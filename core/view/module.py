# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse
from django.conf import settings
from core.manager.base import BaseManager as Manager
from core.models import Article, ArticleLanguage, Category, CategoryLanguage, Site
from core.manager.system_site import SystemManager
from core.models import Language, RegisteredModule, ModulePosition
from core.manager.modules.newsbox_module import ModuleManager as BoxModule
import os, imp

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = Manager()
        self.manager.fetchOptions = { 'site': self.portal.reqsite, 'active': 1, 'activesite': self.portal.reqsite }
        self.urls.show_items = 'core.view.articleadmin.show_items'
        self.manager.model = Article()
        self.manager.modelLanguage = ArticleLanguage()
        self.manager.order = '-date'
        self.manager.debugger.filename = 'articleadmin.py'
        self.manager.moduleName = '__adm_Articles__'
        self.category = Manager()
        self.category.model = Category()
        self.category.order = 'parent'
        self.category.fetchOptions = { 'site': self.portal.reqsite, 'active': 1, 'activesite': self.portal.reqsite }
        self.category.modelLanguage = CategoryLanguage()


def get_module(request, position, site_id):
    system = SystemObject(request)

    t = loader.get_template('core/portal/modules/modules.html')

    try:
        lang = Language.objects.get(id=1)
    except Exception, e:
        print 'Core/View/module.py: ', e

    try:
        site = Site.objects.get(id=site_id)
    except Exception, e:
        print 'Core/View/module.py: ', e

    pos = None
    posmod = []
    modules = None

    try:
        pos = ModulePosition.objects.filter(name=position)
        if len(pos) > 0:
            pos = pos[0]
    except Exception, e:
        print 'portaltags.py, get_modules: ', e

    if pos is not None:
        try:
            modules = RegisteredModule.objects.filter(position=pos).order_by('order') #.filter(sites__id__exact=site.id).order_by('order')
        except Exception,e:
            print 'portaltags.py, get_modules: ', e
            modules = None

    if modules is not None:
        for mod in modules:
            if mod.type.menu is False:
                mod.incl = 'core/portal/modules/' + mod.type.filetemplate + '.html'
                imod = load_from_file(settings.PROJECT_ROOT + '/core/manager/modules/' + mod.type.fileview + '.py', 'ModuleManager')
                module = imod()
                #module.fetch_registered_module(mod.id)
                module.registered_module = mod
                module.permissions = None #permission
                module.get_data(lang, site)
                mod.data = module
                mod.options = module.fetch_options()
                posmod.append(mod)

    system.data.update({ 'posmodules': posmod })
    system.data.update(system.get_context())
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))


def load_from_file(filepath, expected_class):
    #class_inst = None
    py_mod = None

    mod_name,file_ext = os.path.splitext(os.path.split(filepath)[-1])

    if file_ext.lower() == '.py':
        py_mod = imp.load_source(mod_name, filepath)

    elif file_ext.lower() == '.pyc':
        py_mod = imp.load_compiled(mod_name, filepath)

    if py_mod is not None:
        if expected_class in dir(py_mod):
            return getattr(py_mod, expected_class)

    return None

def get_news_box(request):
    data = dict()
    options = dict()
    
    if request.method == 'GET':
        get = request.GET
        if get.has_key('C'):
            options.update({ 'C': get['C'] })
        if get.has_key('E'):
            options.update({ 'E': get['E'] })
        if get.has_key('Z'):
            options.update({ 'Z': get['Z'] })
        if get.has_key('F'):
            options.update({ 'F': get['F'] })
        if get.has_key('M'):
            if get['M'] == '0':
                options.update({ 'M': 'none' })
            else:
                options.update({ 'M': get['M'] })
        else:
            options.update({ 'M': 'default' })
        if get.has_key('KN'):
            options.update({ 'KN': get['KN'] })
        if get.has_key('KZ'):
            options.update({ 'KZ': get['KZ'] })
        if get.has_key('KL'):
            options.update({ 'KL': get['KL'] })
        if get.has_key('KT'):
            options.update({ 'KT': get['KT'] })

    news_box = BoxModule()
    news_box.options = options
    news_box.get_data()
    
    data.update({ 'box': news_box })
    t = loader.get_template('core/portal/modules/news_box_module.html')
    c = RequestContext(request, data)
    return HttpResponse(t.render(c))

    