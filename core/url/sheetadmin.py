# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.sheetadmin import *

urlpatterns = patterns('',
    url(r'^show/all/$', show_items),
    url(r'^action/(?P<item_id>\d+)/$', change_item),
    url(r'^edit/(?P<itemId>\d+)/$', edit_item),
    url(r'^add/$', add_item),
    url(r'^delete/$', delete_item),
    url(r'^copy/(?P<itemId>\d+)/$', copy_item),
)
