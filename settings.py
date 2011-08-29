# -*- coding: utf-8 -*-
# Django settings for portal project.

from config import *

DEBUG = True
TEMPLATE_DEBUG = True

TIME_ZONE = 'Europe/Warsaw'
LANGUAGE_CODE = 'pl'

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale
USE_L10N = True

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'pagination.middleware.PaginationMiddleware',
)

ROOT_URLCONF = 'urls'

TEMPLATE_DIRS = (
	PROJECT_ROOT + 'templates/portaladmin',
)

TEMPLATE_CONTEXT_PROCESSORS = (
        'django.contrib.auth.context_processors.auth',
        'django.core.context_processors.debug',
        'django.core.context_processors.i18n',
        'django.core.context_processors.media',
        'django.core.context_processors.request',
        'django.contrib.messages.context_processors.messages',
)

INSTALLED_APPS = (
    'django_extensions',
    'sorl.thumbnail',
    'pagination',
    'taggit',
    'core',
    'ckeditor',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
)

if ENABLEDAFAULTADMIN:
    INSTALLED_APPS += (
        'django.contrib.admin',
        'django.contrib.admindocs',
    )

CKEDITOR_MEDIA_PREFIX = '/site_media/ckeditor/'
CKEDITOR_UPLOAD_PATH = PROJECT_ROOT + 'site_media/uploads'
CKEDITOR_UPLOAD_PREFIX = '/site_media/uploads/'
CKEDITOR_CONFIGS = {
    'default': {

    },
    'full_ck': {
        'toolbar': 'Full',
        'height': 500,
        'width': '100%',
    },
    'basic_ck': {
        'toolbar': 'Basic',
        'height': 200,
        'width': '100%',
    },

}
