# -*- coding: utf-8 -*-

from django.db import models
from datetime import datetime

class ImpModel(models.Model):
    using = 'dento'
    ID = models.AutoField(primary_key=True, db_column='ID')
    parentID = models.IntegerField()
    linkID = models.IntegerField()
    title = models.TextField()
    intro = models.TextField()
    body = models.TextField()
    added = models.DateTimeField()
    news = models.CharField(max_length=15)
    active = models.BooleanField()
    displayCount = models.IntegerField()
    imageMainID = models.IntegerField()

    class Meta:
        db_table = 'data'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.title)

class ImpArtImage(models.Model):
    ID = models.AutoField(primary_key=True, db_column='ID')
    dataID = models.IntegerField()
    pictureNumber = models.IntegerField()
    picturePath = models.CharField(max_length=255)
    pictureAlign = models.CharField(max_length=122,choices=(('left','left'),('right','right'),('top','top'),('bottom','bottom'),))

    class Meta:
        db_table = 'datapictures'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.title)

class ImpCat(models.Model):
    using = 'dento'
    idStr = models.AutoField(primary_key=True, db_column='idStr')
    idOver = models.IntegerField()
    name = models.CharField(max_length=122)
    ZmianaNa = models.IntegerField()
    orderStr = models.IntegerField()
    actionID = models.IntegerField()
    bannersType = models.CharField(max_length=3)
    bannersHere = models.CharField(max_length=122,choices=(('0','0'),('1','1'),))
    pollID = models.IntegerField()
    pollPosition = models.CharField(max_length=122,choices=(('L','L'),('R','R'),))
    hintID = models.IntegerField()
    hintPosition = models.CharField(max_length=122,choices=(('L','L'),('R','R'),))
    freeAccess = models.CharField(max_length=122,choices=(('0','0'),('1','1'),))
    isEzin = models.CharField(max_length=122,choices=(('0','0'),('1','1'),))
    display = models.CharField(max_length=122,choices=(('0','0'),('1','1'),))
    altSys = models.IntegerField()
    altName = models.CharField(max_length=50)

    class Meta:
        db_table = 'systemStructure'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

class ImpEventType(models.Model):
    using = 'dento'
    schedule_typeID = models.AutoField(primary_key=True, db_column='schedule_typeID')
    name = models.TextField()

    class Meta:
        db_table = 'schedule_type'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.name)

class ImpEvent(models.Model):
    using = 'dento'
    schID = models.AutoField(primary_key=True, db_column='schID')
    year = models.IntegerField()
    month = models.IntegerField()
    day = models.IntegerField()
    description = models.TextField()
    countrydistinctsID = models.IntegerField()
    schedule_typeID = models.IntegerField()
    bannerLink = models.CharField(max_length=100)
    infoLink = models.CharField(max_length=255)
    support = models.CharField(max_length=122,choices=(('0','0'),('1','1'),('2','2'),('3','3'),('4','4'),))
    backgroundColor = models.CharField(max_length=10)
    borderColor = models.CharField(max_length=10)
    borderWidth = models.IntegerField()
    title = models.CharField(max_length=128)
    promotor = models.CharField(max_length=128)
    formMail = models.CharField(max_length=32)
    profesor = models.CharField(max_length=128)
    city = models.CharField(max_length=32)
    date = models.CharField(max_length=64)
    ord = models.IntegerField()

    class Meta:
        db_table = 'schedule'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.description)

class ImpEventSpecial(models.Model):
    using = 'dento'
    specID = models.AutoField(primary_key=True, db_column='specID')
    desc = models.TextField()
    date = models.DateField()
    schID = models.IntegerField()

    class Meta:
        db_table = 'schedule_special'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.desc)

# repetitio

class ImpRepAns(models.Model):
    using = 'dento'
    ID = models.AutoField(primary_key=True, db_column='ID')
    rep_ID = models.IntegerField()
    quizID = models.IntegerField()
    answer_nr = models.IntegerField()
    answer = models.TextField()

    class Meta:
        db_table = 'repetitioAnswers'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.answer)

class ImpRep(models.Model):
    using = 'dento'
    queryID = models.AutoField(primary_key=True, db_column='queryID')
    rep_ID = models.IntegerField()
    query = models.TextField()
    correctAnswer = models.IntegerField()

    class Meta:
        db_table = 'repetitio'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.query)

class ImpRepCourse1(models.Model):
    using = 'dento'
    rep_ID = models.AutoField(primary_key=True, db_column='rep_ID')
    rep_name = models.CharField(max_length=128)
    rep_short = models.CharField(max_length=16)
    rep_author = models.CharField(max_length=64)
    rep_start = models.DateTimeField()
    rep_end = models.DateTimeField()
    rep_dentons = models.IntegerField()
    isDentonBuy = models.CharField(max_length=122,choices=(('0','0'),('1','1'),))
    presentationPath = models.CharField(max_length=32)
    extraBanner = models.CharField(max_length=128)
    isSponsored = models.CharField(max_length=122,choices=(('0','0'),('1','1'),))

    class Meta:
        db_table = 'repetitioIssues'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.rep_name)

class ImpRepCourse2(models.Model):
    using = 'dento'
    rep_ID = models.AutoField(primary_key=True, db_column='rep_ID')
    rep_name = models.CharField(max_length=128)
    rep_short = models.CharField(max_length=16)
    is_active = models.IntegerField()

    class Meta:
        db_table = 'repetitioEdentico'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.rep_name)
