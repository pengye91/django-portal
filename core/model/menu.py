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

class MenuManager(models.Manager):

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

        if options.has_key('menu'):
            if int(options['menu']) != -1:
                kwargs['menu__id'] = options['menu']

        if options.has_key('extra'):
            kwargs.update(options['extra'])

        return self.filter(**kwargs).exclude(**exclude)


class MenuModel(BaseModel, Preferences):
    name = models.CharField(max_length=255, verbose_name=u'Nazwa', blank=True, null=True)
    altname = models.CharField(max_length=255, verbose_name=u'Alternatywna nazwa', blank=True, null=True)
    info = RichTextField(verbose_name=u'Opis', null=True, blank=True)
    objects = MenuManager()

    class Meta:
        db_table = 'menu'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

class MenuItemLanguageModel(models.Model):

    name = models.CharField(max_length=255, verbose_name=u'Nazwa', blank=True, null=True)
    altname = models.CharField(max_length=255, verbose_name=u'Alternatywna nazwa', blank=True, null=True)
    temp = models.BooleanField(u'Tymczasowy?', default = False)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    info = RichTextField(verbose_name=u'Opis', null=True, blank=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)
    objects = MenuManager()

    class Meta:
        db_table = 'menuitem_lang'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def save(self, *args, **kwargs):
        if self.slug is not None:
            if len(self.slug) == 0:
                strtime = "".join(str(time()).split("."))
                string = "%s-%s" % (strtime[5:], self.name)
                self.slug = slugify(string)
        else:
            self.slug = ''

        if self.meta is not None:
            if len(self.meta) == 0:
                if self.info is not None:
                    if len(self.info) == 0:
                        self.meta = striptags(self.name[:160])
                    else:
                        self.meta = striptags(self.info[:160])
                        metastring = self.meta.split()
                        self.meta = " ".join(metastring[:-1])
                else:
                    self.info = ''
        self.meta = ''
        super(MenuItemLanguageModel, self).save(*args, **kwargs)


class MenuItemModel(BaseModel, Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/menu/' + path
    parent = models.ForeignKey('self', blank=True, null=True, related_name='child')
    image = models.ImageField(upload_to=fullpath, null=True, blank=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    name = None
    noedit = models.BooleanField(default=False)

    objects = MenuManager()

    def __init__(self, *args, **kwargs):
        super(MenuItemModel, self).__init__(*args, **kwargs)

    def get_parent(self):
        return self.parent

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def __unicode__(self):
        return "%s" % (self.name)

    class Meta:
        db_table = 'menuitem'
        abstract = True
