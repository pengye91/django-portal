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

class CategoryManager(models.Manager):

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

        if options.has_key('category__id'):
            kwargs['category__id'] = options['category__id']

        if options.has_key('parent__id'):
            kwargs['parent__id'] = options['parent__id']

        if options.has_key('extra'):
            kwargs.update(options['extra'])

        return self.filter(**kwargs).exclude(**exclude)


class CategoryLanguageModel(models.Model):

    name = models.CharField(max_length=255, verbose_name=u'Nazwa Kategorii', blank=True, null=True)
    temp = models.BooleanField(u'Tymczasowy?', default = False)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    info = RichTextField(verbose_name=u'Opis', null=True, blank=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)
    altname = models.CharField(max_length=255, verbose_name=u'Nazwa alternatywna', blank=True, null=True)

    class Meta:
        db_table = 'categorylanguages'
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
        super(CategoryLanguageModel, self).save(*args, **kwargs)


class CategoryModel(BaseModel, Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/articles_categories/' + path
    parent = models.ForeignKey('self', blank=True, null=True, related_name='child')
    image = models.ImageField(verbose_name=u'Zdjęcie kategorii', upload_to=fullpath, null=True, blank=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    name = None
    noedit = models.BooleanField(default=False)
    show_title = models.BooleanField(default = True)
    show_footer = models.BooleanField(default = True)
    show_info = models.BooleanField(default = True)
    show_more = models.BooleanField(default = True)
    fetch_subcategories = models.BooleanField(default = False)
    subcategories_depth = models.IntegerField(blank=True, null=True)
    link_title = models.BooleanField(default = True)
    show_mainimage = models.BooleanField(default = True)
    exposefirst = models.BooleanField(default = True)
    page_title = models.CharField(max_length=255, verbose_name=u'Tytuł strony',null=True, blank = True)
    show_page_title = models.BooleanField(default = False)
    class_prefix = models.CharField(max_length=255, verbose_name=u'prefix stylu',null=True, blank = True)
    dentoid = models.IntegerField(blank=True, null=True)

    objects = CategoryManager()

    def __init__(self, *args, **kwargs):
        super(CategoryModel, self).__init__(*args, **kwargs)

    def get_parent(self):
        return self.parent

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def __unicode__(self):
        return "%s" % (self.name)

    class Meta:
        db_table = 'categories'
        abstract = True

    class Admin:
        list_display = ('name', 'self._parents_repr')
