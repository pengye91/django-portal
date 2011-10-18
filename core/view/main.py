# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse

from core.manager.base import BaseManager as Manager
from core.models import Article, ArticleLanguage, Category, CategoryLanguage
from core.manager.system_site import SystemManager

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = Manager()
        self.manager.fetchOptions = { 'site': self.portal.reqsite, 'active': 1, 'activesite': self.portal.reqsite }
        self.urls.show_items = 'core.view.articleadmin.show_items'
        self.manager.model = Article()
        self.manager.modelLanguage = ArticleLanguage()
        self.manager.order = '-date'
        self.manager.debugger.filename = 'articleadmin.py'
        self.manager.moduleName = '__adm_Articles__'
        self.category = Manager()
        self.category.model = Category()
        self.category.order = 'parent'
        self.category.fetchOptions = { 'site': self.portal.reqsite, 'active': 1, 'activesite': self.portal.reqsite }
        self.category.modelLanguage = CategoryLanguage()


def main_site(request):
    system = SystemObject(request)
    system.show_items(request)
    t = loader.get_template(system.sheet.get_sheet_file('mainsite'))

    system.manager.fetchOptions.update({ 'not_dentoimage': '1' })
    system.manager.rangeItemsStart = None
    system.manager.rangeItemsEnd = 6
    system.manager.fetch_items()
    arts = system.manager.items
    #arts = Article.objects.filter().exclude(dentomainimage__exact=None)[:10]

    for item in arts:
        item.get_language(system.language.currentLanguage.id)
        #print item.id, item.mainimage.path

    system.data.update({ 'arts': arts })
    system.data.update({ 'mainsite': True })

    system.data.update(system.get_context())
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))
