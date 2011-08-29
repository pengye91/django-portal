# -*- coding: utf-8 -*-

__FNAME__ = 'portal.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

from django.conf import settings
from django.contrib.sessions.models import Session
from core.debug.debug import Debugger
from django.contrib.sites.models import Site
from core.models import RegisteredModule

class PortalManager(object):


    def __init__(self, *args, **kwargs):
        self.sites = None
        self.activeSite = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.modules = None
        self.module = None
        self.fetchOptions = dict()

    def fetch_data(self):
        try:
            self.sites = Site.objects.all()
        except Exception, e:
            self.debugger.catch_error('fetch_data: ', e)

    def fetch_active_site(self, pid):
        try:
            site = self.sites.filter(id=pid)
            self.activeSite = site[0]
        except Exception, e:
            self.debugger.catch_error('get_active_site: ', e)

    def get_active_site(self):
        return self.activeSite

    def get_context(self):
        return { 'sites': self.sites, 'activesiteobject': self.get_active_site(), 'modules': self.modules }

    def set_site_for_portal(self, portal):
        try:
            site_object = Site.objects.filter(id=portal.site.id)
            site_object = site_object[0]
        except Exception, e:
            site_object = Site()
            self.debugger.catch_error('set_site_for_portal: ', e)

        try:
            site_object.name = portal.name
            site_object.domain = portal.domain
            site_object.save()
        except Exception, e:
            self.debugger.catch_error('set_site_for_portal: ', e)

    def fetch_modules(self):
        try:
            self.modules = RegisteredModule.objects.optfilter(self.fetchOptions)
        except Exception, e:
            self.debugger.catch_error('fetch_modules: ', e)

    def get_module(self, module_id):
        try:
            self.module = RegisteredModule.objects.get(id=module_id)
            return self.module
        except Exception, e:
            self.debugger.catch_error('get_module: ', e)

        return None
