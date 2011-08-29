# -*- coding: utf-8 -*-

from django.conf.urls.defaults import *
from django.conf import settings

urlpatterns = patterns('',)

urlpatterns += patterns('',
    url(r'^cms/', include('core.url.cmsadmin')),
    url(r'^cms/categories/', include('core.url.categoryadmin')),
    url(r'^cms/articles/', include('core.url.articleadmin')),
    url(r'^cms/images/', include('core.url.imageadmin')),
    url(r'^cms/galleries/', include('core.url.galleryadmin')),
    url(r'^sites/', include('core.url.siteadmin')),
    url(r'^sheets/', include('core.url.sheetadmin')),
    url(r'^sheets/files/', include('core.url.sheetfileadmin')),
    url(r'^portal/', include('core.url.portaladmin')),
    url(r'^calendarium/calendars/', include('core.url.calendarium_calendar_admin')),
    url(r'^calendarium/eventtypes/', include('core.url.calendarium_eventtype_admin')),
    url(r'^calendarium/events/', include('core.url.calendarium_event_admin')),
    url(r'^user/profiles/', include('core.url.userprofileadmin')),
    url(r'^repetitio/courses/', include('core.url.repetitio_course_admin')),
    url(r'^repetitio/tests/', include('core.url.repetitio_test_admin')),
    url(r'^repetitio/questions/', include('core.url.repetitio_question_admin')),
    url(r'^repetitio/answers/', include('core.url.repetitio_answer_admin')),
    url(r'^ads/categories/', include('core.url.ads_category_admin')),
    url(r'^ads/images/', include('core.url.ads_image_admin')),
    url(r'^ads/ads/', include('core.url.ads_admin')),
    url(r'^wiki/', include('core.url.wiki_admin')),
    url(r'^catalogs/categories/', include('core.url.catalog_category_admin')),
    url(r'^catalogs/catalogs/', include('core.url.catalog_admin')),
    url(r'^menu/menus/', include('core.url.menu_admin')),
    url(r'^menu/items/', include('core.url.menu_item_admin')),
    url(r'^modules/registred/', include('core.url.module_admin')),
    url(r'^modules/positions/', include('core.url.module_position_admin')),
    url(r'^megamenu/items/', include('core.url.megamenu_admin')),
    url(r'^$', include('core.url.userprofileadmin')),
)
