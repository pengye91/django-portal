# -*- coding: utf-8 -*-

__FNAME__ = 'megamenu.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from django.conf import settings
from core.debug.debug import Debugger
from core.models import RegisteredModule, MegaMenu, get_module_options_model, Menu, MenuItem, Category, Article, ArticleLanguage
from core.manager.base import BaseManager

class ModuleManager(object):

    def __init__(self, *args, **kwargs):
        self.registered_module = None
        self.megamenu_items = None
        self.options = None
        self.debugger = Debugger(__MNAME__,__FNAME__)

    def get_data(self, lang):
        self.language = lang
        self.fetch_megamenu()
        if self.megamenu_items:
            for item in self.megamenu_items:
                item.get_language(lang.id)
                self.prepare_menu(item, lang)
                self.prepare_category(item, lang)

                width = 3
                if item.category is not None:
                    width = width + 310
                if item.menu is not None:
                    width = width + 200
                width = width + 250

                item.width = width


    def prepare_category(self, item, lang):
        if item.category is not None:
            item.category = self.get_category(item.category, lang)
            item.articles = self.get_articles(item.category, lang)

    def prepare_menu(self, item, lang):
        safemenuitems = []
        if item.menu is not None:
            item.menu.get_language(lang.id)
            item.menu.menuitems = self.get_menu_items(item.menu)
            for it in item.menu.menuitems:
                err = 0
                it.get_language(lang.id)

                it.module_model = get_module_options_model(it.module.id)
                try:
                    options = it.module_model.__class__.objects.filter(menuitem=it)
                    if len(options) > 0:
                        options = options[0]
                    else:
                        options = None
                except Exception, e:
                    err = 1
                    options = None
                    self.debugger.catch_error('get_data: ', e)

                if options is not None:
                    try:
                        it.options = options
                        it.slug = it.options.get_slug(lang.id)
                        it.url_prefix = it.options.get_url_prefix()
                        it.object_id = it.options.get_object_id()
                        it.module_id = it.options.module.id
                    except Exception, e:
                        self.debugger.catch_error('get_data: ', e)
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

    def get_category(self, categoryitem, lang):
        cat = None
        try:
            cat = Category.objects.get(id=categoryitem.id)
            cat.get_language(lang.id)
        except Exception, e:
            self.debugger.catch_error('get_category: ', e)

        return cat

    def get_articles(self, categoryitem, lang):
        manager = BaseManager()
        manager.fetchOptions = { 'site': settings.SITE_ID, 'active': 1, 'activesite': settings.SITE_ID }
        manager.model = Article()
        manager.modelLanguage = ArticleLanguage()
        manager.order = 'date'
        manager.debugger.filename = 'megamenu.py'
        manager.rangeItemsStart = 1
        manager.rangeItemsEnd = 6
        manager.moduleName = '__adm_Articles__'
        manager.fetch_items(default_filter=False)

        if manager.items:
            for item in manager.items:
                item.get_language(lang.id)

        return manager.items
