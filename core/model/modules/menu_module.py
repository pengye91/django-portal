# -*- coding: utf-8 -*-

from django.db import models
from django.conf import settings
from django.contrib.sites.models import Site
from django.template.defaultfilters import slugify, striptags
from datetime import datetime
from time import time
from ckeditor.fields import RichTextField
from core.model.basemodel import BaseModel
from core.model.modules.module import ModelModuleManager

class MenuOptionsModel(models.Model):
    show_name = models.BooleanField(default = True)
    show_info = models.BooleanField(default = True)
    show_images = models.BooleanField(default = False, verbose_name=u'Menu obrazkowe')
    page_title = models.CharField(max_length=255, verbose_name=u'Tytuł strony', null=True, blank = True)
    show_page_title = models.BooleanField(default = False)
    class_prefix = models.CharField(max_length=255, verbose_name=u'prefix stylu',null=True, blank = True)
    date = models.DateTimeField(blank=True, verbose_name=u'Data dodania',default=datetime.now)
    order = models.IntegerField(verbose_name=u'Kolejność', blank = True, null=True, default = 0)
    objects = ModelModuleManager()

    class Meta:
        db_table = 'module_menu_option'
        abstract = True

    def __unicode__(self):
        return "%s" % self.__class__
