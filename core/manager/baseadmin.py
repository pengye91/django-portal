# -*- coding: utf-8 -*-

__FNAME__ = 'baseadmin.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

from django.contrib.contenttypes.models import ContentType
from core.manager.base import BaseManager


class AdminManager(BaseManager):

    def __init__(self, *args, **kwargs):
        """ Konstruktor
        """
        super(AdminManager, self).__init__(*args, **kwargs)
        self.fetchOptions = { 'active': 1, 'temp': False }
        self.moduleName = None
        self.form_class = None
        self.form_language_class = None
        self.form_options_class = None
        self.form = None
        self.languageForm = None
        self.options_form = None
        self.debugger.file = __FNAME__

    def get_context(self):
        self.context.update({ 'modulename': self.moduleName })
        self.context.update({ 'itemForm': self.form })
        self.context.update({ 'itemLanguageForm': self.languageForm })
        self.context.update({ 'itemOptionsForm': self.options_form })

        return self.context

    def edit_item(self, request):
        """ Ogolny wrapper do edycji elementu
        """
        return self.edit_current_item(request)

    def edit_current_item(self, request):
        """ Edycja elementu
        """
        if request.method == 'POST':
            self.set_form(self.item, request)
            if self.modelLanguage is not None:
                self.set_form(self.item.language, request)

            if self.modelOptions is not None:
                self.set_options_form(self.options_item, request, prefix='opt')

            """ jesli wszystko ok to zapisz obiekty"""
            validate = False
            if self.validate_form(self.form):
                validate = True
                if self.modelLanguage is not None:
                    validate = self.validate_form(self.languageForm)
                    if validate is True:
                        if self.modelOptions is not None:
                            validate = self.validate_form(self.options_form)

                if validate is True:
                    instance = self.form.save()
                    instance.temp = False
                    instance.save()
                    self.item = instance
                    if self.modelLanguage is not None:
                        instance = self.languageForm.save()
                        instance.temp = False  # obiekt juz nie jest tymczasowy
                        instance.save()
                    if self.modelOptions is not None:
                        instance = self.options_form.save()
                        instance.save()

                    return True
        else:
            # pierwsze odpalenie formularza
            self.set_form(self.item)
            if self.modelLanguage is not None:
                self.set_form(self.item.language)
            if self.modelOptions is not None:
                self.set_options_form(self.options_item, prefix='opt')

        return False

    def validate_form(self, form):
        """ Sprawdza poprawnosc formularza
        """
        if form.is_valid():
            return True
        return False

    def set_form(self, item, request=None, prefix=None):
        """ Ustawia formularza
        """
        if prefix is None:
            kwargs = { 'instance':item, 'prefix':type(item).__name__}
        else:
            kwargs = { 'instance':item, 'prefix': prefix}

        if request is not None:
            args = (request.POST,request.FILES)
        else:
            args = ()

        try:
            model_type = ContentType.objects.get_for_model(self.model)
        except Exception, e:
            self.debugger.catch_error('set_form: ', e)

        if self.modelLanguage is not None:
            try:
                model_language_type = ContentType.objects.get_for_model(self.modelLanguage)
            except Exception, e:
                self.debugger.catch_error('set_form: ', e)

        if isinstance(item, model_type.model_class()):
            self.form = self.form_class(*args, **kwargs)
        elif self.modelLanguage is not None:
            if isinstance(item, model_language_type.model_class()):
                self.languageForm = self.language_form_class(*args, **kwargs)
        else:
            self.form = None

    def set_options_form(self, item, request=None, prefix=None):
        """ Ustawia formularza
        """
        if prefix is None:
            kwargs = { 'instance':item, 'prefix':type(item).__name__}
        else:
            kwargs = { 'instance':item, 'prefix': prefix }

        if request is not None:
            args = (request.POST,request.FILES)
        else:
            args = ()

        try:
            model_type = ContentType.objects.get_for_model(self.modelOptions)
        except Exception, e:
            self.debugger.catch_error('set_options_form: ', e)
            model_type = None

        if isinstance(item, model_type.model_class()):
            self.options_form = self.form_options_class(*args, **kwargs)
            #self.options_form = self.form_options_class(*args, instance=item)
        else:
            self.options_form = None



    def new(self):
        self.item = self.model
        self.item.save()

    def delete(self, request):
        if request.method == 'POST':
            post = request.POST
            if post.has_key('type'):
                if post.has_key('id'):
                    if post['type'] == 'delete':
                        try:
                            self.fetch_item(post['id'])
                            self.item.delete()
                            return 0
                        except Exception,e:
                            self.debugger.catch_error('delete_item: ', e)
                            return 1
                else:
                    return 1
            else:
                return 1
        else:
            return 1

    def change_item(self, request, site, only_one = False):
        if request.method == 'POST':
            post = request.POST
            if post.has_key('type'):
                if post.has_key('id'):
                    if post['type'] == 'activity':
                        try:
                            self.fetch_item(post['id'])
                            if post['status'] == '0':
                                self.item.active.remove(site)
                            else:
                                self.item.active.add(site)
                            return 0
                        except Exception,e:
                            self.debugger.catch_error('change_item: ', e)
                            return 1
                else:
                    return 1
            else:
                return 1
        else:
            return 1
