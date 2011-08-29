# -*- coding: utf-8 -*-

__FNAME__ = 'system.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

from django.template import loader
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from core.manager.portal import PortalManager
from core.manager.sheet import SheetManager
from core.manager.language import LanguageManager
from core.manager.requester import Requester
from core.manager.permission import PermissionManager
from core.debug.debug import Debugger
from core.utils import ranged_pages

class UrlContener(object):

    def __init__(self, *args, **kwargs):
        self.add = ''
        self.edit = ''
        self.show_items = ''

class SystemManager(object):

    def __init__(self, request, *args, **kwargs):
        self.portal = PortalManager()
        self.manager = None
        self.extramanager = None
        self.sheet = SheetManager()
        self.language = LanguageManager(request)
        self.requester = Requester(request)
        self.data = dict()
        self.items = None
        self.urls = UrlContener()
        self.template = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.portal.fetch_data()
        self.language.fetch_active_languages()
        self.language.fetch_current_language(request)
        self.requester.get_messages(request)
        self.portal.fetch_active_site(self.requester.rData['activesite'])
        self.portal.fetchOptions = { 'site': self.portal.activeSite.id, 'active': '1', 'activesite': self.portal.activeSite.id }
        self.portal.fetch_modules()
        self.permission = PermissionManager()

        self.permission.check_logged_user(request)


    def get_context(self, block=False):
        self.data.update(self.sheet.get_context())
        if self.manager is not None:
            self.data.update(self.manager.get_context())
        self.data.update(self.language.get_context())
        self.data.update(self.requester.get_context())
        self.data.update(self.portal.get_context())
        self.data.update(self.permission.get_context())
        self.data.update({ 'urls': self.urls })
        self.data.update({ 'data': self.items })
        if block is True:
            self.data.update({ 'nochanges': True })

        if self.manager.model is not None:
            self.data.update({ 'model': self.manager.model.__class__.__name__ })
        else:
            self.data.update({ 'model': None })
        #key = str(self.manager.moduleName)
        #self.requester.pages(key)

        return self.data

    def show_item(self, request, itemId, admin=False):
        if itemId is not None:
            if itemId != -1:
                self.manager.fetch_item(itemId)
                self.manager.set_language(self.language.currentLanguage)
                self.items = self.manager.item
                self.permission.compare_permissions(self.manager.item, self.manager.model.__class__.__name__, admin)

    def show_items(self, request, default_filter=False, allow_tree=False, has_language=True, admin=False):
        key = self.manager.moduleName
        self.requester.pages(key, request)

        if default_filter is False:
            count = self.manager.count_items(default_filter=False)
        else:
            count = self.manager.count_items(default_filter=True)

        pages = map(lambda x:x,range(1,((count/int(self.requester.rData[key+'pni'])) + 1)))
        rangedPages = ranged_pages(pages, int(self.requester.rData[key+'page']), 3, 2)
        self.requester.rData[key+'pages'] = rangedPages
        self.requester.rData['pages'] = rangedPages

        self.manager.rangeItemsStart = self.requester.rData['pni'] * self.requester.rData['page']
        if self.manager.rangeItemsStart != 0:
            self.manager.rangeItemsEnd = self.manager.rangeItemsStart + self.requester.rData['pni']
        else:
            self.manager.rangeItemsEnd = self.requester.rData['pni']

        #print self.manager.rangeItemsStart, self.manager.rangeItemsEnd

        if allow_tree == True:
            if int(self.requester.rData['selectedactivity']) == -1:
                self.manager.rangeItemsStart = None
                self.manager.rangeItemsEnd = None

        if default_filter is False:
            self.manager.fetch_items(default_filter=False)
        else:
            self.manager.fetch_items(default_filter=True)

        if has_language is True:
            self.manager.set_language(self.language.currentLanguage)

        self.template = loader.get_template(self.sheet.get_sheet_file('admin_list'))

        if allow_tree is True:
            if int(self.requester.rData['selectedactivity']) == -1:
                self.items = self.manager.get_items_as_tree(request)
            else:
                self.items = self.manager.get_items()
        else:
            self.items = self.manager.get_items()

        self.permission.compare_permissions(None, self.manager.model.__class__.__name__, admin)


    def edit_item(self, request, itemId):
        self.manager.fetch_item(itemId)
        self.manager.fetch_items()
        self.items = self.manager.item

        if self.manager.modelLanguage is not None:
            self.language.set_non_existent_language_items(self.manager.item, self.manager.modelLanguage.__class__)
            self.manager.set_language(self.language.currentLanguage)

        t = loader.get_template(self.sheet.get_sheet_file('admin_edit'))

        if self.manager.edit_item(request):

            self.portal.fetch_active_site(self.requester.rData['activesite'])
            try:
                self.manager.item.sites.add(self.portal.get_active_site())
            except Exception,e:
                self.debugger.catch_error('edit_item', e)
            try:
                self.manager.item.active.add(self.portal.get_active_site())
            except Exception,e:
                self.debugger.catch_error('edit_item', e)

            if request.POST['sn'] == '1':
                return HttpResponseRedirect(reverse(self.urls.add)) # wracamy do nowego elementu
            else:
                return HttpResponseRedirect(reverse(self.urls.show_items)) # wracamy do listy

        return None

    def new(self):
        self.manager.new()
        self.manager.item.sites.add(self.portal.activeSite)
        self.manager.item.active.add(self.portal.activeSite)