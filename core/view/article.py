# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.base import BaseManager as Manager
from core.models import Article, ArticleLanguage, Category, CategoryLanguage
from core.manager.system import SystemManager

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = Manager()
        self.manager.fetchOptions = { 'site': settings.SITE_ID, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.urls.show_items = 'core.view.articleadmin.show_items'
        self.manager.model = Article()
        self.manager.modelLanguage = ArticleLanguage()
        self.manager.order = 'date'
        self.manager.debugger.filename = 'articleadmin.py'
        self.manager.moduleName = '__adm_Articles__'
        self.category = Manager()
        self.category.model = Category()
        self.category.order = 'parent'
        self.category.fetchOptions = { 'site': settings.SITE_ID, 'active': self.requester.rData['selectedactivity'], 'activesite': self.requester.rData['activesite'] }
        self.category.modelLanguage = CategoryLanguage()


def show_items(request):
    system = SystemObject(request)
    system.show_items(request)
    t = loader.get_template(system.sheet.get_sheet_file('articles_list'))

    system.data.update(system.get_context())
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))

def show_item_by_id(request, itemId):
    system = SystemObject(request)
    system.show_item(request, itemId)
    t = loader.get_template(system.sheet.get_sheet_file('article'))

    system.data.update(system.get_context())
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))

