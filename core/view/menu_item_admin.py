# -*- coding: utf-8 -*-

from copy import deepcopy
from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import Menu, MenuItem, MenuItemLanguage
from core.form.menu import AdmItemForm, AdmItemLanguageForm
from core.form.modules import get_module_options
from core.models import get_module_options_model

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.urls.add = 'core.view.menu_item_admin.add_item'
        self.urls.edit = 'core.view.menu_item_admin.edit_item'
        self.urls.show_items = 'core.view.menu_item_admin.show_items'
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'menu': self.requester.rData['selectedmenu'], 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.manager.model = MenuItem()
        self.manager.modelLanguage = MenuItemLanguage()
        self.manager.form_class = AdmItemForm().__class__
        self.manager.language_form_class = AdmItemLanguageForm().__class__
        self.manager.order = 'parent'
        self.manager.debugger.filename = 'menu_item_admin.py'
        self.manager.moduleName = '__adm_Categories__'
        self.data.update({ 'filter_activity': reverse('core.view.menu_item_admin.show_items') })
        self.data.update({ 'filter_1': reverse('core.view.menu_item_admin.show_items') })
        toppanel = {}
        self.data.update({ 'toppanel': toppanel })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })

        self.menu = AdminManager()
        self.menu.model = Menu()
        self.menu.order = 'name'
        self.menu.fetchOptions = { 'site': self.portal.activeSite.id, 'active': 1, 'activesite': self.portal.activeSite.id }

def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.show_items(request, allow_tree=True, admin=True, default_filter=False)

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_menu_items_list'))
    system.menu.fetch_items(for_select=True)
    system.data.update({ 'menus': system.menu.items })
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))

def change_item(request):
    if request.method == 'POST':
        post = request.POST
        system = SystemObject(request)
        if post['type'] == 'activity':
            try:
                system.manager.fetch_item(post['id'])
                if post['status'] == '0':
                    system.manager.item.active.remove(system.portal.get_active_site())
                else:
                    system.manager.item.active.add(system.portal.get_active_site())
                return HttpResponse('0');
            except Exception,e:
                debugger.catch_error('change_item', e)
                return HttpResponse('1');
    else:
        return HttpResponse('1');

def edit_item(request, itemId):
    """
    """
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    moduleId = None
    if request.method == 'GET':
        if request.GET.has_key('module'):
            moduleId = request.GET['module']

    if request.method == 'POST':
        if request.POST.has_key('MenuItem-module'):
            moduleId = request.POST['MenuItem-module']

    if moduleId is None:
        system.portal.fetchOptions = { 'site': system.portal.activeSite.id, 'active': '1', 'activesite': system.portal.activeSite.id }
        system.portal.fetch_modules()
        system.template = loader.get_template(system.sheet.get_sheet_file('admin_menu_items_edit_module_selection'))
    else:
        system = SystemObject(request)
        system.portal.get_module(moduleId)

        system.manager.form_options_class = get_module_options(moduleId).__class__
        system.manager.modelOptions = get_module_options_model(moduleId)

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
            system.manager.options_item.module = system.portal.module
            system.manager.options_item.save()
            return result

        if system.manager.form is not None:
            system.manager.form.choices(system, 'menu')

        system.manager.options_form.choices(system)

        choices = []
        if system.portal.module.type.menu is True:
            choices.append((moduleId, system.portal.module))

        system.manager.form.fields['module'].choices = choices
        system.manager.form.fields['module'].widget.attrs['readonly'] = True

        system.template = loader.get_template(system.sheet.get_sheet_file('admin_menu_items_edit'))

    system.data.update({ 'moduleid': moduleId })
    system.data.update({ 'menuitemid': itemId })
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    """ Dodawanie nowego elementu
    """
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.new()
    return HttpResponseRedirect(reverse('core.view.menu_item_admin.edit_item', args=(system.manager.item.id,)))


def copy_item(request, itemId):
    pass

def delete_item(request):
    manager = AdminManager()
    if manager.delete(request):
        return HttpResponse('1');
    else:
        return HttpResponse('0');
