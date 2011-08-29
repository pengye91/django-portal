# -*- coding: utf-8 -*-

__FNAME__='forms.py'
__MNAME__='articles'

from django import forms
from django.utils.safestring import mark_safe
from core.models import Article, ArticleLanguage, Language, Category, CategoryLanguage, PermisionGroup
from core.manager.base import BaseManager
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
    #id = forms.IntegerField(widget=forms.HiddenInput())
    mainimage = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie główne', required=False)
    tags = TagField(required=False)

    class Meta:
        model = Article
        fields = ('id', 'category', 'gallery', 'date', 'mainimage', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmItemForm, self).__init__(*args, **kwargs)

        try:
            root_pgroup = PermisionGroup.objects.filter(model='Article')
        except Exception, e:
            print 'form/article.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups


    def choices(self, system, field='category'):
        manager = BaseManager()
        manager.model = Category()
        manager.modelLanguage = CategoryLanguage()
        manager.order = 'parent'
        manager.fetchOptions = { 'site': system.portal.activeSite.id, 'active': system.requester.rData['selectedactivity'], 'activesite': system.requester.rData['activesite'] }
        manager.fetch_items(for_select=True)
        items = manager.get_items_as_tree(system.requester.request, for_select=True)

        choices = []
        if items is not None:
            manager.set_language(system.language.currentLanguage)
            for il in items:
                prefix = ''
                for i in range(0,il.depth):
                    prefix = prefix + "&nbsp;&nbsp;&nbsp;"
                il.language.name = (prefix + il.language.name)
                choices.append((il.id,mark_safe(il.language.name)))
        self.fields[field].choices = choices


class AdmItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=ArticleLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    class Meta:
        model = ArticleLanguage
