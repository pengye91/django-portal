# -*- coding: utf-8 -*-

__FNAME__ = 'newsbox_module.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from core.debug.debug import Debugger
from core.models import Article, Language

class ModuleManager(object):

    def __init__(self, *args, **kwargs):
        self.registered_module = None
        self.options = None
        self.language = None
        self.categories = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.fetch_opt = dict()
        self.articles = None

    def get_data(self):
        self.fetch_articles()

    def fetch_articles(self):
        lang = Language.objects.get(symbol='pl')
        if self.options is not None:
            amax = 10
            if self.options.has_key('C'):
                try:
                    amax = int(self.options['C'])
                except Exception,e:
                    self.debugger.catch_error('fetch_articles: ', e)

        self.articles = Article.objects.all().order_by('-date')[:amax]
        for article in self.articles:
            article.get_language(lang)
            if article.language is not None:
                if self.options.has_key('E'):
                    try:
                        title = article.language.title.encode(self.options['E'])
                        #article.language.title = title
                        text = article.language.text.encode(self.options['E'])
                        print title, ' -- ',article.language.title
                    except Exception, e:
                        self.debugger.catch_error('fetch_articles: ', e)
