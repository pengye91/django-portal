# -*- coding: utf-8 -*-
from django.conf import settings

def report_error(*args):
    """ Raportowanie bledow """
    if settings.DEVELDEBUG:
        string = ''
        for arg in args:
            string += str(arg)
        print string

def info(object, spacing=10, collapse=1):
    methodList = [method for method in dir(object) if callable(getattr(object, method))]
    processFunc = collapse and (lambda s: " ".join(s.split())) or (lambda s: s)
    print "\n".join(["%s %s" %
                      (method.ljust(spacing),
                       #processFunc(str(getattr(object, method).__doc__)))
                       '')
                     for method in methodList])

class Debugger(object):
    """ Klasa Debugger obslugujaca wyjatki
    """
    def __init__(self, modulename, filename, *args, **kwargs):
        super(Debugger, self).__init__(*args, **kwargs)
        self.module = modulename
        self.file = filename
        self.lastError = None

    def catch_error(self, string, e):
        """ Lapanie bledu
        """
        self.lastError = e
        self.report_error(string, e)

    def report_error(self, *args):
        """ Raportowanie bledow
        """
        if settings.DEVELDEBUG:
            string = ''
            for arg in args:
                string += str(arg)
            print self.module, ': ', self.file, ': ', string
