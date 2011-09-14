# -*- coding: utf-8 -*-

__FNAME__ = 'megamenu.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from django.conf import settings
from core.debug.debug import Debugger
from core.models import RegisteredModule, MegaMenu, get_module_options_model, Menu, MenuItem, Category, Article, ArticleLanguage
from core.manager.base import BaseManager
from core.manager.system import SystemManager

class ModuleManager(object):

    def __init__(self, *args, **kwargs):
        self.registered_module = None
        self.megamenu_items = None
        self.options = None
        self.debugger = Debugger(__MNAME__,__FNAME__)

    def get_data(self, lang, site):
        self.language = lang
        self.fetch_megamenu()
        if self.megamenu_items:
            for item in self.megamenu_items:
                item.get_language(lang.id)
                self.prepare_menu(item, lang)
                self.prepare_category(item, lang, site)

                width = 3
                if item.category is not None:
                    width = width + 310
                if item.menu is not None:
                    width = width + 200
                width = width + 250

                item.width = width


    def prepare_category(self, item, lang, site):
        if item.category is not None:
            #item.category = self.get_category(item.category, lang, site)
            item.articles = self.get_articles(item.category, lang, site)
            for items in item.articles:
                item.get_language(lang.id)

    def prepare_menu(self, item, lang):
        safemenuitems = []
        err = 0
        if item.menu is not None:
            item.menu.get_language(lang.id)
            item.menu.menuitems = self.get_menu_items(item.menu)
            err = 0
            for it in item.menu.menuitems:
                err = 0
                it.get_language(lang.id)

                it.module_model = get_module_options_model(it.registered_module.id)
                try:
                    options = it.module_model.__class__.objects.filter(menuitem=it)
                    if len(options) > 0:
                        options = options[0]
                    else:
                        options = None
                except Exception, e:
                    err = 1
                    options = None
                    self.debugger.catch_error('prepare_menu: ', e)

                if options is not None:
                    try:
                        it.options = options
                        it.slug = it.options.get_slug(lang.id)
                        it.url_prefix = it.options.get_url_prefix()
                        it.object_id = it.options.get_object_id()
                        it.registered_module_id = it.options.registered_module.id
                    except Exception, e:
                        self.debugger.catch_error('prepare_menu: ', e)
                        err = 1
                else:
                    err = 1
                if err == 0:
                    safemenuitems.append(it)
            item.menu.menuitems = safemenuitems

    def fetch_registered_module(self, rid):
        try:
            self.registered_module = RegisteredModule.objects.get(id=rid)
        except Exception, e:
            self.debugger.catch_error('fetch_registered_module: ', e)

    def fetch_megamenu(self):
        try:
            self.megamenu_items = MegaMenu.objects.all().order_by('order')
        except Exception, e:
            self.debugger.catch_error('fetch_megamenu: ', e)

    def fetch_options(self):
        pass

    def get_items(self):
        return self.megamenu_items

    def get_menu_items(self, menuitem):
        menuitems = None
        try:
            menuitems = MenuItem.objects.filter(menu=menuitem)
        except Exception, e:
            self.debugger.catch_error('get_menu_items: ', e)
        return menuitems

    def get_category(self, categoryitem, lang, site):
        cat = None
        try:
            cat = Category.objects.get(id=categoryitem.id)
            cat.get_language(lang.id)
        except Exception, e:
            self.debugger.catch_error('get_category: ', e)

        return cat

    def get_articles(self, categoryitem, lang, site):

        cats = self.get_items_as_tree(categoryitem, 0)
        manager = BaseManager()
        manager.fetchOptions = { 'site': site.id, 'active': 1, 'activesite': site.id }
        manager.model = Article()
        manager.modelLanguage = ArticleLanguage()
        manager.order = 'date'
        manager.debugger.filename = 'megamenu.py'
        manager.rangeItemsStart = 1
        manager.rangeItemsEnd = 5
        manager.moduleName = '__adm_Articles__'

        items = []
        if 1:
        #for cat in cats:
            #manager.fetchOptions.update({ 'category__id': cat.id })
            manager.fetchOptions.update({  'category': cats })
            manager.fetch_items(default_filter=False)

            if manager.items:
                for item in manager.items:
                    item.get_language(lang.id)
                    items.append(item)

        manager.items = items

        return manager.items [:5]


    def get_items_as_tree(self, item = None, depth = 0, result = None, for_select=False):
        if result is None:
            result = list()
        try:
            items = Category.objects.filter(parent=item.id)
        except Exception, e:
            print 'get_items_as_tree: ', e
            return result

        if items:
            for cat in items:
                cat.depth = depth
                result.append(cat)
                result = self.get_items_as_tree(cat, (depth + 15), result, for_select)
        return result
