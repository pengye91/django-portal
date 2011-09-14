# -*- coding: utf-8 -*-

from django.db import models
from django.conf import settings
from django.contrib.sites.models import Site
from django.template.defaultfilters import slugify, striptags
from datetime import datetime
from time import time
from ckeditor.fields import RichTextField
from core.model.basemodel import BaseModel

class ModelModuleManager(models.Manager):

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

        if options.has_key('notmenumodule'):
            exclude['type__menu'] = True

        return self.filter(**kwargs).exclude(**exclude)

class ModulePositionModel(BaseModel):
    name = models.CharField(max_length=255, verbose_name=u'Nazwa pozycji', blank=True, null=True)
    objects = ModelModuleManager()

    class Meta:
        db_table = 'module_position'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

ASSIGNMENT_CHOICES = (
    (1, u'Menu'),
    (2, u'Content'),
    (3, u'Flash'),
)

class ModuleTypeModel(BaseModel):
    name = models.CharField(max_length=255, verbose_name=u'Nazwa Typu', blank=True, null=True)
    info = RichTextField(verbose_name=u'Opis', null=True, blank=True)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    menu = models.BooleanField(verbose_name=u'Do menu?', default = False)
    options_modelname = models.CharField(max_length=255, verbose_name=u'Klasa Modelu', blank=True, null=True)
    options_formname = models.CharField(max_length=255, verbose_name=u'Klasa formularza', blank=True, null=True)
    filemodel = models.CharField(max_length=255, verbose_name=u'Plik z modelem', blank=True, null=True)
    fileform = models.CharField(max_length=255, verbose_name=u'Plik z formularzem', blank=True, null=True)
    filetemplate = models.CharField(max_length=255, verbose_name=u'Plik szablonu', blank=True, null=True)
    fileview = models.CharField(max_length=255, verbose_name=u'Plik widoku', blank=True, null=True)
    objects = ModelModuleManager()

    class Meta:
        db_table = 'module_type'
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

        super(ModuleTypeModel, self).save(*args, **kwargs)

class RegisteredModuleModel(BaseModel):
    name = models.CharField(max_length=255, verbose_name=u'Zarejestrowana nazwa', blank=True, null=True)
    info = RichTextField(verbose_name=u'Opis', null=True, blank=True)
    modulename = models.CharField(max_length=255, verbose_name=u'Nazwa', blank=True, null=True)
    order = models.PositiveSmallIntegerField(default=1, blank=True, null=True)
    objects = ModelModuleManager()

    class Meta:
        db_table = 'module_registered'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)
