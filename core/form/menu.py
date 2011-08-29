# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import RegisteredModule, Menu, MenuItem, MenuItemLanguage, Language, PermisionGroup
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe
from core.form.utils import AdmImageWidget

class AdmItemForm(forms.ModelForm):

    id = forms.ModelChoiceField(queryset=MenuItem.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    date =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    date.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    image = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie kategorii', required=False)
    parent = forms.ModelChoiceField(queryset=MenuItem.objects.all(), required=False)
    module = forms.ModelChoiceField(queryset=RegisteredModule.objects.all(), label=u'Moduł')
    menu = forms.ModelChoiceField(queryset=Menu.objects.all(), label=u'Menu')
    tags = TagField(required=False)

    class Meta:
        model = MenuItem
        fields = ('id', 'menu', 'module', 'date', 'image', 'parent', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='MenuItem')
        except Exception, e:
            print 'form/repetitio.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class AdmItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=MenuItemLanguage.objects.all(), widget=forms.HiddenInput())
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    info = forms.CharField(widget=CKEditorWidget(config_name='full_ck'), required=False)

    class Meta:
        model = MenuItemLanguage
        fields = ('id', 'name', 'altname', 'info', 'language')

class MenuForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=Menu.objects.all(), widget=forms.HiddenInput())
    tags = TagField(required=False)

    class Meta:
        model = Menu
        fields = ('id', 'name', 'altname', 'info', 'permissions')

    def __init__(self, *args, **kwargs):
        super(MenuForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='Menu')
        except Exception, e:
            print 'form/repetitio.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups
