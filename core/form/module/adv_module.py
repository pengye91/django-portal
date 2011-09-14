# -*- coding: utf-8 -*-

import datetime
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import AdvModuleOption
from core.manager.base import BaseManager
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe

class AdvModuleOptionForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=AdvModuleOption.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = AdvModuleOption
        #fields = ('id', 'article', 'show_title', 'show_footer', 'show_info', 'page_title', 'show_page_title', 'class_prefix', 'registered_module')

    def choices(self, system):
        pass