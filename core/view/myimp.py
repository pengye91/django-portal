# -*- coding: utf-8 -*-

import urllib
from phpserialize import *
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
from core.models import DentoCourse1, DentoCourse2, DentoRep, DentoRepAns
from core.models import RepetitioAnswer, RepetitioAnswerLanguage, RepetitioCourse, RepetitioCourseLanguage, RepetitioQuestion, RepetitioQuestionLanguage, RepetitioTest, RepetitioTestAnswer, RepetitioTestLanguage
from core.models import SitePortal

class SystemObject(SystemManager):

    def __init__(self, request, *args, **kwargs):
        super(SystemObject, self).__init__(request, *args, **kwargs)


def users(request):
    system = SystemObject(request)
    data = dict()

    t = loader.get_template('imp/impu.html')
    c = RequestContext(request, data)

    return HttpResponse(t.render(c))

def repetitio(request):
    system = SystemObject(request)
    data = dict()

    # testy 1
    t1 = DentoCourse1.objects.using('dento').all()
    for item in t1:
        questions = DentoRep.objects.using('dento').filter(rep_ID=item.rep_ID)
        item.questions = questions
        for q in questions:
            answers = DentoRepAns.objects.using('dento').filter(rep_ID=item.rep_ID, quizID=q.queryID)
            q.answers = answers

    course = RepetitioCourse.objects.get(id=1)
    put_tests(system, course, t1, False)

    # testy 2
    t2 = DentoCourse2.objects.using('dento').all()
    for item in t2:
        questions = DentoRep.objects.using('dento').filter(rep_ID=item.rep_ID)
        item.questions = questions
        for q in questions:
            answers = DentoRepAns.objects.using('dento').filter(rep_ID=item.rep_ID, quizID=q.queryID)
            q.answers = answers

    course = RepetitioCourse.objects.get(id=2)
    put_tests(system, course, t2, True)

    data.update({ 'tests1': t1 })
    data.update({ 'tests2': t2 })
    t = loader.get_template('imp/imprep.html')
    c = RequestContext(request, data)

    return HttpResponse(t.render(c))

def put_tests(system, course, tests, edentico):
    sites = Site.objects.all()
    for item in tests:
        t = RepetitioTest()

        t.course = course
        t.dento_id = item.rep_ID

        if edentico is False:
            t.author = item.rep_author
            t.datestart = item.rep_start
            t.dateend = item.rep_end
            t.eprice = item.rep_dentons
            if item.rep_dentons == -1:
                t.smsbuy = True
            t.dento_presenation_path = 'http://pacjenci.dentonet.pl/prezentacje/' + item.presentationPath
            if item.extraBanner != '':
                data = item.extraBanner
                banner = loads(data, object_hook=phpobject)
                t.dento_banner_path = item.extraBanner
            if item.isSponsored == 1:
                t.sponsored = True
            else:
                t.sponsored = False
        else:
            t.edentico = True
        t.save()
        for site in sites:
            t.sites.add(site)
            t.active.add(site)

        system.language.set_non_existent_language_items(t, RepetitioTestLanguage)
        if t is not None:
            t.get_language(system.language.currentLanguage.id)
            t.language.name = item.rep_name
            t.language.shortname = item.rep_short
            t.language.save()

            for tq in item.questions:
                q = RepetitioQuestion()
                q.dento_id = tq.queryID
                q.test = t
                q.save()
                for site in sites:
                    q.sites.add(site)
                    q.active.add(site)
                correct_answer = tq.correctAnswer

                system.language.set_non_existent_language_items(q, RepetitioQuestionLanguage)
                if q is not None:
                    q.get_language(system.language.currentLanguage.id)
                    q.language.question = tq.query
                    q.language.save()

                    for tqa in tq.answers:
                        a = RepetitioAnswer()
                        a.dento_id = tqa.ID
                        a.question = q
                        a.nr = tqa.answer_nr
                        if correct_answer == tqa.answer_nr:
                            a.correct_answer = True
                        else:
                            a.correct_answer = False
                        a.save()

                        system.language.set_non_existent_language_items(a, RepetitioAnswerLanguage)
                        if a is not None:
                            a.get_language(system.language.currentLanguage.id)
                            a.language.answer = tqa.answer
                            a.language.save()

def events(request):

    textcolors = {
        'black': 'color: #FFFFFF;',
        '#000000': 'color: #FFFFFF;',
        '#00548E': 'color: #FFFFFF;',
        '#304594': 'color: #FFFFFF;',
        '#004080': 'color: #FFFFFF;',
        '#0083FA': 'color: #FFFFFF;',
        '#0477BC': 'color: #FFFFFF;',
        '#102D95': 'color: #FFFFFF;',
        '#002060': 'color: #FFFFFF;',
        '#005800': 'color: #005800;',
        '#00457C': 'color: #00457C;',
        '#3F3F3F': 'color: #9FC905;'
    }

    system = SystemObject(request)
    data = dict()
    rootcalendar = Calendar.objects.get(id=1)
    site = SitePortal.objects.get(id=1)
    """ Event types """

    items = DentoEventType.objects.using('dento').all()
    for item in items:
        et = CalendarEventType()
        et.calendar = rootcalendar
        et.dentoid = item.schedule_typeID
        et.save()
        et.active.add(site.site)
        et.sites.add(site.site)
        system.language.set_non_existent_language_items(et, CalendarEventTypeLanguage)
        if et is not None:
            et.get_language(system.language.currentLanguage.id)
            et.language.name = item.name
            et.language.save()

    # end Event types
    # Events

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
        if textcolors.has_key(item.backgroundColor):
            e.textcolor = textcolors[item.backgroundColor]

        f = urllib.urlopen('http://www.dentonet.pl/others/schd/banners/mini/' + item.bannerLink)
        if f.info().gettype() != 'text/html':
            e.dentois = 'http://www.dentonet.pl/others/schd/banners/mini/' + item.bannerLink

        f = urllib.urlopen('http://www.dentonet.pl/others/schd/banners/med/' + item.bannerLink)
        if f.info().gettype() != 'text/html':
            e.dentoim = 'http://www.dentonet.pl/others/schd/banners/med/' + item.bannerLink

        f = urllib.urlopen('http://www.dentonet.pl/others/schd/banners/' + item.bannerLink)
        if f.info().gettype() != 'text/html':
            e.dentoih = 'http://www.dentonet.pl/others/schd/banners/' + item.bannerLink


        e.save()
        e.active.add(site.site)
        e.sites.add(site.site)
        system.language.set_non_existent_language_items(e, CalendarEventLanguage)
        if e is not None:
            e.get_language(system.language.currentLanguage.id)
            e.language.title = item.title
            e.language.text = item.description
            e.language.save()

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

def change_image(id, content, item, only_main=False, show=False):
    for i in range(0,10):
        f = content.find('<' + str(i) + '>')
        if f != -1:
            if show:
                print 'Przed: ', content
            image = None
            try:
                image = DentoArtImage.objects.using('dento').get(dataID=id, pictureNumber=i)
            except Exception, e:
                print 'change_image: ', e

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
                if only_main == False:
                    content = content.replace('<' + str(i) + '>',u'<img style="margin-top:5px; margin-bottom: 3px; ' + mr + '" src="http://dentonet.pl/imagesArticles/' + image.picturePath + '" align="' + image.pictureAlign +'">')

                if i==0:
                    item.dentomainimage = 'http://dentonet.pl/imagesArticles/' + image.picturePath
            else:
                print 'jest image a nie ma: ', id
            if show:
                print 'Po: ', content

    return content

def arts(request):
    system = SystemObject(request)
    data = dict()
    fw = []
    #items = DentoData.objects.using('dento').all().order_by('-added')
    #gallery = Gallery.objects.get(id=2)

    site = SitePortal.objects.get(id=1) # lekarze
    items = Category.objects.optfilter({ 'site': site.id })


    for cat in items:
        if cat.dentoid is not None:
            arts = DentoData.objects.using('dento').filter(linkID=cat.dentoid).order_by('-added')

            for item in arts:
                text = ''
                art = Article()
                art.save()
                system.language.set_non_existent_language_items(art, ArticleLanguage)
                art.get_language(system.language.currentLanguage.id)

                if item.intro is not None:
                    item.intro = item.intro.replace('\n',u'</p><p>')
                    item.intro = change_image(item.ID, item.intro, art)
                    text = text + '<p>' + item.intro + '</p>'

                if item.body is not None:
                    item.body = item.body.replace('\n',u'</p><p>')
                    item.body = change_image(item.ID, item.body, art)
                    text = text + '<p>' + item.body + '</p>'

                if item.title is not None:
                    item.title = item.title.replace('\n\n',u'')
                    item.title = change_image(item.ID, item.title, art, only_main=True, show=True)
                    art.language.title = item.title

                fw.append(art.dentomainimage)
                art.language.text = text
                art.visits = item.displayCount
                if item.added:
                    art.date = item.added

                art.category = cat
                art.save()
                art.language.save()
                art.sites.add(site.site)
                if item.active:
                    art.active.add(site.site)
                time.sleep(0.2)

    data.update({ 'data': fw })
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