# -*- coding: utf-8 -*-

from core.models import PermisionGroup

def ranged_pages(pages, current, dist, border):
	""" Zwraca fragment listy /pages/ zawężoną do /dist/ wokół /current/
	oraz oddalone o /border/ od początku i końca listy """
	bounce = 0
	if bounce:
	    bounce_left = pages.index(current)-dist
	    bounce_right = len(pages)-pages.index(current)-1-dist
	    if bounce_left < 0:
	        dist += abs(bounce_left)
	    if bounce_right < 0:
	        dist += abs(bounce_right)
	return map(lambda x: [None,x][(x > current-dist-1) &
	    (x < current+dist+1) | (pages.index(x) < border) |
	    (pages.index(x) > len(pages)-border-1)],
	    filter(lambda x: (x > current-dist-1) &
	    (x < current+dist+1) | (pages.index(x) < border+1) |
	    (pages.index(x) > len(pages)-border-2), pages))







""" ---------------------------------------- """
class Perm():

    def __init__(self, *args, **kwargs):
        self.cccc()

    def cccc(self):
        rgu = []
        rga = []
        rpgu = PermisionGroup.objects.get(id=1)
        rpga = PermisionGroup.objects.get(id=2)

        rga.append(self.cpg(u'Kategorie', 0, 1, 1, 1, 1, 0, 1,rpga, 'Category'))
        rga.append(self.cpg(u'Artykuły', 0, 1, 1, 1, 1, 0 , 1,rpga, 'Article'))
        rga.append(self.cpg(u'Użytkownicy', 0, 1, 1, 1, 1, 0, 1,rpga, 'UserProfile'))
        rga.append(self.cpg(u'Wiki', 0, 1, 1, 1, 1, 0, 1,rpga, 'Wiki'))
        rga.append(self.cpg(u'Strony', 0, 1, 1, 1, 1, 0, 1,rpga, 'SitePortal'))
        rga.append(self.cpg(u'Szablony', 0, 1, 1, 1, 1, 0, 1,rpga, 'Sheet'))
        rga.append(self.cpg(u'Pliki Szablonów', 0, 1, 1, 1, 1, 0, 1,rpga, 'SheetFile'))
        rga.append(self.cpg(u'Kursy', 0, 1, 1, 1, 1, 0 , 1,rpga, 'RepetitioCourse'))
        rga.append(self.cpg(u'Testy', 0, 1, 1, 1, 1, 0 , 1,rpga, 'RepetitioTest'))
        rga.append(self.cpg(u'Pytania', 0, 1, 1, 1, 1, 0 , 1,rpga, 'RepetitioQuestion'))
        rga.append(self.cpg(u'Moduły', 0, 1, 1, 1, 1, 0 , 1,rpga, 'RegisteredModule'))
        rga.append(self.cpg(u'Pozycje modułów', 0, 1, 1, 1, 1, 0 , 1,rpga, 'ModulePosition'))
        rga.append(self.cpg(u'Elementy menu', 0, 1, 1, 1, 1, 0 , 1,rpga, 'MenuItem'))
        rga.append(self.cpg(u'Menu', 0, 1, 1, 1, 1, 0 , 1,rpga, 'Menu'))
        rga.append(self.cpg(u'MegaMenu', 0, 1, 1, 1, 1, 0 , 1,rpga, 'MegaMenu'))
        rga.append(self.cpg(u'Zdjęcia', 0, 1, 1, 1, 1, 0 , 1,rpga, 'Image'))
        rga.append(self.cpg(u'Galerie', 0, 1, 1, 1, 1, 0 , 1,rpga, 'Gallery'))
        rga.append(self.cpg(u'Elementy katalogu', 0, 1, 1, 1, 1, 0 , 1,rpga, 'CatalogItem'))
        rga.append(self.cpg(u'Kategorie katalogu', 0, 1, 1, 1, 1, 0 , 1,rpga, 'CatalogCategory'))
        rga.append(self.cpg(u'Zdjęcia katalogu', 0, 1, 1, 1, 1, 0 , 1,rpga, 'CatalogImage'))
        rga.append(self.cpg(u'Kalendarze', 0, 1, 1, 1, 1, 0 , 1,rpga, 'Calendar'))
        rga.append(self.cpg(u'Wydarzenia', 0, 1, 1, 1, 1, 0 , 1,rpga, 'CalendarEvent'))
        rga.append(self.cpg(u'Typy wydarzeń', 0, 1, 1, 1, 1, 0 , 1,rpga, 'CalendarEventType'))
        rga.append(self.cpg(u'Kategorie ogłoszeń', 0, 1, 1, 1, 1, 0 , 1,rpga, 'AdCategory'))
        rga.append(self.cpg(u'Ogłoszenia', 0, 1, 1, 1, 1, 0 , 1,rpga, 'Ad'))
        rga.append(self.cpg(u'Zdjęcia ogłoszeń', 0, 1, 1, 1, 1, 0 , 1,rpga, 'AdImage'))
        rga.append(self.cpg(u'Grupy reklam', 0, 1, 1, 1, 1, 0 , 1,rpga, 'AdvGroup'))
        rga.append(self.cpg(u'Reklamy', 0, 1, 1, 1, 1, 0 , 1,rpga, 'Adv'))
        rga.append(self.cpg(u'Reklamy - klienci', 0, 1, 1, 1, 1, 0 , 1,rpga, 'AdvClient'))

        rgu.append(self.cpg(u'Kategorie', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'Category'))
        rgu.append(self.cpg(u'Artykuły', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'Article'))
        rgu.append(self.cpg(u'Użytkownicy', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'UserProfile'))
        rgu.append(self.cpg(u'Wiki', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'Wiki'))
        rgu.append(self.cpg(u'Strony', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'SitePortal'))
        rgu.append(self.cpg(u'Szablony', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'Sheet'))
        rgu.append(self.cpg(u'Pliki Szablonów', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'SheetFile'))
        rgu.append(self.cpg(u'Kursy', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'RepetitioCourse'))
        rgu.append(self.cpg(u'Testy', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'RepetitioTest'))
        rgu.append(self.cpg(u'Pytania', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'RepetitioQuestion'))
        rgu.append(self.cpg(u'Odpowiedzi', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'RepetitioAnswer'))
        rgu.append(self.cpg(u'Moduły', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'RegisteredModule'))
        rgu.append(self.cpg(u'Pozycje modułów', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'ModulePosition'))
        rgu.append(self.cpg(u'Elementy menu', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'MenuItem'))
        rgu.append(self.cpg(u'Menu', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'Menu'))
        rgu.append(self.cpg(u'MegaMenu', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'MegaMenu'))
        rgu.append(self.cpg(u'Zdjęcia', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'Image'))
        rgu.append(self.cpg(u'Galerie', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'Gallery'))
        rgu.append(self.cpg(u'Elementy katalogu', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'CatalogItem'))
        rgu.append(self.cpg(u'Kategorie katalogu', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'CatalogCategory'))
        rgu.append(self.cpg(u'Zdjęcia katalogu', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'CatalogImage'))
        rgu.append(self.cpg(u'Kalendarze', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'Calendar'))
        rgu.append(self.cpg(u'Wydarzenia', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'CalendarEvent'))
        rgu.append(self.cpg(u'Typy wydarzeń', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'CalendarEventType'))
        rgu.append(self.cpg(u'Kategorie ogłoszeń', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'AdCategory'))
        rgu.append(self.cpg(u'Ogłoszenia', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'Ad'))
        rgu.append(self.cpg(u'Zdjęcia ogłoszeń', 1, 1, 0, 0, 0, 0 , 0,rpgu, 'AdImage'))
        rgu.append(self.cpg(u'Grupy reklam', 0, 1, 1, 1, 1, 0 , 0,rpgu, 'AdvGroup'))
        rgu.append(self.cpg(u'Reklamy', 0, 1, 1, 1, 1, 0 , 0,rpgu, 'Adv'))
        rgu.append(self.cpg(u'Reklamy - klienci', 0, 1, 1, 1, 1, 0 , 0,rpgu, 'AdvClient'))

        for a in rgu:
            self.cfu(a)

        for a in rga:
            self.cfa(a)

    def cfu(self, rg):
        self.cpg(u'Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, 0, rg, subname=True)
        self.cpg(u'Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, 1, rg, subname=True)
        self.cpg(u'Użytkownik - Dodawanie', 1, 0, 0, 1, 0, 0, 1, rg, subname=True)
        self.cpg(u'Użytkownik - Kasowanie', 1, 0, 0, 0, 1, 0, 1, rg, subname=True)
        self.cpg(u'Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, 1, rg, subname=True)
        self.cpg(u'Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, 1, rg, subname=True)

    def cfa(self, rg):
        self.cpg(u'Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, 1, rg, subname=True)
        self.cpg(u'Admin - Edycja', 0, 0, 1, 0, 0, 0, 1, rg, subname=True)
        self.cpg(u'Admin - Dodawanie', 0, 0, 0, 1, 0, 0, 1, rg, subname=True)
        self.cpg(u'Admin - Kasowanie', 0, 0, 0, 0, 1, 0, 1, rg, subname=True)
        self.cpg(u'Admin - Tylko własne', 0, 0, 0, 0, 0, 1, 1, rg, subname=True)
        self.cpg(u'Admin - Zalogowany', 0, 0, 0, 0, 0, 1, 1, rg, subname=True)

    def cpg(self, name, p, r, w, a, d, o, l, group, model=None, subname=False):
        a1 = PermisionGroup()
        if subname is True:
            a1.name = group.name + u': ' + name
            print group.name + u': ' + name
        else:
            a1.name = name
        a1.public = p
        a1.read = r
        a1.write = w
        a1.add = a
        a1.delete = d
        a1.own_only = o
        a1.login = l
        a1.parent = group
        a1.model = model
        a1.save()
        return a1


"""

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE `permission_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `write` tinyint(1) NOT NULL,
  `delete` tinyint(1) NOT NULL,
  `add` tinyint(1) NOT NULL,
  `own_only` tinyint(1) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_groups_63f17a16` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

INSERT INTO `permission_groups` VALUES(1, 'User', 1, 1, 0, 0, 0, 0, '', NULL);
INSERT INTO `permission_groups` VALUES(2, 'Admin', 0, 1, 1, 1, 1, 0, '', NULL);


ALTER TABLE `permission_groups`
  ADD CONSTRAINT `parent_id_refs_id_cb284e13` FOREIGN KEY (`parent_id`) REFERENCES `permission_groups` (`id`);
SET FOREIGN_KEY_CHECKS=1;

"""
