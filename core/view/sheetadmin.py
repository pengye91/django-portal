# -*- coding: utf-8 -*-

from copy import deepcopy
from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import Sheet, SheetFiles
from core.form.sheet import AdmItemForm

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.shee_files = AdminManager()
        self.urls.add = 'core.view.sheetadmin.add_item'
        self.urls.edit = 'core.view.sheetadmin.edit_item'
        self.urls.show_items = 'core.view.sheetadmin.show_items'
        self.manager.model = Sheet()
        self.manager.modelLanguage = None
        self.manager.form_class = AdmItemForm().__class__
        self.manager.language_form_class = None
        self.manager.order = 'date'
        self.manager.debugger.filename = 'sheetadmin.py'
        self.manager.moduleName = '__adm_Sheets__'
        self.data.update({ 'filter_activity': reverse('core.view.sheetadmin.show_items') })
        toppanel = {
            reverse('core.view.sheetadmin.show_items'): '__adm_Sheets__',
            reverse('core.view.sheetfileadmin.show_items'): '__adm_SheetFiles__'
        }
        self.data.update({ 'toppanel': toppanel })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })

def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.show_items(request)
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_sheets_list'))

    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def edit_item(request, itemId):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    result = system.edit_item(request, itemId)

    if result is not None:
        try:
            items = SheetFiles.objects.filter(sheet=system.manager.item)
            for item in items:
                item.sites.add(system.portal.activeSite)
        except Exception, e:
            print "Site adding problem: ",e
        return result

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_sheets_edit'))
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.new()
    return HttpResponseRedirect(reverse('core.view.sheetadmin.edit_item', args=(system.manager.item.id,)))


def copy_item(request, itemId):
    pass


def change_item(request, item_id):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    try:
        system.sheet.fetch_sheets()
        for item in system.sheet.sheets:
            for site in system.portal.sites:
                item.active.remove(site)
        system.manager.fetch_item(item_id)
        system.manager.item.active.add(system.portal.activeSite)
    except Exception,e:
        print e
    return HttpResponseRedirect(reverse('core.view.sheetadmin.show_items'))

def delete_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    if system.manager.delete(request):
        return HttpResponse('1');
    else:
        return HttpResponse('0');
