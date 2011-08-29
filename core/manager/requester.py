# -*- coding: utf-8 -*-

__FNAME__ = 'requester.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

from datetime import datetime
from django.conf import settings
from django.contrib.sessions.models import Session
from core.debug.debug import Debugger

class Requester(object):


    def __init__(self, request, *args, **kwargs):

        self.selectedActivity = -1
        self.painateni = None
        self.numItemsOnPage = 25
        self.contextdata = dict()
        self.activeSite = None
        self.selectedCategory = None
        self.request = request
        self.rData = {
            'selectedactivity': -1,
            'activesite': None,
            'pni': 10,
            'pages': [],
            'page': 0,
            'pprev': None,
            'pnext': 1,
            'pagesinfo': {},
            #'paginateni': 10,
            'selectedcategory': None,
            'selectedtest': None,
            'selectedcourse': None,
            'selectedquestion': None,
            'adminall': settings.ADMINALLSITES,
            'currentdate': datetime.now()
        }
        #print self.rData
        self.debugger = Debugger(__MNAME__,__FNAME__)
        super(Requester, self).__init__(*args, **kwargs)

    def pages(self, key, request):
        self.get_opt_pages(key, 'pni', request, 10, True)
        self.get_opt_pages(key, 'page', request, 0, True)
        self.get_opt_pages(key, 'pages', request, [], False)
        self.get_opt_pages(key, 'pprev', request, None, False)
        self.get_opt_pages(key, 'pnext', request, 2, True)
        if request.method == 'GET':
            if request.GET.has_key('pni'):
                self.rData[key+'page'] = 0
        self.set_session_values(request)

    def get_opt_pages(self, key1, key2, request, default, integer):
        if not self.rData.has_key(key1+key2):
            if request.session.has_key(key1+key2):
                self.rData[key1+key2] = request.session[key1+key2]
            else:
                self.rData.update({ key1+key2: default })

        if self.rData.has_key(key1+key2):
            if request.method == 'GET':
                if request.GET.has_key(key2):
                    self.rData[key1+key2] = request.GET[key2]
                else:
                    if self.rData[key1+key2] == '':
                        self.rData[key1+key2] = default
                    self.rData[key2] = self.rData[key1+key2]

        if integer is True:
            if self.rData.has_key(key2):
                self.rData[key2] = int(self.rData[key2])


    def get_messages(self, request):
        if settings.ADMINALLSITES is False:
            self.activeSite = settings.SITE_ID
        else:
            self.get_option('activesite', request, True)
        self.get_option('selectedcategory', request)
        self.get_option('pni', request)
        self.get_option('pages', request)
        self.get_option('page', request)
        self.get_option('pprev', request)
        self.get_option('pnext', request)
        self.get_option('selectedactivity', request)
        self.get_option('selectedtest', request, True)
        self.get_option('selectedcourse', request, True)
        self.get_session_active_site(request)
        self.set_session_values(request)

    def get_page(self, request):
        if rData['page'] == 1:
                rData['pprev'] = None
        else:
                rData['pprev'] = int(rData['page']) - 1

        rData['pnext'] = int(rData['page']) + 1

        #data.update({ 'page': page, 'prevpage': prevpage, 'nextpage': nextpage })

    def get_option(self, key, request, integer=False):
        if not self.rData.has_key(key):
            self.rData.update({ key: '' })

        data = ''
        try:
            data = request.session[key]
        except Exception,e:
            self.debugger.catch_error('get_option: ', e)

        try:
            data = request.GET[key]
        except Exception,e:
            self.debugger.catch_error('get_option: ', e)

        if data is not None:
            if data != '':
                self.rData[key] = data

        if integer is True:
            if self.rData.has_key(key):
                try:
                    self.rData[key] = int(self.rData[key])
                except Exception,e:
                    self.debugger.catch_error('get_option: ', e)


    def get_session_active_site(self, request):
        if not self.rData.has_key('activesite'):
            self.rData['activesite'] = settings.SITE_ID
        else:
            if self.rData['activesite'] == None:
                self.rData['activesite'] = settings.SITE_ID
            elif self.rData['activesite'] == '':
                self.rData['activesite'] = settings.SITE_ID

    def set_session_values(self, request):
        for key, value in self.rData.items():
            request.session[key] = value

    def get_context(self):
        if self.request.method == 'GET':
            if self.request.GET.has_key('loadfromjs'):
                self.rData.update({ 'loadfromjs': 1 })
        return self.rData

    def set_context_data(self):
        pass

    def init_from_session(self, request):
        self.get_session_active_site(request)
