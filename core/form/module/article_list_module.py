# -*- coding: utf-8 -*-

from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import ArticleListModuleOption, Article, Category, CategoryLanguage
from core.manager.base import BaseManager
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe


class ArticleListOptionForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=ArticleListModuleOption.objects.all(), widget=forms.HiddenInput())
    category = forms.ModelChoiceField(queryset=Category.objects.all())

    class Meta:
        model = ArticleListModuleOption
        fields = ('id', 'category', 'show_title', 'link_title', 'exposefirst', 'show_footer', 'show_info', 'page_title', 'show_page_title', 'show_mainimage', 'class_prefix')

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
            for il in items:
                manager.set_language(system.language.currentLanguage)
                choices.append((il.id,il.language))
                print il.language
        self.fields['category'].choices = choices
