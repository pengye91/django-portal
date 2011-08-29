# -*- coding: utf-8 -*-
# Config for specific site

SITE_ID = 1
PORTALSHEETPATH = 'default'
DEFAULTPORTALLANG = 'en'
ENABLEDAFAULTADMIN = True
DEVELDEBUG = True
ADMINSITE = True
ADMINALLSITES = True
PROJECT_ROOT = '' # this is ABSOLUTE PATH to the project
MEDIA_ROOT = PROJECT_ROOT + 'site_media/'
MEDIA_URL = 'http://yourhost/site_media/' # change "yourhost" to... your host
ADMIN_MEDIA_PREFIX = '/media/'

ADMINS = (
    ('Your name', 'Your email'), # you data
)

MANAGERS = ADMINS

# You must edit this databases access. For now default and profiles mustbe the same

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': '',                      # Or path to database file if using sqlite3.
        'USER': '',                      # Not used with sqlite3.
        'PASSWORD': '',                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
    },
    'profiles': {
        'ENGINE': 'django.db.backends.mysql', # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': '',                      # Or path to database file if using sqlite3.
        'USER': '',                      # Not used with sqlite3.
        'PASSWORD': '',                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '8889',                      # Set to empty string for default. Not used with sqlite3.
    },
}


# Make this unique, and don't share it with anybody.
SECRET_KEY = 'secret_key'
