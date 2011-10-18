# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse
from django.core.urlresolvers import reverse

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import Ad, AdLanguage, AdCategory, AdCategoryLanguage
from core.form.ads import AdsItemForm as AdmItemForm
from core.form.ads import AdsItemLanguageForm as AdmItemLanguageForm

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': int(self.portal.activeSite.id), 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.urls.add = 'core.view.ads_admin.add_item'
        self.urls.edit = 'core.view.ads_admin.edit_item'
        self.urls.show_items = 'core.view.ads_admin.show_items'
        self.manager.model = Ad()
        self.manager.modelLanguage = AdLanguage()
        self.manager.form_class = AdmItemForm().__class__
        self.manager.language_form_class = AdmItemLanguageForm().__class__
        self.manager.order = 'date'
        self.manager.debugger.filename = 'ads_admin.py'
        self.manager.moduleName = '__adm_Ads__'
        self.data.update({ 'filter_activity': reverse('core.view.ads_admin.show_items') })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })

        self.category = AdminManager()
        self.category.model = AdCategory()
        self.category.order = 'parent'
        self.category.fetchOptions = { 'site': self.portal.activeSite.id, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.category.modelLanguage = AdCategoryLanguage()

def show_items(request):
    system = SystemObject(request)
    system.show_items(request)
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_ads_list'))

    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))

