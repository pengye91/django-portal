# -*- coding: utf-8 -*-

from datetime import datetime
from django.db import models
from django.conf import settings
from django.contrib.sites.models import Site
from ckeditor.fields import RichTextField

class SitePortalManager(models.Manager):

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

class SitePortalModel(models.Model):
    path = str(datetime.now().year) + '/' + str(datetime.now().month)
    fullpath = 'images/portal/' + path
    image = models.ImageField(verbose_name=u'Zdjęcie', upload_to=fullpath, null=True, blank=True)
    info = RichTextField(verbose_name=u'Któtki Opis', null=True, blank=True)
    meta = models.CharField(max_length=255, verbose_name=u'Opis meta', blank=True, null=True)
    keywords = models.CharField(max_length=500, verbose_name=u'Słowa kluczowe', blank=True, null=True)
    visits = models.IntegerField(verbose_name=u'Ilość wizyt', blank = True, null=True,default = 0, editable=False)
    name = models.CharField(max_length=500, verbose_name=u'Nazwa', blank=True, null=True)
    domain = models.CharField(max_length=250, verbose_name=u'Domena', blank=True, null=True)

    class Meta:
        db_table = 'site_portal'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.meta)

class SitePortalStatModel(models.Model):
    date = models.DateTimeField(blank=True, verbose_name=u'Data wizyty',default=datetime.now)
    ip = models.IPAddressField(blank=True, null=True)
    system = models.TextField(blank=True, null=True)
    browser = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'site_portal_stat'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.ip)

class PortalModule(models.Model):
    """ Model przechowujacy informacje o modulach strony
        moduly sa przypisane do konkretnych stron
    """

    modulename = models.CharField(max_length=150, verbose_name=u'Nazwa modułu')
    systemname = models.CharField(max_length=150, verbose_name=u'Nazwa systemowa')
    active = models.BooleanField(u'Aktywny?', default = True)
    required = models.BooleanField(u'Wymagany?', default = True)
    sites = models.ManyToManyField(Site)

    class Meta:
        db_table = 'portalmodules'

    def __unicode__(self):
        return "%s" % (self.systemname)

BOXPOSITION_CHOICES = (
    (1, u'Kolumna lewa'),
    (2, u'Kolumna prawa'),
    (3, u'Kolumna z treścią'),
)

BOXTYPES_CHOICES = (
    (1, u'Najnowsze artykuły'),
    (2, u'Najnowsze wiadomości'),
    (99, u'Własne'),
)
"""
class PortalBox(models.Model):
     Model przechowujacy informacje o poszczegolnych blokach strony

    order = models.IntegerField(verbose_name=u'Kolejność (mniej-wyżej)', default=0)
    boxtype = models.IntegerField(choices=BOXTYPES_CHOICES, blank=True, null=True, verbose_name=u'Rodzaj')
    module = models.ForeignKey(PortalModule, blank=True, null=True, verbose_name=u'Powiązany moduł')
    active = models.BooleanField(u'Aktywny?', default = True)
    sites = models.ManyToManyField(Site)

    class Meta:
        db_table = 'portalboxes'

    def __unicode__(self):
        return "%s" % (self.module)

class PortalBoxOption1(models.Model):
     Model przechowujacy opcje bloku strony dla konkretnej witryny

    position = models.IntegerField(choices=BOXPOSITION_CHOICES, blank=True, null=True, verbose_name=u'Umiejscowienie')
    portalbox = models.ForeignKey(PortalBox, blank=True, null=True, verbose_name=u'Powiązany box')
    ammountarticles = models.IntegerField(blank=True, null=True, verbose_name=u'Ilość artykułów', default=5)
    showname = models.BooleanField(u'Pokaż nazwę?', default = True)
    site = models.ForeignKey(Site, blank=True, null=True, verbose_name=u'Powiązana strona')

    class Meta:
        db_table = 'portalboxoptions'


if settings.ENABLEDAFAULTADMIN:
    from django.contrib import admin
    admin.site.register(PortalModule)
    admin.site.register(PortalBox)
"""