# -*- coding: utf-8 -*-

from copy import deepcopy
from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import RegisteredModule, ModuleVisibility
from core.form.modules import AdmItemForm, VisItemForm
from core.form.modules import get_module_options, get_module_type_options, get_module_options_form_by_type
from core.models import get_module_options_model, get_module_type_options_model, get_module_options_by_type, ModuleType

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'notmenumodule': 1, 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.shee_files = AdminManager()
        self.urls.add = 'core.view.module_admin.add_item'
        self.urls.edit = 'core.view.module_admin.edit_item'
        self.urls.show_items = 'core.view.module_admin.show_items'
        self.manager.model = RegisteredModule()
        self.manager.modelLanguage = None
        self.manager.form_class = AdmItemForm().__class__
        self.manager.language_form_class = None
        self.manager.order = 'date'
        self.manager.debugger.filename = 'module_admin.py'
        self.manager.moduleName = '__adm_Modules__'
        self.data.update({ 'filter_activity': reverse('core.view.module_admin.show_items') })
        toppanel = {
            reverse('core.view.module_admin.show_items'): '__adm_Modules__',
            reverse('core.view.module_position_admin.show_items'): '__adm_Positions__'
        }
        self.data.update({ 'toppanel': toppanel })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })

def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.show_items(request, admin=True)
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_modules_list'))

    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def edit_item(request, itemId):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))

    system.manager.fetch_item(itemId)

    moduleId = None
    if request.method == 'GET':
        if request.GET.has_key('module'):
            moduleId = request.GET['module']

    if request.method == 'POST':
        if request.POST.has_key('opt-module'):
            moduleId = request.POST['opt-module']

    if request.method == 'POST':
        if request.POST.has_key('opt-registered_module'):
            #moduleId = request.POST['opt-registered_module']
            #registered_module_id = request.POST['opt-registered_module']
            #registered_module =
            moduleId = system.manager.item.type.id

    if moduleId is None:
        system.portal.fetchOptions = { 'site': system.portal.activeSite.id, 'active': '1', 'activesite': system.portal.activeSite.id }
        system.portal.fetch_module_types()
        system.template = loader.get_template(system.sheet.get_sheet_file('admin_module_edit_module_selection'))
    else:
        if system.manager.item.type is not None:
            # registeredmodule utworzony np z menuitem
            options_model = get_module_options_by_type(system.manager.item.type)
            options_form = get_module_options_form_by_type(system.manager.item.type).__class__
        else:
            # registeredmodule utworzony bez innych informacji
            type_module = ModuleType.objects.get(id=moduleId)
            options_model = get_module_options_by_type(type_module)
            options_form = get_module_options_form_by_type(type_module).__class__
            option = options_model
            option.registered_module = system.manager.item
            option.save()

            system.manager.item.type = type_module
            system.manager.item.save()

        options = options_model.__class__.objects.filter(registered_module=system.manager.item)
        if len(options) > 0:
            options = options[0]

        system.manager.form_options_class = options_form
        system.manager.modelOptions = options_model
        system.manager.options_item = options

        result = system.edit_item(request, itemId)
        if result is not None:
            return result

        if system.manager.options_form is not None:
            system.manager.options_form.choices(system)

        system.template = loader.get_template(system.sheet.get_sheet_file('admin_modules_edit'))

    system.data.update({ 'moduleid': moduleId })
    system.data.update({ 'regmoduleid': itemId })
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.new()
    system.manager.item.sites.add(system.portal.get_active_site())
    system.manager.item.active.add(system.portal.get_active_site())
    return HttpResponseRedirect(reverse('core.view.module_admin.edit_item', args=(system.manager.item.id,)))


def copy_item(request, itemId):
    pass


def change_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    if system.manager.change_item(request, system.portal.get_active_site()):
        return HttpResponse('1');
    else:
        return HttpResponse('0');


def delete_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    if system.manager.delete(request):
        return HttpResponse('1');
    else:
        return HttpResponse('0');
