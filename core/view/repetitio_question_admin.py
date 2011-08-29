# -*- coding: utf-8 -*-

from copy import deepcopy
from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import RepetitioTest, RepetitioTestLanguage, RepetitioQuestion, RepetitioQuestionLanguage
from core.form.repetitio import RepetitioQuestionForm as AdmItemForm
from core.form.repetitio import RepetitioQuestionLanguageForm as AdmItemLanguageForm

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'test': self.requester.rData['selectedtest'], 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.urls.add = 'core.view.repetitio_question_admin.add_item'
        self.urls.edit = 'core.view.repetitio_question_admin.edit_item'
        self.urls.show_items = 'core.view.repetitio_question_admin.show_items'
        self.manager.model = RepetitioQuestion()
        self.manager.modelLanguage = RepetitioQuestionLanguage()
        self.manager.form_class = AdmItemForm().__class__
        self.manager.language_form_class = AdmItemLanguageForm().__class__
        self.manager.order = 'date'
        self.manager.debugger.filename = 'repetitio_question_admin.py'
        self.manager.moduleName = '__adm_Sheet_Files__'
        self.data.update({ 'filter_1': reverse('core.view.repetitio_question_admin.show_items') })
        toppanel = {
            #reverse('core.view.repetitio_question_admin.show_items'): '__adm_Questions__',
            #reverse('core.view.repetitio_question_admin.show_items'): '__adm_SheetFiles__'
        }
        self.data.update({ 'toppanel': toppanel })
        self.data.update({ 'savebutton': 1, 'saveaddbutton': 1, 'copybutton': 1, 'addbutton': 1 })

        self.test = AdminManager()
        self.test.fetchOptions = { 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.test.model = RepetitioTest()
        self.test.modelLanguage = RepetitioTestLanguage()
        self.test.order = 'date'

def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.show_items(request)
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_repetitio_questions_list'))

    system.test.fetch_items()
    system.test.set_language(system.language.currentLanguage)
    system.data.update({ 'tests': system.test.items })

    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def edit_item(request, itemId):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    result = system.edit_item(request, itemId)

    if result is not None:
        return result

    system.template = loader.get_template(system.sheet.get_sheet_file('admin_repetitio_questions_edit'))
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))


def add_item(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.manager.new()
    return HttpResponseRedirect(reverse('core.view.repetitio_question_admin.edit_item', args=(system.manager.item.id,)))


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