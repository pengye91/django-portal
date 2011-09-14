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

class AdManager(models.Manager):

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

class AdImageLanguageModel(models.Model):

    name = models.CharField(max_length=255, verbose_name=u'Nazwa Zdjęcia', blank=True, null=True)
    temp = models.BooleanField(u'Tymczasowy?', default = False)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    info = RichTextField(verbose_name=u'Opis', null=True, blank=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)

    class Meta:
        db_table = 'ads_image_lang'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

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
        super(AdImageLanguageModel, self).save(*args, **kwargs)


class AdImageModel(BaseModel, Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/ads_images/' + path
    image = models.ImageField(verbose_name=u'Zdjęcie', upload_to=fullpath, null=True, blank=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    name = None

    objects = AdManager()

    def __init__(self, *args, **kwargs):
        super(AdImageModel, self).__init__(*args, **kwargs)

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def __unicode__(self):
        return "%s" % (self.name)

    class Meta:
        db_table = 'ad_image'
        abstract = True


class AdModel(BaseModel,Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/ads/' + path
    author = models.CharField(max_length=255, verbose_name=u'Autor',blank = True, null=True)
    mainimage = models.ImageField(verbose_name=u'Zdjęcie główne', upload_to=fullpath, null=True, blank=True)
    mimage_info = models.CharField(max_length=255, verbose_name='Info o zdjeciu',blank = True, null=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    bold = models.BooleanField(u'Pogrubienie?', default = False)
    distinction = models.BooleanField(u'Wyróżnienie?', default = False)
    datestart = models.DateTimeField(verbose_name=u'Data rozpoczęcia', default=datetime.now)
    dateend = models.DateTimeField(verbose_name=u'Data zakończenia', blank=True, null=True)

    objects = AdManager()

    class Meta:
        db_table = 'ad'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.date)

    def get_absolute_url(self):
        postid = "%s" % self.id
        return '/article/post/' + postid + '/'

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

class AdLanguageModel(models.Model):
    title = models.CharField(max_length=255, verbose_name=u'Tytuł',null=True, blank = True)
    text = RichTextField(config_name='full_ck', verbose_name=u'Treść', null=True, blank = True)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    info = RichTextField(verbose_name=u'Któtki Opis', null=True, blank=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)

    class Meta:
        db_table = 'ad_lang'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.title)

    def save(self, *args, **kwargs):
        if self.slug is not None:
            if len(self.slug) == 0:
                strtime = "".join(str(time()).split("."))
                string = "%s-%s" % (strtime[5:], self.title)
                self.slug = slugify(string)
        else:
            self.slug = ''

        if self.meta is not None:
            if len(self.meta) == 0:
                if self.info is not None:
                    if len(self.info) == 0:
                        self.meta = striptags(self.title[:160])
                    else:
                        self.meta = striptags(self.info[:160])
                        metastring = self.meta.split()
                        self.meta = " ".join(metastring[:-1])
                else:
                    self.info = ''
        self.meta = ''
        super(AdLanguageModel, self).save(*args, **kwargs)

class AdCategoryLanguageModel(models.Model):

    name = models.CharField(max_length=255, verbose_name=u'Nazwa Kategorii', blank=True, null=True)
    temp = models.BooleanField(u'Tymczasowy?', default = False)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    info = RichTextField(verbose_name=u'Opis', null=True, blank=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)

    class Meta:
        db_table = 'ad_cat_lang'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

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
        super(AdCategoryLanguageModel, self).save(*args, **kwargs)


class AdCategoryModel(BaseModel, Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/ads_cat/' + path
    parent = models.ForeignKey('self', blank=True, null=True, related_name='child')
    image = models.ImageField(verbose_name=u'Zdjęcie kategorii', upload_to=fullpath, null=True, blank=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    name = None
    noedit = models.BooleanField(default=False)

    objects = AdManager()

    def __init__(self, *args, **kwargs):
        super(AdCategoryModel, self).__init__(*args, **kwargs)

    def get_parent(self):
        return self.parent

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def __unicode__(self):
        return "%s" % (self.name)

    class Meta:
        db_table = 'ad_cat'
        abstract = True

    class Admin:
        list_display = ('name', 'self._parents_repr')
