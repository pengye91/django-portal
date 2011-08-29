# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.conf import settings
from core.view.main import *

urlpatterns = patterns('',
    (r'^jsi18n/$', 'django.views.i18n.javascript_catalog', {'packages': 'django.conf'}),
    (r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
    (r'^ckeditor/', include('ckeditor.urls')),
    (r'^cms/', include('core.urls')),
    (r'^$', main_site),
)


if settings.ADMINSITE:
    urlpatterns += patterns('',
        (r'^administrator/', include('core.url.admin')),
    )

if settings.ENABLEDAFAULTADMIN:
    from django.contrib import admin
    admin.autodiscover()

    urlpatterns += patterns('',
        (r'^admin/doc/', include('django.contrib.admindocs.urls')),
        (r'^admin/', admin.site.urls),
    )
