# -*- coding: utf-8 -*-

from django.conf.urls.defaults import *
#from django.conf import settings

#from core.utils import Perm
#Perm()

urlpatterns = patterns('',)

urlpatterns += patterns('',
    url(r'^article/', include('core.url.article')),
    url(r'^artykul/', include('core.url.article')),
    url(r'^category/', include('core.url.category')),
    url(r'^kategoria/', include('core.url.category')),
    url(r'^html/', include('core.url.html_module')),
    url(r'^kalendarium/', include('core.url.calendarium')),
    url(r'^module/', include('core.url.module')),
)
