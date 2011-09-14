# -*- coding: utf-8 -*-

from django.db import models
from django.conf import settings
from django.contrib.sites.models import Site
from django.template.defaultfilters import slugify, striptags
from datetime import datetime
from time import time
from ckeditor.fields import RichTextField
from core.model.basemodel import BaseModel
from core.model.prefs import Preferences
from core.model.language import LanguageModel

class AdvManager(models.Manager):

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

        if options.has_key('category__id'):
            kwargs['category__id'] = options['category__id']

        if options.has_key('parent__id'):
            kwargs['parent__id'] = options['parent__id']

        if options.has_key('extra'):
            kwargs.update(options['extra'])

        return self.filter(**kwargs).exclude(**exclude)


class AdvGroupModel(BaseModel, Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/articles_categories/' + path
    name = models.CharField(max_length=255, verbose_name=u'Nazwa')
    info = models.TextField(verbose_name=u'Dodatkowe informacje', blank = True, null = True,)
    image = models.ImageField(verbose_name=u'Zdjęcie kategorii', upload_to=fullpath, null=True, blank=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    noedit = models.BooleanField(default=False)
    class_prefix = models.CharField(max_length=255, verbose_name=u'prefix stylu',null=True, blank = True)
    width = models.IntegerField(verbose_name=u'Szerokość', blank = True, null=True, default = 0)
    height = models.IntegerField(verbose_name=u'Wysokość', blank = True, null=True, default = 0)
    dentoid = models.IntegerField(blank=True, null=True)

    objects = AdvManager()

    def __unicode__(self):
        return "%s" % (self.name)

    class Meta:
        db_table = 'adv_groups'
        abstract = True

class AdvModel(BaseModel, Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/adv/' + path
    filepath = 'files/adv/' + path
    name = models.CharField(max_length=255, verbose_name=u'Nazwa reklamy')
    code = models.TextField(verbose_name=u'Kod reklamy',null=True, blank = True)
    link = models.CharField(max_length=255, verbose_name=u'Link zewnętrzny', blank = True, null = True,)
    info = models.TextField(verbose_name=u'Dodatkowe informacje', blank = True, null = True,)
    datestart = models.DateTimeField(verbose_name=u'Data rozpoczęcia emisji',default=datetime.now, blank = True, null = True,)
    dateend = models.DateTimeField(verbose_name=u'Data zakończenia emisji', blank = True, null = True)
    mainimage = models.ImageField(verbose_name=u'Zdjęcie', upload_to=fullpath, null=True, blank=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    clicks = models.IntegerField(verbose_name=u'Ilość kliknięć', blank = True, null=True, default = 0)
    clickcount = models.IntegerField(verbose_name=u'kliknięcia', blank = True, null=True, default = 0)
    views = models.IntegerField(verbose_name=u'Ilość odsłon', blank = True, null=True, default = 0)
    file = models.FileField(upload_to=filepath, verbose_name=u'Plik', blank = True, null=True)
    is_active = models.BooleanField(default = True)
    in_main = models.BooleanField(default = False)
    default = models.BooleanField(default = False)

    objects = AdvManager()

    class Meta:
        db_table = 'adv'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)


class AdvClientModel(BaseModel, Preferences):
    name = models.CharField(max_length=255, verbose_name='Nazwa klienta')
    address = models.CharField(max_length=255, verbose_name='Adres klienta', null=True, blank=True)
    is_active = models.BooleanField("Aktywny?",default = True)
    info = models.CharField(max_length=255, verbose_name='Dodatkowe informacje', null=True, blank=True)

    objects = AdvManager()

    class Meta:
        db_table = 'adv_clients'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)