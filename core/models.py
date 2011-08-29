# -*- coding: utf-8 -*-

import os, imp

from django.conf import settings
from django.db import models
from django.contrib.sites.models import Site
from core.model.others import StateModel, CountryModel, SexModel
from core.model.category import CategoryModel, CategoryLanguageModel
from core.model.article import ArticleModel, ArticleLanguageModel
from core.model.image import ImageModel, ImageLanguageModel
from core.model.gallery import GalleryModel, GalleryLanguageModel
from core.model.language import LanguageModel, PortalSiteConstLanguageModel
from core.model.sheet import SheetModel, SheetFilesModel
from core.model.calendarium import *
from core.model.users import ProfileModel, ProfileDataModel, ProfileGroupModel, ProfilePermissionModel
from core.model.forum import *
from core.model.repetitio import RepetitioQuestionModel, RepetitioAnswerModel, RepetitioTestModel, RepetitioCourseModel, RepetitioTestAnswerModel, RepetitioCourseUserModel
from core.model.repetitio import RepetitioQuestionLanguageModel, RepetitioAnswerLanguageModel, RepetitioTestLanguageModel, RepetitioCourseLanguageModel
from core.model.ads import AdImageLanguageModel, AdImageModel, AdLanguageModel, AdModel, AdCategoryLanguageModel, AdCategoryModel
from core.model.wiki import WikiLanguageModel, WikiModel
from core.model.portal import SitePortalModel, SitePortalStatModel
from core.model.catalog import CatalogImageLanguageModel, CatalogImageModel, CatalogItemLanguageModel, CatalogItemModel, CatalogCategoryLanguageModel, CatalogCategoryModel
from core.model.modules.module import ModuleTypeModel, RegisteredModuleModel, ModulePositionModel
from core.model.menu import MenuItemLanguageModel, MenuItemModel, MenuModel
from core.model.megamenu import MegaMenuItemLanguageModel, MegaMenuItemModel
from core.model.modules.artykul_module import ArticleOptionsModel
from core.model.modules.article_list_module import ArticleListModuleOptionModel
from core.model.modules.menu_module import MenuOptionsModel
from core.model.permissions import PermissionGroupModel

""" Permissions
"""

class PermisionGroup(PermissionGroupModel):
    pass

""" Additional
"""

class State(StateModel):
    pass

class Country(CountryModel):
    pass

class Sex(SexModel):
    pass

""" User profile
"""
"""
class UserProfileGroup(ProfileGroupModel):
    pass
"""
class UserProfile(ProfileModel):
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)
    sites = models.ManyToManyField(Site, blank = True, null=True)

    def get_permissions(self):
        return self.permissions
"""
class UserProfilePermission(ProfilePermissionModel):
    group = models.ForeignKey(UserProfileGroup, null=True, blank=True)
    user = models.ForeignKey(UserProfile, null=True, blank=True)
"""
class UserProfileData(ProfileDataModel):
    using = 'profiles'
    profile = models.ForeignKey(UserProfile, null=True, blank=True)
    state = models.ForeignKey(State, null=True, blank=True)
    country = models.ForeignKey(Country, null=True, blank=True)
    sex = models.ForeignKey(Sex, null=True, blank=True)

""" Language
"""

class Language(LanguageModel):
    active = models.ManyToManyField(Site, related_name='lang_activ_on_site')

#class PortalBoxLanguage(PortalBoxLanguageModel):
#    language = models.ForeignKey(Language, verbose_name=u'Język')

#class PortalModuleLanguage(PortalModuleLanguageModel):
#    language = models.ForeignKey(Language, verbose_name=u'Język')

""" Language const translations
"""

class PortalSiteConstLanguage(PortalSiteConstLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Gallery
"""

class GalleryLanguage(GalleryLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class Gallery(GalleryModel):
    active = models.ManyToManyField(Site, related_name='gallery_activ_on_site')
    languages = models.ManyToManyField(GalleryLanguage)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Calendarium
"""

class CalendarLanguage(CalendarLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class CalendarEventTypeLanguage(CalendarEventTypeLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class CalendarEventLanguage(CalendarEventLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class Calendar(CalendarModel):
    active = models.ManyToManyField(Site, related_name='calendar_activ_on_site')
    languages = models.ManyToManyField(CalendarLanguage, verbose_name=u'Język')
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class CalendarEventType(CalendarEventTypeModel):
    active = models.ManyToManyField(Site, related_name='calendareventtype_activ_on_site')
    languages = models.ManyToManyField(CalendarEventTypeLanguage, verbose_name=u'Język', blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class CalendarEvent(CalendarEventModel):
    active = models.ManyToManyField(Site, related_name='calendarevent_activ_on_site')
    type = models.ForeignKey(CalendarEventType,verbose_name=u'Typ wydarzenia', blank=True, null=True)
    state = models.ForeignKey(State, null=True, blank=True)
    languages = models.ManyToManyField(CalendarEventLanguage, verbose_name=u'Język', blank=True, null=True)
    calendar = models.ForeignKey(Calendar, verbose_name=u'Kalendarz', blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Category
"""

class CategoryLanguage(CategoryLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class Category(CategoryModel):
    active = models.ManyToManyField(Site, related_name='art_activ_on_site')
    languages = models.ManyToManyField(CategoryLanguage)
    galleries = models.ManyToManyField(Gallery, blank = True, null=True, related_name='cat_gal')
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Article
"""

class ArticleLanguage(ArticleLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class Article(ArticleModel):
    active = models.ManyToManyField(Site, related_name='activ_on_site')
    category = models.ForeignKey(Category, blank = True, null=True)
    languages = models.ManyToManyField(ArticleLanguage)
    gallery = models.ForeignKey(Gallery, blank = True, null=True, related_name='art_gal')
    event = models.ForeignKey(CalendarEvent, blank = True, null=True, related_name='art_evnt')
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Sheet
"""

class Sheet(SheetModel):
    active = models.ManyToManyField(Site, related_name='sheet_on_site')
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class SheetFiles(SheetFilesModel):
    sheet = models.ForeignKey(Sheet, verbose_name=u'Szablon',blank = True, null=True)
    active = models.ManyToManyField(Site, related_name='sheetfile_on_site')

""" Images
"""

class ImageLanguage(ImageLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class Image(ImageModel):
    active = models.ManyToManyField(Site, related_name='image_activ_on_site', blank = True, null=True)
    gallery = models.ForeignKey(Gallery, verbose_name=u'Galeria', blank = True, null=True, related_name='image_gallery')
    languages = models.ManyToManyField(ImageLanguage)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Repetitio
"""

class RepetitioCourseLanguage(RepetitioCourseLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class RepetitioCourse(RepetitioCourseModel):
    active = models.ManyToManyField(Site, related_name='repc_activ_on_site', blank = True, null=True)
    languages = models.ManyToManyField(RepetitioCourseLanguage, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class RepetitioTestLanguage(RepetitioTestLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class RepetitioTest(RepetitioTestModel):
    active = models.ManyToManyField(Site, related_name='rept_activ_on_site', blank = True, null=True)
    languages = models.ManyToManyField(RepetitioTestLanguage, blank=True, null=True)
    course = models.ForeignKey(RepetitioCourse, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class RepetitioQuestionLanguage(RepetitioQuestionLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class RepetitioQuestion(RepetitioQuestionModel):
    test = models.ForeignKey(RepetitioTest, verbose_name=u'Test', blank=True, null=True)
    active = models.ManyToManyField(Site, related_name='repq_activ_on_site', blank = True, null=True)
    languages = models.ManyToManyField(RepetitioQuestionLanguage, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class RepetitioAnswerLanguage(RepetitioAnswerLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class RepetitioAnswer(RepetitioAnswerModel):
    question = models.ForeignKey(RepetitioQuestion, verbose_name=u'Pytanie', blank=True, null=True)
    languages = models.ManyToManyField(RepetitioAnswerLanguage, blank=True, null=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class RepetitioTestAnswer(RepetitioTestAnswerModel):
    user = models.ForeignKey(UserProfile, null=True, blank=True)
    question = models.ForeignKey(RepetitioQuestion, verbose_name=u'Pytanie', blank=True, null=True)
    answer = models.ForeignKey(RepetitioAnswer, verbose_name=u'Odpowiedź', blank=True, null=True)
    test = models.ForeignKey(RepetitioTest, verbose_name=u'Odpowiedź', blank=True, null=True)

class RepetitioCourseUser(RepetitioCourseUserModel):
    user = models.ForeignKey(UserProfile, null=True, blank=True)
    course = models.ForeignKey(RepetitioCourse, blank=True, null=True)

""" Ads
"""

class AdImageLanguage(AdImageLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class AdImage(AdImageModel):
    active = models.ManyToManyField(Site, related_name='ad_image_activ_on_site')
    languages = models.ManyToManyField(AdImageLanguage, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class AdCategoryLanguage(AdCategoryLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class AdCategory(AdCategoryModel):
    active = models.ManyToManyField(Site, related_name='ad_cat_activ_on_site')
    languages = models.ManyToManyField(AdCategoryLanguage, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class AdLanguage(AdLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class Ad(AdModel):
    active = models.ManyToManyField(Site, related_name='ad_activ_on_site')
    languages = models.ManyToManyField(AdLanguage, blank=True, null=True)
    images = models.ManyToManyField(AdImage, blank=True, null=True)
    category = models.ForeignKey(AdCategory, verbose_name=u'Kategoria', blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Wiki
"""

class WikiLanguage(WikiLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class Wiki(WikiModel):
    active = models.ManyToManyField(Site, related_name='wiki_activ_on_site')
    languages = models.ManyToManyField(WikiLanguage, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Portal
"""

class SitePortal(SitePortalModel):
    active = models.ManyToManyField(Site, related_name='siteactives')
    site = models.ForeignKey(Site, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class SitePortalStat(SitePortalStatModel):
    site = models.ForeignKey(Site, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Catalog
"""

class CatalogImageLanguage(CatalogImageLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class CatalogImage(CatalogImageModel):
    active = models.ManyToManyField(Site, related_name='cat_image_activ_on_site')
    languages = models.ManyToManyField(AdImageLanguage, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class CatalogCategoryLanguage(CatalogCategoryLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class CatalogCategory(CatalogCategoryModel):
    active = models.ManyToManyField(Site, related_name='cat_cat_activ_on_site')
    languages = models.ManyToManyField(CatalogCategoryLanguage, blank=True, null=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

class CatalogItemLanguage(CatalogItemLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class CatalogItem(CatalogItemModel):
    active = models.ManyToManyField(Site, related_name='cat_activ_on_site')
    languages = models.ManyToManyField(CatalogItemLanguage, blank=True, null=True)
    images = models.ManyToManyField(CatalogImage, blank=True, null=True)
    category = models.ForeignKey(CatalogCategory, verbose_name=u'Kategoria', blank=True, null=True)
    state = models.ForeignKey(State, null=True, blank=True)
    country = models.ForeignKey(Country, null=True, blank=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Modules
"""

class ModulePosition(ModulePositionModel):
    active = models.ManyToManyField(Site, related_name='mod_pos_activ')
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

"""
class ModuleOption(ModuleOptionModel):
    active = models.ManyToManyField(Site, related_name='mod_opt_activ')
    position = models.ForeignKey(ModulePosition, null=True, blank=True)
"""
class ModuleType(ModuleTypeModel):
    active = models.ManyToManyField(Site, related_name='mod_type_activ')

class RegisteredModule(RegisteredModuleModel):
    active = models.ManyToManyField(Site, related_name='mod_reg_activ')
    type = models.ForeignKey(ModuleType, null=True, blank=True)
    position = models.ForeignKey(ModulePosition, null=True, blank=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Menu
"""

class Menu(MenuModel):
    active = models.ManyToManyField(Site, related_name='menu_activ')
    module = models.ForeignKey(RegisteredModule, null=True, blank=True, related_name='menu_module')
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

    def get_language(self,language_id):
        pass

class MenuItemLanguage(MenuItemLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class MenuItem(MenuItemModel):
    active = models.ManyToManyField(Site, related_name='menuitem_activ')
    languages = models.ManyToManyField(MenuItemLanguage, blank=True, null=True)
    module = models.ForeignKey(RegisteredModule, null=True, blank=True)
    menu = models.ForeignKey(Menu, null=True, blank=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Mega Menu
"""
class MegaMenuLanguage(MegaMenuItemLanguageModel):
    language = models.ForeignKey(Language, verbose_name=u'Język')

class MegaMenu(MegaMenuItemModel):
    active = models.ManyToManyField(Site, related_name='megamenu_activ')
    languages = models.ManyToManyField(MegaMenuLanguage, blank=True, null=True)
    module = models.ForeignKey(RegisteredModule, null=True, blank=True)
    menu = models.ForeignKey(Menu, null=True, blank=True)
    category = models.ForeignKey(Category, null=True, blank=True)
    adv_id = models.CharField(verbose_name=u'Reklama (w przygotowaniu)', max_length=255, null=True, blank=True)
    owner = models.ForeignKey(UserProfile, null=True, blank=True)
    permissions = models.ManyToManyField(PermisionGroup, null=True, blank=True)

    def get_permissions(self):
        return self.permissions

""" Specific modules
"""

class ArticleModuleOption(ArticleOptionsModel):
    menuitem = models.ForeignKey(MenuItem, null=True, blank=True)
    article = models.ForeignKey(Article, null=True, blank=True)
    module = models.ForeignKey(RegisteredModule, null=True, blank=True, related_name='art_module')

    def get_slug(self, language_id):
        if self.article is not None:
            self.article.get_language(language_id)
            return "%s" % self.article.language.slug
        else:
            return None

    def get_url_prefix(self):
        return 'cms/article'

    def get_object_id(self):
        if self.article is not None:
            return self.article.id
        else:
            return 0

class ArticleListModuleOption(ArticleListModuleOptionModel):
    menuitem = models.ForeignKey(MenuItem, null=True, blank=True)
    category = models.ForeignKey(Category, null=True, blank=True)
    module = models.ForeignKey(RegisteredModule, null=True, blank=True, related_name='art_list_module')

    def get_slug(self, language_id):
        if self.category is not None:
            self.category.get_language(language_id)
            return "%s" % self.category.language.slug
        else:
            return None

    def get_url_prefix(self):
        return 'cms/category/list'

    def get_object_id(self):
        if self.category is not None:
            return self.category.id
        else:
            return 0


class MenuModuleOption(MenuOptionsModel):
    #menuitem = models.ForeignKey(MenuItem, null=True, blank=True)
    menu = models.ForeignKey(Menu, null=True, blank=True)
    module = models.ForeignKey(RegisteredModule, null=True, blank=True)


def get_module_options_model(moduleId):
    try:
        module = RegisteredModule.objects.get(id=moduleId)
    except Exception, e:
        self.debugger.catch_error('get_module_options_model: ', e)
        return None

    #return getattr(models, module.type.options_modelname)
    cl = eval(module.type.options_modelname)
    return cl()


""" Visibility
"""

class ModuleVisibility(BaseModel):
    menuitem = models.ManyToManyField(MenuItem, related_name='menu_vis')
    model = models.ForeignKey(RegisteredModule, null=True, blank=True)

    class Meta:
        db_table = 'module_visibility'

    def __unicode__(self):
        return "ModuleVisibility"


if settings.ENABLEDAFAULTADMIN:
    from django.contrib import admin
    admin.site.register(UserProfile)
    admin.site.register(State)
    admin.site.register(Category)
    admin.site.register(CategoryLanguage)
    admin.site.register(Language)
    admin.site.register(PortalSiteConstLanguage)
    admin.site.register(Sheet)
    admin.site.register(SheetFiles)
    admin.site.register(Article)
    admin.site.register(ArticleLanguage)
    admin.site.register(Image)
    admin.site.register(ImageLanguage)
    admin.site.register(Gallery)
    admin.site.register(GalleryLanguage)
    admin.site.register(Calendar)
    admin.site.register(CalendarEventType)
    admin.site.register(CalendarEvent)
    admin.site.register(CalendarLanguage)
    admin.site.register(CalendarEventTypeLanguage)
    admin.site.register(CalendarEventLanguage)
    admin.site.register(ModulePosition)
    admin.site.register(ModuleType)
    admin.site.register(RegisteredModule)
    admin.site.register(Menu)
    admin.site.register(MenuItem)
