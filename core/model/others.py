# -*- coding: utf-8 -*-

from django.db import models

class StateModel(models.Model):
    """ Model przechowujacy liste wojewodztw
    """
    name = models.CharField(max_length=255)

    class Meta:
        db_table = 'states'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)


class CountryModel(models.Model):
    """ Model przechowujacy liste panstw
    """
    name = models.CharField(max_length=255)

    class Meta:
        db_table = 'countries'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)


class SexModel(models.Model):
    """
    """
    name = models.CharField(max_length=255)

    class Meta:
        db_table = 'sex'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)