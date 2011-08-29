# -*- coding: utf-8 -*-

__FNAME__='forms.py'
__MNAME__='articles'

from django import forms
from django.utils.safestring import mark_safe
from core.models import Article, ArticleLanguage, Language
from core.debug.debug import *
from taggit.forms import *

class AdmImageWidget(forms.FileInput):
    """
    Widget ImageField pokazujacy miniature.
    """
    def __init__(self, attrs={}):
        super(AdmImageWidget, self).__init__(attrs)

    def render(self, name, value, attrs=None):
        output = []
        if value and hasattr(value, "url"):
            #print value.url
            output.append(('<center><a target="_blank" href="%s">'
                           '<img src="%s" style="width: 100%%;" /></a></center> '
                           % (value.url, value.url)))
        output.append(super(AdmImageWidget, self).render(name, value, attrs))
        return mark_safe(u''.join(output))

class AdmItemForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=Article.objects.all(), widget=forms.HiddenInput())
    mainimage = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie główne', required=False)
    tags = TagField(required=False)

    class Meta:
        model = Article
        fields = ('id', 'category', 'date', 'mainimage', 'tags')

class AdmItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=ArticleLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    class Meta:
        model = ArticleLanguage
