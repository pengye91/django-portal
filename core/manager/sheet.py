# -*- coding: utf-8 -*-

__FNAME__ = 'sheet.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

import os
from django.conf import settings
from core.debug.debug import Debugger
from core.models import Sheet, SheetFiles
from core.manager.base import BaseManager

class SheetManager(BaseManager):
    """Sheet
    """
    def __init__(self, *args, **kwargs):
        """Init
        """
        super(SheetManager, self).__init__(*args, **kwargs)
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.admin_site = None
        self.sheet = None
        self.sheets = None
        self.fullpath = None
        self.path = None
        self.order = 'name'
        self.model = Sheet()
        self.modelName = 'Sheet'
        self.moduleName = '__adm_Sheets__'
        self.request = None
        self.reqsite = None

    def get_sheet_file(self, templatename):
        if self.sheet is None:
            self.fetch_sheet()

        err_template = 'no_template.html'

        if not self.sheet:
            err_template = 'no_sheets.html'
        else:
            try:
                templates = SheetFiles.objects.filter(name=templatename, sheet=self.sheet)
                if len(templates)==1:
                    template = templates[0]
                elif len(templates)>1:
                    template = templates[0]
                else:
                    raise Exception('No template.')

                err_template = None
                absolutePath = settings.PROJECT_ROOT + 'templates/' + self.sheet.sheetpath + '/' + template.path
                if not os.path.isfile(absolutePath):
                    err_template = 'no_template.html'
                    raise Exception('File not found: ' + str(absolutePath))
            except Exception, e:
                self.debugger.catch_error('get_sheet_file: ',e)

        if err_template is None:
            return template.path
        else:
            return err_template
    """
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
                self.debugger.catch_error('fetch_sheet: ',e)
                self.request.session['reqsite'] = settings.SITE_ID
                self.reqsite = settings.SITE_ID
        else:
            self.reqsite = settings.SITE_ID
    """
    """
    def set_reqsite(self):
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
                self.debugger.catch_error('fetch_sheet: ',e)
                self.request.session['reqsite'] = settings.SITE_ID
                self.reqsite = settings.SITE_ID
        else:
            self.reqsite = settings.SITE_ID
    """
    def fetch_sheet(self):
        sheets = None

        if self.reqsite == 0:
            self.reqsite = settings.DEFAULT_SITE_ID
        elif self.reqsite is None:
            self.reqsite = settings.DEFAULT_SITE_ID

        try:
            sheets = Sheet.objects.filter(sites__id__exact=self.reqsite, default=1)
        except Exception,e:
            self.sheet = Sheet()
            self.sheet.sheetpath = 'default'
            self.debugger.catch_error('fetch_sheet: ',e)

        if sheets is not None:
            if len(sheets) >0:
                self.sheet = sheets[0]
                self.sheets = sheets
            else:
                self.sheet = Sheet()
                self.sheet.sheetpath = 'default'

        self.fullpath = settings.PROJECT_ROOT + "/templates/" + self.sheet.sheetpath
        self.path = self.sheet.sheetpath
        settings.TEMPLATE_DIRS = (self.fullpath,)
        settings.PORTALSHEETPATH = self.sheet.sheetpath

    def fetch_sheets(self):
        if self.reqsite is None:
            try:
                self.sheets = Sheet.objects.filter(sites__id=self.reqsite)
            except Exception,e:
                self.debugger.catch_error('fetch_sheet: ',e)
        else:
            try:
                self.sheets = Sheet.objects.filter(sites__id=self.reqsite)
            except Exception,e:
                self.debugger.catch_error('fetch_sheet: ',e)

    def fetch_items(self):
        """Pobiera elementy
        """
        model_class = self.model.__class__
        try:
            self.items = model_class.objects.all().order_by(self.order)[self.rangeItemsStart:self.rangeItemsEnd]
        except Exception,e:
            self.debugger.catch_error('fetch_items: ',e)

    def get_context(self):
        return { 'PORTALSHEETPATH': self.path }
