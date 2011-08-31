# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.manager.base import BaseManager
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
    #parent = forms.ModelChoiceField(queryset=MenuItem.objects.all())
    module = forms.ModelChoiceField(queryset=RegisteredModule.objects.all(), label=u'Moduł')
    menu = forms.ModelChoiceField(queryset=Menu.objects.all(), label=u'Menu')
    tags = TagField(required=False)

    class Meta:
        model = MenuItem
        fields = ('id', 'menu', 'parent', 'module', 'date', 'image', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='MenuItem')
        except Exception, e:
            print 'form/menu.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

    def choices(self, system, field='menu'):

        manager = BaseManager()
        manager.model = Menu()
        manager.order = 'parent'
        manager.fetchOptions = { 'site': system.portal.activeSite.id, 'active': system.requester.rData['selectedactivity'], 'activesite': system.requester.rData['activesite'] }
        manager.fetch_items(for_select=True)
        items = manager.get_items_as_tree(system.requester.request, for_select=True)

        choices = []
        if items is not None:
            for il in items:
                prefix = ''
                for i in range(0,il.depth):
                    prefix = prefix + "&nbsp;&nbsp;&nbsp;"
                il.name = (prefix + il.name)
                choices.append((il.id,mark_safe(il.name)))
        self.fields[field].choices = choices
        
        manager.model = MenuItem()
        manager.modelLanguage = MenuItemLanguage()
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
        self.fields['parent'].choices = choices

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
        fields = ('id', 'name', 'parent', 'altname', 'info', 'permissions')

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

    def choices(self, system, field='parent'):
        manager = BaseManager()
        manager.model = Menu()
        manager.order = 'parent'
        manager.fetchOptions = { 'site': system.portal.activeSite.id, 'active': system.requester.rData['selectedactivity'], 'activesite': system.requester.rData['activesite'] }
        manager.fetch_items(for_select=True)
        items = manager.get_items_as_tree(system.requester.request, for_select=True)

        choices = []
        if items is not None:
            for il in items:
                if il is not None:
                    if il.name is not None:
                        prefix = ''
                        for i in range(0,il.depth):
                            prefix = prefix + "&nbsp;&nbsp;&nbsp;"
                        il.name = (prefix + il.name)
                        choices.append((il.id,mark_safe(il.name)))
        self.fields[field].choices = choices