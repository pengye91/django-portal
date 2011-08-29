# -*- coding: utf-8 -*-

from django import forms
from django.utils.safestring import mark_safe
from ckeditor.widgets import CKEditorWidget
from core.models import CatalogItem, CatalogItemLanguage, CatalogCategory, CatalogCategoryLanguage, CatalogImage, CatalogImageLanguage, Language, PermisionGroup
from core.form.utils import AdmImageWidget
from core.debug.debug import *
from taggit.forms import *


class CatalogItemForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CatalogItem.objects.all(), widget=forms.HiddenInput())
    mainimage = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie główne', required=False)
    category = forms.ModelChoiceField(queryset=CatalogCategory.objects.all(), label=u'Kategoria ogłoszeń')

    tags = TagField(required=False)

    class Meta:
        model = CatalogItem
        fields = ('id', 'category', 'date', 'mainimage', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(CatalogItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='CatalogItem')
        except Exception, e:
            print 'form/catalog.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class CatalogItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CatalogItemLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = CatalogItemLanguage

class CatalogCategoryItemForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CatalogCategory.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    date =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    date.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    image = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie kategorii', required=False)
    parent = forms.ModelChoiceField(queryset=CatalogCategory.objects.all())#, widget=forms.HiddenInput())
    tags = TagField(required=False)

    class Meta:
        model = CatalogCategory
        fields = ('id', 'temp', 'date', 'image', 'parent', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(CatalogCategoryItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='CatalogCategory')
        except Exception, e:
            print 'form/catalog.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class CatalogCategoryItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CatalogCategoryLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    info = forms.CharField(widget=CKEditorWidget(config_name='full_ck'), required=False)
    class Meta:
        model = CatalogCategoryLanguage


class CatalogImageItemForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CatalogImage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    date =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    date.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    image = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie', required=False)
    tags = TagField(required=False)

    class Meta:
        model = CatalogImage
        fields = ('id', 'temp', 'date', 'image', 'sites', 'active', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(CatalogImageItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='CatalogImage')
        except Exception, e:
            print 'form/catalog.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class CatalogImageItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CatalogImageLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    info = forms.CharField(widget=CKEditorWidget(config_name='full_ck'), required=False)

    class Meta:
        model = CatalogImageLanguage
