# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.repetitio_course_admin import *

urlpatterns = patterns('',
    url(r'^show/all/$', show_items),
    url(r'^action/$', change_item),
    url(r'^edit/(?P<itemId>\d+)/$', edit_item),
    url(r'^edit/(?P<itemId>\d+)/(?P<new>.*)/$', edit_item),
    url(r'^add/$', add_item),
    url(r'^delete/$', delete_item),
    url(r'^copy/(?P<itemId>\d+)/$', copy_item),
)
