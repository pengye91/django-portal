# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.article import *

urlpatterns = patterns('',
    url(r'^list/$', show_items),
    url(r'^article/(?P<itemId>.*)/$', show_item_by_id),
)
