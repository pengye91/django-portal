# -*- coding: utf-8 -*-

__FNAME__ = 'site.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

from django.conf import settings
from django.contrib.sites.models import Site
from core.manager.base import BaseManager
from core.debug.debug import Debugger

class Manager(BaseManager):
    """ ItemManager
        Odpowiada za pobieranie danych z bazy wedlug okreslonych zasad
    """

    def __init__(self, *args, **kwargs):
        """ Konstruktor
        """
        super(Manager, self).__init__(*args, **kwargs)

        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.order = 'name'
        self.model = Site()
        self.modelName = 'Site'
        self.moduleName = '__adm_Sites__'


    def fetch_items(self):
        """Pobiera elementy
        """
        model_class = self.model.__class__
        try:
            self.items = model_class.objects.all().order_by(self.order)[self.rangeItemsStart:self.rangeItemsEnd]
        except Exception,e:
            self.debugger.catch_error('fetch_items: ',e)
