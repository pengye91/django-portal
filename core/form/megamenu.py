# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import RegisteredModule, MegaMenu, MegaMenuLanguage, Language, Menu, Category, CategoryLanguage, PermisionGroup
from core.manager.base import BaseManager
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe
from core.form.utils import AdmImageWidget

class AdmItemForm(forms.ModelForm):

    id = forms.ModelChoiceField(queryset=MegaMenu.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    date =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    date.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    image = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie kategorii', required=False)
    module = forms.ModelChoiceField(queryset=RegisteredModule.objects.all(), label=u'Moduł', required=False)
    menu = forms.ModelChoiceField(queryset=Menu.objects.all(), label=u'Menu', required=False)
    tags = TagField(required=False)

    class Meta:
        model = MegaMenu
        #fields = ('id', 'menu', 'module', 'date', 'image', 'parent', 'tags')

    def __init__(self, *args, **kwargs):
        super(AdmItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='MegaMenu')
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
                print il.depth
        self.fields[field].choices = choices

class AdmItemLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=MegaMenuLanguage.objects.all(), widget=forms.HiddenInput())
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    info = forms.CharField(widget=CKEditorWidget(config_name='full_ck'), required=False)

    class Meta:
        model = MegaMenuLanguage
        #fields = ('id', 'name', 'info', 'language')
