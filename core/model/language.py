# -*- coding: utf-8 -*-

from django.db import models
from django.conf import settings
from ckeditor.fields import RichTextField
#from core.model.portal import PortalBox, PortalModule
from core.model.basemodel import BaseModel
from core.model.prefs import Preferences

class LanguageModel(BaseModel):
    name = models.CharField(max_length=255, verbose_name=u'Nazwa')
    symbol = models.CharField(max_length=255, verbose_name=u'Symbol')
    currencysymbol = models.CharField(max_length=255, verbose_name=u'Symbol waluty')

    class Meta:
        db_table = 'languages'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

"""
class PortalBoxLanguageModel(models.Model):
    portalbox = models.ForeignKey(PortalBox, verbose_name=u'Dodatek')
    name = models.CharField(max_length=150, verbose_name=u'Nazwa',null=True, blank = True)
    source = models.TextField(verbose_name=u'Zawartość (opcjonalnie)',null=True, blank = True)

    class Meta:
        verbose_name = u'Tłumaczenie dodatku'
        verbose_name_plural = u'Tłumaczenia dodatków'
        db_table = 'portalboxlanguages'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

class PortalModuleLanguageModel(models.Model):
    portalmodule = models.ForeignKey(PortalModule, verbose_name=u'Dodatek')
    name = models.CharField(max_length=150, verbose_name=u'Nazwa', blank=True, null=True)
    info = RichTextField(config_name='full_ck', verbose_name=u'Info', blank=True, null=True)

    class Meta:
        verbose_name = u'Tłumaczenie modułu'
        verbose_name_plural = u'Tłumaczenia modułów'
        db_table = 'portalmodulelanguages'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)
"""
class PortalSiteConstLanguageModel(BaseModel):
    systemname = models.CharField(max_length=150, verbose_name=u'Nazwa systemowa')
    name = models.TextField(verbose_name=u'Nazwa')

    class Meta:
        db_table = 'sheetlanguages'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)
