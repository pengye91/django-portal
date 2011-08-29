# -*- coding: utf-8 -*-

from copy import deepcopy
from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.language_lang_admin import AdminManager
from core.manager.system import SystemManager

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.urls.add = 'core.view.language_lang_admin.add_item'
        self.urls.edit = 'core.view.language_lang_admin.edit_item'
        self.urls.show_items = 'core.view.language_lang_admin.show_items'


def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.portal.fetch_active_site(system.requester.rData['activesite'])
    system.manager.fetchOptions = { 'site': system.portal.activeSite.id, 'active': system.requester.rData['selectedactivity'] }
    system.manager.fetch_items()
    t = loader.get_template(system.sheet.get_sheet_file('admin_sheets_list'))

    items = system.manager.get_items()
    system.data.update({ 'data': items })
    system.data.update(system.get_context())
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))


def edit_item(request, itemId):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.fetch_item(itemId)
    system.manager.fetch_items()

    t = loader.get_template(system.sheet.get_sheet_file('admin_sheets_edit'))

    if system.manager.edit_item(request):
        if request.POST['sn'] == '1':
            return HttpResponseRedirect(reverse(system.urls.add)) # wracamy do nowego elementu
        else:
            return HttpResponseRedirect(reverse(system.urls.show_items)) # wracamy do listy

    system.data.update(system.get_context())
    system.data.update({ 'item': system.manager.item })
    system.data.update({ 'nochanges': True })
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))


def add_item(request):
    """ Dodawanie nowego elementu
    """
    manager = AdminManager()
    manager.new()
    item = manager.item
    return HttpResponseRedirect(reverse('core.view.siteadmin.edit_item', args=(manager.item.id,)))


def copy_item(request, itemId):
    pass
    """ Kopiowanie elementu
    try:
        item = Category.objects.get(id=itemId)
    except Exception,e:
        debugger.catch_error('copy_item: ',e)
        item = ''

    if item != '':
        itemLanguages = CategoryLanguage.objects.filter(category=item)

        newCategory = deepcopy(item)
        newCategory.id = None
        newCategory.save()

        for cl in itemLanguages:    # kopiowanie wersji jezykowych
            ncl = deepcopy(cl)
            ncl.category = newCategory
            ncl.id = None
            ncl.save()

        return HttpResponseRedirect(reverse('categories.admin.views.edit_item', args=(newCategory.id,))) # wracamy do nowego elementu
    else:
        return HttpResponseRedirect(reverse('categories.admin.views.edit_item', args=(itemId,))) # cos nie tak, wracamy do edycji starego
    """
def delete_item(request):
    pass
    """ Kasowanie elementu
        Todo: sprawdzic czy wersje jezykowe sie kasuja, jesli nie to zalozyc triggera w bazie albo obsluzyc tutaj
                NIE KASUJA SIE - do napisania

    if request.method == 'POST':
        post = request.POST
        if post['type'] == 'delete':
            try:
                item = Category.objects.get(id=post['id'])
                item.delete()
                return HttpResponse('0');
            except Exception,e:
                debugger.catch_error('delete_item', e)
                return HttpResponse('1');
    else:
        return HttpResponse('1');
    """
