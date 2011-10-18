# -*- coding: utf-8 -*-

from django.db import models
#from django.conf import settings
#from django.contrib.sites.models import Site
#from tagging.fields import TagField
from taggit.managers import TaggableManager

class Preferences(models.Model):
    temp = models.BooleanField(verbose_name=u'Tymczasowy?', default = True)
    tags = TaggableManager()
    required = models.BooleanField(verbose_name=u'Wymagany?', default = False)
    order = models.IntegerField(verbose_name=u'Kolejność (mniej-wyżej)', default=0)
    visits = models.IntegerField(verbose_name=u'Ilość wizyt', blank = True, null=True,default = 0, editable=False)
    """
    tags = TagField()

    def set_tags(self, tags):
        Tag.objects.update_tags(self, tags)

    def get_tags(self, tags):
        return Tag.objects.get_for_object(self)

    tags = property(get_tags, set_tags)
    """
    class Meta:
        abstract = True
        db_table = 'preferences'
