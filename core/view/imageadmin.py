# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import Image, ImageLanguage, Gallery, GalleryLanguage
from core.form.image import AdmItemForm, AdmItemLanguageForm

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': int(self.portal.activeSite.id), 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.urls.add = 'core.view.imageadmin.add_item'
        self.urls.edit = 'core.view.imageadmin.edit_item'
        self.urls.show_items = 'core.view.imageadmin.show_items'
        self.manager.model = Image()
        self.manager.modelLanguage = ImageLanguage()
        self.manager.form_class = AdmItemForm().__class__
        self.manager.language_form_class = AdmItemLanguageForm().__class__
        self.manager.order = 'date'
        self.manager.debugger.filename = 'imageadmin.py'
        self.manager.moduleName = '__adm_Articles__'
        self.data.update({ 'filter_activity': reverse('core.view.imageadmin.show_items') })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })

        self.gallery = AdminManager()
        self.gallery.model = Gallery()
        self.gallery.order = 'parent'
        self.gallery.fetchOptions = { 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.gallery.modelLanguage = GalleryLanguage()

def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.show_items(request)
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_images_list'))

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
        system.portal.fetch_active_site(system.requester.rData['activesite'])
        system.manager.item.sites.add(system.portal.get_active_site())
        system.manager.item.active.add(system.portal.get_active_site())
        return result

    system.gallery.fetch_items()
    system.gallery.set_language(system.language.currentLanguage)
    if system.manager.form is not None:
        """ Pobieranie nazw do listy """
        items = system.gallery.get_items()
        choices = []
        for il in items:
            choices.append((il.id,il.language))
        system.manager.form.fields['gallery'].choices = choices

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_images_edit'))
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.new()
    return HttpResponseRedirect(reverse('core.view.imageadmin.edit_item', args=(system.manager.item.id,)))


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
