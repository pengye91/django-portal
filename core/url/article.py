# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.article import *

urlpatterns = patterns('',
    url(r'^list/$', show_items),
    url(r'^article/(?P<itemId>.*)/$', show_item_by_id),
    url(r'^m/(\d+)/r/(\d+)/o/(?P<itemId>\d+)/s/([a-zA-Z0-9-_.]*)/$', show_item_by_id),
    url(r'^(?P<slug>.*)/$', show_item_by_slug),
)
