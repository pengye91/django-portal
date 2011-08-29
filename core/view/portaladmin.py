# -*- coding: utf-8 -*-

from copy import deepcopy
from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.system import SystemManager

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        toppanel = {
            '': '__adm_Statistics__',
            reverse('core.view.siteadmin.show_items'): '__adm_Sites__',
            reverse('core.view.sheetadmin.show_items'): '__adm_Sheets__',
            '': '__adm_Users__'
        }
        self.data.update({ 'toppanel': toppanel })

def show_items(request):
    system = SystemObject(request)
    if system.permission.user is None:
        return HttpResponseRedirect(reverse('core.view.userprofileadmin.login'))
    system.portal.fetch_active_site(system.requester.rData['activesite'])
    system.template = loader.get_template(system.sheet.get_sheet_file('admin_portal'))

    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))
