# -*- coding: utf-8 -*-

from django import forms
from django.utils.safestring import mark_safe
from ckeditor.widgets import CKEditorWidget
from core.models import Wiki, WikiLanguage, Language, PermisionGroup
from core.form.utils import AdmImageWidget
from core.debug.debug import *
from taggit.forms import *


class AdmItemForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=Wiki.objects.all(), widget=forms.HiddenInput())
    mainimage = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie główne', required=False)
    parent = forms.ModelChoiceField(queryset=Wiki.objects.all(), label=u'Artykuł nadrzędny', required=False)
    tags = TagField(required=False)

    class Meta:
        model = Wiki
        fields = ('id', 'parent', 'date', 'mainimage', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='Wiki')
        except Exception, e:
            print 'form/wiki.py: ', e
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
    id = forms.ModelChoiceField(queryset=WikiLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = WikiLanguage
