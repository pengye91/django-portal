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
        self.sheet = None
        self.sheets = None
        self.fullpath = None
        self.path = None
        self.order = 'name'
        self.model = Sheet()
        self.modelName = 'Sheet'
        self.moduleName = '__adm_Sheets__'

    def get_sheet_file(self, templatename):
        self.fetch_sheet()
        err_template = 'no_template.html'

        if not self.sheet:
            err_template = 'no_sheets.html'
        else:
            try:
                templates = SheetFiles.objects.filter(name=templatename)
                template = templates[0]
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


    def fetch_sheet(self):
        try:
            sheets = Sheet.objects.filter(sites__id=settings.SITE_ID)
            self.sheet = sheets[0]
            self.sheets = sheets

            if not sheets:
                self.sheet = Sheet()
                self.sheet.sheetpath = 'default'
        except Exception,e:
            self.sheet = Sheet()
            self.sheet.sheetpath = 'default'
            self.debugger.catch_error('fetch_sheet: ',e)

        self.fullpath = settings.PROJECT_ROOT + "/templates/" + self.sheet.sheetpath
        self.path = self.sheet.sheetpath
        settings.TEMPLATE_DIRS = (self.fullpath,)
        settings.PORTALSHEETPATH = self.sheet.sheetpath

    def fetch_sheets(self):
        try:
            self.sheets = Sheet.objects.filter(sites__id=settings.SITE_ID)
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
