# -*- coding: utf-8 -*-

__FNAME__ = 'htmlbox_module.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from django.conf import settings
from core.debug.debug import Debugger
from core.models import RegisteredModule, HTMLBoxModuleOption

class ModuleManager(object):

    def __init__(self, *args, **kwargs):
        self.registered_module = None
        self.options = None
        self.language = None
        self.html = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.fetch_opt = dict()

    def get_data(self, lang, site):
        self.language = lang
        self.fetch_options()
        self.html = self.options.html

    def fetch_registered_module(self, rid):
        try:
            self.registered_module = RegisteredModule.objects.get(id=rid)
        except Exception, e:
            self.debugger.catch_error('fetch_registered_module: ', e)

    def fetch_options(self):
        try:
            self.options = HTMLBoxModuleOption.objects.filter(registered_module=self.registered_module)
            if self.options > 0:
                self.options = self.options[0]
            else:
                self.options = None
        except Exception, e:
            self.debugger.catch_error('fetch_options: ', e)
