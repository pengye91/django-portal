# -*- coding: utf-8 -*-

import os, imp
import re
from datetime import datetime
from django.conf import settings
from django.template import Library, Node, Variable
from django.core.urlresolvers import reverse
from django.conf import settings
from core.models import Language, PortalSiteConstLanguage, RegisteredModule, ModulePosition, Article, ArticleLanguage, Category, CategoryLanguage
from django.template.defaultfilters import stringfilter
from core.manager.base import BaseManager

register = Library()

def get_language_tag(string):
    try:
        langSymbol = 'portaltags.py TODO: Pobieranie ustawien lang z sesji'
        raise Exception(langSymbol)
    except Exception,e:
        langSymbol = settings.DEFAULTPORTALLANG

    try:
        lang = Language.objects.filter(symbol=langSymbol)[0]
    except Exception,e:
        lang = None

    try:
        lconst = PortalSiteConstLanguage.objects.get(language__id__exact=lang.id, systemname=string)
    except Exception,e:
        lconst = ''

    return "%s" % lconst

@register.simple_tag
def getlang(token):
    return get_language_tag(token)


class DynUrlNode(Node):
    def __init__(self, *args):
        self.name_var = Variable(args[0])
        self.args = [Variable(a) for a in args[1].split(',')]

    def render(self, context):
        name = self.name_var.resolve(context)
        args = [a.resolve(context) for a in self.args]
        return reverse(name, args = args)

@register.tag
def dynurl(parser, token):
    args = token.split_contents()
    return DynUrlNode(*args[1:])


@register.filter
@stringfilter
def killtags(value, tags):
    tags = [re.escape(tag) for tag in tags.split()]
    tags_re = u'(%s)' % u'|'.join(tags)
    kill_re = re.compile("<\s*%s[^>]*>(.*?)<\s*/\s*\\1>" % tags_re, re.U)
    value = kill_re.sub('', value)
    return value
killtags.is_safe = True

@register.filter
def getlang(obj, epk):
    try:
        return obj.get_lang_unicode(int(epk))
    except:
        return ''

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

def get_modules(string, lang):
    pos = None
    posmod = []
    modules = None

    try:
        pos = ModulePosition.objects.filter(name=string)[0]
    except Exception, e:
        print e

    if pos is not None:
        try:
            modules = RegisteredModule.objects.filter(position=pos)
        except Exception,e:
            modules = None

    if modules is not None:
        for mod in modules:
            if mod.type.menu is False:
                mod.incl = 'core/portal/modules/' + mod.type.filetemplate + '.html'
                imod = load_from_file(settings.PROJECT_ROOT + '/core/manager/modules/' + mod.type.fileview + '.py', 'ModuleManager')
                module = imod()
                module.fetch_registered_module(mod.id)
                module.get_data(lang)
                mod.data = module
                mod.options = module.fetch_options()
                posmod.append(mod)

    return { 'posmodules': posmod }

@register.inclusion_tag('core/portal/modules/modules.html')
def getmodules(token, lang):
    return get_modules(token, lang)

def get_path(item, manager, items):
    manager.fetch_item(item.id)
    if manager.item is not None:
        items.append(item)
        if manager.item.parent is not None:
            get_path(manager.item.parent, manager, items)

    return items

def get_category_path(pid, lang):
    manager = BaseManager()
    manager.fetchOptions = { 'site': settings.SITE_ID }
    manager.model = Category()
    manager.fetch_item(pid)
    items = get_path(manager.item, manager, [])
    for item in items:
        item.get_language(lang.id)
        item.name = item.language.name
        item.url = '/cms/category/list/' + str(item.id)
    items.reverse()

    return { 'path': items }


@register.inclusion_tag('core/portal/breadcrumb.html')
def category_path(token, lang):
    return get_category_path(token, lang)

@register.filter
def hash(object, attr):
    pseudo_context = { 'object' : object }
    try:
        value = Variable('object.%s' % attr).resolve(pseudo_context)
    except:
        value = None
    return value

@register.filter
def sub(value, arg):
    return int(value) - int(arg)
