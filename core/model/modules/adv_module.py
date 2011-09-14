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

class AdvModuleOptionModel(BaseModel):
    title = models.TextField(blank=True, null=True)
    show_title = models.BooleanField(default = True)
    ammount = models.IntegerField(verbose_name=u'Ile reklam naraz', blank = True, null=True, default = 0)
    class_prefix = models.CharField(max_length=255, verbose_name=u'styl',null=True, blank = True)
    slug = models.SlugField(max_length=900, blank=True, null=True)

    objects = ModelModuleManager()

    class Meta:
        db_table = 'module_adv_option'
        abstract = True

    def __unicode__(self):
        return "%s" % self.__class__

    def save(self, *args, **kwargs):
        if self.slug is not None:
            if len(self.slug) == 0:
                strtime = "".join(str(time()).split("."))
                string = "%s-%s" % (strtime[5:], self.title)
                self.slug = slugify(string)
        else:
            self.slug = ''

        super(AdvModuleOptionModel, self).save(*args, **kwargs)
