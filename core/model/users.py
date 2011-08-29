# -*- coding: utf-8 -*-

from django.conf import settings
from django.db import models
from datetime import datetime

class ProfileManager(models.Manager):

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

        if options.has_key('username'):
            kwargs['username'] = options['username']

        if options.has_key('password'):
            kwargs['password'] = options['password']

        if options.has_key('confirmed'):
            kwargs['confirmed'] = options['confirmed']

        return self.filter(**kwargs).exclude(**exclude)

class ProfileModel(models.Model):
    username = models.CharField(max_length=255, verbose_name=u'Nazwa Użytkownika')
    password = models.CharField(max_length=255, verbose_name=u'Hasło')
    email = models.EmailField(max_length=255, verbose_name=u'Adres email')
    registerhash = models.CharField(max_length=255, verbose_name=u'kod potwierdzenia', null=True, blank=True)
    userhash = models.CharField(max_length=255, verbose_name=u'user code', null=True, blank=True)
    lastlogin = models.DateTimeField(blank = True, null=True,)
    lastip = models.CharField(max_length=255, null=True, blank=True)
    is_active = models.BooleanField(default = False)
    confirmed = models.BooleanField(default = False)
    registerdate = models.DateTimeField(blank=True, verbose_name=u'Data rejestracji', default=datetime.now)
    emailsenddate = models.DateTimeField(verbose_name=u'Data wysłania emaila', null=True, blank=True)
    admincomment = models.TextField(verbose_name=u'Uwagi administracyjne',null=True, blank = True)
    objects = ProfileManager()

    class Meta:
        db_table = 'profiles'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.username)


class ProfileGroupModel(models.Model):
    name = models.CharField(max_length=255)
    objects = ProfileManager()

    class Meta:
        db_table = 'profile_groups'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)


class ProfilePermissionModel(models.Model):
    read = models.BooleanField(default = True)
    write = models.BooleanField(default = True)
    delete = models.BooleanField(default = True)
    add = models.BooleanField(default = True)
    own_only = models.BooleanField(default = True)
    objects = ProfileManager()

    class Meta:
        db_table = 'profile_perm'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.own_only)

class ProfileDataModel(models.Model):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/profiles/' + path
    name = models.CharField(max_length=255, verbose_name=u'Imię', null=True, blank=True)
    surname = models.CharField(max_length=255, verbose_name=u'Nazwisko', null=True, blank=True)
    birthdate = models.DateTimeField(verbose_name=u'Data urodzin', blank = True, null=True,)
    post_code = models.CharField(max_length=10, verbose_name=u'Kod pocztowy', blank = True, null=True)
    street = models.CharField(max_length=255, verbose_name=u'Ulica', blank = True, null=True)
    town = models.CharField(max_length=255, verbose_name=u'Miasto', null=True, blank=True)
    shortinfo = models.TextField(verbose_name=u'Krótkie info',null=True, blank = True)
    image = models.ImageField(verbose_name=u'Zdjęcie', upload_to=fullpath, null=True, blank=True)
    pathinfo  = models.CharField(max_length=255, blank=False, null=False, editable=False, default=path)
    objects = ProfileManager()

    class Meta:
        db_table = 'profile_data'
        abstract = True

    def __unicode__(self):
        return "%s %s" % (self.name, self.surname)