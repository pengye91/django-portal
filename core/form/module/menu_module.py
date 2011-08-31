# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import MenuModuleOption, Menu
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe

class MenuOptionForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=MenuModuleOption.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = MenuModuleOption

    def choices(self, system):
        manager = BaseManager()
        manager.model = Menu()
        manager.order = 'date'
        manager.fetchOptions = { 'site': system.portal.activeSite.id, 'active': system.requester.rData['selectedactivity'], 'activesite': system.requester.rData['activesite'] }
        manager.fetch_items()
        items = manager.get_items()
        choices = []
        if items is not None:
            manager.set_language(system.language.currentLanguage)
            for il in items:
                choices.append((il.id,il.language))
        self.fields['menu'].choices = choices
