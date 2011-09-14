# -*- coding: utf-8 -*-

__FNAME__ = 'menu_module.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from django.conf import settings
from core.debug.debug import Debugger
from core.models import RegisteredModule, NewsFlashColumnModuleOption, Category, Article

class ModuleManager(object):

    def __init__(self, *args, **kwargs):
        self.registered_module = None
        self.options = None
        self.language = None
        self.categories = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.fetch_opt = dict()

    def get_data(self, lang, site):
        self.language = lang
        self.fetch_options()
        self.fetch_opt = { 'site': site.id, 'active': 1, 'activesite': site.id, 'parent__id': self.options.category.id }
        self.fetch_categories(lang, site)

    def fetch_registered_module(self, rid):
        try:
            self.registered_module = RegisteredModule.objects.get(id=rid)
        except Exception, e:
            self.debugger.catch_error('fetch_registered_module: ', e)

    def fetch_options(self):
        try:
            self.options = NewsFlashColumnModuleOption.objects.filter(registered_module=self.registered_module)
            if self.options > 0:
                self.options = self.options[0]
            else:
                self.options = None
        except Exception, e:
            self.debugger.catch_error('fetch_options: ', e)

    def fetch_categories(self, lang, site):
        try:
            categories = Category.objects.optfilter(self.fetch_opt)

            cats = []
            for item in categories:
                item.get_language(lang.id)

                affilter = { 'site': site.id, 'active': 1, 'activesite': site.id , 'category__id': item.id }
                articles = Article.objects.optfilter(affilter).order_by('-date')[:4]
                if len(articles) > 3:
                    for art in articles:
                        art.get_language(lang.id)
                    item.articles = articles
                    cats.append(item)
            self.categories = cats[:3]
        except Exception, e:
            self.debugger.catch_error('fetch_categories: ', e)
