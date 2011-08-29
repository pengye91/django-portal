# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import UserProfile, PermisionGroup
from core.debug.debug import *
from django.utils.safestring import mark_safe

class AdmItemForm(forms.ModelForm):

    id = forms.ModelChoiceField(queryset=UserProfile.objects.all(), widget=forms.HiddenInput())
    #permissions = forms.MultipleChoiceField(choices=PermisionGroupwidget=forms.Select(attrs={'style':'width: auto;'}))

    class Meta:
        model = UserProfile
        fields = ('id', 'username', 'password', 'email', 'confirmed', 'admincomment', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter().exclude(parent=None).exclude(parent=1)
        except Exception, e:
            print 'form/userprofile.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'
        self.fields['permissions'].required = False

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class LoginForm(forms.Form):
    uname = forms.CharField(max_length=200, label=u'Użytkownik')
    upasswd = forms.PasswordInput()
