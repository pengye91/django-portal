# -*- coding: utf-8 -*-

__FNAME__ = 'language.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

from django.conf import settings
from core.models import Language
from core.debug.debug import Debugger

class LanguageManager(object):

    def __init__(self, request, *args, **kwargs):
        super(LanguageManager, self).__init__(*args, **kwargs)
        self.currentLanguage = None
        self.activeLanguages = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.fetch_current_language(request)
        self.fetch_active_languages()
        self.sheet = None
        self.fullpath = None
        self.path = None
        self.order = 'name'
        self.model = Language()
        self.modelName = 'Language'
        self.moduleName = '__adm_Language__'

    def fetch_current_language(self, request):
        """ pobiera aktualnie ustawiony jezyk i zapisuje go do sesji """
        changedLanguage = False
        if request.method == 'GET':
            try:
                lang = request.GET['lang'] # kliknieto na zmiane jezyka
                request.session['lang'] = lang
                langSymbol = lang
                changedLanguage = True
            except Exception,e:
                self.debugger.catch_error('fetch_current_language: ',e)
                pass

        if not changedLanguage:
            """ nie bylo zmiany jezyka, sprawdz czy jezyk jest ustawiony w sesji
                jesli nie to ustaw na domyslny z pliku ustawien """
            try:
                langSymbol = request.session['lang']
            except Exception,e:
                langSymbol = settings.DEFAULTPORTALLANG
                request.session['lang'] = langSymbol
                self.debugger.catch_error('fetch_current_language: ',e)

        """ Na podstawie sybolu jezyka pobierz obiekt """
        try:
            self.currentLanguage = Language.objects.get(symbol=langSymbol)
        except Exception,e:
            self.currentLanguage = None
            self.debugger.catch_error('fetch_current_language: ',e)


    def fetch_active_languages(self):
        """ pobiera wszystkie jezyki okreslone jako aktywne w bazie """
        try:
            self.activeLanguages = Language.objects.filter(active=True)
        except Exception,e:
            self.activeLanguages = None
            self.debugger.catch_error('get_active_languages: ',e)

    def get_context(self):
        return { 'languages': self.activeLanguages, 'activelanguage': self.currentLanguage.symbol, 'activelang': self.currentLanguage }

    def set_non_existent_language_items(self, item, object):
        """ Jesli nie ma elementu w danym jezyku to go stworz """
        if item is not None:
            if self.activeLanguages is not None:
                for activeLanguage in self.activeLanguages:
                    itIs = False
                    if item.languages is not None:
                        for languageItem in item.languages.all():
                            if activeLanguage.symbol == languageItem.language.symbol:
                                itIs = True
                        if itIs == False:
                            newLanguage = object()
                            if newLanguage is not None:
                                newLanguage.language = activeLanguage
                                newLanguage.save()
                                item.languages.add(newLanguage)
                    else:
                        newLanguage = object()
                        if newLanguage is not None:
                            newLanguage.language = activeLanguage
                            newLanguage.save()
                            item.languages.add(newLanguage)
