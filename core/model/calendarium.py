# -*- coding: utf-8 -*-

from django.db import models
from django.conf import settings
from django.contrib.sites.models import Site
from django.template.defaultfilters import slugify, striptags
from datetime import datetime
from time import time
from core.model.basemodel import BaseModel
from core.model.prefs import Preferences
from ckeditor.fields import RichTextField
from sorl.thumbnail import ImageField

class CalendariumManager(models.Manager):

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

        if options.has_key('startdate_gte'):
            kwargs['startdate__gte'] = options['startdate_gte']

        if options.has_key('startdate_lte'):
            kwargs['startdate__lte'] = options['startdate_lte']

        if options.has_key('extra'):
            kwargs.update(options['extra'])

        return self.filter(**kwargs).exclude(**exclude)

class CalendarModel(BaseModel,Preferences):
    dentoid = models.CharField(max_length=255, null=True, blank=True)
    objects = CalendariumManager()

    class Meta:
        db_table = 'calendars'
        abstract = True

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def __unicode__(self):
        return "%s" % (self.id)

class CalendarEventTypeModel(BaseModel,Preferences):
    dentoid = models.CharField(max_length=255, null=True, blank=True)
    objects = CalendariumManager()

    class Meta:
        db_table = 'calendartypes'
        abstract = True

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def __unicode__(self):
        return "%s" % (self.id)

class CalendarEventModel(BaseModel,Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/calendar_events/' + path
    startdate = models.DateTimeField(blank=True, verbose_name=u'Data początkowa', default=datetime.now)
    enddate = models.DateTimeField(blank=True, verbose_name=u'Data końcowa', default=datetime.now)
    town = models.CharField(max_length=255, verbose_name=u'Miejscowość', null=True, blank=True)
    image = ImageField(upload_to=fullpath, verbose_name='Zdjęcie',blank = True, null=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    www = models.CharField(max_length=255, verbose_name='Strona internetowa', null=True, blank=True)
    email = models.CharField(max_length=255, verbose_name='Adres email', null=True, blank=True)
    price = models.CharField(max_length=255, verbose_name='Cena', null=True, blank=True)
    sw = models.BooleanField(u'Święto?',default = False)
    dentoid = models.CharField(max_length=255, null=True, blank=True)
    bannerLink = models.CharField(max_length=100, null=True, blank=True)
    infoLink = models.CharField(max_length=255, null=True, blank=True)
    support = models.CharField(max_length=122,choices=(('0','0'),('1','1'),('2','2'),('3','3'),('4','4'),), null=True, blank=True)
    backgroundColor = models.CharField(max_length=10, null=True, blank=True)
    borderColor = models.CharField(max_length=10, null=True, blank=True)
    borderWidth = models.IntegerField(null=True, blank=True)
    promotor = models.CharField(max_length=128, null=True, blank=True)
    formMail = models.CharField(max_length=32, null=True, blank=True)
    profesor = models.CharField(max_length=128, null=True, blank=True)
    dentocountryid = models.CharField(max_length=32, null=True, blank=True)
    textcolor = models.CharField(max_length=255, verbose_name='Kolor tekstu', null=True, blank=True)
    dentois = models.TextField(null=True, blank=True)
    dentoim = models.TextField(null=True, blank=True)
    dentoih = models.TextField(null=True, blank=True)
    objects = CalendariumManager()

    class Meta:
        db_table = 'calendarevents'
        abstract = True

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def __unicode__(self):
        return "%s" % (self.id)


class CalendarLanguageModel(models.Model):
    name = models.TextField(verbose_name=u'Nazwa kalendarza', blank=True, null=True)
    description = RichTextField(config_name='full_ck', verbose_name=u'Opis', null=True, blank = True)
    shortinfo = RichTextField(config_name='full_ck', verbose_name=u'Krótki opis', null=True, blank = True)
    temp = models.BooleanField(verbose_name=u'Tymczasowy?', default = False)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)

    class Meta:
        db_table = 'calendarlanguages'
        abstract = True

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
                if self.description is not None:
                    if len(self.description) == 0:
                        self.meta = striptags(self.name[:160])
                    else:
                        self.meta = striptags(self.description[:160])
                        metastring = self.meta.split()
                        self.meta = " ".join(metastring[:-1])
                else:
                    self.description = ''
        self.meta = ''
        super(CalendarLanguageModel, self).save(*args, **kwargs)

    def __unicode__(self):
        return "%s" % (self.name)

class CalendarEventTypeLanguageModel(models.Model):
    name = models.TextField(verbose_name='Typ wydarzenia', blank=True, null=True)
    info = RichTextField(config_name='full_ck', verbose_name='Info', null=True, blank = True)

    class Meta:
        db_table = 'calendareventtypelanguages'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

class CalendarEventLanguageModel(models.Model):
    title = models.TextField(verbose_name=u'Tytuł wydarzenia', blank=True, null=True)
    text = RichTextField(config_name='full_ck', verbose_name='Opis wydarzenia', null=True, blank = True)
    contact = RichTextField(config_name='full_ck', verbose_name=u'Kontakt', null=True, blank = True)
    shortinfo = RichTextField(config_name='full_ck', verbose_name=u'Krótki opis', null=True, blank = True)

    class Meta:
        db_table = 'calendareventlanguages'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.title)
