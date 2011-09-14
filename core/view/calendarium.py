# -*- coding: utf-8 -*-


import datetime
from copy import deepcopy
from django.template import loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings

from core.manager.baseadmin import AdminManager
from core.manager.system_site import SystemManager
from core.models import CalendarEvent, CalendarEventLanguage
from core.form.calendarium import AdmCalendarEventForm as AdmItemForm
from core.form.calendarium import AdmCalendarEventLanguageForm as AdmItemLanguageForm

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)
        self.manager = AdminManager()
        self.manager.fetchOptions = { 'site': self.portal.reqsite, 'active': 1, 'activesite': self.portal.reqsite }
        self.manager.rangeItemsStart = None
        self.manager.rangeItemsEnd = None
        self.manager.model = CalendarEvent()
        self.manager.modelLanguage = CalendarEventLanguage()
        self.manager.order = 'startdate'
        self.manager.debugger.filename = 'calendarium.py'
        self.manager.moduleName = '__adm_Calendars__'


def show_items(request):
    system = SystemObject(request)
    today = datetime.date.today()
    first_day = datetime.date(today.year, today.month, 1)
    last_day = datetime.date(today.year, today.month+1, 1) - datetime.timedelta(1,0,0)
    system.manager.fetchOptions.update({ 'startdate_gte': today.isoformat(), 'startdate_lte': last_day.isoformat() })

    system.show_items(request, paginate=False)
    system.template = loader.get_template(system.sheet.get_sheet_file('calendarium_event_list'))

    current_date = first_day
    next_month = datetime.date(today.year, today.month + 1, 1)
    prev_month = datetime.date(today.year, today.month - 1, 1)
    system.data.update({ 'current_date': current_date })
    system.data.update({ 'next_month': next_month })
    system.data.update({ 'prev_month': prev_month })
    system.data.update({ 'items': system.items })

    system.data.update({ 'month': today.month })
    system.data.update({ 'items': system.items })
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))

def show_items_by_month(request, month):
    system = SystemObject(request)
    today = datetime.date.today()

    try:
        month = int(month)
        if month < 0:
            month = today.month
        if month > 13:
            month = today.month
    except Exception, e:
        month = today.month

    first_day = datetime.date(today.year, month, 1)
    if month<12:
        last_day = datetime.date(today.year, month + 1, 1) - datetime.timedelta(1,0,0)
    else:
        last_day = datetime.date(today.year, month, 30)

    system.manager.fetchOptions.update({ 'startdate_gte': first_day.isoformat(), 'startdate_lte': last_day.isoformat() })

    system.show_items(request, paginate=False)
    system.template = loader.get_template(system.sheet.get_sheet_file('calendarium_event_list'))

    current_date = first_day
    next_month = None
    prev_month = None
    if month<12:
        next_month = datetime.date(today.year, month + 1, 1)
    if month>1:
        prev_month = datetime.date(today.year, month - 1, 1)
    system.data.update({ 'current_date': current_date })
    system.data.update({ 'next_month': next_month })
    system.data.update({ 'prev_month': prev_month })

    system.data.update({ 'items': system.items })
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))

def show_item_by_id(request, itemId):
    system = SystemObject(request)
    system.show_item(request, itemId)
    t = loader.get_template(system.sheet.get_sheet_file('calendarium_event'))

    system.data.update({ 'item': system.manager.item })
    system.data.update(system.get_context())
    c = RequestContext(request, system.data)
    return HttpResponse(t.render(c))

def search(request):
    system = SystemObject(request)
    today = datetime.date.today()

    month = today.month

    if request.method == 'POST':
        post = request.POST
        if post.has_key('month'):
            month = post['month']
            print month

    try:
        month = int(month)
        if month < 1:
            month = today.month
        if month > 12:
            month = today.month
    except Exception, e:
        month = today.month
        print 'core/view, calendarium: ', e

    first_day = datetime.date(today.year, month, 1)
    if month<12:
        last_day = datetime.date(today.year, month + 1, 1) - datetime.timedelta(1,0,0)
    else:
        if month<12:
            last_day = datetime.date(today.year, month + 1, 1) - datetime.timedelta(1,0,0)
        else:
            last_day = datetime.date(today.year, month, 30)

    system.manager.fetchOptions.update({ 'startdate_gte': first_day.isoformat(), 'startdate_lte': last_day.isoformat() })

    print first_day, last_day

    system.show_items(request, paginate=False)
    system.template = loader.get_template(system.sheet.get_sheet_file('calendarium_event_list'))

    current_date = first_day
    next_month = None
    prev_month = None
    if month<12:
        next_month = datetime.date(today.year, month + 1, 1)
    if month>1:
        prev_month = datetime.date(today.year, month - 1, 1)
    system.data.update({ 'current_date': current_date })
    system.data.update({ 'next_month': next_month })
    system.data.update({ 'prev_month': prev_month })
    system.data.update({ 'items': system.items })

    system.data.update({ 'month': today.month })
    system.data.update({ 'items': system.items })
    c = RequestContext(request, system.get_context())
    return HttpResponse(system.template.render(c))
