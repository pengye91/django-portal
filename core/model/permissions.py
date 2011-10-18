# -*- coding: utf-8 -*-

from django.conf import settings
from django.db import models
#from datetime import datetime

class ModelManager(models.Manager):

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

class PermissionGroupModel(models.Model):
    name = models.CharField(max_length=255)
    public = models.BooleanField(default = True)
    read = models.BooleanField(default = True)
    write = models.BooleanField(default = True)
    delete = models.BooleanField(default = True)
    add = models.BooleanField(default = True)
    own_only = models.BooleanField(default = True)
    model = models.CharField(max_length=255)
    login = models.BooleanField(default = True)
    parent = models.ForeignKey('self', blank=True, null=True, related_name='perm_child')
    objects = ModelManager()

    class Meta:
        db_table = 'permission_groups'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

    def get_permisions(self):
        return (self.read, self.write, self.delete, self.add, self.own_only, self.public)
