# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import Wiki, WikiLanguage
from core.form.wiki import AdmItemForm, AdmItemLanguageForm

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': int(self.portal.activeSite.id), 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.urls.add = 'core.view.wiki_admin.add_item'
        self.urls.edit = 'core.view.wiki_admin.edit_item'
        self.urls.show_items = 'core.view.wiki_admin.show_items'
        self.manager.model = Wiki()
        self.manager.modelLanguage = WikiLanguage()
        self.manager.form_class = AdmItemForm().__class__
        self.manager.language_form_class = AdmItemLanguageForm().__class__
        self.manager.order = 'parent'
        self.manager.debugger.filename = 'wiki_admin.py'
        self.manager.moduleName = '__adm_Wiki__'
        self.data.update({ 'filter_activity': reverse('core.view.wiki_admin.show_items') })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })


def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.show_items(request, allow_tree=True)
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_wiki_list'))

    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def edit_item(request, itemId):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.fetch_item(itemId)
    system.language.set_non_existent_language_items(system.manager.item, system.manager.modelLanguage.__class__)
    system.manager.set_language(system.language.currentLanguage)
    result = system.edit_item(request, itemId)

    if result is not None:
        return result

    system.manager.fetch_items()
    system.manager.set_language(system.language.currentLanguage)
    if system.manager.form is not None:
        """ Pobieranie nazw do listy """
        items = system.manager.get_items()
        choices = []
        for il in items:
            choices.append((il.id,il.language))
        system.manager.form.fields['parent'].choices = choices

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_wiki_edit'))
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.new()
    return HttpResponseRedirect(reverse('core.view.wiki_admin.edit_item', args=(system.manager.item.id,)))


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
