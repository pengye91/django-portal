# -*- coding: utf-8 -*-

from django.db import models
from django.conf import settings
from django.contrib.sites.models import Site
from datetime import datetime
from ckeditor.fields import RichTextField
from core.model.basemodel import BaseModel
from core.model.prefs import Preferences

class SheetManager(models.Manager):

    def optfilter(self, options = dict()):
        kwargs = dict()
        exclude = dict()
        if options.has_key('active'):
            if int(options['active']) == 1:
                kwargs['active__id'] = options['activesite']
            elif int(options['active']) == 2:
                exclude['active__id'] = options['activesite']
            else:
                pass

        if not settings.ADMINALLSITES:
            kwargs['sites__id'] = settings.SITE_ID

        if options.has_key('site'):
            if options['site'] != None:
                kwargs['sites__id'] = int(options['site'])

        if options.has_key('temp'):
            kwargs['temp'] = options['temp']

        if options.has_key('extra'):
            kwargs.update(options['extra'])

        return self.filter(**kwargs).exclude(**exclude)

class SheetModel(BaseModel):
    """ Model przechowujacy informacje o szablonach strony
    """
    name = models.CharField(max_length=150, verbose_name=u'Nazwa')
    sheetpath = models.CharField(max_length=150, verbose_name=u'Katalog z szablonem')
    info = RichTextField(config_name='full_ck', verbose_name=u'Info', blank=True, null=True)
    objects = SheetManager()

    class Meta:
        db_table = 'sheets'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

class SheetFilesModel(models.Model):
    """ Informacje o plikach szablonu
    """
    name = models.CharField(max_length=150, verbose_name=u'Nazwa')
    path = models.CharField(max_length=150, verbose_name=u'Ścieżka')
    info = models.TextField(verbose_name=u'Info', blank=True, null=True)
    objects = SheetManager()

    class Meta:
        db_table = 'sheetfiles'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)
