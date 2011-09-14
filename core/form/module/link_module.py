# -*- coding: utf-8 -*-

import datetime
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import LinkModuleOption
from core.manager.base import BaseManager
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe

class LinkModuleOptionForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=LinkModuleOption.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = LinkModuleOption
        #fields = ('id', 'article', 'show_title', 'show_footer', 'show_info', 'page_title', 'show_page_title', 'class_prefix', 'registered_module')

    def choices(self, system):
        pass