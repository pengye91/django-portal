# -*- coding: utf-8 -*-

from django.conf import settings

def sett(request):
    return { 'PROJECT_URL': settings.PROJECT_URL }
