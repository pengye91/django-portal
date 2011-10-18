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

class ArticleListModuleOptionModel(models.Model):
    show_title = models.BooleanField(default = True)
    show_footer = models.BooleanField(default = True)
    show_info = models.BooleanField(default = True)
    show_more = models.BooleanField(default = True)
    small = models.BooleanField(default = False)
    show_only_images = models.BooleanField(verbose_name=u'Lista obrazkowa', default = False)
    use_li = models.BooleanField(verbose_name=u'Użyj list', default = False)
    fetch_subcategories = models.BooleanField(default = False)
    subcategories_depth = models.IntegerField(blank=True, null=True)
    link_title = models.BooleanField(default = True)
    show_mainimage = models.BooleanField(default = True)
    exposefirst = models.BooleanField(default = True)
    page_title = models.CharField(max_length=255, verbose_name=u'Tytuł strony',null=True, blank = True)
    show_page_title = models.BooleanField(default = False)
    class_prefix = models.CharField(max_length=255, verbose_name=u'prefix stylu',null=True, blank = True)
    date = models.DateTimeField(blank=True, verbose_name=u'Data dodania',default=datetime.now)
    order = models.CharField(max_length=255, verbose_name=u'Kolejność', null=True, blank = True)
    count = models.IntegerField(verbose_name=u'Ilość elementów', blank = True, null=True, default = 10)
    only_with_image = models.BooleanField(default = False, verbose_name=u'Tylko ze zdjęciem')
    objects = ModelModuleManager()

    class Meta:
        db_table = 'module_article_list_option'
        abstract = True

    def __unicode__(self):
        return "%s" % self.__class__
