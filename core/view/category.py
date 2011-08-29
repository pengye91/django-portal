# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.base import BaseManager as Manager
from core.models import Category, CategoryLanguage, Article, ArticleLanguage
from core.manager.system import SystemManager
from core.manager.modules.article_list_module import ModuleManager

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = Manager()
        self.manager.model = Category()
        self.manager.order = 'parent'
        self.manager.fetchOptions = { 'site': settings.SITE_ID }
        self.manager.modelLanguage = CategoryLanguage()
        self.manager.moduleName = '__adm_Categories__'
        self.module = None

def show_item(request, itemId, module_id):
    system = SystemObject(request)
    #system.show_item(request, itemId)
    system.module = ModuleManager()
    system.module.category = itemId
    system.manager.fetch_item(itemId)
    system.module.fetch_registered_module(module_id)
    system.module.fetch_items(system.language.currentLanguage)
    system.module.fetch_options()

    t = loader.get_template(system.sheet.get_sheet_file('articles_list'))

    system.data.update({ 'category': system.manager.item })
    system.data.update({ 'mod': system.module })
    system.data.update(system.get_context())
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))

def show_item_by_id(request, itemId):
    system = SystemObject(request)
    system.show_item(request, itemId)
    system.manager.options = {
        'show_title': system.manager.item.show_title,
        'link_title': system.manager.item.link_title,
        'exposefirst': system.manager.item.exposefirst,
        'show_footer': system.manager.item.show_footer,
        'show_info': system.manager.item.show_info,
        'page_title': system.manager.item.page_title,
        'show_page_title': system.manager.item.show_page_title,
        'show_mainimage': system.manager.item.show_mainimage,
        'class_prefix': system.manager.item.class_prefix
    }

    articles = None
    try:
        articles = Article.objects.filter(category=itemId)
        for item in articles:
            item.get_language(system.language.currentLanguage.id)
    except Exception, e:
        print e

    system.manager.items = articles

    t = loader.get_template(system.sheet.get_sheet_file('articles_list'))

    system.data.update({ 'category': system.manager.item })
    system.data.update({ 'mod': system.manager })
    system.data.update(system.get_context())
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))
