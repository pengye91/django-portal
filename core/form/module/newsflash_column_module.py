# -*- coding: utf-8 -*-

from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import NewsFlashColumnModuleOption, Article, Category, CategoryLanguage
from core.manager.base import BaseManager
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe


class NewsFlashColumnModuleOptionForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=NewsFlashColumnModuleOption.objects.all(), widget=forms.HiddenInput())
    category = forms.ModelChoiceField(queryset=Category.objects.all())

    class Meta:
        model = NewsFlashColumnModuleOption
        #fields = ('id', 'category', 'columns', 'show_title', 'link_title', 'exposefirst', 'show_more', 'show_mainimage', 'image', 'show_page_title', 'page_title', 'class_prefix', 'module', 'registered_module')

    def choices(self, system):
        manager = BaseManager()
        manager.model = Category()
        manager.modelLanguage = CategoryLanguage()
        manager.order = 'parent'
        manager.fetchOptions = { 'site': system.portal.activeSite.id, 'active': system.requester.rData['selectedactivity'], 'activesite': system.requester.rData['activesite'] }
        manager.fetch_items(for_select=True)
        items = manager.get_items()
        choices = []
        if items is not None:
            manager.set_language(system.language.currentLanguage)
            for il in items:
                choices.append((il.id,il.language))
        self.fields['category'].choices = choices
