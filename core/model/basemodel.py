# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.sites.models import Site
from datetime import datetime

class BaseModel(models.Model):
    sites = models.ManyToManyField(Site, blank = True, null=True)
    date = models.DateTimeField(blank=True, verbose_name=u'Data dodania',default=datetime.now)

    class Meta:
        abstract = True
