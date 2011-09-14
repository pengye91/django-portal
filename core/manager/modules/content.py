# -*- coding: utf-8 -*-

__FNAME__ = 'content.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from django.conf import settings
from django.template import loader, RequestContext
from django.http import HttpResponse
from core.debug.debug import Debugger
from core.models import RegisteredModule, MegaMenu, get_module_options_model, Menu, MenuItem, Category, Article, ArticleLanguage
from core.manager.system import SystemManager

class ContentManager(object):

    def __init__(self, *args, **kwargs):
        self.options = None
        self.debugger = Debugger(__MNAME__,__FNAME__)

    def get_data(self, lang, site):
        data = dict()

        t = loader.get_template('content.html')
        c = RequestContext(request, data)
        return HttpResponse(t.render(c))