# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.myimp import *

urlpatterns = patterns('',
    url(r'^link/(?P<link_id>\d+)/$', show_items),
    url(r'^cats/$', cats),
    url(r'^arts/$', arts),
    url(r'^events/$', events),
    url(r'^rep/$', repetitio),
    url(r'^users/$', users),
)