# -*- coding: utf-8 -*-

__FNAME__='models.py'
__MNAME__='forum' # nazwa modulu

from django.db import models
from django.conf import settings
from django.contrib.sites.models import Site

class ForumTopicModel(models.Model):
    using = 'forum'
    topic_title = models.TextField()
    topic_id = models.AutoField(primary_key=True, db_column='topic_id')
    forum_id = models.IntegerField()

    class Meta:
        db_table = 'phpbb_topics'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.topic_title)

class ForumPostModel(models.Model):
    using = 'forum'
    id = models.AutoField(primary_key=True, db_column='post_id')
    forum_id = models.IntegerField()
    topic_id = models.IntegerField()
    post_time = models.CharField(max_length="200")

    class Meta:
        db_table = 'phpbb_posts'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.post_id)

class ForumPostTextModel(models.Model):
    using = 'forum'
    post_text = models.TextField(db_column='post_text')
    post_id = models.AutoField(primary_key=True, db_column='post_id')

    class Meta:
        db_table = 'phpbb_posts_text'
        abstract = True

    def __unicode__(self):
        return "%s" % (self.post_text)

