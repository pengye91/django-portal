# -*- coding: utf-8 -*-

from django import forms
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
            output.append(('<center><a target="_blank" href="%s">'
                           '<img src="%s" style="width: 100%%;" /></a></center> '
                           % (value.url, value.url)))
        output.append(super(AdmImageWidget, self).render(name, value, attrs))
        return mark_safe(u''.join(output))
