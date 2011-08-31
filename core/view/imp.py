# -*- coding: utf-8 -*-

from django.template import loader, RequestContext
from django.http import HttpResponse
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.conf import settings
from django.contrib.sites.models import Site
import time, datetime

from core.manager.baseadmin import AdminManager
from core.manager.system import SystemManager
from core.models import Article, ArticleLanguage, Category, CategoryLanguage, DentoData, DentoCat, Gallery, Image, ImageLanguage, DentoArtImage
from core.models import Calendar, CalendarEvent, CalendarEventLanguage, CalendarEventType, CalendarEventTypeLanguage, CalendarLanguage, DentoEvent, DentoEventSpecial, DentoEventType
from core.models import SitePortal

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)

def events(request):
    system = SystemObject(request)
    data = dict()
    rootcalendar = Calendar.objects.get(id=2)
    """ Event types """
    """
    items = DentoEventType.objects.using('dento').all()
    for item in items:
        et = CalendarEventType()
        et.calendar = rootcalendar
        et.dentoid = item.schedule_typeID
        et.save()
        system.language.set_non_existent_language_items(et, CalendarEventTypeLanguage)
        if et is not None:
            et.get_language(system.language.currentLanguage.id)
            et.language.name = item.name
            et.language.save()
    """
    """ end Event types """
    """ Events """
    """
    items = DentoEvent.objects.using('dento').all()
    for item in items:
        e = CalendarEvent()
        e.dentoid = item.schID
        e.startdate = '2001-01-01 00:00:00'
        e.enddate = '2001-01-01 00:00:00'
        if item.month:
            if item.day:
                if item.year:
                    if item.month == 2:
                        if item.day == 29:
                            item.day = 28
                    e.startdate = str(item.year) + '-' + str(item.month) + '-' + str(item.day) + ' 00:00:00'
                    e.enddate = str(item.year) + '-' + str(item.month) + '-' + str(item.day) + ' 00:00:00'
                    #print str(item.year) + '-' + str(item.month) + '-' + str(item.day) + ' 00:00:00'
        e.dentocountryid = item.countrydistinctsID
        try:
            t = CalendarEventType.objects.get(dentoid=item.schedule_typeID)
            e.type = t
        except:
            pass
        e.bannerLink = item.bannerLink
        e.infoLink = item.infoLink
        e.support = item.support
        e.backgroundColor = item.backgroundColor
        e.borderColor = item.borderColor
        e.borderWidth = item.borderWidth
        e.promotor = item.promotor
        e.formMail = item.formMail
        e.profesor = item.profesor
        e.town = item.city
        order = int(item.ord)
        e.save()
        system.language.set_non_existent_language_items(e, CalendarEventLanguage)
        if e is not None:
            e.get_language(system.language.currentLanguage.id)
            e.language.title = item.title
            e.language.text = item.description
            e.language.save()
    """
    """ end Events """

        #time_format = "%Y-%m-%d %H:%M:%S"
        #itemdate = datetime.datetime.fromtimestamp(time.mktime(time.strptime(timestring, time_format)))
        #print itemdate
    data.update({ 'data': items })
    t = loader.get_template('imp/impevent.html')
    c = RequestContext(request, data)

    return HttpResponse(t.render(c))

def show_items(request, link_id):
    data = dict()

    items = DentoData.objects.using('dento').filter(linkID=link_id).order_by('-added')

    #cat = ccat(request, link_id)
    #cart(request, cat, items)

    data.update({ 'items': items })
    t = loader.get_template('imp.html')
    c = RequestContext(request, data)

    return HttpResponse(t.render(c))

def cats(request):
    system = SystemObject(request)
    data = dict()
    cats = DentoCat.objects.using('dento').all()
    #cat = DentoCat.objects.using('dento').get(idStr=2) # lekarze
    #site = SitePortal.objects.get(id=1) # lekarze
    #print site.site
    cat = DentoCat.objects.using('dento').get(idStr=3) # studenci
    site = SitePortal.objects.get(id=3) # studenci
    items = get_items_as_tree1(system, request, item = cat)
    #items = get_items_as_tree(system, request, items = c)
    c = cats
    """ This is import from dento

    for cat in items:
        category = Category()
        category.dentoid = cat.idStr
        category.save()
        system.language.set_non_existent_language_items(category, CategoryLanguage)

        if category is not None:
            category.get_language(system.language.currentLanguage.id)
            category.language.name = cat.name
            category.language.save()
            category.sites.add(site.site)
            category.active.add(site.site)

    cats = Category.objects.all()
    root = Category.objects.get(id=1)
    for cat in cats:
        try:
            dcat = DentoCat.objects.using('dento').get(idStr=cat.dentoid)
            if dcat.idOver != 0:
                parent = Category.objects.get(dentoid=dcat.idOver)
            else:
                parent = root
        except Exception, e:
            print e
            parent = root
        cat.parent = parent
        cat.save()
    """


    data.update({ 'data': items })
    t = loader.get_template('imp/impcat.html')
    c = RequestContext(request, data)

    return HttpResponse(t.render(c))

def arts(request):
    system = SystemObject(request)
    data = dict()
    items = DentoData.objects.using('dento').all().order_by('-added')
    gallery = Gallery.objects.get(id=2)

    for item in items:
        cat = None
        try:
            cat = Category.objects.get(dentoid=item.linkID)
        except Exception, e:
            print e

        if item.body is not None:
            item.body = item.body.replace('\n',u'<br />')

        if item.intro is not None:
            item.intro = item.intro.replace('\n',u'<br />')
        """ This is import from dento

        if cat is not None:
            art = Article()
            art.save()
            system.language.set_non_existent_language_items(art, ArticleLanguage)
            art.get_language(system.language.currentLanguage.id)
            art.language.title = item.title


            for i in range(0,10):
                if item.body:
                    f = item.body.find('<' + str(i) + '>')
                    if f != -1:
                        image = None
                        try:
                            image = DentoArtImage.objects.using('dento').get(dataID=item.ID, pictureNumber=i)
                        except Exception, e:
                            print e
                        if image is not None:
                            if not image.picturePath:
                                image.picturePath = ''
                            if not image.pictureAlign:
                                image.pictureAlign = 'left'
                            mr = 'margin-right: 8px;'
                            if image.pictureAlign == 'left':
                                mr = 'margin-right: 8px;'
                            if image.pictureAlign == 'right':
                                mr = 'margin-left: 8px;'
                            if item.body:
                                item.body = item.body.replace('<' + str(i) + '>',u'<img style="margin-top:5px; margin-bottom: 3px; ' + mr + '" src="http://dentonet.pl/imagesArticles/' + image.picturePath + '" align="' + image.pictureAlign +'">')
                            if i==0:
                                art.mainimage = 'http://dentonet.pl/imagesArticles/' + image.picturePath

                if item.intro:
                    f = item.intro.find('<' + str(i) + '>')
                    if f != -1:
                        image = None
                        try:
                            image = DentoArtImage.objects.using('dento').get(dataID=item.ID, pictureNumber=i)
                        except Exception, e:
                            print e
                        if image is not None:
                            if not image.picturePath:
                                image.picturePath = ''
                            if not image.pictureAlign:
                                image.pictureAlign = 'left'
                            if image.pictureAlign == 'left':
                                mr = 'margin-right: 8px;'
                            if image.pictureAlign == 'right':
                                mr = 'margin-left: 8px;'
                            if item.intro:
                                item.intro = item.intro.replace('<' + str(i) + '>',u'<img style="margin-top:5px; margin-bottom: 3px; ' + mr + '" src="http://dentonet.pl/imagesArticles/' + image.picturePath + '" align="' + image.pictureAlign +'">')
                            if i==0:
                                art.mainimage = 'old_dento/imagesArticles/' + image.picturePath


            text = ''
            if item.intro:
                text = text + item.intro + '<br /><br />'
            if item.body:
                text = text + item.body
            art.language.text = text
            art.visits = item.displayCount
            if item.added:
                art.date = item.added

            art.category = cat
            art.save()
            art.language.save()
            art.sites.add(system.portal.get_active_site())
            if item.active:
                art.active.add(system.portal.get_active_site())
            
            """
    data.update({ 'data': items })
    t = loader.get_template('imp/impart.html')
    c = RequestContext(request, data)

    return HttpResponse(t.render(c))

def get_items_as_tree(system, request, items = None, parentId = 0, depth = 0, result = None, for_select=False):
    if result is None:
        result = list()

    if items:
        for cat in items:
            if cat.idOver == parentId:
                cat.depth = depth
                result.append(cat)
                # zeby zrozumiec rekurencje nalezy zrozumiec rekurencje :)
                result = get_items_as_tree(system, request, items, cat.idStr, (depth + 15), result, for_select)
    return result

def get_items_as_tree1(system, request, item = None, depth = 0, result = None, for_select=False):
    if result is None:
        result = list()

    if item is not None:
        items = DentoCat.objects.using('dento').filter(idOver=item.idStr)
    else:
        items = DentoCat.objects.using('dento').filter(idOver=0)

    if items:
        for cat in items:
            cat.depth = depth
            result.append(cat)
            result = get_items_as_tree1(system, request, cat, (depth + 15), result, for_select)
    return result