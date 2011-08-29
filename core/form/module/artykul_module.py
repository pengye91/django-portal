# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import ArticleModuleOption, Article, ArticleLanguage
from core.manager.base import BaseManager
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe

class ArticleOptionForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=ArticleModuleOption.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = ArticleModuleOption
        fields = ('id', 'article', 'show_title', 'show_footer', 'show_info', 'page_title', 'show_page_title', 'class_prefix')

    def choices(self, system):
        manager = BaseManager()
        manager.model = Article()
        manager.modelLanguage = ArticleLanguage()
        manager.order = 'date'
        manager.fetchOptions = { 'site': system.portal.activeSite.id, 'active': system.requester.rData['selectedactivity'], 'activesite': system.requester.rData['activesite'] }
        manager.fetch_items()
        items = manager.get_items()
        choices = []
        if items is not None:
            for il in items:
                manager.set_language(system.language.currentLanguage)
                choices.append((il.id,il.language))
                print il.language
        self.fields['article'].choices = choices