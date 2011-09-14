# -*- coding: utf-8 -*-

from copy import deepcopy
from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import Adv, AdvClient
from core.form.adv import AdvClientForm as AdmItemForm

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.urls.add = 'core.view.adv_client_admin.add_item'
        self.urls.edit = 'core.view.adv_client_admin.edit_item'
        self.urls.show_items = 'core.view.adv_client_admin.show_items'
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.manager.model = AdvClient()
        self.manager.form_class = AdmItemForm().__class__
        self.manager.order = 'date'
        self.manager.debugger.filename = 'adv_client_admin.py'
        self.manager.moduleName = '__adm_Clients__'
        self.data.update({ 'filter_activity': reverse('core.view.adv_client_admin.show_items') })
        toppanel = {}
        self.data.update({ 'toppanel': toppanel })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })

def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.show_items(request, allow_tree=True, admin=True)
    print '[[[[]]]]', system.manager.items
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_adv_clients_list'))
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
        return result

    system.manager.form.choices()

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_adv_clients_edit'))
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    """ Dodawanie nowego elementu
    """
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.new()
    return HttpResponseRedirect(reverse('core.view.adv_client_admin.edit_item', args=(system.manager.item.id,)))


def copy_item(request, itemId):
    pass

def delete_item(request):
    manager = AdminManager()
    if manager.delete(request):
        return HttpResponse('1');
    else:
        return HttpResponse('0');
