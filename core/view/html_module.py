# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.base import BaseManager as Manager
from core.models import HTMLBoxModuleOption
from core.manager.system import SystemManager

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = Manager()
        self.manager.fetchOptions = { 'site': settings.SITE_ID }
        self.manager.model = HTMLBoxModuleOption()
        self.manager.moduleName = 'HTMLBoxModuleOption'
        self.manager.order = 'date'
        self.manager.debugger.filename = 'html_module.py'

def show_item_by_id(request, itemId):
    system = SystemObject(request)
    system.show_item(request, itemId)
    t = loader.get_template(system.sheet.get_sheet_file('htmlbox'))

    system.data.update(system.get_context())
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))
