# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.html_module import *

urlpatterns = patterns('',
    url(r'^m/(\d+)/r/(\d+)/o/(?P<itemId>\d+)/s/([a-zA-Z0-9-_.]*)/$', show_item_by_id),
)
