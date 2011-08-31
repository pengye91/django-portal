# -*- coding: utf-8 -*-
from django import forms
from django.contrib.sites.models import Site
from core.models import SitePortal, PermisionGroup
from core.debug.debug import *
from django.utils.safestring import mark_safe

class AdmItemForm(forms.ModelForm):

    id = forms.ModelChoiceField(queryset=SitePortal.objects.all())
    site = forms.ModelChoiceField(queryset=Site.objects.all())

    class Meta:
        model = SitePortal

    def __init__(self, *args, **kwargs):
        super(AdmItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='SitePortal')
        except Exception, e:
            print 'form/article.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups