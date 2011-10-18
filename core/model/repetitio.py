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

"""
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE `repetitio_answers`, `repetitio_answers_languages`, `repetitio_answers_permissions`, `repetitio_answers_sites`, `repetitio_course`, `repetitio_courseusers`, `repetitio_courseusers_sites`, `repetitio_course_active`, `repetitio_course_languages`, `repetitio_course_permissions`, `repetitio_course_sites`, `repetitio_questions`, `repetitio_questions_active`, `repetitio_questions_languages`, `repetitio_questions_permissions`, `repetitio_questions_sites`, `repetitio_tests`, `repetitio_tests_active`, `repetitio_tests_languages`, `repetitio_tests_permissions`, `repetitio_tests_sites`, `repetitio_useranswers`, `repetitio_useranswers_sites`, `rep_answer_lang`, `rep_course_lang`, `rep_question_lang`, `rep_test_lang`;
SET FOREIGN_KEY_CHECKS=1;
"""

class RepetitioManager(models.Manager):

    def optfilter(self, options = dict()):
        kwargs = dict()
        args = ()
        exclude = dict()
        if options.has_key('active'):
            if int(options['active']) == 1:
                kwargs['active__id'] = options['activesite']
            elif int(options['active']) == 2:
                exclude['active__id'] = options['activesite']
            else:
                pass

        if options.has_key('test'):
            if options['test'] is not None:
                if int(options['test']) != -1:
                    kwargs['test__exact'] = options['test']

        if options.has_key('course'):
            if options['course'] is not None:
                if int(options['course']) != -1:
                    kwargs['course__exact'] = options['course']

        if options.has_key('question'):
            if options['question'] is not None:
                if int(options['question']) != -1:
                    kwargs['question__exact'] = options['question']

        if not settings.ADMINALLSITES:
            kwargs['sites__id'] = settings.SITE_ID

        if options.has_key('site'):
            if options['site'] != None:
                kwargs['sites__id'] = int(options['site'])

        if options.has_key('temp'):
            kwargs['temp'] = options['temp']

        if options.has_key('extra'):
            kwargs.update(options['extra'])

        return self.filter(*args, **kwargs).exclude(**exclude)

class RepetitioQuestionModel(BaseModel,Preferences):
    manyanswers = models.BooleanField(u'Wielokrotnego wyboru?', default = False)
    textanswers = models.BooleanField(u'Odpowiedź tekstowa?', default = False)
    points = models.IntegerField(max_length=255, verbose_name=u'Ilość punktów za odpowiedź', null=True, blank=True, default=0)
    dento_id = models.IntegerField(null=True, blank=True)
    objects = RepetitioManager()

    class Meta:
        db_table = 'repetitio_questions'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.id)

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def get_lang_unicode(self,language_id):
        language = self.languages.get(language=language_id)
        return language.question

class RepetitioQuestionLanguageModel(models.Model):
    question = models.TextField(verbose_name=u'Pytanie', blank=True, null=True)
    shortname = models.TextField(verbose_name=u'Nazwa krótka',  blank=True, null=True)
    description = RichTextField(verbose_name=u'Opis pytania', blank=True, null=True)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)

    class Meta:
        db_table = 'rep_question_lang'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.question)

    def save(self, *args, **kwargs):
        if self.slug is not None:
            if len(self.slug) == 0:
                strtime = "".join(str(time()).split("."))
                string = "%s-%s" % (strtime[5:], self.question)
                self.slug = slugify(string)
        else:
            self.slug = ''

        if self.meta is not None:
            if len(self.meta) == 0:
                self.meta = striptags(self.question[:160])

        self.meta = ''
        super(RepetitioQuestionLanguageModel, self).save(*args, **kwargs)

class RepetitioAnswerModel(BaseModel,Preferences):
    textanswer = models.BooleanField(verbose_name=u'Odpowiedź tekstowa?', default = False)
    points = models.IntegerField(max_length=255, verbose_name=u'Ilość punktów za odpowiedź', null=True, blank=True, default=0)
    nr = models.IntegerField(max_length=255, verbose_name=u'Numer', null=True, blank=True)
    dento_id = models.IntegerField(null=True, blank=True)
    correct_answer = models.BooleanField(verbose_name=u'Odpowiedź prawidłowa?', default = False)

    objects = RepetitioManager()

    class Meta:
        db_table = 'repetitio_answers'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.id)

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

class RepetitioAnswerLanguageModel(models.Model):
    answer = models.TextField(verbose_name=u'Odpowiedź', blank=True, null=True)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)

    class Meta:
        db_table = 'rep_answer_lang'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.answer)

    def save(self, *args, **kwargs):
        if self.slug is not None:
            if len(self.slug) == 0:
                strtime = "".join(str(time()).split("."))
                string = "%s-%s" % (strtime[5:], self.answer)
                self.slug = slugify(string)
        else:
            self.slug = ''

        if self.meta is not None:
            if len(self.meta) == 0:
                self.meta = striptags(self.answer[:160])

        self.meta = ''
        super(RepetitioAnswerLanguageModel, self).save(*args, **kwargs)

class RepetitioTestModel(BaseModel,Preferences):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'files/repetitio/' + path
    points = models.IntegerField(max_length=255, verbose_name=u'Ilość punktów za wypełnienie ankiety', null=True, blank=True, default=0)
    datapath = models.CharField(max_length=255, verbose_name=u'Ścieżka do pliku z materiałami', null=True, blank=True)
    file = models.FileField(verbose_name=u'plik z materiałami', upload_to=fullpath, null=True, blank=True)
    datestart = models.DateTimeField(verbose_name=u'Data rozpoczęcia emisji',default=datetime.now, blank = True, null = True,)
    dateend = models.DateTimeField(verbose_name=u'Data zakończenia emisji', blank = True, null = True)
    eprice = models.IntegerField(max_length=255, verbose_name=u'Cena w dentonach', null=True, blank=True, default=0)
    smsbuy = models.BooleanField(u'Płatność SMS-em?', default = False)
    sponsored = models.BooleanField(u'Sponsorowany?', default = False)
    dento_presenation_path = models.CharField(max_length=255)
    dento_banner_path = models.CharField(max_length=255)
    edentico = models.BooleanField(u'Edentico?', default = False)
    visible = models.BooleanField(verbose_name=u'Widoczny?', default = False)
    dento_id = models.IntegerField(null=True, blank=True)
    author = models.CharField(max_length=255, verbose_name=u'Autor',  blank=True, null=True)
    objects = RepetitioManager()

    class Meta:
        db_table = 'repetitio_tests'
        abstract = True

    def __unicode__(self):
            return "%s" % (self.id)

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def get_lang_unicode(self,language_id):
        language = self.languages.get(language=language_id)
        return language.name

class RepetitioTestLanguageModel(models.Model):
    name = models.TextField(verbose_name=u'Nazwa ankiety',  blank=True, null=True)
    shortname = models.CharField(max_length=255, verbose_name=u'Nazwa krótka',  blank=True, null=True)
    description = RichTextField(verbose_name=u'Opis',  blank=True, null=True)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)

    class Meta:
        db_table = 'rep_test_lang'
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
                self.meta = striptags(self.name[:160])

        self.meta = ''
        super(RepetitioTestLanguageModel, self).save(*args, **kwargs)

class RepetitioCourseModel(BaseModel,Preferences):
    datestart = models.DateTimeField(verbose_name=u'Data rozpoczęcia', default=datetime.now)
    dateend = models.DateTimeField(verbose_name=u'Data zakończenia', blank=True, null=True)
    points = models.IntegerField(max_length=255, verbose_name=u'Suma punktów', null=True, blank=True, default=0, editable=False)
    visible = models.BooleanField(verbose_name=u'Widoczny?', default = False)
    smsbuy = models.BooleanField(u'Płatność SMS-em?', default = False)
    complete = models.BooleanField(u'Zakończony?', default = False)
    objects = RepetitioManager()

    class Meta:
        db_table = 'repetitio_course'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.id)

    def get_language(self,language_id):
        self.language = self.languages.get(language=language_id)

    def get_lang_unicode(self,language_id):
        language = self.languages.get(language=language_id)
        return language.name

class RepetitioCourseLanguageModel(models.Model):
    name = models.TextField(verbose_name=u'Nazwa',  blank=True, null=True)
    description = RichTextField(verbose_name=u'Opis',  blank=True, null=True)
    law = RichTextField(verbose_name=u'Regulamin', blank=True, null=True)
    slug = models.SlugField(max_length=900, blank=True, null=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)

    class Meta:
        db_table = 'rep_course_lang'
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
                self.meta = striptags(self.name[:160])

        self.meta = ''
        super(RepetitioCourseLanguageModel, self).save(*args, **kwargs)

class RepetitioTestAnswerModel(BaseModel,Preferences):
    """ Odpowiedz uzytkownika na pytanie
    """
    textanswer = RichTextField(verbose_name=u'Odpowiedź tekstowa', blank=True, null=True)
    objects = RepetitioManager()

    class Meta:
        db_table = 'repetitio_useranswers'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.id)

class RepetitioCourseUserModel(BaseModel,Preferences):
    datestart = models.DateTimeField(verbose_name=u'Data rozpoczęcia', default=datetime.now)
    points = models.IntegerField(max_length=255, verbose_name=u'Suma punktów', null=True, blank=True, default=0)
    objects = RepetitioManager()

    class Meta:
        db_table = 'repetitio_courseusers'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.id)
