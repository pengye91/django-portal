# -*- coding: utf-8 -*-

from django import forms
from django.utils.safestring import mark_safe
from ckeditor.widgets import CKEditorWidget
from core.models import Ad, AdLanguage, AdCategory, AdCategoryLanguage, AdImage, AdImageLanguage, Language, PermisionGroup
from core.form.utils import AdmImageWidget
from core.debug.debug import *
from taggit.forms import *


class AdsItemForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=Ad.objects.all(), widget=forms.HiddenInput())
    mainimage = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie główne', required=False)
    category = forms.ModelChoiceField(queryset=AdCategory.objects.all(), label=u'Kategoria ogłoszeń')
    datestart =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    datestart.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    dateend =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget(), required=False)
    dateend.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    tags = TagField(required=False)

    class Meta:
        model = Ad
        fields = ('id', 'category', 'date', 'mainimage', 'tags', 'images', 'bold', 'distinction', 'datestart', 'dateend', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdsItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='Ad')
        except Exception, e:
            print 'form/ads.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class AdsItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=AdLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = AdLanguage

class AdsCatItemForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=AdCategory.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    date =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    date.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    image = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie kategorii', required=False)
    parent = forms.ModelChoiceField(queryset=AdCategory.objects.all())#, widget=forms.HiddenInput())
    tags = TagField(required=False)

    class Meta:
        model = AdCategory
        fields = ('id', 'temp', 'date', 'image', 'parent', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdsCatItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='AdCategory')
        except Exception, e:
            print 'form/ads.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class AdsCatItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=AdCategoryLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    info = forms.CharField(widget=CKEditorWidget(config_name='full_ck'), required=False)
    class Meta:
        model = AdCategoryLanguage


class AdsImageItemForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=AdImage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    date =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    date.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    image = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie', required=False)
    tags = TagField(required=False)

    class Meta:
        model = AdImage
        fields = ('id', 'temp', 'date', 'image', 'sites', 'active', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdsImageItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='AdImage')
        except Exception, e:
            print 'form/ads.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class AdsImageItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=AdImageLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    info = forms.CharField(widget=CKEditorWidget(config_name='full_ck'), required=False)
    class Meta:
        model = AdImageLanguage
