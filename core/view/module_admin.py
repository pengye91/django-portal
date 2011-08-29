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

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
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
    system.manager.form_options_class = VisItemForm().__class__
    system.manager.modelOptions = ModuleVisibility()
    system.manager.fetch_item(itemId)
    try:
        options = system.manager.modelOptions.__class__.objects.filter(menuitem=system.manager.item)
        if len(options) == 0:
            system.manager.options_item = system.manager.modelOptions
            system.manager.options_item.menuitem = system.manager.item
            system.manager.options_item.save()
        else:
            system.manager.options_item = options[0]
    except Exception, e:
        system.debugger.catch_error('edit_item: ', e)
        system.manager.options_item = system.manager.modelOptions
        system.manager.options_item.save()
    result = system.edit_item(request, itemId)

    if result is not None:
        system.portal.fetch_active_site(system.requester.rData['activesite'])
        system.manager.item.sites.add(system.portal.get_active_site())
        system.manager.item.active.add(system.portal.get_active_site())
        return result

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_modules_edit'))
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.new()
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
