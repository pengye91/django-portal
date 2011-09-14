# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.category import *

urlpatterns = patterns('',
    url(r'^list/(?P<itemId>\d+)/$', show_item_by_id),
    url(r'^list/m/(\d+)/r/(?P<module_id>\d+)/o/(?P<itemId>\d+)/s/([a-zA-Z0-9-_.]*)/$', show_item),
    url(r'^(?P<slug>.*)/$', show_item_by_slug),
)
