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

class LinkModuleOptionModel(BaseModel):
    title = models.TextField(blank=True, null=True)
    link = models.TextField(blank=True, null=True)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    show_title = models.BooleanField(default = False)
    new_window = models.BooleanField(default = False)

    objects = ModelModuleManager()

    class Meta:
        db_table = 'module_link_option'
        abstract = True

    def __unicode__(self):
        return "%s" % self.__class__

    def save(self, *args, **kwargs):
        if self.slug is not None:
            if len(self.slug) == 0:
                strtime = "".join(str(time()).split("."))
                if self.title != '':
                    string = "%s-%s" % (strtime[5:], self.title)
                else:
                    string = "%s" % (strtime[5:])
                self.slug = slugify(string)
        else:
            self.slug = ''

        super(LinkModuleOptionModel, self).save(*args, **kwargs)
