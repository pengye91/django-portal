# -*- coding: utf-8 -*-

__FNAME__ = 'base.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

from core.debug.debug import Debugger

class BaseManager(object):
    """ Base
    """

    def __init__(self, *args, **kwargs):
        """Init
        """
        self.item = None
        self.items = None
        self.options_item = None
        self.rangeItemsStart = 1
        self.rangeItemsEnd = 10
        self.order = None
        self.model = None
        self.modelLanguage = None
        self.modelOptions = None
        self.fetchOptions = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.context = dict()
        self.options = None

    def fetch_item(self, itemId):
        """Pobiera element
        """
        model_class = self.model.__class__

        try:
            self.item = model_class.objects.get(id=itemId)
        except Exception,e:
            self.debugger.catch_error('fetch_item: ',e)

    def fetch_item_by_slug(self, slug, lang):
        """Pobiera element
        """
        model_class = self.model.__class__
        model_language_class = self.modelLanguage.__class__

        try:
            item = model_language_class.objects.filter(slug=slug, language=lang)
        except Exception,e:
            self.debugger.catch_error('fetch_item_by_slug: ',e)

        try:
            self.item = model_class.objects.filter(languages__in=item)
            if len(self.item) > 0:
                self.item = self.item[0]
            else:
                self.item = None
        except Exception,e:
            self.debugger.catch_error('fetch_item_by_slug: ',e)

    def fetch_items(self, default_filter=False, database='', for_select=False):
        """Pobiera elementy
        """
        model_class = self.model.__class__

        if for_select == True:
            self.rangeItemsStart = None
            self.rangeItemsEnd = None

        try:
            if default_filter is False:
                if database == '':
                    self.items = model_class.objects.optfilter(self.fetchOptions).order_by(self.order)[self.rangeItemsStart:self.rangeItemsEnd]
                else:
                    self.items = model_class.objects.using(database).optfilter(self.fetchOptions).order_by(self.order)[self.rangeItemsStart:self.rangeItemsEnd]
            else:
                if database == '':
                    self.items = model_class.objects.all().order_by(self.order)[self.rangeItemsStart:self.rangeItemsEnd]
                else:
                    self.items = model_class.objects.using(database).all().order_by(self.order)[self.rangeItemsStart:self.rangeItemsEnd]
        except Exception,e:
            self.debugger.catch_error('fetch_items: ',e)


    def count_items(self, default_filter=False, database=''):
        """Pobiera elementy
        """
        model_class = self.model.__class__
        count = 0
        try:
            if default_filter is False:
                if database == '':
                    count = model_class.objects.optfilter(self.fetchOptions).order_by(self.order).count()
                else:
                    count = model_class.objects.using(database).optfilter(self.fetchOptions).order_by(self.order).count()
            else:
                if database == '':
                    count = model_class.objects.all().order_by(self.order).count()
                else:
                    count = model_class.objects.using(database).all().order_by(self.order).count()
        except Exception,e:
            self.debugger.catch_error('fetch_items: ',e)
        return count

    def get_items(self):
        """ Zwraca liste rzeczy
        """
        return self.items

    def set_language(self, currentLanguage):
        if self.item is not None:
            try:
                self.item.get_language(currentLanguage)
            except Exception,e:
                self.debugger.catch_error('set_language: ',e)

        if self.items is not None:
            for item in self.items:
                try:
                    item.get_language(currentLanguage)

                except Exception,e:
                    self.debugger.catch_error('set_language: ',e)



    def get_items_as_tree(self, request, items = None, parentId = None, depth = 0, result = None, for_select=False):
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

        if items:
            for cat in items:
                if cat.parent_id == parentId:
                    cat.depth = depth
                    result.append(cat)
                    # zeby zrozumiec rekurencje nalezy zrozumiec rekurencje :)
                    if for_select is False:
                        result = self.get_items_as_tree(request, items, cat.id, (depth + 15), result, for_select)
                    else:
                        result = self.get_items_as_tree(request, items, cat.id, (depth + 1), result, for_select)

        return result

    def get_context(self):
        self.context.update({ 'modulename': self.moduleName })
        return self.context
