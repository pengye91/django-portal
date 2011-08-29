# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import Image, ImageLanguage, Language, Gallery, PermisionGroup
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe

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

    id = forms.ModelChoiceField(queryset=Image.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    date =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    date.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    image = forms.ImageField(widget=AdmImageWidget(), label=u'Zdjęcie', required=False)
    gallery = forms.ModelChoiceField(queryset=Gallery.objects.all())
    tags = TagField(required=False)

    class Meta:
        model = Image
        fields = ('id', 'temp', 'date', 'image', 'gallery', 'sites', 'active', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='Image')
        except Exception, e:
            print 'form/image.py: ', e
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
    id = forms.ModelChoiceField(queryset=ImageLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    info = forms.CharField(widget=CKEditorWidget(config_name='full_ck'), required=False)
    class Meta:
        model = ImageLanguage
