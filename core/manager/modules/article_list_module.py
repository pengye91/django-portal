# -*- coding: utf-8 -*-

__FNAME__ = 'article_list_module.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from django.conf import settings
from core.debug.debug import Debugger
from core.models import RegisteredModule, Article, ArticleLanguage, ArticleListModuleOption, get_module_options_model

class ModuleManager(object):

    def __init__(self, *args, **kwargs):
        self.registered_module = None
        self.menu = None
        self.menuitems = []
        self.items = []
        self.treemenuitems = None
        self.options = None
        self.language = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.category = None

    def fetch_registered_module(self, rid):
        try:
            self.registered_module = RegisteredModule.objects.get(id=rid)
        except Exception, e:
            self.debugger.catch_error('fetch_registered_module: ', e)

    def fetch_options(self):
        try:
            self.options = ArticleListModuleOption.objects.get(module=self.registered_module)
        except Exception, e:
            self.debugger.catch_error('fetch_options: ', e)

    def fetch_items(self, lang):
        try:
            self.items = Article.objects.filter(category=self.category)
            for item in self.items:
                item.get_language(lang.id)
        except Exception, e:
            self.debugger.catch_error('fetch_items: ', e)
