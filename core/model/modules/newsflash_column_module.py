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
from sorl.thumbnail import ImageField

class NewsFlashColumnModuleModel(BaseModel):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/modules/' + path
    show_title = models.BooleanField(default = True)
    show_footer = models.BooleanField(default = True)
    show_more = models.BooleanField(default = True)
    show_info = models.BooleanField(default = True)
    link_title = models.BooleanField(default = True)
    show_mainimage = models.BooleanField(default = True)
    exposefirst = models.BooleanField(default = True)
    columns = models.IntegerField(null=True, blank=True)
    page_title = models.CharField(max_length=255, verbose_name=u'Tytuł strony',null=True, blank = True)
    show_page_title = models.BooleanField(default = True)
    class_prefix = models.CharField(max_length=255, verbose_name=u'prefix stylu',null=True, blank = True)
    info = RichTextField(config_name='full_ck', verbose_name=u'Krótki opis', null=True, blank = True)
    image = ImageField(upload_to=fullpath, verbose_name='Zdjęcie', blank = True, null=True)

    objects = ModelModuleManager()

    class Meta:
        db_table = 'module_newsflash_c_option'
        abstract = True

    def __unicode__(self):
        return "%s" % self.__class__




