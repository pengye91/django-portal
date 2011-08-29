# -*- coding: utf-8 -*-

from copy import deepcopy
from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import CatalogCategory, CatalogCategoryLanguage
from core.form.catalog import CatalogCategoryItemForm as AdmItemForm
from core.form.catalog import CatalogCategoryItemLanguageForm as AdmItemLanguageForm

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.urls.add = 'core.view.catalog_category_admin.add_item'
        self.urls.edit = 'core.view.catalog_category_admin.edit_item'
        self.urls.show_items = 'core.view.catalog_category_admin.show_items'
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.manager.model = CatalogCategory()
        self.manager.modelLanguage = CatalogCategoryLanguage()
        self.manager.form_class = AdmItemForm().__class__
        self.manager.language_form_class = AdmItemLanguageForm().__class__
        self.manager.order = 'parent'
        self.manager.debugger.filename = 'catalog_category_admin.py'
        self.manager.moduleName = '__adm_Catalogs_categories__'
        self.data.update({ 'filter_activity': reverse('core.view.catalog_category_admin.show_items') })
        toppanel = {}
        self.data.update({ 'toppanel': toppanel })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })

def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.show_items(request, allow_tree=True, admin=True)
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_catalog_categories_list'))
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
    result = system.edit_item(request, itemId)

    if result is not None:
        system.portal.fetch_active_site(system.requester.rData['activesite'])
        system.manager.item.sites.add(system.portal.get_active_site())
        system.manager.item.active.add(system.portal.get_active_site())
        return result

    if system.manager.form is not None:
        items = system.manager.get_items()
        choices = []
        for il in items:
            choices.append((il.id,il.language))
        system.manager.form.fields['parent'].choices = choices

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_catalog_categories_edit'))
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    """ Dodawanie nowego elementu
    """
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.new()
    return HttpResponseRedirect(reverse('core.view.catalog_category_admin.edit_item', args=(system.manager.item.id,)))


def copy_item(request, itemId):
    pass

def delete_item(request):
    manager = AdminManager()
    if manager.delete(request):
        return HttpResponse('1');
    else:
        return HttpResponse('0');
