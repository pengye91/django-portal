# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.calendarium import *

urlpatterns = patterns('',
    url(r'^lista/$', show_items),
    url(r'^lista/miesiac/(?P<month>\d+)/$', show_items_by_month),
    url(r'^wydarzenie/(?P<itemId>.*)/$', show_item_by_id),
    url(r'^szukaj/$', search),
    #url(r'^(?P<slug>.*)/$', show_item_by_slug),
)
