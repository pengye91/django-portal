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

class SiteMapOptionModel(BaseModel):
    show_name = models.BooleanField(default = True)
    show_info = models.BooleanField(default = True)
    page_title = models.CharField(max_length=255, verbose_name=u'Tytuł strony', null=True, blank = True)
    show_page_title = models.BooleanField(default = False)
    class_prefix = models.CharField(max_length=255, verbose_name=u'prefix stylu',null=True, blank = True)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    objects = ModelModuleManager()

    class Meta:
        db_table = 'module_sitemap_option'
        abstract = True

    def __unicode__(self):
        return "%s" % self.__class__

    def save(self, *args, **kwargs):
        if self.slug is not None:
            if len(self.slug) == 0:
                strtime = "".join(str(time()).split("."))
                if self.page_title is not None:
                    string = "%s-%s" % (strtime[5:], self.page_title)
                else:
                    string = "%s-sitemap" % (strtime[5:])
                self.slug = slugify(string)
        else:
            self.slug = ''

        super(SiteMapOptionModel, self).save(*args, **kwargs)
