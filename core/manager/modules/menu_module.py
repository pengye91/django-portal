# -*- coding: utf-8 -*-

__FNAME__ = 'menu_module.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

from core.debug.debug import Debugger
from core.models import RegisteredModule, Menu, MenuItem, MenuModuleOption, get_module_options_model
from core.manager.modules.module import ModuleBaseManager

class ModuleManager(ModuleBaseManager):

    def __init__(self, *args, **kwargs):
        super(ModuleBaseManager, self).__init__(*args, **kwargs)
        self.registered_module = None
        self.menu = None
        self.menuitems = []
        self.treemenuitems = None
        self.options = None
        self.language = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.permissions = None

    def get_data(self, lang, site):
        self.language = lang
        self.fetch_options()
        self.fetch_menu()
        self.fetch_menu_items()

        self.treemenuitems = self.get_items_as_tree()

        newitems = []
        for item in self.menuitems:
            if item.parent is not None:
                newitems.append(item)
        self.menuitems = newitems

        safemenuitems = []
        if self.menuitems is not None:
            for item in self.menuitems:
                if self.permissions is not None:
                    self.permissions.permissions = None
                err = 0
                if item is not None:

                    item.get_language(lang.id)
                    item.module_model = get_module_options_model(item.registered_module.id)

                    if self.permissions is not None:
                        self.permissions.prepare_permissions(item.permissions)
                        self.permissions.compare_permissions(item, item.__class__.__name__, False)

                    options = None
                    try:
                        options = item.module_model.__class__.objects.filter(menuitem=item)
                        if len(options) > 0:
                            options = options[0]
                        else:
                            options = None
                    except Exception, e:
                        err = 1
                        options = None
                        self.debugger.catch_error('get_data: ', e)

                    if options is not None:
                        item.options = options
                        try:
                            item.slug = item.options.get_slug(lang.id)
                            item.url_prefix = item.options.get_url_prefix()
                            item.object_id = item.options.get_object_id()
                            item.registered_module = item.options.registered_module
                        except Exception, e:
                            err = 1
                            self.debugger.catch_error('get_data: ', e)
                    else:
                        err = 1
                if err == 0:
                    if self.permissions is not None:
                        if self.permissions.permissions['public'] is True:
                            safemenuitems.append(item)
                    # chwilowo!!! usunac
                    #else:
                    #    safemenuitems.append(item)
            self.menuitems = safemenuitems

        newitems = []
        for item in self.treemenuitems:
            if item.parent is not None:
                newitems.append(item)
        self.treemenuitems = newitems


    def fetch_registered_module(self, rid):
        try:
            self.registered_module = RegisteredModule.objects.get(id=rid)
        except Exception, e:
            self.debugger.catch_error('fetch_registered_module: ', e)

    def fetch_options(self):
        try:
            self.options = MenuModuleOption.objects.filter(registered_module=self.registered_module)
            if self.options > 0:
                self.options = self.options[0]
            else:
                self.options = None
        except Exception, e:
            self.debugger.catch_error('fetch_options: ', e)

    def fetch_menu_items(self):
        if self.menu is not None:
            try:
                items = MenuItem.objects.filter(menu=self.menu) #options.menu)
                root = MenuItem.objects.filter(parent=None)[0]
                self.menuitems.append(root)
                for item in items:
                    if self.permissions is not None:
                        self.permissions.prepare_permissions(item.permissions)
                        self.permissions.compare_permissions(item, item.__class__.__name__, False)
                        if self.permissions.permissions['public'] is True:
                            self.menuitems.append(item)
            except Exception, e:
                self.debugger.catch_error('fetch_options: ', e)

    def fetch_menu(self):
        try:
            menu = Menu.objects.filter(id=self.options.menu.id)[0]
            if self.permissions is not None:
                self.permissions.prepare_permissions(menu.permissions)
                self.permissions.compare_permissions(menu, menu.__class__.__name__, False)
                if self.permissions.permissions['public'] is True:
                    self.menu = menu
        except Exception, e:
            self.debugger.catch_error('fetch_menu: ', e)

    def get_items(self):
        return None #self.menuitems

    def get_items_as_tree(self, items = None, parentId = None, depth = -15, result = None):
        """ Zwraca obiekty jako drzewo - hierarhia zalezy od pola 'parent'
        """
        if result is None:
            result = list()
        if items is None:
            try:
                items = self.get_items()
            except Exception,e:
                self.debugger.catch_error('get_items_as_tree: ',e)
                items = ''

        if items is not None:
            for cat in items:
                if cat.parent_id == parentId:
                    cat.depth = depth
                    result.append(cat)
                    # zeby zrozumiec rekurencje nalezy zrozumiec rekurencje :)
                    result = self.get_items_as_tree(items, cat.id, (depth + 15), result)

        return result
