# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import RepetitioCourse, RepetitioCourseLanguage
from core.models import RepetitioTest, RepetitioTestLanguage
from core.models import RepetitioAnswer, RepetitioAnswerLanguage
from core.models import RepetitioQuestion, RepetitioQuestionLanguage
from core.models import Language, PermisionGroup
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe


class RepetitioCourseForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=RepetitioCourse.objects.all(), widget=forms.HiddenInput())
    tags = TagField(required=False)

    class Meta:
        model = RepetitioCourse

    def __init__(self, *args, **kwargs):
        super(RepetitioCourseForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='RepetitioCourse')
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

class RepetitioCourseLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=RepetitioCourseLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = RepetitioCourseLanguage

class RepetitioTestForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=RepetitioTest.objects.all(), widget=forms.HiddenInput())
    tags = TagField(required=False)

    class Meta:
        model = RepetitioTest

    def __init__(self, *args, **kwargs):
        super(RepetitioTestForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='RepetitioTest')
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

class RepetitioTestLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=RepetitioTestLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = RepetitioTestLanguage

class RepetitioAnswerForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=RepetitioAnswer.objects.all(), widget=forms.HiddenInput())
    tags = TagField(required=False)

    class Meta:
        model = RepetitioAnswer

    def __init__(self, *args, **kwargs):
        super(RepetitioAnswerForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='RepetitioAnswer')
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

class RepetitioAnswerLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=RepetitioAnswerLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = RepetitioAnswerLanguage

class RepetitioQuestionForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=RepetitioQuestion.objects.all(), widget=forms.HiddenInput())
    tags = TagField(required=False)

    class Meta:
        model = RepetitioQuestion

    def __init__(self, *args, **kwargs):
        super(RepetitioQuestionForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='RepetitioQuestion')
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

class RepetitioQuestionLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=RepetitioQuestionLanguage.objects.all(), widget=forms.HiddenInput())
    temp = forms.BooleanField(widget=forms.HiddenInput(), required=False)
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = RepetitioQuestionLanguage
