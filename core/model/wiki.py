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

class WikiManager(models.Manager):

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


class WikiModel(BaseModel,Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/ads/' + path
    author = models.CharField(max_length=255, verbose_name=u'Autor',blank = True, null=True)
    mainimage = models.ImageField(verbose_name=u'Zdjęcie główne', upload_to=fullpath, null=True, blank=True)
    mimage_info = models.CharField(max_length=255, verbose_name='Info o zdjeciu',blank = True, null=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    parent = models.ForeignKey('self', verbose_name=u'Nadrzędny', blank=True, null=True, related_name='child')

    objects = WikiManager()

    class Meta:
        db_table = 'wiki'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.date)

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def get_parent(self):
        return self.parent

class WikiLanguageModel(models.Model):
    title = models.CharField(max_length=255, verbose_name=u'Tytuł',null=True, blank = True)
    text = RichTextField(config_name='full_ck', verbose_name=u'Treść', null=True, blank = True)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    info = RichTextField(verbose_name=u'Któtki Opis', null=True, blank=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)

    class Meta:
        db_table = 'wiki_lang'
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
        super(WikiLanguageModel, self).save(*args, **kwargs)
