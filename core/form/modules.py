# -*- coding: utf-8 -*-

import os, imp
from os.path import join, basename, splitext
from django.conf import settings
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import RegisteredModule, ModulePosition, ModuleVisibility, MenuItem
from core.models import Language, PermisionGroup
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

    id = forms.ModelChoiceField(queryset=RegisteredModule.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = RegisteredModule
        fields = ('id', 'name', 'type', 'order', 'position', 'permissions')

    def __init__(self, *args, **kwargs):
        super(AdmItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='RegisteredModule')
        except Exception, e:
            print 'form/modules.py: ', e
            root_pgroup = None

        self.fields['permissions'].label = u'Uprawnienia - pozostaw puste jeśli mają być domyślne'

        if root_pgroup is not None:
            pgroups = []
            for rg in root_pgroup:
                pg = PermisionGroup.objects.filter(parent=rg)
                for group in pg:
                    pgroups.append((group.id,mark_safe(group.name)))
            self.fields['permissions'].choices = pgroups

class PosItemForm(forms.ModelForm):

    id = forms.ModelChoiceField(queryset=ModulePosition.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = ModulePosition
        fields = ('id', 'name', 'permissions')

    def __init__(self, *args, **kwargs):
        super(PosItemForm, self).__init__(*args, **kwargs)
        try:
            root_pgroup = PermisionGroup.objects.filter(model='ModulePosition')
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

class VisItemForm(forms.ModelForm):

    id = forms.ModelChoiceField(queryset=ModuleVisibility.objects.all(), widget=forms.HiddenInput())
    menuitem = forms.ModelMultipleChoiceField(queryset=MenuItem.objects.all(), required=False)

    class Meta:
        model = ModuleVisibility
        fields = ('id', 'menuitem')

def load_from_file(filepath, expected_class):
    class_inst = None

    mod_name,file_ext = os.path.splitext(os.path.split(filepath)[-1])

    if file_ext.lower() == '.py':
        py_mod = imp.load_source(mod_name, filepath)

    elif file_ext.lower() == '.pyc':
        py_mod = imp.load_compiled(mod_name, filepath)

    if expected_class in dir(py_mod):
        return getattr(py_mod, expected_class)

    return None

def get_module_options(moduleId):
    try:
        module = RegisteredModule.objects.get(id=moduleId)
    except Exception, e:
        self.debugger.catch_error('get_module_options: ', e)
        return None

    imod = load_from_file(settings.PROJECT_ROOT + '/core/form/module/' + module.type.fileform + '.py', module.type.options_formname)

    try:
        if imod() is None:
            return None
    except Exception, e:
        print 'form/modules.py, get_module_options: ', e
        return None

    return imod()

def get_module_type_options(module_type):
    #print settings.PROJECT_ROOT + '/core/form/module/' + module_type.fileform + '.py', module_type.options_formname
    imod = load_from_file(settings.PROJECT_ROOT + '/core/form/module/' + module_type.fileform + '.py', module_type.options_formname)

    try:
        if imod() is None:
            return None
    except Exception, e:
        print 'form/modules.py, get_module_type_options: ', e
        return None

    return imod()


def get_module_options_form_by_type(module_type):
    imod = load_from_file(settings.PROJECT_ROOT + '/core/form/module/' + module_type.fileform + '.py', module_type.options_formname)

    try:
        if imod() is None:
            return None
    except Exception, e:
        print 'form/modules.py, get_module_options_form_by_type: ', e
        return None

    return imod()
