# -*- coding: utf-8 -*-

import datetime
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
        fields = ('id', 'article', 'show_title', 'show_footer', 'show_info', 'page_title', 'show_page_title', 'class_prefix', 'registered_module')

    def choices(self, system):
        s = ((datetime.date.today() + datetime.timedelta(days=1)) - datetime.timedelta(6 * 365 / 12))
        manager = BaseManager()
        manager.model = Article()
        manager.modelLanguage = ArticleLanguage()
        manager.order = '-date'
        manager.fetchOptions = { 'date_gte': s.isoformat(), 'site': system.portal.activeSite.id, 'active': system.requester.rData['selectedactivity'], 'activesite': system.requester.rData['activesite'] }
        manager.rangeItemsStart = None
        manager.rangeItemsEnd = None
        manager.fetch_items()
        items = manager.items
        #items = Article.objects.optfilter(manager.fetchOptions)
        #print '--->',items
        choices = []
        if items is not None:
            manager.set_language(system.language.currentLanguage)
            for il in items:
                choices.append((il.id,il.language))
        self.fields['article'].choices = choices