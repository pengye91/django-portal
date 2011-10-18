# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from core.view.module import get_module, get_news_box

urlpatterns = patterns('',
    url(r'^get/(?P<position>[a-zA-Z0-9-_.]*)/(?P<site_id>\d+)/$', get_module),
    url(r'^box/', get_news_box),
)
