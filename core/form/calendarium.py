# -*- coding: utf-8 -*-

from django import forms
from django.utils.safestring import mark_safe
from core.models import Language, Calendar, CalendarEventType, CalendarEvent, CalendarLanguage, CalendarEventTypeLanguage, CalendarEventLanguage, PermisionGroup
from taggit.forms import *

class AdmImageWidget(forms.FileInput):
    """
    Widget ImageField pokazujacy miniature.
    """
    def __init__(self, attrs={}):
        super(AdmImageWidget, self).__init__(attrs)

    def render(self, name, value, attrs=None):
        output = []
        if value and hasattr(value, "url"):
            output.append(('<center><a target="_blank" href="%s">'
                           '<img src="%s" style="width: 100%%;" /></a></center> '
                           % (value.url, value.url)))
        output.append(super(AdmImageWidget, self).render(name, value, attrs))
        return mark_safe(u''.join(output))

class AdmCalendarForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=Calendar.objects.all(), widget=forms.HiddenInput())
    tags = TagField(required=False)
    class Meta:
        model = Calendar
        fields = ('id', 'date', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmCalendarForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='Calendar')
        except Exception, e:
            print 'form/calendarium.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups


class AdmCalendarEventTypeForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CalendarEventType.objects.all(), widget=forms.HiddenInput())
    tags = TagField(required=False)
    class Meta:
        model = CalendarEventType
        fields = ('id', 'date', 'tags', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmCalendarEventTypeForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='CalendarEventType')
        except Exception, e:
            print 'form/calendarium.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class AdmCalendarEventForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CalendarEvent.objects.all(), widget=forms.HiddenInput())
    date =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    date.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    startdate =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    startdate.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    enddate =  forms.SplitDateTimeField(widget=forms.SplitDateTimeWidget())
    enddate.widget.widgets = (forms.TextInput({'class':'vDateField'}),forms.TextInput({'class':'vTimeField'}))
    type = forms.ModelChoiceField(queryset=CalendarEventType.objects.all())
    calendar = forms.ModelChoiceField(queryset=Calendar.objects.all())
    class Meta:
        model = CalendarEvent
        fields = ('id', 'date', 'calendar', 'type', 'startdate', 'enddate', 'sw', 'state', 'town', 'image', 'www', 'email', 'price', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmCalendarEventForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='CalendarEvent')
        except Exception, e:
            print 'form/calendarium.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class AdmCalendarLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CalendarLanguage.objects.all(), widget=forms.HiddenInput())
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    class Meta:
        model = CalendarLanguage
        fields = ('id', 'name', 'language', 'shortinfo', 'description', 'slug', 'meta', )

class AdmCalendarEventTypeLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CalendarEventTypeLanguage.objects.all(), widget=forms.HiddenInput())
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    class Meta:
        model = CalendarEventTypeLanguage
        fields = ('id', 'name', 'language', 'info', )

class AdmCalendarEventLanguageForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=CalendarEventLanguage.objects.all(), widget=forms.HiddenInput())
    language = forms.ModelChoiceField(queryset=Language.objects.all(), widget=forms.HiddenInput())
    class Meta:
        model = CalendarEventLanguage
        fields = ('id', 'title', 'shortinfo', 'text', 'contact', 'language', )
