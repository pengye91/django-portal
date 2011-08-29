# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import Menu, MenuModuleOption, RegisteredModule, ModuleType
from core.form.menu import MenuForm as AdmItemForm
from core.form.module.menu_module import MenuOptionForm

from core.models import MenuItem, MenuItemLanguage

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
    system.show_items(request, admin=True)
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_menu_list'))

    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def edit_item(request, itemId):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.fetch_item(itemId)
    system.manager.set_language(system.language.currentLanguage)

    system.manager.form_options_class = MenuOptionForm().__class__
    system.manager.modelOptions = MenuModuleOption()
    try:
        mtype = ModuleType.objects.get(name='Menu')
    except Exception, e:
        print e
        mtype = None

    try:
        options = system.manager.modelOptions.__class__.objects.filter(menu=system.manager.item)
        if len(options) == 0:
            system.manager.options_item = system.manager.modelOptions
            system.manager.options_item.menu = system.manager.item
            system.manager.options_item.save()
            module = RegisteredModule()
            module.name = 'new menu module'
            if mtype is not None:
                module.type = mtype
            module.save()
            system.manager.options_item.module = module
            system.manager.options_item.save()
        else:
            system.manager.options_item = options[0]
    except Exception, e:
        system.debugger.catch_error('edit_item: ', e)
        system.manager.options_item = system.manager.modelOptions
        system.manager.options_item.save()
        module = RegisteredModule()
        module.name = 'new menu module'
        if mtype is not None:
            module.type = mtype
        module.save()
        system.manager.options_item.module = module
        system.manager.options_item.save()

    result = system.edit_item(request, itemId)

    if result is not None:
        system.manager.item.sites.add(system.portal.get_active_site())
        system.manager.item.active.add(system.portal.get_active_site())
        try:
            module = RegisteredModule.objects.get(id=system.manager.options_item.module.id)

        except Exception, e:
            print e
            module = RegisteredModule()
        module.name = system.manager.item.name
        if mtype is not None:
            module.type = mtype
        module.save()
        module.sites.add(system.portal.get_active_site())
        module.active.add(system.portal.get_active_site())
        system.manager.options_item.module = module
        system.manager.options_item.save()
        return result

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_menu_edit'))
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.new()
    
    rootmenuitem = MenuItem()
    rootmenuitem.noedit = True
    rootmenuitem.save()
    rootmenuitem.sites.add(system.portal.get_active_site())
    rootmenuitem.active.add(system.portal.get_active_site())
    system.language.set_non_existent_language_items(rootmenuitem, MenuItemLanguage)

    for l in rootmenuitem.languages.all():
        l.name = 'Root'
        l.save()

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
