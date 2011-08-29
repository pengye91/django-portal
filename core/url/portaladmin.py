# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.portaladmin import *

urlpatterns = patterns('',
    url(r'^show/$', show_items),
)
