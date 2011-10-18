# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
#from django.conf import settings
from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import Menu, MenuModuleOption, RegisteredModule, ModuleType
from core.form.menu import MenuForm as AdmItemForm
from core.form.module.menu_module import MenuOptionForm
#from core.form.modules import get_module_options, get_module_type_options
#from core.models import get_module_options_model, get_module_type_options_model
#from core.models import MenuItem, MenuItemLanguage

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.urls.add = 'core.view.menu_admin.add_item'
        self.urls.edit = 'core.view.menu_admin.edit_item'
        self.urls.show_items = 'core.view.menu_admin.show_items'
        self.manager.model = Menu()
        self.manager.modelLanguage = None
        self.manager.form_class = AdmItemForm().__class__
        self.manager.language_form_class = None
        self.manager.order = 'date'
        self.manager.debugger.filename = 'menu_admin.py'
        self.manager.moduleName = '__adm_Menu__'
        self.data.update({ 'filter_activity': reverse('core.view.menu_admin.show_items') })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })


def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.show_items(request, admin=True, allow_tree=True)
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_menu_list'))

    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def edit_item(request, itemId):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))

    system.manager.fetch_item(itemId)
    system.manager.set_language(system.language.currentLanguage)

    menuoption = MenuModuleOption.objects.filter(menu=system.manager.item)
    if len(menuoption) > 0:
        menuoption = menuoption[0]
    else:
        type_module = ModuleType.objects.get(name='Menu')
        rmodule = RegisteredModule()
        rmodule.owner = system.permission.user
        rmodule.name = ' (Pozycja menu)'
        rmodule.type = type_module
        rmodule.order = 0
        rmodule.menu = 0
        rmodule.save()
        rmodule.sites.add(system.portal.get_active_site())
        rmodule.active.add(system.portal.get_active_site())
        rmodule.save()
        menuoption = MenuModuleOption()
        menuoption.menu = system.manager.item
        menuoption.registered_module = rmodule
        menuoption.save()

    system.manager.options_item = menuoption
    system.manager.form_options_class = MenuOptionForm().__class__

    system.manager.modelOptions = menuoption
    result = system.edit_item(request, itemId)

    system.manager.options_form.choices(system)

    if result is not None:
        menuoption.registered_module.name = system.manager.item.name + u' (Menu)'
        menuoption.registered_module.save()
        return result

    system.manager.options_form.choices(system, edit_menu=True)
    system.manager.form.choices(system)

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_menu_edit'))
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.new()

    type_module = ModuleType.objects.get(name='Menu')
    rmodule = RegisteredModule()
    rmodule.type = type_module
    rmodule.owner = system.permission.user
    rmodule.name = ' (Menu)'
    rmodule.order = 0
    rmodule.save()
    rmodule.sites.add(system.portal.get_active_site())
    rmodule.active.add(system.portal.get_active_site())

    menuoption = MenuModuleOption()
    menuoption.menu = system.manager.item
    menuoption.registered_module = rmodule
    menuoption.save()
    """
    rootmenuitem = MenuItem()
    rootmenuitem.noedit = True
    rootmenuitem.save()
    rootmenuitem.sites.add(system.portal.get_active_site())
    rootmenuitem.active.add(system.portal.get_active_site())
    system.language.set_non_existent_language_items(rootmenuitem, MenuItemLanguage)

    for l in rootmenuitem.languages.all():
        l.name = 'Root'
        l.save()
    """
    return HttpResponseRedirect(reverse('core.view.menu_admin.edit_item', args=(system.manager.item.id,)))


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
