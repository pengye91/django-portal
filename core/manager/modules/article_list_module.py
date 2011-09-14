# -*- coding: utf-8 -*-

__FNAME__ = 'article_list_module.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from django.conf import settings
from core.debug.debug import Debugger
from core.models import RegisteredModule, Article, ArticleLanguage, ArticleListModuleOption, Category, get_module_options_model

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
                for item in self.items:
                    item.get_slug(lang.id)

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
            self.items = Article.objects.filter(category=self.category)[:10]
            for item in self.items:
                item.get_language(lang.id)
        except Exception, e:
            self.debugger.catch_error('fetch_items: ', e)

    def get_category(self, categoryitem, lang, site):
        try:
            self.category = Category.objects.get(id=categoryitem.id)
            self.category.get_language(lang.id)
        except Exception, e:
            self.debugger.catch_error('get_category: ', e)
