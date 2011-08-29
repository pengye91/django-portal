# -*- coding: utf-8 -*-

from django.conf.urls.defaults import *
from django.conf import settings

#from core.utils import Perm
#Perm()

urlpatterns = patterns('',)

urlpatterns += patterns('',
    url(r'^article/', include('core.url.article')),
    url(r'^category/', include('core.url.category')),
)
