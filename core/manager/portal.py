# -*- coding: utf-8 -*-

__FNAME__ = 'portal.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

from django.conf import settings
from core.debug.debug import Debugger
from django.contrib.sites.models import Site
from core.models import RegisteredModule, ModuleType

class PortalManager(object):


    def __init__(self, request, *args, **kwargs):
        self.sites = None
        self.activeSite = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.modules = None
        self.module = None
        self.module_types = None
        self.module_type = None
        self.fetchOptions = dict()
        self.reqsite = None
        self.request = request
        self.get_user_site()

    def fetch_data(self):
        try:
            self.sites = Site.objects.all()
        except Exception, e:
            self.debugger.catch_error('fetch_data: ', e)

    def fetch_active_site(self, pid):
        error = 0
        try:
            site = Site.objects.get(id=pid)
            self.activeSite = site
        except Exception, e:
            error = 1
            self.debugger.catch_error('fetch_active_site: ', e)

        if error == 1:
            try:
                site = Site.objects.get(id=settings.DEFAULT_SITE_ID)
                self.activeSite = site
            except Exception, e:
                self.debugger.catch_error('fetch_active_site--: ', e)

    def get_active_site(self):
        return self.activeSite

    def get_context(self):
        return { 'sites': self.sites, 'activesiteobject': self.get_active_site(), 'modules': self.modules, 'module_types': self.module_types, 'usersite': self.reqsite }

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

    def fetch_module_types(self):
        try:
            self.module_types = ModuleType.objects.optfilter(self.fetchOptions)
        except Exception, e:
            self.debugger.catch_error('fetch_modules: ', e)

    def get_module(self, module_id):
        try:
            self.module = RegisteredModule.objects.get(id=module_id)
            return self.module
        except Exception, e:
            self.debugger.catch_error('get_module: ', e)

        return None

    def get_module_type(self, moduletype_id):
        try:
            self.module_type = ModuleType.objects.get(id=moduletype_id)
            return self.module_type
        except Exception, e:
            self.debugger.catch_error('get_module: ', e)

        return None

    def get_user_site(self):
        if self.request is not None:
            try:
                if self.request.method == 'GET':
                    if self.request.GET.has_key('reqsite'):
                        self.reqsite = self.request.GET['reqsite']
                        self.request.session['reqsite'] = self.reqsite
                    else:
                        self.reqsite = self.request.session['reqsite']
                elif self.request.method == 'POST':
                    if self.request.POST.has_key('reqsite'):
                        self.reqsite = self.request.POST['reqsite']
                        self.request.session['reqsite'] = self.reqsite
                    else:
                        self.reqsite = self.request.session['reqsite']
                else:
                    self.reqsite = self.request.session['reqsite']
            except Exception,e:
                self.debugger.catch_error('get_user_site: ',e)
                self.request.session['reqsite'] = settings.SITE_ID
                self.reqsite = settings.SITE_ID
        else:
            self.reqsite = settings.SITE_ID

        self.fetch_active_site(self.reqsite)
