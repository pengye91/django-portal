# -*- coding: utf-8 -*-

from django import forms
from django.utils.safestring import mark_safe
from ckeditor.widgets import CKEditorWidget
from core.models import Adv, AdvGroup, AdvClient, Language, PermisionGroup, Menu, MenuItem
from core.form.utils import AdmImageWidget
from core.debug.debug import *
from taggit.forms import *


class AdvForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=Adv.objects.all(), widget=forms.HiddenInput())
    datestart =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    datestart.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    dateend =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget(), required=False)
    dateend.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    tags = TagField(required=False)


    class Meta:
        model = Adv
        #fields = ('id', 'category', 'date', 'mainimage', 'tags', 'images', 'bold', 'distinction', 'datestart', 'dateend', 'permissions')

    def choices(self):
        pass

class AdvGroupForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=AdvGroup.objects.all(), widget=forms.HiddenInput())
    tags = TagField(required=False)

    class Meta:
        model = AdvGroup
        #fields = ('id', 'category', 'date', 'mainimage', 'tags', 'images', 'bold', 'distinction', 'datestart', 'dateend', 'permissions')

    def choices(self):
        pass

class AdvClientForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=AdvClient.objects.all(), widget=forms.HiddenInput())
    tags = TagField(required=False)

    class Meta:
        model = AdvClient
        #fields = ('id', 'category', 'date', 'mainimage', 'tags', 'images', 'bold', 'distinction', 'datestart', 'dateend', 'permissions')

    def choices(self):
        pass