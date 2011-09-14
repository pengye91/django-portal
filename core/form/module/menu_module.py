# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import SplitDateTimeWidget
from ckeditor.widgets import CKEditorWidget
from core.models import MenuModuleOption, Menu
from core.manager.base import BaseManager
from core.debug.debug import *
from taggit.forms import *
from django.utils.safestring import mark_safe

class MenuOptionForm(forms.ModelForm):
    id = forms.ModelChoiceField(queryset=MenuModuleOption.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = MenuModuleOption

    def choices(self, system, edit_menu=False):
        if edit_menu is False:
            if system.manager.options_item.menu is not None:
                choices = [(system.manager.options_item.menu.id, system.manager.options_item.menu)]
            else:
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
        else:
            choices = [(system.manager.item.id, system.manager.item)]
        self.fields['menu'].choices = choices
