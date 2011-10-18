# -*- coding: utf-8 -*-

__FNAME__ = 'article_list_module.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from core.debug.debug import Debugger
from core.models import RegisteredModule, Article, ArticleListModuleOption, Category

class ModuleManager(object):

    def __init__(self, *args, **kwargs):
        self.registered_module = None
        self.items = []
        self.treemenuitems = None
        self.options = None
        self.language = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.category = None

    def get_data(self, lang, site):
        self.fetch_options()
        if self.options is not None:
            if self.options.category is not None:
                self.category = self.options.category
                self.fetch_items(lang)
                #for item in self.items:
                    

    def fetch_registered_module(self, rid):
        try:
            self.registered_module = RegisteredModule.objects.get(id=rid)
        except Exception, e:
            self.debugger.catch_error('fetch_registered_module: ', e)

    def fetch_options(self):
        try:
            self.options = ArticleListModuleOption.objects.get(registered_module=self.registered_module)
        except Exception, e:
            self.debugger.catch_error('fetch_options: ', e)

    def fetch_items(self, lang):
        try:
            count = 10
            if self.options.count is not None:
                count = self.options.count
            try:
                count = int(count)
            except Exception, e:
                self.debugger.catch_error('fetch_items: ', e)
                count = 10
            
            kwargs = dict()
            excl = dict()
            if self.options.only_with_image is True:
                kwargs['mainimage__isnull'] = False
                excl['mainimage'] = ''
            
            kwargs['category__id'] = self.category.id
                    
            if self.options.order is not None:
                self.items = Article.objects.filter(**kwargs).exclude(**excl).order_by(self.options.order)[:count]
            else:
                self.items = Article.objects.filter(**kwargs).exclude(**excl)[:count]
                
            for item in self.items:
                item.get_language(lang.id)
                item.get_slug(lang.id)
        except Exception, e:
            self.debugger.catch_error('fetch_items: ', e)

    def get_category(self, categoryitem, lang, site):
        try:
            self.category = Category.objects.get(id=categoryitem.id)
            self.category.get_language(lang.id)
        except Exception, e:
            self.debugger.catch_error('get_category: ', e)
