# -*- coding: utf-8 -*-

__FNAME__ = 'adv_module.py'
__MNAME__ = 'Core/Manager/Modules'  # nazwa modulu

import random
from datetime import datetime
from django.conf import settings
from core.debug.debug import Debugger
from core.models import RegisteredModule, AdvModuleOption, Adv, AdvGroup

class ModuleManager(object):

    def __init__(self, *args, **kwargs):
        self.registered_module = None
        self.options = None
        self.language = None
        self.adv = None
        self.advgroup = None
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.fetch_opt = dict()

    def get_data(self, lang, site):
        #date = ((datetime.date.today() + datetime.timedelta(days=1)) - datetime.timedelta(6 * 365 / 12))
        self.language = lang
        self.fetch_options()
        if self.options is not None:
            if self.options.advgroup is not None:
                self.fetch_adv_group(self.options.advgroup.id, lang, site)
            elif self.options.adv is not None:
                self.fetch_adv(self.options.adv.id)

            if self.advgroup is not None:
                if self.advs is not None:
                    filteradv = []
                    for adv in self.advs:
                        #print adv
                        to_filter = False
                        if adv.datestart is not None:
                            if adv.datestart <= datetime.today():
                                if adv.dateend is not None:
                                    if adv.dateend >= datetime.today():
                                        to_filter = True
                                else:
                                    to_filter = True
                        #print '1: ', to_filter
                        if adv.views is not None:
                            if adv.views != 0:
                                if adv.views > adv.visits:
                                    to_filter = False
                        #print '2: ', to_filter
                        if adv.clicks is not None:
                            if adv.clicks != 0:
                                if adv.clicks > adv.clickcount:
                                    to_filter = False
                        #print '3: ', to_filter
                        if adv.is_active is False:
                            to_filter = False
                        #print '4: ', to_filter
                        if to_filter is True:
                            size = str(adv.group.width) + "x" + str(adv.group.height)
                            adv.size = size
                            filteradv.append(adv)
                        #print '5: ', to_filter

                    total = len(filteradv) #self.advs.count()
                    if total > 1:
                        self.adv = filteradv[random.randrange(len(filteradv))] #Adv.objects.filter(group=self.advgroup).order_by('?')[0]
                    elif total == 1:
                        self.adv = filteradv[0]

                    one_adv = False
                    if self.options.ammount is not None:
                        if self.options.ammount > 0:
                            random_advs = []
                            for i in range(0, (self.options.ammount)):
                                random_advs.append(self.select_random(filteradv))
                            self.advs = random_advs #filteradv[:self.options.ammount]
                            for adv in self.advs:
                                self.adv.visits = self.adv.visits + 1
                                self.adv.save()
                        else:
                            one_adv = True
                    else:
                        one_adv = True

                    if one_adv is True:
                        self.adv.visits = self.adv.visits + 1
                    self.adv.save()

    def select_random(self, data):
        if data != []:
            pos = random.randrange( len(data) )
            elem = data[pos]
            data[pos] = data[-1]
            del data[-1]
            return elem
        else:
            return None

    def fetch_registered_module(self, rid):
        try:
            self.registered_module = RegisteredModule.objects.get(id=rid)
        except Exception, e:
            self.debugger.catch_error('fetch_registered_module: ', e)

    def fetch_options(self):
        try:
            self.options = AdvModuleOption.objects.filter(registered_module=self.registered_module)
            if self.options > 0:
                self.options = self.options[0]
            else:
                self.options = None
        except Exception, e:
            self.debugger.catch_error('fetch_options: ', e)

    def fetch_adv_group(self, group_id, lang, site):
        try:
            self.advgroup = AdvGroup.objects.get(id=group_id)
        except Exception, e:
            self.debugger.catch_error('fetch_adv_group (advgroup): ', e)

        if self.advgroup is not None:
            try:
                self.advs = Adv.objects.filter(group=self.advgroup, active=site, sites=site)
            except Exception, e:
                self.debugger.catch_error('fetch_adv_group (adv): ', e)

    def fetch_adv(self, adv_id):
        try:
            self.adv = Adv.objects.get(id=adv_id)
        except Exception, e:
            self.debugger.catch_error('fetch_adv: ', e)