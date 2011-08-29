-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 29 Sie 2011, 11:12
-- Wersja serwera: 5.5.9
-- Wersja PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `fe_portal`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad`
--

CREATE TABLE `ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `mainimage` varchar(100) DEFAULT NULL,
  `mimage_info` varchar(255) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `bold` tinyint(1) NOT NULL,
  `distinction` tinyint(1) NOT NULL,
  `datestart` datetime NOT NULL,
  `dateend` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_42dc49bc` (`category_id`),
  KEY `ad_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ads_image_lang`
--

CREATE TABLE `ads_image_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_421cd526` (`language_id`),
  KEY `ads_image_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ads_image_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_active`
--

CREATE TABLE `ad_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`site_id`),
  KEY `ad_active_51c59e2f` (`ad_id`),
  KEY `ad_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_cat`
--

CREATE TABLE `ad_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `noedit` tinyint(1) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_cat_63f17a16` (`parent_id`),
  KEY `ad_cat_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_cat`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_cat_active`
--

CREATE TABLE `ad_cat_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adcategory_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adcategory_id` (`adcategory_id`,`site_id`),
  KEY `ad_cat_active_92cd3a0d` (`adcategory_id`),
  KEY `ad_cat_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_cat_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_cat_lang`
--

CREATE TABLE `ad_cat_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_b0d7340d` (`language_id`),
  KEY `ad_cat_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_cat_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_cat_languages`
--

CREATE TABLE `ad_cat_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adcategory_id` int(11) NOT NULL,
  `adcategorylanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adcategory_id` (`adcategory_id`,`adcategorylanguage_id`),
  KEY `ad_cat_languages_92cd3a0d` (`adcategory_id`),
  KEY `ad_cat_languages_42ce22b7` (`adcategorylanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_cat_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_cat_permissions`
--

CREATE TABLE `ad_cat_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adcategory_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adcategory_id` (`adcategory_id`,`permisiongroup_id`),
  KEY `ad_cat_permissions_92cd3a0d` (`adcategory_id`),
  KEY `ad_cat_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_cat_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_cat_sites`
--

CREATE TABLE `ad_cat_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adcategory_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adcategory_id` (`adcategory_id`,`site_id`),
  KEY `ad_cat_sites_92cd3a0d` (`adcategory_id`),
  KEY `ad_cat_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_cat_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_image`
--

CREATE TABLE `ad_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_image_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_image`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_images`
--

CREATE TABLE `ad_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `adimage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`adimage_id`),
  KEY `ad_images_51c59e2f` (`ad_id`),
  KEY `ad_images_650c9089` (`adimage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_images`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_image_active`
--

CREATE TABLE `ad_image_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adimage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adimage_id` (`adimage_id`,`site_id`),
  KEY `ad_image_active_650c9089` (`adimage_id`),
  KEY `ad_image_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_image_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_image_languages`
--

CREATE TABLE `ad_image_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adimage_id` int(11) NOT NULL,
  `adimagelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adimage_id` (`adimage_id`,`adimagelanguage_id`),
  KEY `ad_image_languages_650c9089` (`adimage_id`),
  KEY `ad_image_languages_5ed0d2f7` (`adimagelanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_image_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_image_permissions`
--

CREATE TABLE `ad_image_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adimage_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adimage_id` (`adimage_id`,`permisiongroup_id`),
  KEY `ad_image_permissions_650c9089` (`adimage_id`),
  KEY `ad_image_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_image_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_image_sites`
--

CREATE TABLE `ad_image_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adimage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adimage_id` (`adimage_id`,`site_id`),
  KEY `ad_image_sites_650c9089` (`adimage_id`),
  KEY `ad_image_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_image_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_lang`
--

CREATE TABLE `ad_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_b1feb076` (`language_id`),
  KEY `ad_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_languages`
--

CREATE TABLE `ad_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `adlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`adlanguage_id`),
  KEY `ad_languages_51c59e2f` (`ad_id`),
  KEY `ad_languages_768202bb` (`adlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_permissions`
--

CREATE TABLE `ad_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`permisiongroup_id`),
  KEY `ad_permissions_51c59e2f` (`ad_id`),
  KEY `ad_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ad_sites`
--

CREATE TABLE `ad_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`site_id`),
  KEY `ad_sites_51c59e2f` (`ad_id`),
  KEY `ad_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `ad_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `articlelanguages`
--

CREATE TABLE `articlelanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext,
  `text` longtext,
  `foot` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_fc54b360` (`language_id`),
  KEY `articlelanguages_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `articlelanguages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `mainimage` varchar(100) DEFAULT NULL,
  `mimage_info` varchar(255) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_42dc49bc` (`category_id`),
  KEY `articles_cb7c733d` (`gallery_id`),
  KEY `articles_e9b82f95` (`event_id`),
  KEY `articles_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `articles`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `articles_active`
--

CREATE TABLE `articles_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`site_id`),
  KEY `articles_active_30525a19` (`article_id`),
  KEY `articles_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `articles_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `articles_languages`
--

CREATE TABLE `articles_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `articlelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`articlelanguage_id`),
  KEY `articles_languages_30525a19` (`article_id`),
  KEY `articles_languages_1b93cd79` (`articlelanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `articles_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `articles_permissions`
--

CREATE TABLE `articles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`permisiongroup_id`),
  KEY `articles_permissions_30525a19` (`article_id`),
  KEY `articles_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `articles_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `articles_sites`
--

CREATE TABLE `articles_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`site_id`),
  KEY `articles_sites_30525a19` (`article_id`),
  KEY `articles_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `articles_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `auth_group`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `auth_message`
--

CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_fbfc09f1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `auth_message`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=220 ;

--
-- Zrzut danych tabeli `auth_permission`
--

INSERT INTO `auth_permission` VALUES(1, 'Can add kv store', 1, 'add_kvstore');
INSERT INTO `auth_permission` VALUES(2, 'Can change kv store', 1, 'change_kvstore');
INSERT INTO `auth_permission` VALUES(3, 'Can delete kv store', 1, 'delete_kvstore');
INSERT INTO `auth_permission` VALUES(4, 'Can add Tag', 2, 'add_tag');
INSERT INTO `auth_permission` VALUES(5, 'Can change Tag', 2, 'change_tag');
INSERT INTO `auth_permission` VALUES(6, 'Can delete Tag', 2, 'delete_tag');
INSERT INTO `auth_permission` VALUES(7, 'Can add Tagged Item', 3, 'add_taggeditem');
INSERT INTO `auth_permission` VALUES(8, 'Can change Tagged Item', 3, 'change_taggeditem');
INSERT INTO `auth_permission` VALUES(9, 'Can delete Tagged Item', 3, 'delete_taggeditem');
INSERT INTO `auth_permission` VALUES(10, 'Can add permission', 4, 'add_permission');
INSERT INTO `auth_permission` VALUES(11, 'Can change permission', 4, 'change_permission');
INSERT INTO `auth_permission` VALUES(12, 'Can delete permission', 4, 'delete_permission');
INSERT INTO `auth_permission` VALUES(13, 'Can add group', 5, 'add_group');
INSERT INTO `auth_permission` VALUES(14, 'Can change group', 5, 'change_group');
INSERT INTO `auth_permission` VALUES(15, 'Can delete group', 5, 'delete_group');
INSERT INTO `auth_permission` VALUES(16, 'Can add user', 6, 'add_user');
INSERT INTO `auth_permission` VALUES(17, 'Can change user', 6, 'change_user');
INSERT INTO `auth_permission` VALUES(18, 'Can delete user', 6, 'delete_user');
INSERT INTO `auth_permission` VALUES(19, 'Can add message', 7, 'add_message');
INSERT INTO `auth_permission` VALUES(20, 'Can change message', 7, 'change_message');
INSERT INTO `auth_permission` VALUES(21, 'Can delete message', 7, 'delete_message');
INSERT INTO `auth_permission` VALUES(22, 'Can add content type', 8, 'add_contenttype');
INSERT INTO `auth_permission` VALUES(23, 'Can change content type', 8, 'change_contenttype');
INSERT INTO `auth_permission` VALUES(24, 'Can delete content type', 8, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES(25, 'Can add session', 9, 'add_session');
INSERT INTO `auth_permission` VALUES(26, 'Can change session', 9, 'change_session');
INSERT INTO `auth_permission` VALUES(27, 'Can delete session', 9, 'delete_session');
INSERT INTO `auth_permission` VALUES(28, 'Can add site', 10, 'add_site');
INSERT INTO `auth_permission` VALUES(29, 'Can change site', 10, 'change_site');
INSERT INTO `auth_permission` VALUES(30, 'Can delete site', 10, 'delete_site');
INSERT INTO `auth_permission` VALUES(31, 'Can add log entry', 11, 'add_logentry');
INSERT INTO `auth_permission` VALUES(32, 'Can change log entry', 11, 'change_logentry');
INSERT INTO `auth_permission` VALUES(33, 'Can delete log entry', 11, 'delete_logentry');
INSERT INTO `auth_permission` VALUES(34, 'Can add permision group', 12, 'add_permisiongroup');
INSERT INTO `auth_permission` VALUES(35, 'Can change permision group', 12, 'change_permisiongroup');
INSERT INTO `auth_permission` VALUES(36, 'Can delete permision group', 12, 'delete_permisiongroup');
INSERT INTO `auth_permission` VALUES(37, 'Can add state', 13, 'add_state');
INSERT INTO `auth_permission` VALUES(38, 'Can change state', 13, 'change_state');
INSERT INTO `auth_permission` VALUES(39, 'Can delete state', 13, 'delete_state');
INSERT INTO `auth_permission` VALUES(40, 'Can add country', 14, 'add_country');
INSERT INTO `auth_permission` VALUES(41, 'Can change country', 14, 'change_country');
INSERT INTO `auth_permission` VALUES(42, 'Can delete country', 14, 'delete_country');
INSERT INTO `auth_permission` VALUES(43, 'Can add sex', 15, 'add_sex');
INSERT INTO `auth_permission` VALUES(44, 'Can change sex', 15, 'change_sex');
INSERT INTO `auth_permission` VALUES(45, 'Can delete sex', 15, 'delete_sex');
INSERT INTO `auth_permission` VALUES(46, 'Can add user profile', 16, 'add_userprofile');
INSERT INTO `auth_permission` VALUES(47, 'Can change user profile', 16, 'change_userprofile');
INSERT INTO `auth_permission` VALUES(48, 'Can delete user profile', 16, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES(49, 'Can add user profile data', 17, 'add_userprofiledata');
INSERT INTO `auth_permission` VALUES(50, 'Can change user profile data', 17, 'change_userprofiledata');
INSERT INTO `auth_permission` VALUES(51, 'Can delete user profile data', 17, 'delete_userprofiledata');
INSERT INTO `auth_permission` VALUES(52, 'Can add language', 18, 'add_language');
INSERT INTO `auth_permission` VALUES(53, 'Can change language', 18, 'change_language');
INSERT INTO `auth_permission` VALUES(54, 'Can delete language', 18, 'delete_language');
INSERT INTO `auth_permission` VALUES(55, 'Can add portal site const language', 19, 'add_portalsiteconstlanguage');
INSERT INTO `auth_permission` VALUES(56, 'Can change portal site const language', 19, 'change_portalsiteconstlanguage');
INSERT INTO `auth_permission` VALUES(57, 'Can delete portal site const language', 19, 'delete_portalsiteconstlanguage');
INSERT INTO `auth_permission` VALUES(58, 'Can add gallery language', 20, 'add_gallerylanguage');
INSERT INTO `auth_permission` VALUES(59, 'Can change gallery language', 20, 'change_gallerylanguage');
INSERT INTO `auth_permission` VALUES(60, 'Can delete gallery language', 20, 'delete_gallerylanguage');
INSERT INTO `auth_permission` VALUES(61, 'Can add gallery', 21, 'add_gallery');
INSERT INTO `auth_permission` VALUES(62, 'Can change gallery', 21, 'change_gallery');
INSERT INTO `auth_permission` VALUES(63, 'Can delete gallery', 21, 'delete_gallery');
INSERT INTO `auth_permission` VALUES(64, 'Can add calendar language', 22, 'add_calendarlanguage');
INSERT INTO `auth_permission` VALUES(65, 'Can change calendar language', 22, 'change_calendarlanguage');
INSERT INTO `auth_permission` VALUES(66, 'Can delete calendar language', 22, 'delete_calendarlanguage');
INSERT INTO `auth_permission` VALUES(67, 'Can add calendar event type language', 23, 'add_calendareventtypelanguage');
INSERT INTO `auth_permission` VALUES(68, 'Can change calendar event type language', 23, 'change_calendareventtypelanguage');
INSERT INTO `auth_permission` VALUES(69, 'Can delete calendar event type language', 23, 'delete_calendareventtypelanguage');
INSERT INTO `auth_permission` VALUES(70, 'Can add calendar event language', 24, 'add_calendareventlanguage');
INSERT INTO `auth_permission` VALUES(71, 'Can change calendar event language', 24, 'change_calendareventlanguage');
INSERT INTO `auth_permission` VALUES(72, 'Can delete calendar event language', 24, 'delete_calendareventlanguage');
INSERT INTO `auth_permission` VALUES(73, 'Can add calendar', 25, 'add_calendar');
INSERT INTO `auth_permission` VALUES(74, 'Can change calendar', 25, 'change_calendar');
INSERT INTO `auth_permission` VALUES(75, 'Can delete calendar', 25, 'delete_calendar');
INSERT INTO `auth_permission` VALUES(76, 'Can add calendar event type', 26, 'add_calendareventtype');
INSERT INTO `auth_permission` VALUES(77, 'Can change calendar event type', 26, 'change_calendareventtype');
INSERT INTO `auth_permission` VALUES(78, 'Can delete calendar event type', 26, 'delete_calendareventtype');
INSERT INTO `auth_permission` VALUES(79, 'Can add calendar event', 27, 'add_calendarevent');
INSERT INTO `auth_permission` VALUES(80, 'Can change calendar event', 27, 'change_calendarevent');
INSERT INTO `auth_permission` VALUES(81, 'Can delete calendar event', 27, 'delete_calendarevent');
INSERT INTO `auth_permission` VALUES(82, 'Can add category language', 28, 'add_categorylanguage');
INSERT INTO `auth_permission` VALUES(83, 'Can change category language', 28, 'change_categorylanguage');
INSERT INTO `auth_permission` VALUES(84, 'Can delete category language', 28, 'delete_categorylanguage');
INSERT INTO `auth_permission` VALUES(85, 'Can add category', 29, 'add_category');
INSERT INTO `auth_permission` VALUES(86, 'Can change category', 29, 'change_category');
INSERT INTO `auth_permission` VALUES(87, 'Can delete category', 29, 'delete_category');
INSERT INTO `auth_permission` VALUES(88, 'Can add article language', 30, 'add_articlelanguage');
INSERT INTO `auth_permission` VALUES(89, 'Can change article language', 30, 'change_articlelanguage');
INSERT INTO `auth_permission` VALUES(90, 'Can delete article language', 30, 'delete_articlelanguage');
INSERT INTO `auth_permission` VALUES(91, 'Can add article', 31, 'add_article');
INSERT INTO `auth_permission` VALUES(92, 'Can change article', 31, 'change_article');
INSERT INTO `auth_permission` VALUES(93, 'Can delete article', 31, 'delete_article');
INSERT INTO `auth_permission` VALUES(94, 'Can add sheet', 32, 'add_sheet');
INSERT INTO `auth_permission` VALUES(95, 'Can change sheet', 32, 'change_sheet');
INSERT INTO `auth_permission` VALUES(96, 'Can delete sheet', 32, 'delete_sheet');
INSERT INTO `auth_permission` VALUES(97, 'Can add sheet files', 33, 'add_sheetfiles');
INSERT INTO `auth_permission` VALUES(98, 'Can change sheet files', 33, 'change_sheetfiles');
INSERT INTO `auth_permission` VALUES(99, 'Can delete sheet files', 33, 'delete_sheetfiles');
INSERT INTO `auth_permission` VALUES(100, 'Can add image language', 34, 'add_imagelanguage');
INSERT INTO `auth_permission` VALUES(101, 'Can change image language', 34, 'change_imagelanguage');
INSERT INTO `auth_permission` VALUES(102, 'Can delete image language', 34, 'delete_imagelanguage');
INSERT INTO `auth_permission` VALUES(103, 'Can add image', 35, 'add_image');
INSERT INTO `auth_permission` VALUES(104, 'Can change image', 35, 'change_image');
INSERT INTO `auth_permission` VALUES(105, 'Can delete image', 35, 'delete_image');
INSERT INTO `auth_permission` VALUES(106, 'Can add repetitio course language', 36, 'add_repetitiocourselanguage');
INSERT INTO `auth_permission` VALUES(107, 'Can change repetitio course language', 36, 'change_repetitiocourselanguage');
INSERT INTO `auth_permission` VALUES(108, 'Can delete repetitio course language', 36, 'delete_repetitiocourselanguage');
INSERT INTO `auth_permission` VALUES(109, 'Can add repetitio course', 37, 'add_repetitiocourse');
INSERT INTO `auth_permission` VALUES(110, 'Can change repetitio course', 37, 'change_repetitiocourse');
INSERT INTO `auth_permission` VALUES(111, 'Can delete repetitio course', 37, 'delete_repetitiocourse');
INSERT INTO `auth_permission` VALUES(112, 'Can add repetitio test language', 38, 'add_repetitiotestlanguage');
INSERT INTO `auth_permission` VALUES(113, 'Can change repetitio test language', 38, 'change_repetitiotestlanguage');
INSERT INTO `auth_permission` VALUES(114, 'Can delete repetitio test language', 38, 'delete_repetitiotestlanguage');
INSERT INTO `auth_permission` VALUES(115, 'Can add repetitio test', 39, 'add_repetitiotest');
INSERT INTO `auth_permission` VALUES(116, 'Can change repetitio test', 39, 'change_repetitiotest');
INSERT INTO `auth_permission` VALUES(117, 'Can delete repetitio test', 39, 'delete_repetitiotest');
INSERT INTO `auth_permission` VALUES(118, 'Can add repetitio question language', 40, 'add_repetitioquestionlanguage');
INSERT INTO `auth_permission` VALUES(119, 'Can change repetitio question language', 40, 'change_repetitioquestionlanguage');
INSERT INTO `auth_permission` VALUES(120, 'Can delete repetitio question language', 40, 'delete_repetitioquestionlanguage');
INSERT INTO `auth_permission` VALUES(121, 'Can add repetitio question', 41, 'add_repetitioquestion');
INSERT INTO `auth_permission` VALUES(122, 'Can change repetitio question', 41, 'change_repetitioquestion');
INSERT INTO `auth_permission` VALUES(123, 'Can delete repetitio question', 41, 'delete_repetitioquestion');
INSERT INTO `auth_permission` VALUES(124, 'Can add repetitio answer language', 42, 'add_repetitioanswerlanguage');
INSERT INTO `auth_permission` VALUES(125, 'Can change repetitio answer language', 42, 'change_repetitioanswerlanguage');
INSERT INTO `auth_permission` VALUES(126, 'Can delete repetitio answer language', 42, 'delete_repetitioanswerlanguage');
INSERT INTO `auth_permission` VALUES(127, 'Can add repetitio answer', 43, 'add_repetitioanswer');
INSERT INTO `auth_permission` VALUES(128, 'Can change repetitio answer', 43, 'change_repetitioanswer');
INSERT INTO `auth_permission` VALUES(129, 'Can delete repetitio answer', 43, 'delete_repetitioanswer');
INSERT INTO `auth_permission` VALUES(130, 'Can add repetitio test answer', 44, 'add_repetitiotestanswer');
INSERT INTO `auth_permission` VALUES(131, 'Can change repetitio test answer', 44, 'change_repetitiotestanswer');
INSERT INTO `auth_permission` VALUES(132, 'Can delete repetitio test answer', 44, 'delete_repetitiotestanswer');
INSERT INTO `auth_permission` VALUES(133, 'Can add repetitio course user', 45, 'add_repetitiocourseuser');
INSERT INTO `auth_permission` VALUES(134, 'Can change repetitio course user', 45, 'change_repetitiocourseuser');
INSERT INTO `auth_permission` VALUES(135, 'Can delete repetitio course user', 45, 'delete_repetitiocourseuser');
INSERT INTO `auth_permission` VALUES(136, 'Can add ad image language', 46, 'add_adimagelanguage');
INSERT INTO `auth_permission` VALUES(137, 'Can change ad image language', 46, 'change_adimagelanguage');
INSERT INTO `auth_permission` VALUES(138, 'Can delete ad image language', 46, 'delete_adimagelanguage');
INSERT INTO `auth_permission` VALUES(139, 'Can add ad image', 47, 'add_adimage');
INSERT INTO `auth_permission` VALUES(140, 'Can change ad image', 47, 'change_adimage');
INSERT INTO `auth_permission` VALUES(141, 'Can delete ad image', 47, 'delete_adimage');
INSERT INTO `auth_permission` VALUES(142, 'Can add ad category language', 48, 'add_adcategorylanguage');
INSERT INTO `auth_permission` VALUES(143, 'Can change ad category language', 48, 'change_adcategorylanguage');
INSERT INTO `auth_permission` VALUES(144, 'Can delete ad category language', 48, 'delete_adcategorylanguage');
INSERT INTO `auth_permission` VALUES(145, 'Can add ad category', 49, 'add_adcategory');
INSERT INTO `auth_permission` VALUES(146, 'Can change ad category', 49, 'change_adcategory');
INSERT INTO `auth_permission` VALUES(147, 'Can delete ad category', 49, 'delete_adcategory');
INSERT INTO `auth_permission` VALUES(148, 'Can add ad language', 50, 'add_adlanguage');
INSERT INTO `auth_permission` VALUES(149, 'Can change ad language', 50, 'change_adlanguage');
INSERT INTO `auth_permission` VALUES(150, 'Can delete ad language', 50, 'delete_adlanguage');
INSERT INTO `auth_permission` VALUES(151, 'Can add ad', 51, 'add_ad');
INSERT INTO `auth_permission` VALUES(152, 'Can change ad', 51, 'change_ad');
INSERT INTO `auth_permission` VALUES(153, 'Can delete ad', 51, 'delete_ad');
INSERT INTO `auth_permission` VALUES(154, 'Can add wiki language', 52, 'add_wikilanguage');
INSERT INTO `auth_permission` VALUES(155, 'Can change wiki language', 52, 'change_wikilanguage');
INSERT INTO `auth_permission` VALUES(156, 'Can delete wiki language', 52, 'delete_wikilanguage');
INSERT INTO `auth_permission` VALUES(157, 'Can add wiki', 53, 'add_wiki');
INSERT INTO `auth_permission` VALUES(158, 'Can change wiki', 53, 'change_wiki');
INSERT INTO `auth_permission` VALUES(159, 'Can delete wiki', 53, 'delete_wiki');
INSERT INTO `auth_permission` VALUES(160, 'Can add site portal', 54, 'add_siteportal');
INSERT INTO `auth_permission` VALUES(161, 'Can change site portal', 54, 'change_siteportal');
INSERT INTO `auth_permission` VALUES(162, 'Can delete site portal', 54, 'delete_siteportal');
INSERT INTO `auth_permission` VALUES(163, 'Can add site portal stat', 55, 'add_siteportalstat');
INSERT INTO `auth_permission` VALUES(164, 'Can change site portal stat', 55, 'change_siteportalstat');
INSERT INTO `auth_permission` VALUES(165, 'Can delete site portal stat', 55, 'delete_siteportalstat');
INSERT INTO `auth_permission` VALUES(166, 'Can add catalog image language', 56, 'add_catalogimagelanguage');
INSERT INTO `auth_permission` VALUES(167, 'Can change catalog image language', 56, 'change_catalogimagelanguage');
INSERT INTO `auth_permission` VALUES(168, 'Can delete catalog image language', 56, 'delete_catalogimagelanguage');
INSERT INTO `auth_permission` VALUES(169, 'Can add catalog image', 57, 'add_catalogimage');
INSERT INTO `auth_permission` VALUES(170, 'Can change catalog image', 57, 'change_catalogimage');
INSERT INTO `auth_permission` VALUES(171, 'Can delete catalog image', 57, 'delete_catalogimage');
INSERT INTO `auth_permission` VALUES(172, 'Can add catalog category language', 58, 'add_catalogcategorylanguage');
INSERT INTO `auth_permission` VALUES(173, 'Can change catalog category language', 58, 'change_catalogcategorylanguage');
INSERT INTO `auth_permission` VALUES(174, 'Can delete catalog category language', 58, 'delete_catalogcategorylanguage');
INSERT INTO `auth_permission` VALUES(175, 'Can add catalog category', 59, 'add_catalogcategory');
INSERT INTO `auth_permission` VALUES(176, 'Can change catalog category', 59, 'change_catalogcategory');
INSERT INTO `auth_permission` VALUES(177, 'Can delete catalog category', 59, 'delete_catalogcategory');
INSERT INTO `auth_permission` VALUES(178, 'Can add catalog item language', 60, 'add_catalogitemlanguage');
INSERT INTO `auth_permission` VALUES(179, 'Can change catalog item language', 60, 'change_catalogitemlanguage');
INSERT INTO `auth_permission` VALUES(180, 'Can delete catalog item language', 60, 'delete_catalogitemlanguage');
INSERT INTO `auth_permission` VALUES(181, 'Can add catalog item', 61, 'add_catalogitem');
INSERT INTO `auth_permission` VALUES(182, 'Can change catalog item', 61, 'change_catalogitem');
INSERT INTO `auth_permission` VALUES(183, 'Can delete catalog item', 61, 'delete_catalogitem');
INSERT INTO `auth_permission` VALUES(184, 'Can add module position', 62, 'add_moduleposition');
INSERT INTO `auth_permission` VALUES(185, 'Can change module position', 62, 'change_moduleposition');
INSERT INTO `auth_permission` VALUES(186, 'Can delete module position', 62, 'delete_moduleposition');
INSERT INTO `auth_permission` VALUES(187, 'Can add module type', 63, 'add_moduletype');
INSERT INTO `auth_permission` VALUES(188, 'Can change module type', 63, 'change_moduletype');
INSERT INTO `auth_permission` VALUES(189, 'Can delete module type', 63, 'delete_moduletype');
INSERT INTO `auth_permission` VALUES(190, 'Can add registered module', 64, 'add_registeredmodule');
INSERT INTO `auth_permission` VALUES(191, 'Can change registered module', 64, 'change_registeredmodule');
INSERT INTO `auth_permission` VALUES(192, 'Can delete registered module', 64, 'delete_registeredmodule');
INSERT INTO `auth_permission` VALUES(193, 'Can add menu', 65, 'add_menu');
INSERT INTO `auth_permission` VALUES(194, 'Can change menu', 65, 'change_menu');
INSERT INTO `auth_permission` VALUES(195, 'Can delete menu', 65, 'delete_menu');
INSERT INTO `auth_permission` VALUES(196, 'Can add menu item language', 66, 'add_menuitemlanguage');
INSERT INTO `auth_permission` VALUES(197, 'Can change menu item language', 66, 'change_menuitemlanguage');
INSERT INTO `auth_permission` VALUES(198, 'Can delete menu item language', 66, 'delete_menuitemlanguage');
INSERT INTO `auth_permission` VALUES(199, 'Can add menu item', 67, 'add_menuitem');
INSERT INTO `auth_permission` VALUES(200, 'Can change menu item', 67, 'change_menuitem');
INSERT INTO `auth_permission` VALUES(201, 'Can delete menu item', 67, 'delete_menuitem');
INSERT INTO `auth_permission` VALUES(202, 'Can add mega menu language', 68, 'add_megamenulanguage');
INSERT INTO `auth_permission` VALUES(203, 'Can change mega menu language', 68, 'change_megamenulanguage');
INSERT INTO `auth_permission` VALUES(204, 'Can delete mega menu language', 68, 'delete_megamenulanguage');
INSERT INTO `auth_permission` VALUES(205, 'Can add mega menu', 69, 'add_megamenu');
INSERT INTO `auth_permission` VALUES(206, 'Can change mega menu', 69, 'change_megamenu');
INSERT INTO `auth_permission` VALUES(207, 'Can delete mega menu', 69, 'delete_megamenu');
INSERT INTO `auth_permission` VALUES(208, 'Can add article module option', 70, 'add_articlemoduleoption');
INSERT INTO `auth_permission` VALUES(209, 'Can change article module option', 70, 'change_articlemoduleoption');
INSERT INTO `auth_permission` VALUES(210, 'Can delete article module option', 70, 'delete_articlemoduleoption');
INSERT INTO `auth_permission` VALUES(211, 'Can add article list module option', 71, 'add_articlelistmoduleoption');
INSERT INTO `auth_permission` VALUES(212, 'Can change article list module option', 71, 'change_articlelistmoduleoption');
INSERT INTO `auth_permission` VALUES(213, 'Can delete article list module option', 71, 'delete_articlelistmoduleoption');
INSERT INTO `auth_permission` VALUES(214, 'Can add menu module option', 72, 'add_menumoduleoption');
INSERT INTO `auth_permission` VALUES(215, 'Can change menu module option', 72, 'change_menumoduleoption');
INSERT INTO `auth_permission` VALUES(216, 'Can delete menu module option', 72, 'delete_menumoduleoption');
INSERT INTO `auth_permission` VALUES(217, 'Can add module visibility', 73, 'add_modulevisibility');
INSERT INTO `auth_permission` VALUES(218, 'Can change module visibility', 73, 'change_modulevisibility');
INSERT INTO `auth_permission` VALUES(219, 'Can delete module visibility', 73, 'delete_modulevisibility');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `auth_user`
--

INSERT INTO `auth_user` VALUES(1, 'admin', '', '', 'your@email.xxx', 'sha1$3e5c3$b5fb0f67f8c2830af459e16818b56cb128de2702', 1, 1, 1, '2011-08-29 10:15:45', '2011-08-29 09:53:21');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `auth_user_groups`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendareventlanguages`
--

CREATE TABLE `calendareventlanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext,
  `text` longtext,
  `contact` longtext,
  `shortinfo` longtext,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendareventlanguages_7ab48146` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendareventlanguages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendarevents`
--

CREATE TABLE `calendarevents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `town` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `www` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `sw` tinyint(1) NOT NULL,
  `dentoid` varchar(255) DEFAULT NULL,
  `bannerLink` varchar(100) DEFAULT NULL,
  `infoLink` varchar(255) DEFAULT NULL,
  `support` varchar(122) DEFAULT NULL,
  `backgroundColor` varchar(10) DEFAULT NULL,
  `borderColor` varchar(10) DEFAULT NULL,
  `borderWidth` int(11) DEFAULT NULL,
  `promotor` varchar(128) DEFAULT NULL,
  `formMail` varchar(32) DEFAULT NULL,
  `profesor` varchar(128) DEFAULT NULL,
  `dentocountryid` varchar(32) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `calendar_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendarevents_777d41c8` (`type_id`),
  KEY `calendarevents_b9608dc2` (`state_id`),
  KEY `calendarevents_447205e2` (`calendar_id`),
  KEY `calendarevents_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendarevents`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendarevents_active`
--

CREATE TABLE `calendarevents_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendarevent_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendarevent_id` (`calendarevent_id`,`site_id`),
  KEY `calendarevents_active_bcb39b1d` (`calendarevent_id`),
  KEY `calendarevents_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendarevents_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendarevents_languages`
--

CREATE TABLE `calendarevents_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendarevent_id` int(11) NOT NULL,
  `calendareventlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendarevent_id` (`calendarevent_id`,`calendareventlanguage_id`),
  KEY `calendarevents_languages_bcb39b1d` (`calendarevent_id`),
  KEY `calendarevents_languages_569dbb8d` (`calendareventlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendarevents_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendarevents_permissions`
--

CREATE TABLE `calendarevents_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendarevent_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendarevent_id` (`calendarevent_id`,`permisiongroup_id`),
  KEY `calendarevents_permissions_bcb39b1d` (`calendarevent_id`),
  KEY `calendarevents_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendarevents_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendarevents_sites`
--

CREATE TABLE `calendarevents_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendarevent_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendarevent_id` (`calendarevent_id`,`site_id`),
  KEY `calendarevents_sites_bcb39b1d` (`calendarevent_id`),
  KEY `calendarevents_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendarevents_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendareventtypelanguages`
--

CREATE TABLE `calendareventtypelanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `info` longtext,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendareventtypelanguages_7ab48146` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendareventtypelanguages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendarlanguages`
--

CREATE TABLE `calendarlanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `description` longtext,
  `shortinfo` longtext,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_96bade93` (`language_id`),
  KEY `calendarlanguages_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendarlanguages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendars`
--

CREATE TABLE `calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `dentoid` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendars_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendars`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendars_active`
--

CREATE TABLE `calendars_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_id` (`calendar_id`,`site_id`),
  KEY `calendars_active_447205e2` (`calendar_id`),
  KEY `calendars_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendars_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendars_languages`
--

CREATE TABLE `calendars_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `calendarlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_id` (`calendar_id`,`calendarlanguage_id`),
  KEY `calendars_languages_447205e2` (`calendar_id`),
  KEY `calendars_languages_a93315c0` (`calendarlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendars_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendars_permissions`
--

CREATE TABLE `calendars_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_id` (`calendar_id`,`permisiongroup_id`),
  KEY `calendars_permissions_447205e2` (`calendar_id`),
  KEY `calendars_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendars_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendars_sites`
--

CREATE TABLE `calendars_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_id` (`calendar_id`,`site_id`),
  KEY `calendars_sites_447205e2` (`calendar_id`),
  KEY `calendars_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendars_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendartypes`
--

CREATE TABLE `calendartypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `dentoid` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendartypes_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendartypes`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendartypes_active`
--

CREATE TABLE `calendartypes_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendareventtype_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendareventtype_id` (`calendareventtype_id`,`site_id`),
  KEY `calendartypes_active_5ec8c85f` (`calendareventtype_id`),
  KEY `calendartypes_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendartypes_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendartypes_languages`
--

CREATE TABLE `calendartypes_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendareventtype_id` int(11) NOT NULL,
  `calendareventtypelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendareventtype_id` (`calendareventtype_id`,`calendareventtypelanguage_id`),
  KEY `calendartypes_languages_5ec8c85f` (`calendareventtype_id`),
  KEY `calendartypes_languages_17162c91` (`calendareventtypelanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendartypes_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendartypes_permissions`
--

CREATE TABLE `calendartypes_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendareventtype_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendareventtype_id` (`calendareventtype_id`,`permisiongroup_id`),
  KEY `calendartypes_permissions_5ec8c85f` (`calendareventtype_id`),
  KEY `calendartypes_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendartypes_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `calendartypes_sites`
--

CREATE TABLE `calendartypes_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendareventtype_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendareventtype_id` (`calendareventtype_id`,`site_id`),
  KEY `calendartypes_sites_5ec8c85f` (`calendareventtype_id`),
  KEY `calendartypes_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `calendartypes_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_cat`
--

CREATE TABLE `catalogs_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `noedit` tinyint(1) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogs_cat_63f17a16` (`parent_id`),
  KEY `catalogs_cat_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_cat`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_cat_active`
--

CREATE TABLE `catalogs_cat_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogcategory_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogcategory_id` (`catalogcategory_id`,`site_id`),
  KEY `catalogs_cat_active_41624eb6` (`catalogcategory_id`),
  KEY `catalogs_cat_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_cat_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_cat_lang`
--

CREATE TABLE `catalogs_cat_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_29bca8c2` (`language_id`),
  KEY `catalogs_cat_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_cat_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_cat_languages`
--

CREATE TABLE `catalogs_cat_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogcategory_id` int(11) NOT NULL,
  `catalogcategorylanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogcategory_id` (`catalogcategory_id`,`catalogcategorylanguage_id`),
  KEY `catalogs_cat_languages_41624eb6` (`catalogcategory_id`),
  KEY `catalogs_cat_languages_eca20c14` (`catalogcategorylanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_cat_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_cat_permissions`
--

CREATE TABLE `catalogs_cat_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogcategory_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogcategory_id` (`catalogcategory_id`,`permisiongroup_id`),
  KEY `catalogs_cat_permissions_41624eb6` (`catalogcategory_id`),
  KEY `catalogs_cat_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_cat_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_cat_sites`
--

CREATE TABLE `catalogs_cat_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogcategory_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogcategory_id` (`catalogcategory_id`,`site_id`),
  KEY `catalogs_cat_sites_41624eb6` (`catalogcategory_id`),
  KEY `catalogs_cat_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_cat_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_image`
--

CREATE TABLE `catalogs_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogs_image_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_image`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_image_active`
--

CREATE TABLE `catalogs_image_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogimage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogimage_id` (`catalogimage_id`,`site_id`),
  KEY `catalogs_image_active_743b2c4c` (`catalogimage_id`),
  KEY `catalogs_image_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_image_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_image_lang`
--

CREATE TABLE `catalogs_image_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_b7ede39f` (`language_id`),
  KEY `catalogs_image_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_image_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_image_languages`
--

CREATE TABLE `catalogs_image_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogimage_id` int(11) NOT NULL,
  `adimagelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogimage_id` (`catalogimage_id`,`adimagelanguage_id`),
  KEY `catalogs_image_languages_743b2c4c` (`catalogimage_id`),
  KEY `catalogs_image_languages_5ed0d2f7` (`adimagelanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_image_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_image_permissions`
--

CREATE TABLE `catalogs_image_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogimage_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogimage_id` (`catalogimage_id`,`permisiongroup_id`),
  KEY `catalogs_image_permissions_743b2c4c` (`catalogimage_id`),
  KEY `catalogs_image_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_image_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_image_sites`
--

CREATE TABLE `catalogs_image_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogimage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogimage_id` (`catalogimage_id`,`site_id`),
  KEY `catalogs_image_sites_743b2c4c` (`catalogimage_id`),
  KEY `catalogs_image_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_image_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_item`
--

CREATE TABLE `catalogs_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `mainimage` varchar(100) DEFAULT NULL,
  `mimage_info` varchar(255) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `datestart` datetime NOT NULL,
  `dateend` datetime DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `house_nr` varchar(255) DEFAULT NULL,
  `local_nr` varchar(255) DEFAULT NULL,
  `www` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogs_item_42dc49bc` (`category_id`),
  KEY `catalogs_item_b9608dc2` (`state_id`),
  KEY `catalogs_item_534dd89` (`country_id`),
  KEY `catalogs_item_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_item`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_item_active`
--

CREATE TABLE `catalogs_item_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`site_id`),
  KEY `catalogs_item_active_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_item_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_item_images`
--

CREATE TABLE `catalogs_item_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `catalogimage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`catalogimage_id`),
  KEY `catalogs_item_images_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_images_743b2c4c` (`catalogimage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_item_images`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_item_languages`
--

CREATE TABLE `catalogs_item_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `catalogitemlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`catalogitemlanguage_id`),
  KEY `catalogs_item_languages_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_languages_66c758e5` (`catalogitemlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_item_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_item_permissions`
--

CREATE TABLE `catalogs_item_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`permisiongroup_id`),
  KEY `catalogs_item_permissions_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_item_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_item_sites`
--

CREATE TABLE `catalogs_item_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`site_id`),
  KEY `catalogs_item_sites_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_item_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `catalogs_lang`
--

CREATE TABLE `catalogs_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_8a5613fb` (`language_id`),
  KEY `catalogs_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `catalogs_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `noedit` tinyint(1) NOT NULL,
  `show_title` tinyint(1) NOT NULL,
  `show_footer` tinyint(1) NOT NULL,
  `show_info` tinyint(1) NOT NULL,
  `show_more` tinyint(1) NOT NULL,
  `fetch_subcategories` tinyint(1) NOT NULL,
  `subcategories_depth` int(11) DEFAULT NULL,
  `link_title` tinyint(1) NOT NULL,
  `show_mainimage` tinyint(1) NOT NULL,
  `exposefirst` tinyint(1) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `show_page_title` tinyint(1) NOT NULL,
  `class_prefix` varchar(255) DEFAULT NULL,
  `dentoid` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_63f17a16` (`parent_id`),
  KEY `categories_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` VALUES(1, '2011-08-29 09:57:20', 0, 1, 0, NULL, NULL, NULL, '', 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `categories` VALUES(2, '2011-08-29 10:32:17', 1, 0, 0, 0, NULL, '', '2011/8', 0, 1, 1, 1, 1, 0, NULL, 1, 1, 1, NULL, 0, NULL, NULL, NULL);
INSERT INTO `categories` VALUES(3, '2011-08-29 10:40:47', 1, 0, 0, 0, NULL, '', '2011/8', 0, 1, 1, 1, 1, 0, NULL, 1, 1, 1, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `categories_active`
--

CREATE TABLE `categories_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`site_id`),
  KEY `categories_active_42dc49bc` (`category_id`),
  KEY `categories_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `categories_active`
--

INSERT INTO `categories_active` VALUES(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `categories_galleries`
--

CREATE TABLE `categories_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`gallery_id`),
  KEY `categories_galleries_42dc49bc` (`category_id`),
  KEY `categories_galleries_cb7c733d` (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `categories_galleries`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `categories_languages`
--

CREATE TABLE `categories_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `categorylanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`categorylanguage_id`),
  KEY `categories_languages_42dc49bc` (`category_id`),
  KEY `categories_languages_c246ffe6` (`categorylanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Zrzut danych tabeli `categories_languages`
--

INSERT INTO `categories_languages` VALUES(1, 1, 1);
INSERT INTO `categories_languages` VALUES(7, 1, 2);
INSERT INTO `categories_languages` VALUES(12, 3, 12);
INSERT INTO `categories_languages` VALUES(13, 3, 13);
INSERT INTO `categories_languages` VALUES(14, 3, 14);
INSERT INTO `categories_languages` VALUES(15, 3, 15);
INSERT INTO `categories_languages` VALUES(16, 3, 16);
INSERT INTO `categories_languages` VALUES(17, 3, 17);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `categories_permissions`
--

CREATE TABLE `categories_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`permisiongroup_id`),
  KEY `categories_permissions_42dc49bc` (`category_id`),
  KEY `categories_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `categories_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `categories_sites`
--

CREATE TABLE `categories_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`site_id`),
  KEY `categories_sites_42dc49bc` (`category_id`),
  KEY `categories_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `categories_sites`
--

INSERT INTO `categories_sites` VALUES(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `categorylanguages`
--

CREATE TABLE `categorylanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `altname` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_2a8937d3` (`language_id`),
  KEY `categorylanguages_a951d5d6` (`slug`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Zrzut danych tabeli `categorylanguages`
--

INSERT INTO `categorylanguages` VALUES(1, 'Root', 0, '', NULL, '', NULL, 1);
INSERT INTO `categorylanguages` VALUES(2, 'Root', 0, '', NULL, '', NULL, 2);
INSERT INTO `categorylanguages` VALUES(3, NULL, 0, '', NULL, '', NULL, 3);
INSERT INTO `categorylanguages` VALUES(4, NULL, 0, '', NULL, '', NULL, 4);
INSERT INTO `categorylanguages` VALUES(5, NULL, 0, '', NULL, '', NULL, 5);
INSERT INTO `categorylanguages` VALUES(6, NULL, 0, '', NULL, '', NULL, 6);
INSERT INTO `categorylanguages` VALUES(7, NULL, 0, '', NULL, '', NULL, 2);
INSERT INTO `categorylanguages` VALUES(8, NULL, 0, '', NULL, '', NULL, 3);
INSERT INTO `categorylanguages` VALUES(9, NULL, 0, '', NULL, '', NULL, 4);
INSERT INTO `categorylanguages` VALUES(10, NULL, 0, '', NULL, '', NULL, 5);
INSERT INTO `categorylanguages` VALUES(11, NULL, 0, '', NULL, '', NULL, 6);
INSERT INTO `categorylanguages` VALUES(12, NULL, 0, '', NULL, '', NULL, 1);
INSERT INTO `categorylanguages` VALUES(13, NULL, 0, '', NULL, '', NULL, 2);
INSERT INTO `categorylanguages` VALUES(14, NULL, 0, '', NULL, '', NULL, 3);
INSERT INTO `categorylanguages` VALUES(15, NULL, 0, '', NULL, '', NULL, 4);
INSERT INTO `categorylanguages` VALUES(16, NULL, 0, '', NULL, '', NULL, 5);
INSERT INTO `categorylanguages` VALUES(17, NULL, 0, '', NULL, '', NULL, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `countries`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `django_admin_log`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Zrzut danych tabeli `django_content_type`
--

INSERT INTO `django_content_type` VALUES(1, 'kv store', 'thumbnail', 'kvstore');
INSERT INTO `django_content_type` VALUES(2, 'Tag', 'taggit', 'tag');
INSERT INTO `django_content_type` VALUES(3, 'Tagged Item', 'taggit', 'taggeditem');
INSERT INTO `django_content_type` VALUES(4, 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES(5, 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES(6, 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES(7, 'message', 'auth', 'message');
INSERT INTO `django_content_type` VALUES(8, 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES(9, 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES(10, 'site', 'sites', 'site');
INSERT INTO `django_content_type` VALUES(11, 'log entry', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES(12, 'permision group', 'core', 'permisiongroup');
INSERT INTO `django_content_type` VALUES(13, 'state', 'core', 'state');
INSERT INTO `django_content_type` VALUES(14, 'country', 'core', 'country');
INSERT INTO `django_content_type` VALUES(15, 'sex', 'core', 'sex');
INSERT INTO `django_content_type` VALUES(16, 'user profile', 'core', 'userprofile');
INSERT INTO `django_content_type` VALUES(17, 'user profile data', 'core', 'userprofiledata');
INSERT INTO `django_content_type` VALUES(18, 'language', 'core', 'language');
INSERT INTO `django_content_type` VALUES(19, 'portal site const language', 'core', 'portalsiteconstlanguage');
INSERT INTO `django_content_type` VALUES(20, 'gallery language', 'core', 'gallerylanguage');
INSERT INTO `django_content_type` VALUES(21, 'gallery', 'core', 'gallery');
INSERT INTO `django_content_type` VALUES(22, 'calendar language', 'core', 'calendarlanguage');
INSERT INTO `django_content_type` VALUES(23, 'calendar event type language', 'core', 'calendareventtypelanguage');
INSERT INTO `django_content_type` VALUES(24, 'calendar event language', 'core', 'calendareventlanguage');
INSERT INTO `django_content_type` VALUES(25, 'calendar', 'core', 'calendar');
INSERT INTO `django_content_type` VALUES(26, 'calendar event type', 'core', 'calendareventtype');
INSERT INTO `django_content_type` VALUES(27, 'calendar event', 'core', 'calendarevent');
INSERT INTO `django_content_type` VALUES(28, 'category language', 'core', 'categorylanguage');
INSERT INTO `django_content_type` VALUES(29, 'category', 'core', 'category');
INSERT INTO `django_content_type` VALUES(30, 'article language', 'core', 'articlelanguage');
INSERT INTO `django_content_type` VALUES(31, 'article', 'core', 'article');
INSERT INTO `django_content_type` VALUES(32, 'sheet', 'core', 'sheet');
INSERT INTO `django_content_type` VALUES(33, 'sheet files', 'core', 'sheetfiles');
INSERT INTO `django_content_type` VALUES(34, 'image language', 'core', 'imagelanguage');
INSERT INTO `django_content_type` VALUES(35, 'image', 'core', 'image');
INSERT INTO `django_content_type` VALUES(36, 'repetitio course language', 'core', 'repetitiocourselanguage');
INSERT INTO `django_content_type` VALUES(37, 'repetitio course', 'core', 'repetitiocourse');
INSERT INTO `django_content_type` VALUES(38, 'repetitio test language', 'core', 'repetitiotestlanguage');
INSERT INTO `django_content_type` VALUES(39, 'repetitio test', 'core', 'repetitiotest');
INSERT INTO `django_content_type` VALUES(40, 'repetitio question language', 'core', 'repetitioquestionlanguage');
INSERT INTO `django_content_type` VALUES(41, 'repetitio question', 'core', 'repetitioquestion');
INSERT INTO `django_content_type` VALUES(42, 'repetitio answer language', 'core', 'repetitioanswerlanguage');
INSERT INTO `django_content_type` VALUES(43, 'repetitio answer', 'core', 'repetitioanswer');
INSERT INTO `django_content_type` VALUES(44, 'repetitio test answer', 'core', 'repetitiotestanswer');
INSERT INTO `django_content_type` VALUES(45, 'repetitio course user', 'core', 'repetitiocourseuser');
INSERT INTO `django_content_type` VALUES(46, 'ad image language', 'core', 'adimagelanguage');
INSERT INTO `django_content_type` VALUES(47, 'ad image', 'core', 'adimage');
INSERT INTO `django_content_type` VALUES(48, 'ad category language', 'core', 'adcategorylanguage');
INSERT INTO `django_content_type` VALUES(49, 'ad category', 'core', 'adcategory');
INSERT INTO `django_content_type` VALUES(50, 'ad language', 'core', 'adlanguage');
INSERT INTO `django_content_type` VALUES(51, 'ad', 'core', 'ad');
INSERT INTO `django_content_type` VALUES(52, 'wiki language', 'core', 'wikilanguage');
INSERT INTO `django_content_type` VALUES(53, 'wiki', 'core', 'wiki');
INSERT INTO `django_content_type` VALUES(54, 'site portal', 'core', 'siteportal');
INSERT INTO `django_content_type` VALUES(55, 'site portal stat', 'core', 'siteportalstat');
INSERT INTO `django_content_type` VALUES(56, 'catalog image language', 'core', 'catalogimagelanguage');
INSERT INTO `django_content_type` VALUES(57, 'catalog image', 'core', 'catalogimage');
INSERT INTO `django_content_type` VALUES(58, 'catalog category language', 'core', 'catalogcategorylanguage');
INSERT INTO `django_content_type` VALUES(59, 'catalog category', 'core', 'catalogcategory');
INSERT INTO `django_content_type` VALUES(60, 'catalog item language', 'core', 'catalogitemlanguage');
INSERT INTO `django_content_type` VALUES(61, 'catalog item', 'core', 'catalogitem');
INSERT INTO `django_content_type` VALUES(62, 'module position', 'core', 'moduleposition');
INSERT INTO `django_content_type` VALUES(63, 'module type', 'core', 'moduletype');
INSERT INTO `django_content_type` VALUES(64, 'registered module', 'core', 'registeredmodule');
INSERT INTO `django_content_type` VALUES(65, 'menu', 'core', 'menu');
INSERT INTO `django_content_type` VALUES(66, 'menu item language', 'core', 'menuitemlanguage');
INSERT INTO `django_content_type` VALUES(67, 'menu item', 'core', 'menuitem');
INSERT INTO `django_content_type` VALUES(68, 'mega menu language', 'core', 'megamenulanguage');
INSERT INTO `django_content_type` VALUES(69, 'mega menu', 'core', 'megamenu');
INSERT INTO `django_content_type` VALUES(70, 'article module option', 'core', 'articlemoduleoption');
INSERT INTO `django_content_type` VALUES(71, 'article list module option', 'core', 'articlelistmoduleoption');
INSERT INTO `django_content_type` VALUES(72, 'menu module option', 'core', 'menumoduleoption');
INSERT INTO `django_content_type` VALUES(73, 'module visibility', 'core', 'modulevisibility');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `django_session`
--

INSERT INTO `django_session` VALUES('df6a7dc9b27615489913093b9a4bf624', 'ZWE1YzVlMTc3MmMyODA5NGMwODIzZWQ4NmM3MGM5ZmFkM2NlMmQwNzqAAn1xAShVF19fYWRtX1No\nZWV0X0ZpbGVzX19wYWdlSwBVFV9fYWRtX0FydGljbGVzX19wbmV4dEsCVRFfX2FkbV9TaXRlc19f\ncGFnZUsAVRRfX2FkbV9BcnRpY2xlc19fcGFnZUsAVRVfX2FkbV9BcnRpY2xlc19fcHByZXZOVQxz\nZWxlY3RlZHRlc3ROVRJfX2FkbV9TaXRlc19fcGFnZXNdVRNfX2FkbV9BcnRpY2xlc19fcG5pSwpV\nEl9fYWRtX1NpdGVzX19wbmV4dEsCVRBfX2FkbV9NZW51X19wYWdlSwBVCXBhZ2VzaW5mb31VDV9h\ndXRoX3VzZXJfaWSKAQFVCmFjdGl2ZXNpdGVLAVUXX19hZG1fQ2F0ZWdvcmllc19fcHByZXZOVQVw\nYWdlc11xAlUTX19hZG1fU2hlZXRzX19wYWdlc11VF19fYWRtX0NhdGVnb3JpZXNfX3BhZ2VzaAJV\nEV9fYWRtX01lbnVfX3BhZ2VzXVUVX19hZG1fQXJ0aWNsZXNfX3BhZ2VzXVUFcHByZXZOVRBzZWxl\nY3RlZHF1ZXN0aW9uTlUSX19hZG1fU2l0ZXNfX3BwcmV2TlUGbG9naW50igEDVSA1YTRkZjQ2NzVj\nYjZlYTRiOTQzOGNmNzg1ZTQyYzhmZYZVA3BuaUsKVRhfX2FkbV9TaGVldF9GaWxlc19fcG5leHRL\nAlUSX19hZG1fU2hlZXRzX19wYWdlSwBVC2N1cnJlbnRkYXRlY2RhdGV0aW1lCmRhdGV0aW1lCnED\nVQoH2wgdCwwJDDAmhVJxBFUXX19hZG1fQ2F0ZWdvcmllc19fcG5leHRLAlUVX19hZG1fQ2F0ZWdv\ncmllc19fcG5pWAIAAAAxMFUTX19hZG1fU2hlZXRzX19wbmV4dEsCVQVwbmV4dEsCVRFfX2FkbV9T\naGVldHNfX3BuaUsKVQRsYW5nWAIAAABwbFUWX19hZG1fU2hlZXRfRmlsZXNfX3BuaUsKVQ9fX2Fk\nbV9NZW51X19wbmlLClUWX19hZG1fQ2F0ZWdvcmllc19fcGFnZUsAVRBzZWxlY3RlZGNhdGVnb3J5\nTlUQX19hZG1fU2l0ZXNfX3BuaUsKVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmli\nLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kVQ5zZWxlY3RlZGNvdXJzZU5VEV9fYWRtX01lbnVf\nX3BuZXh0SwJVE19fYWRtX1NoZWV0c19fcHByZXZOVRBzZWxlY3RlZGFjdGl2aXR5Sv////9VGF9f\nYWRtX1NoZWV0X0ZpbGVzX19wYWdlc11VGF9fYWRtX1NoZWV0X0ZpbGVzX19wcHJldk5VEV9fYWRt\nX01lbnVfX3BwcmV2TlUEcGFnZUsAVQhhZG1pbmFsbIh1Lg==\n', '2011-09-12 11:12:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `django_site`
--

INSERT INTO `django_site` VALUES(1, 'example.com', 'Example site');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `galleries`
--

CREATE TABLE `galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_63f17a16` (`parent_id`),
  KEY `galleries_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `galleries`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `gallerieslanguages`
--

CREATE TABLE `gallerieslanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_d0049166` (`language_id`),
  KEY `gallerieslanguages_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `gallerieslanguages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `galleries_active`
--

CREATE TABLE `galleries_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`site_id`),
  KEY `galleries_active_cb7c733d` (`gallery_id`),
  KEY `galleries_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `galleries_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `galleries_languages`
--

CREATE TABLE `galleries_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `gallerylanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`gallerylanguage_id`),
  KEY `galleries_languages_cb7c733d` (`gallery_id`),
  KEY `galleries_languages_3cf670ab` (`gallerylanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `galleries_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `galleries_permissions`
--

CREATE TABLE `galleries_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`permisiongroup_id`),
  KEY `galleries_permissions_cb7c733d` (`gallery_id`),
  KEY `galleries_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `galleries_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `galleries_sites`
--

CREATE TABLE `galleries_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`site_id`),
  KEY `galleries_sites_cb7c733d` (`gallery_id`),
  KEY `galleries_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `galleries_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `imagelanguages`
--

CREATE TABLE `imagelanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_c994f155` (`language_id`),
  KEY `imagelanguages_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `imagelanguages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_cb7c733d` (`gallery_id`),
  KEY `images_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `images`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `images_active`
--

CREATE TABLE `images_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`site_id`),
  KEY `images_active_6682136` (`image_id`),
  KEY `images_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `images_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `images_languages`
--

CREATE TABLE `images_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `imagelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`imagelanguage_id`),
  KEY `images_languages_6682136` (`image_id`),
  KEY `images_languages_46b4dec` (`imagelanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `images_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `images_permissions`
--

CREATE TABLE `images_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`permisiongroup_id`),
  KEY `images_permissions_6682136` (`image_id`),
  KEY `images_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `images_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `images_sites`
--

CREATE TABLE `images_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`site_id`),
  KEY `images_sites_6682136` (`image_id`),
  KEY `images_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `images_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `currencysymbol` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `languages`
--

INSERT INTO `languages` VALUES(1, '2011-08-29 09:59:03', 'Polski', 'pl', 'PLN');
INSERT INTO `languages` VALUES(2, '2011-08-29 09:59:15', 'English', 'en', '$');
INSERT INTO `languages` VALUES(3, '2011-08-29 10:01:04', 'German', 'de', '€');
INSERT INTO `languages` VALUES(4, '2011-08-29 10:01:06', 'Spanish', 'sp', '€');
INSERT INTO `languages` VALUES(5, '2011-08-29 10:02:02', 'Francais', 'fr', '€');
INSERT INTO `languages` VALUES(6, '2011-08-29 10:02:09', 'Italian', 'it', '€');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `languages_active`
--

CREATE TABLE `languages_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_id` (`language_id`,`site_id`),
  KEY `languages_active_7ab48146` (`language_id`),
  KEY `languages_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `languages_active`
--

INSERT INTO `languages_active` VALUES(1, 1, 1);
INSERT INTO `languages_active` VALUES(2, 2, 1);
INSERT INTO `languages_active` VALUES(3, 3, 1);
INSERT INTO `languages_active` VALUES(4, 4, 1);
INSERT INTO `languages_active` VALUES(5, 5, 1);
INSERT INTO `languages_active` VALUES(6, 6, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `languages_sites`
--

CREATE TABLE `languages_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_id` (`language_id`,`site_id`),
  KEY `languages_sites_7ab48146` (`language_id`),
  KEY `languages_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `languages_sites`
--

INSERT INTO `languages_sites` VALUES(1, 1, 1);
INSERT INTO `languages_sites` VALUES(2, 2, 1);
INSERT INTO `languages_sites` VALUES(3, 3, 1);
INSERT INTO `languages_sites` VALUES(4, 4, 1);
INSERT INTO `languages_sites` VALUES(5, 5, 1);
INSERT INTO `languages_sites` VALUES(6, 6, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `megamenu`
--

CREATE TABLE `megamenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `noedit` tinyint(1) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `adv_id` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `megamenu_f53ed95e` (`module_id`),
  KEY `megamenu_143efa3` (`menu_id`),
  KEY `megamenu_42dc49bc` (`category_id`),
  KEY `megamenu_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `megamenu`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `megamenu_active`
--

CREATE TABLE `megamenu_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `megamenu_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megamenu_id` (`megamenu_id`,`site_id`),
  KEY `megamenu_active_2d9d23f3` (`megamenu_id`),
  KEY `megamenu_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `megamenu_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `megamenu_lang`
--

CREATE TABLE `megamenu_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_6a49f184` (`language_id`),
  KEY `megamenu_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `megamenu_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `megamenu_languages`
--

CREATE TABLE `megamenu_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `megamenu_id` int(11) NOT NULL,
  `megamenulanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megamenu_id` (`megamenu_id`,`megamenulanguage_id`),
  KEY `megamenu_languages_2d9d23f3` (`megamenu_id`),
  KEY `megamenu_languages_67e9139` (`megamenulanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `megamenu_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `megamenu_permissions`
--

CREATE TABLE `megamenu_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `megamenu_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megamenu_id` (`megamenu_id`,`permisiongroup_id`),
  KEY `megamenu_permissions_2d9d23f3` (`megamenu_id`),
  KEY `megamenu_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `megamenu_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `megamenu_sites`
--

CREATE TABLE `megamenu_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `megamenu_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megamenu_id` (`megamenu_id`,`site_id`),
  KEY `megamenu_sites_2d9d23f3` (`megamenu_id`),
  KEY `megamenu_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `megamenu_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `altname` varchar(255) DEFAULT NULL,
  `info` longtext,
  `module_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_f53ed95e` (`module_id`),
  KEY `menu_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `menu`
--

INSERT INTO `menu` VALUES(2, '2011-08-29 11:09:52', 0, 0, 0, 0, 'Main Menu', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menuitem`
--

CREATE TABLE `menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `noedit` tinyint(1) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menuitem_63f17a16` (`parent_id`),
  KEY `menuitem_f53ed95e` (`module_id`),
  KEY `menuitem_143efa3` (`menu_id`),
  KEY `menuitem_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `menuitem`
--

INSERT INTO `menuitem` VALUES(1, '2011-08-29 10:42:55', 1, 0, 0, 0, NULL, '', '2011/8', 0, NULL, NULL, NULL);
INSERT INTO `menuitem` VALUES(2, '2011-08-29 11:09:52', 1, 0, 0, 0, NULL, '', '2011/8', 1, NULL, NULL, NULL);
INSERT INTO `menuitem` VALUES(3, '2011-08-29 11:10:03', 0, 0, 0, 0, NULL, '', '2011/8', 0, 1, 2, NULL);
INSERT INTO `menuitem` VALUES(4, '2011-08-29 11:10:42', 1, 0, 0, 0, NULL, '', '2011/8', 0, NULL, NULL, NULL);
INSERT INTO `menuitem` VALUES(5, '2011-08-29 11:11:02', 0, 0, 0, 0, 3, '', '2011/8', 0, 1, 2, NULL);
INSERT INTO `menuitem` VALUES(6, '2011-08-29 11:11:54', 0, 0, 0, 0, 3, '', '2011/8', 0, 21, 2, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menuitem_active`
--

CREATE TABLE `menuitem_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuitem_id` (`menuitem_id`,`site_id`),
  KEY `menuitem_active_f8c10b8c` (`menuitem_id`),
  KEY `menuitem_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `menuitem_active`
--

INSERT INTO `menuitem_active` VALUES(1, 2, 1);
INSERT INTO `menuitem_active` VALUES(2, 3, 1);
INSERT INTO `menuitem_active` VALUES(3, 5, 1);
INSERT INTO `menuitem_active` VALUES(4, 6, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menuitem_lang`
--

CREATE TABLE `menuitem_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `altname` varchar(255) DEFAULT NULL,
  `temp` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_4fd5574f` (`language_id`),
  KEY `menuitem_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Zrzut danych tabeli `menuitem_lang`
--

INSERT INTO `menuitem_lang` VALUES(1, NULL, NULL, 0, '', NULL, '', 1);
INSERT INTO `menuitem_lang` VALUES(2, NULL, NULL, 0, '', NULL, '', 2);
INSERT INTO `menuitem_lang` VALUES(3, NULL, NULL, 0, '', NULL, '', 3);
INSERT INTO `menuitem_lang` VALUES(4, NULL, NULL, 0, '', NULL, '', 4);
INSERT INTO `menuitem_lang` VALUES(5, NULL, NULL, 0, '', NULL, '', 5);
INSERT INTO `menuitem_lang` VALUES(6, NULL, NULL, 0, '', NULL, '', 6);
INSERT INTO `menuitem_lang` VALUES(7, 'Root', NULL, 0, '0899299-root', '', '', 1);
INSERT INTO `menuitem_lang` VALUES(8, 'Root', NULL, 0, '089930-root', '', '', 2);
INSERT INTO `menuitem_lang` VALUES(9, 'Root', NULL, 0, '089930-root', '', '', 3);
INSERT INTO `menuitem_lang` VALUES(10, 'Root', NULL, 0, '0899301-root', '', '', 4);
INSERT INTO `menuitem_lang` VALUES(11, 'Root', NULL, 0, '0899301-root', '', '', 5);
INSERT INTO `menuitem_lang` VALUES(12, 'Root', NULL, 0, '0899302-root', '', '', 6);
INSERT INTO `menuitem_lang` VALUES(13, 'Root', '', 0, '0903312-item-1', '', '', 1);
INSERT INTO `menuitem_lang` VALUES(14, NULL, NULL, 0, '', NULL, '', 2);
INSERT INTO `menuitem_lang` VALUES(15, NULL, NULL, 0, '', NULL, '', 3);
INSERT INTO `menuitem_lang` VALUES(16, NULL, NULL, 0, '', NULL, '', 4);
INSERT INTO `menuitem_lang` VALUES(17, NULL, NULL, 0, '', NULL, '', 5);
INSERT INTO `menuitem_lang` VALUES(18, NULL, NULL, 0, '', NULL, '', 6);
INSERT INTO `menuitem_lang` VALUES(19, NULL, NULL, 0, '', NULL, '', 1);
INSERT INTO `menuitem_lang` VALUES(20, NULL, NULL, 0, '', NULL, '', 2);
INSERT INTO `menuitem_lang` VALUES(21, NULL, NULL, 0, '', NULL, '', 3);
INSERT INTO `menuitem_lang` VALUES(22, NULL, NULL, 0, '', NULL, '', 4);
INSERT INTO `menuitem_lang` VALUES(23, NULL, NULL, 0, '', NULL, '', 5);
INSERT INTO `menuitem_lang` VALUES(24, NULL, NULL, 0, '', NULL, '', 6);
INSERT INTO `menuitem_lang` VALUES(25, 'Item 1', '', 0, '0907264-item-1', '', '', 1);
INSERT INTO `menuitem_lang` VALUES(26, NULL, NULL, 0, '', NULL, '', 2);
INSERT INTO `menuitem_lang` VALUES(27, NULL, NULL, 0, '', NULL, '', 3);
INSERT INTO `menuitem_lang` VALUES(28, NULL, NULL, 0, '', NULL, '', 4);
INSERT INTO `menuitem_lang` VALUES(29, NULL, NULL, 0, '', NULL, '', 5);
INSERT INTO `menuitem_lang` VALUES(30, NULL, NULL, 0, '', NULL, '', 6);
INSERT INTO `menuitem_lang` VALUES(31, 'Item 2', '', 0, '0912975-item-2', '', '', 1);
INSERT INTO `menuitem_lang` VALUES(32, NULL, NULL, 0, '', NULL, '', 2);
INSERT INTO `menuitem_lang` VALUES(33, NULL, NULL, 0, '', NULL, '', 3);
INSERT INTO `menuitem_lang` VALUES(34, NULL, NULL, 0, '', NULL, '', 4);
INSERT INTO `menuitem_lang` VALUES(35, NULL, NULL, 0, '', NULL, '', 5);
INSERT INTO `menuitem_lang` VALUES(36, NULL, NULL, 0, '', NULL, '', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menuitem_languages`
--

CREATE TABLE `menuitem_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(11) NOT NULL,
  `menuitemlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuitem_id` (`menuitem_id`,`menuitemlanguage_id`),
  KEY `menuitem_languages_f8c10b8c` (`menuitem_id`),
  KEY `menuitem_languages_ace3ffae` (`menuitemlanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Zrzut danych tabeli `menuitem_languages`
--

INSERT INTO `menuitem_languages` VALUES(1, 1, 1);
INSERT INTO `menuitem_languages` VALUES(2, 1, 2);
INSERT INTO `menuitem_languages` VALUES(3, 1, 3);
INSERT INTO `menuitem_languages` VALUES(4, 1, 4);
INSERT INTO `menuitem_languages` VALUES(5, 1, 5);
INSERT INTO `menuitem_languages` VALUES(6, 1, 6);
INSERT INTO `menuitem_languages` VALUES(7, 2, 7);
INSERT INTO `menuitem_languages` VALUES(8, 2, 8);
INSERT INTO `menuitem_languages` VALUES(9, 2, 9);
INSERT INTO `menuitem_languages` VALUES(10, 2, 10);
INSERT INTO `menuitem_languages` VALUES(11, 2, 11);
INSERT INTO `menuitem_languages` VALUES(12, 2, 12);
INSERT INTO `menuitem_languages` VALUES(13, 3, 13);
INSERT INTO `menuitem_languages` VALUES(14, 3, 14);
INSERT INTO `menuitem_languages` VALUES(15, 3, 15);
INSERT INTO `menuitem_languages` VALUES(16, 3, 16);
INSERT INTO `menuitem_languages` VALUES(17, 3, 17);
INSERT INTO `menuitem_languages` VALUES(18, 3, 18);
INSERT INTO `menuitem_languages` VALUES(19, 4, 19);
INSERT INTO `menuitem_languages` VALUES(20, 4, 20);
INSERT INTO `menuitem_languages` VALUES(21, 4, 21);
INSERT INTO `menuitem_languages` VALUES(22, 4, 22);
INSERT INTO `menuitem_languages` VALUES(23, 4, 23);
INSERT INTO `menuitem_languages` VALUES(24, 4, 24);
INSERT INTO `menuitem_languages` VALUES(25, 5, 25);
INSERT INTO `menuitem_languages` VALUES(26, 5, 26);
INSERT INTO `menuitem_languages` VALUES(27, 5, 27);
INSERT INTO `menuitem_languages` VALUES(28, 5, 28);
INSERT INTO `menuitem_languages` VALUES(29, 5, 29);
INSERT INTO `menuitem_languages` VALUES(30, 5, 30);
INSERT INTO `menuitem_languages` VALUES(31, 6, 31);
INSERT INTO `menuitem_languages` VALUES(32, 6, 32);
INSERT INTO `menuitem_languages` VALUES(33, 6, 33);
INSERT INTO `menuitem_languages` VALUES(34, 6, 34);
INSERT INTO `menuitem_languages` VALUES(35, 6, 35);
INSERT INTO `menuitem_languages` VALUES(36, 6, 36);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menuitem_permissions`
--

CREATE TABLE `menuitem_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuitem_id` (`menuitem_id`,`permisiongroup_id`),
  KEY `menuitem_permissions_f8c10b8c` (`menuitem_id`),
  KEY `menuitem_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `menuitem_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menuitem_sites`
--

CREATE TABLE `menuitem_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuitem_id` (`menuitem_id`,`site_id`),
  KEY `menuitem_sites_f8c10b8c` (`menuitem_id`),
  KEY `menuitem_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `menuitem_sites`
--

INSERT INTO `menuitem_sites` VALUES(1, 2, 1);
INSERT INTO `menuitem_sites` VALUES(2, 3, 1);
INSERT INTO `menuitem_sites` VALUES(3, 5, 1);
INSERT INTO `menuitem_sites` VALUES(4, 6, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menu_active`
--

CREATE TABLE `menu_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id` (`menu_id`,`site_id`),
  KEY `menu_active_143efa3` (`menu_id`),
  KEY `menu_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `menu_active`
--

INSERT INTO `menu_active` VALUES(2, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menu_permissions`
--

CREATE TABLE `menu_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id` (`menu_id`,`permisiongroup_id`),
  KEY `menu_permissions_143efa3` (`menu_id`),
  KEY `menu_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `menu_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menu_sites`
--

CREATE TABLE `menu_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id` (`menu_id`,`site_id`),
  KEY `menu_sites_143efa3` (`menu_id`),
  KEY `menu_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `menu_sites`
--

INSERT INTO `menu_sites` VALUES(2, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_article_list_option`
--

CREATE TABLE `module_article_list_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_title` tinyint(1) NOT NULL,
  `show_footer` tinyint(1) NOT NULL,
  `show_info` tinyint(1) NOT NULL,
  `show_more` tinyint(1) NOT NULL,
  `fetch_subcategories` tinyint(1) NOT NULL,
  `subcategories_depth` int(11) DEFAULT NULL,
  `link_title` tinyint(1) NOT NULL,
  `show_mainimage` tinyint(1) NOT NULL,
  `exposefirst` tinyint(1) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `show_page_title` tinyint(1) NOT NULL,
  `class_prefix` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `menuitem_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_article_list_option_f8c10b8c` (`menuitem_id`),
  KEY `module_article_list_option_42dc49bc` (`category_id`),
  KEY `module_article_list_option_f53ed95e` (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `module_article_list_option`
--

INSERT INTO `module_article_list_option` VALUES(1, 1, 1, 1, 1, 0, NULL, 1, 1, 1, '', 0, '', '2011-08-23 11:28:36', 5, 8, 21);
INSERT INTO `module_article_list_option` VALUES(2, 1, 1, 1, 1, 0, NULL, 1, 1, 1, '', 0, '', '2011-08-29 11:11:58', 6, 1, 21);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_article_option`
--

CREATE TABLE `module_article_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_title` tinyint(1) NOT NULL,
  `show_footer` tinyint(1) NOT NULL,
  `show_info` tinyint(1) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `show_page_title` tinyint(1) NOT NULL,
  `class_prefix` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `menuitem_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_article_option_f8c10b8c` (`menuitem_id`),
  KEY `module_article_option_30525a19` (`article_id`),
  KEY `module_article_option_f53ed95e` (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Zrzut danych tabeli `module_article_option`
--

INSERT INTO `module_article_option` VALUES(22, 1, 1, 1, '', 0, '', '2011-08-23 10:02:08', 2, 4, 1);
INSERT INTO `module_article_option` VALUES(23, 1, 1, 1, '', 0, '', '2011-08-23 10:05:20', 5, NULL, 1);
INSERT INTO `module_article_option` VALUES(24, 1, 1, 1, '', 0, '', '2011-08-23 10:05:23', 3, NULL, 1);
INSERT INTO `module_article_option` VALUES(25, 1, 1, 1, NULL, 0, '', '2011-08-23 10:05:26', 4, NULL, 1);
INSERT INTO `module_article_option` VALUES(26, 1, 1, 1, NULL, 0, NULL, '2011-08-29 10:44:25', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_menu_option`
--

CREATE TABLE `module_menu_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_name` tinyint(1) NOT NULL,
  `show_info` tinyint(1) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `show_page_title` tinyint(1) NOT NULL,
  `class_prefix` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_menu_option_143efa3` (`menu_id`),
  KEY `module_menu_option_f53ed95e` (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `module_menu_option`
--

INSERT INTO `module_menu_option` VALUES(4, 1, 1, '', 0, '', '2011-08-21 18:53:22', 2, 18);
INSERT INTO `module_menu_option` VALUES(5, 1, 1, '', 0, '', '2011-08-24 08:31:56', 3, 23);
INSERT INTO `module_menu_option` VALUES(6, 1, 1, '', 0, '', '2011-08-24 10:31:52', 4, 25);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_position`
--

CREATE TABLE `module_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_position_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `module_position`
--

INSERT INTO `module_position` VALUES(1, '2011-08-20 23:32:33', 'content', NULL);
INSERT INTO `module_position` VALUES(2, '2011-08-22 08:41:32', 'footer_3', NULL);
INSERT INTO `module_position` VALUES(3, '2011-08-23 10:23:14', 'box_1', NULL);
INSERT INTO `module_position` VALUES(4, '2011-08-24 08:45:50', 'topmenu', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_position_active`
--

CREATE TABLE `module_position_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleposition_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduleposition_id` (`moduleposition_id`,`site_id`),
  KEY `module_position_active_a9f4973f` (`moduleposition_id`),
  KEY `module_position_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `module_position_active`
--

INSERT INTO `module_position_active` VALUES(1, 1, 1);
INSERT INTO `module_position_active` VALUES(2, 1, 3);
INSERT INTO `module_position_active` VALUES(3, 2, 1);
INSERT INTO `module_position_active` VALUES(4, 3, 1);
INSERT INTO `module_position_active` VALUES(5, 4, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_position_permissions`
--

CREATE TABLE `module_position_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleposition_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduleposition_id` (`moduleposition_id`,`permisiongroup_id`),
  KEY `module_position_permissions_a9f4973f` (`moduleposition_id`),
  KEY `module_position_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `module_position_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_position_sites`
--

CREATE TABLE `module_position_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleposition_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduleposition_id` (`moduleposition_id`,`site_id`),
  KEY `module_position_sites_a9f4973f` (`moduleposition_id`),
  KEY `module_position_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `module_position_sites`
--

INSERT INTO `module_position_sites` VALUES(1, 1, 1);
INSERT INTO `module_position_sites` VALUES(2, 1, 3);
INSERT INTO `module_position_sites` VALUES(3, 2, 1);
INSERT INTO `module_position_sites` VALUES(4, 3, 1);
INSERT INTO `module_position_sites` VALUES(5, 4, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_registered`
--

CREATE TABLE `module_registered` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `info` longtext,
  `modulename` varchar(255) DEFAULT NULL,
  `order` smallint(5) unsigned DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_registered_777d41c8` (`type_id`),
  KEY `module_registered_80180135` (`position_id`),
  KEY `module_registered_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Zrzut danych tabeli `module_registered`
--

INSERT INTO `module_registered` VALUES(1, '2011-08-20 23:07:43', 'Artykul (menu)', '', '', 1, 2, 1, NULL);
INSERT INTO `module_registered` VALUES(17, '2011-08-21 18:32:28', 'Footer menu', '', '', 1, 3, 1, NULL);
INSERT INTO `module_registered` VALUES(18, '2011-08-21 18:53:22', 'Main Menu', '', '', 1, 3, 1, NULL);
INSERT INTO `module_registered` VALUES(19, '2011-08-21 19:45:50', 'fghgfh', '', '', 1, 2, 1, NULL);
INSERT INTO `module_registered` VALUES(20, '2011-08-22 15:53:26', 'Lista Artykułów', NULL, NULL, 1, 4, 3, NULL);
INSERT INTO `module_registered` VALUES(21, '2011-08-23 11:27:34', 'Lista Artykułów (menu)', NULL, NULL, 1, 5, NULL, NULL);
INSERT INTO `module_registered` VALUES(22, '2011-08-23 13:58:44', 'Lista Artykułów (domyślne)', NULL, NULL, 1, 4, NULL, NULL);
INSERT INTO `module_registered` VALUES(23, '2011-08-24 08:31:56', 'Dla lekarzy', NULL, NULL, 1, 3, NULL, NULL);
INSERT INTO `module_registered` VALUES(24, '2011-08-24 08:45:34', 'Menu górne', NULL, NULL, 1, 6, 4, NULL);
INSERT INTO `module_registered` VALUES(25, '2011-08-24 10:31:52', '', NULL, NULL, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_registered_active`
--

CREATE TABLE `module_registered_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registeredmodule_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registeredmodule_id` (`registeredmodule_id`,`site_id`),
  KEY `module_registered_active_a89b7aec` (`registeredmodule_id`),
  KEY `module_registered_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Zrzut danych tabeli `module_registered_active`
--

INSERT INTO `module_registered_active` VALUES(9, 1, 1);
INSERT INTO `module_registered_active` VALUES(10, 1, 3);
INSERT INTO `module_registered_active` VALUES(21, 17, 1);
INSERT INTO `module_registered_active` VALUES(26, 18, 1);
INSERT INTO `module_registered_active` VALUES(27, 19, 1);
INSERT INTO `module_registered_active` VALUES(28, 19, 3);
INSERT INTO `module_registered_active` VALUES(29, 20, 1);
INSERT INTO `module_registered_active` VALUES(30, 21, 1);
INSERT INTO `module_registered_active` VALUES(31, 22, 1);
INSERT INTO `module_registered_active` VALUES(33, 23, 1);
INSERT INTO `module_registered_active` VALUES(32, 24, 1);
INSERT INTO `module_registered_active` VALUES(34, 25, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_registered_permissions`
--

CREATE TABLE `module_registered_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registeredmodule_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registeredmodule_id` (`registeredmodule_id`,`permisiongroup_id`),
  KEY `module_registered_permissions_a89b7aec` (`registeredmodule_id`),
  KEY `module_registered_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `module_registered_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_registered_sites`
--

CREATE TABLE `module_registered_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registeredmodule_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registeredmodule_id` (`registeredmodule_id`,`site_id`),
  KEY `module_registered_sites_a89b7aec` (`registeredmodule_id`),
  KEY `module_registered_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Zrzut danych tabeli `module_registered_sites`
--

INSERT INTO `module_registered_sites` VALUES(9, 1, 1);
INSERT INTO `module_registered_sites` VALUES(10, 1, 3);
INSERT INTO `module_registered_sites` VALUES(21, 17, 1);
INSERT INTO `module_registered_sites` VALUES(26, 18, 1);
INSERT INTO `module_registered_sites` VALUES(27, 19, 1);
INSERT INTO `module_registered_sites` VALUES(28, 19, 3);
INSERT INTO `module_registered_sites` VALUES(29, 20, 1);
INSERT INTO `module_registered_sites` VALUES(30, 21, 1);
INSERT INTO `module_registered_sites` VALUES(31, 22, 1);
INSERT INTO `module_registered_sites` VALUES(33, 23, 1);
INSERT INTO `module_registered_sites` VALUES(32, 24, 1);
INSERT INTO `module_registered_sites` VALUES(34, 25, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_type`
--

CREATE TABLE `module_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `info` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `menu` tinyint(1) NOT NULL,
  `options_modelname` varchar(255) DEFAULT NULL,
  `options_formname` varchar(255) DEFAULT NULL,
  `filemodel` varchar(255) DEFAULT NULL,
  `fileform` varchar(255) DEFAULT NULL,
  `filetemplate` varchar(255) DEFAULT NULL,
  `fileview` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_type_a951d5d6` (`slug`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `module_type`
--

INSERT INTO `module_type` VALUES(2, '2011-08-20 23:07:17', 'Artykul', '', '7444718-artykul', 1, 'ArticleModuleOption', 'ArticleOptionForm', 'artykul_module', 'artykul_module', NULL, NULL);
INSERT INTO `module_type` VALUES(3, '2011-08-21 14:50:04', 'Menu', '', '3103994-menu', 0, 'Menu', 'MenuForm', 'menu_module', 'menu_module', 'menu_module', 'menu_module');
INSERT INTO `module_type` VALUES(4, '2011-08-22 00:00:00', 'Lista artykułów', NULL, 'articles-list', 0, 'ArticleListModuleOption', 'ArticleListOptionForm', 'article_list_module', 'article_list_module', 'article_list_module', 'article_list_module');
INSERT INTO `module_type` VALUES(5, '2011-08-22 00:00:00', 'Lista artykułów (menu)', NULL, 'articles-list-menu', 1, 'ArticleListModuleOption', 'ArticleListOptionForm', 'article_list_module', 'article_list_module', 'article_list_module', 'article_list_module');
INSERT INTO `module_type` VALUES(6, '0000-00-00 00:00:00', 'Top Menu', NULL, 'topmenu', 0, NULL, NULL, NULL, NULL, 'megamenu', 'megamenu');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_type_active`
--

CREATE TABLE `module_type_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduletype_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduletype_id` (`moduletype_id`,`site_id`),
  KEY `module_type_active_9cb16fae` (`moduletype_id`),
  KEY `module_type_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `module_type_active`
--

INSERT INTO `module_type_active` VALUES(3, 2, 1);
INSERT INTO `module_type_active` VALUES(4, 2, 3);
INSERT INTO `module_type_active` VALUES(5, 3, 1);
INSERT INTO `module_type_active` VALUES(6, 3, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_type_sites`
--

CREATE TABLE `module_type_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduletype_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduletype_id` (`moduletype_id`,`site_id`),
  KEY `module_type_sites_9cb16fae` (`moduletype_id`),
  KEY `module_type_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `module_type_sites`
--

INSERT INTO `module_type_sites` VALUES(3, 2, 1);
INSERT INTO `module_type_sites` VALUES(4, 2, 3);
INSERT INTO `module_type_sites` VALUES(5, 3, 1);
INSERT INTO `module_type_sites` VALUES(6, 3, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_visibility`
--

CREATE TABLE `module_visibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_visibility_aff30766` (`model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Zrzut danych tabeli `module_visibility`
--

INSERT INTO `module_visibility` VALUES(1, '2011-08-21 12:49:08', NULL);
INSERT INTO `module_visibility` VALUES(2, '2011-08-21 12:49:43', NULL);
INSERT INTO `module_visibility` VALUES(3, '2011-08-21 12:49:51', NULL);
INSERT INTO `module_visibility` VALUES(4, '2011-08-21 12:52:16', NULL);
INSERT INTO `module_visibility` VALUES(5, '2011-08-21 12:53:27', NULL);
INSERT INTO `module_visibility` VALUES(6, '2011-08-21 12:53:47', NULL);
INSERT INTO `module_visibility` VALUES(7, '2011-08-21 12:55:08', NULL);
INSERT INTO `module_visibility` VALUES(8, '2011-08-21 13:03:58', NULL);
INSERT INTO `module_visibility` VALUES(9, '2011-08-21 13:09:50', NULL);
INSERT INTO `module_visibility` VALUES(10, '2011-08-21 13:11:23', NULL);
INSERT INTO `module_visibility` VALUES(11, '2011-08-21 13:17:09', NULL);
INSERT INTO `module_visibility` VALUES(12, '2011-08-21 14:51:14', NULL);
INSERT INTO `module_visibility` VALUES(13, '2011-08-21 14:51:54', NULL);
INSERT INTO `module_visibility` VALUES(14, '2011-08-21 16:55:57', NULL);
INSERT INTO `module_visibility` VALUES(15, '2011-08-21 16:56:51', NULL);
INSERT INTO `module_visibility` VALUES(16, '2011-08-21 17:02:15', NULL);
INSERT INTO `module_visibility` VALUES(17, '2011-08-21 18:30:14', NULL);
INSERT INTO `module_visibility` VALUES(18, '2011-08-21 18:30:24', NULL);
INSERT INTO `module_visibility` VALUES(19, '2011-08-21 18:33:41', NULL);
INSERT INTO `module_visibility` VALUES(20, '2011-08-21 18:33:49', NULL);
INSERT INTO `module_visibility` VALUES(21, '2011-08-21 18:34:03', NULL);
INSERT INTO `module_visibility` VALUES(22, '2011-08-21 18:34:15', NULL);
INSERT INTO `module_visibility` VALUES(23, '2011-08-21 19:45:50', NULL);
INSERT INTO `module_visibility` VALUES(24, '2011-08-21 19:46:10', NULL);
INSERT INTO `module_visibility` VALUES(25, '2011-08-21 20:20:01', NULL);
INSERT INTO `module_visibility` VALUES(26, '2011-08-21 20:20:08', NULL);
INSERT INTO `module_visibility` VALUES(27, '2011-08-21 20:20:13', NULL);
INSERT INTO `module_visibility` VALUES(28, '2011-08-22 08:37:00', NULL);
INSERT INTO `module_visibility` VALUES(29, '2011-08-22 08:37:02', NULL);
INSERT INTO `module_visibility` VALUES(30, '2011-08-22 08:43:51', NULL);
INSERT INTO `module_visibility` VALUES(31, '2011-08-22 08:45:24', NULL);
INSERT INTO `module_visibility` VALUES(32, '2011-08-22 08:46:13', NULL);
INSERT INTO `module_visibility` VALUES(33, '2011-08-22 08:46:21', NULL);
INSERT INTO `module_visibility` VALUES(34, '2011-08-22 08:49:23', NULL);
INSERT INTO `module_visibility` VALUES(35, '2011-08-22 09:23:49', NULL);
INSERT INTO `module_visibility` VALUES(36, '2011-08-22 10:48:41', NULL);
INSERT INTO `module_visibility` VALUES(37, '2011-08-22 10:48:45', NULL);
INSERT INTO `module_visibility` VALUES(38, '2011-08-22 10:49:08', NULL);
INSERT INTO `module_visibility` VALUES(39, '2011-08-22 11:04:47', NULL);
INSERT INTO `module_visibility` VALUES(40, '2011-08-22 15:53:26', NULL);
INSERT INTO `module_visibility` VALUES(41, '2011-08-22 15:53:43', NULL);
INSERT INTO `module_visibility` VALUES(42, '2011-08-22 15:54:02', NULL);
INSERT INTO `module_visibility` VALUES(43, '2011-08-22 15:56:12', NULL);
INSERT INTO `module_visibility` VALUES(44, '2011-08-22 15:56:15', NULL);
INSERT INTO `module_visibility` VALUES(45, '2011-08-22 15:56:16', NULL);
INSERT INTO `module_visibility` VALUES(46, '2011-08-23 09:03:22', NULL);
INSERT INTO `module_visibility` VALUES(47, '2011-08-23 09:03:39', NULL);
INSERT INTO `module_visibility` VALUES(48, '2011-08-23 09:03:49', NULL);
INSERT INTO `module_visibility` VALUES(49, '2011-08-23 09:27:42', NULL);
INSERT INTO `module_visibility` VALUES(50, '2011-08-23 10:13:53', NULL);
INSERT INTO `module_visibility` VALUES(51, '2011-08-23 10:13:56', NULL);
INSERT INTO `module_visibility` VALUES(52, '2011-08-23 10:14:14', NULL);
INSERT INTO `module_visibility` VALUES(53, '2011-08-23 10:22:40', NULL);
INSERT INTO `module_visibility` VALUES(54, '2011-08-23 10:22:43', NULL);
INSERT INTO `module_visibility` VALUES(55, '2011-08-23 10:23:09', NULL);
INSERT INTO `module_visibility` VALUES(56, '2011-08-23 10:23:33', NULL);
INSERT INTO `module_visibility` VALUES(57, '2011-08-23 10:23:37', NULL);
INSERT INTO `module_visibility` VALUES(58, '2011-08-23 11:27:34', NULL);
INSERT INTO `module_visibility` VALUES(59, '2011-08-23 11:27:47', NULL);
INSERT INTO `module_visibility` VALUES(60, '2011-08-23 11:27:51', NULL);
INSERT INTO `module_visibility` VALUES(61, '2011-08-23 11:27:56', NULL);
INSERT INTO `module_visibility` VALUES(62, '2011-08-23 13:34:10', NULL);
INSERT INTO `module_visibility` VALUES(63, '2011-08-23 13:58:44', NULL);
INSERT INTO `module_visibility` VALUES(64, '2011-08-23 13:59:07', NULL);
INSERT INTO `module_visibility` VALUES(65, '2011-08-24 08:45:34', NULL);
INSERT INTO `module_visibility` VALUES(66, '2011-08-24 08:46:01', NULL);
INSERT INTO `module_visibility` VALUES(67, '2011-08-24 08:46:07', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_visibility_menuitem`
--

CREATE TABLE `module_visibility_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulevisibility_id` int(11) NOT NULL,
  `menuitem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modulevisibility_id` (`modulevisibility_id`,`menuitem_id`),
  KEY `module_visibility_menuitem_a47bb30` (`modulevisibility_id`),
  KEY `module_visibility_menuitem_f8c10b8c` (`menuitem_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Zrzut danych tabeli `module_visibility_menuitem`
--

INSERT INTO `module_visibility_menuitem` VALUES(13, 11, 1);
INSERT INTO `module_visibility_menuitem` VALUES(3, 13, 1);
INSERT INTO `module_visibility_menuitem` VALUES(4, 13, 2);
INSERT INTO `module_visibility_menuitem` VALUES(5, 22, 1);
INSERT INTO `module_visibility_menuitem` VALUES(6, 22, 2);
INSERT INTO `module_visibility_menuitem` VALUES(7, 24, 1);
INSERT INTO `module_visibility_menuitem` VALUES(8, 24, 2);
INSERT INTO `module_visibility_menuitem` VALUES(9, 24, 3);
INSERT INTO `module_visibility_menuitem` VALUES(10, 24, 4);
INSERT INTO `module_visibility_menuitem` VALUES(11, 24, 5);
INSERT INTO `module_visibility_menuitem` VALUES(12, 27, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `module_visibility_sites`
--

CREATE TABLE `module_visibility_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulevisibility_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modulevisibility_id` (`modulevisibility_id`,`site_id`),
  KEY `module_visibility_sites_a47bb30` (`modulevisibility_id`),
  KEY `module_visibility_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `module_visibility_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `write` tinyint(1) NOT NULL,
  `delete` tinyint(1) NOT NULL,
  `add` tinyint(1) NOT NULL,
  `own_only` tinyint(1) NOT NULL,
  `model` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_groups_63f17a16` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=403 ;

--
-- Zrzut danych tabeli `permission_groups`
--

INSERT INTO `permission_groups` VALUES(1, 'User', 1, 1, 0, 0, 0, 0, '', NULL);
INSERT INTO `permission_groups` VALUES(2, 'Admin', 0, 1, 1, 1, 1, 0, '', NULL);
INSERT INTO `permission_groups` VALUES(97, 'Kategorie', 0, 1, 1, 1, 1, 0, 'Category', 2);
INSERT INTO `permission_groups` VALUES(98, 'Artykuły', 0, 1, 1, 1, 1, 0, 'Article', 2);
INSERT INTO `permission_groups` VALUES(99, 'Użytkownicy', 0, 1, 1, 1, 1, 0, 'UserProfile', 2);
INSERT INTO `permission_groups` VALUES(100, 'Wiki', 0, 1, 1, 1, 1, 0, 'Wiki', 2);
INSERT INTO `permission_groups` VALUES(101, 'Strony', 0, 1, 1, 1, 1, 0, 'SitePortal', 2);
INSERT INTO `permission_groups` VALUES(102, 'Szablony', 0, 1, 1, 1, 1, 0, 'Sheet', 2);
INSERT INTO `permission_groups` VALUES(103, 'Kursy', 0, 1, 1, 1, 1, 0, 'RepetitioCourse', 2);
INSERT INTO `permission_groups` VALUES(104, 'Testy', 0, 1, 1, 1, 1, 0, 'RepetitioTest', 2);
INSERT INTO `permission_groups` VALUES(105, 'Pytania', 0, 1, 1, 1, 1, 0, 'RepetitioQuestion', 2);
INSERT INTO `permission_groups` VALUES(106, 'Moduły', 0, 1, 1, 1, 1, 0, 'RegisteredModule', 2);
INSERT INTO `permission_groups` VALUES(107, 'Pozycje modułów', 0, 1, 1, 1, 1, 0, 'ModulePosition', 2);
INSERT INTO `permission_groups` VALUES(108, 'Elementy menu', 0, 1, 1, 1, 1, 0, 'MenuItem', 2);
INSERT INTO `permission_groups` VALUES(109, 'Menu', 0, 1, 1, 1, 1, 0, 'Menu', 2);
INSERT INTO `permission_groups` VALUES(110, 'MegaMenu', 0, 1, 1, 1, 1, 0, 'MegaMenu', 2);
INSERT INTO `permission_groups` VALUES(111, 'Zdjęcia', 0, 1, 1, 1, 1, 0, 'Image', 2);
INSERT INTO `permission_groups` VALUES(112, 'Galerie', 0, 1, 1, 1, 1, 0, 'Gallery', 2);
INSERT INTO `permission_groups` VALUES(113, 'Elementy katalogu', 0, 1, 1, 1, 1, 0, 'CatalogItem', 2);
INSERT INTO `permission_groups` VALUES(114, 'Kategorie katalogu', 0, 1, 1, 1, 1, 0, 'CatalogCategory', 2);
INSERT INTO `permission_groups` VALUES(115, 'Zdjęcia katalogu', 0, 1, 1, 1, 1, 0, 'CatalogImage', 2);
INSERT INTO `permission_groups` VALUES(116, 'Kalendarze', 0, 1, 1, 1, 1, 0, 'Calendar', 2);
INSERT INTO `permission_groups` VALUES(117, 'Wydarzenia', 0, 1, 1, 1, 1, 0, 'CalendarEvent', 2);
INSERT INTO `permission_groups` VALUES(118, 'Typy wydarzeń', 0, 1, 1, 1, 1, 0, 'CalendarEventType', 2);
INSERT INTO `permission_groups` VALUES(119, 'Kategorie ogłoszeń', 0, 1, 1, 1, 1, 0, 'AdCategory', 2);
INSERT INTO `permission_groups` VALUES(120, 'Ogłoszenia', 0, 1, 1, 1, 1, 0, 'Ad', 2);
INSERT INTO `permission_groups` VALUES(121, 'Zdjęcia ogłoszeń', 0, 1, 1, 1, 1, 0, 'AdImage', 2);
INSERT INTO `permission_groups` VALUES(122, 'Kategorie', 1, 1, 0, 0, 0, 0, 'Category', 1);
INSERT INTO `permission_groups` VALUES(123, 'Artykuły', 1, 1, 0, 0, 0, 0, 'Article', 1);
INSERT INTO `permission_groups` VALUES(124, 'Użytkownicy', 1, 1, 0, 0, 0, 0, 'UserProfile', 1);
INSERT INTO `permission_groups` VALUES(125, 'Wiki', 1, 1, 0, 0, 0, 0, 'Wiki', 1);
INSERT INTO `permission_groups` VALUES(126, 'Strony', 1, 1, 0, 0, 0, 0, 'SitePortal', 1);
INSERT INTO `permission_groups` VALUES(127, 'Szablony', 1, 1, 0, 0, 0, 0, 'Sheet', 1);
INSERT INTO `permission_groups` VALUES(128, 'Kursy', 1, 1, 0, 0, 0, 0, 'RepetitioCourse', 1);
INSERT INTO `permission_groups` VALUES(129, 'Testy', 1, 1, 0, 0, 0, 0, 'RepetitioTest', 1);
INSERT INTO `permission_groups` VALUES(130, 'Pytania', 1, 1, 0, 0, 0, 0, 'RepetitioQuestion', 1);
INSERT INTO `permission_groups` VALUES(131, 'Odpowiedzi', 1, 1, 0, 0, 0, 0, 'RepetitioAnswer', 1);
INSERT INTO `permission_groups` VALUES(132, 'Moduły', 1, 1, 0, 0, 0, 0, 'RegisteredModule', 1);
INSERT INTO `permission_groups` VALUES(133, 'Pozycje modułów', 1, 1, 0, 0, 0, 0, 'ModulePosition', 1);
INSERT INTO `permission_groups` VALUES(134, 'Elementy menu', 1, 1, 0, 0, 0, 0, 'MenuItem', 1);
INSERT INTO `permission_groups` VALUES(135, 'Menu', 1, 1, 0, 0, 0, 0, 'Menu', 1);
INSERT INTO `permission_groups` VALUES(136, 'MegaMenu', 1, 1, 0, 0, 0, 0, 'MegaMenu', 1);
INSERT INTO `permission_groups` VALUES(137, 'Zdjęcia', 1, 1, 0, 0, 0, 0, 'Image', 1);
INSERT INTO `permission_groups` VALUES(138, 'Galerie', 1, 1, 0, 0, 0, 0, 'Gallery', 1);
INSERT INTO `permission_groups` VALUES(139, 'Elementy katalogu', 1, 1, 0, 0, 0, 0, 'CatalogItem', 1);
INSERT INTO `permission_groups` VALUES(140, 'Kategorie katalogu', 1, 1, 0, 0, 0, 0, 'CatalogCategory', 1);
INSERT INTO `permission_groups` VALUES(141, 'Zdjęcia katalogu', 1, 1, 0, 0, 0, 0, 'CatalogImage', 1);
INSERT INTO `permission_groups` VALUES(142, 'Kalendarze', 1, 1, 0, 0, 0, 0, 'Calendar', 1);
INSERT INTO `permission_groups` VALUES(143, 'Wydarzenia', 1, 1, 0, 0, 0, 0, 'CalendarEvent', 1);
INSERT INTO `permission_groups` VALUES(144, 'Typy wydarzeń', 1, 1, 0, 0, 0, 0, 'CalendarEventType', 1);
INSERT INTO `permission_groups` VALUES(145, 'Kategorie ogłoszeń', 1, 1, 0, 0, 0, 0, 'AdCategory', 1);
INSERT INTO `permission_groups` VALUES(146, 'Ogłoszenia', 1, 1, 0, 0, 0, 0, 'Ad', 1);
INSERT INTO `permission_groups` VALUES(147, 'Zdjęcia ogłoszeń', 1, 1, 0, 0, 0, 0, 'AdImage', 1);
INSERT INTO `permission_groups` VALUES(148, 'Kategorie: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 122);
INSERT INTO `permission_groups` VALUES(149, 'Kategorie: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 122);
INSERT INTO `permission_groups` VALUES(150, 'Kategorie: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 122);
INSERT INTO `permission_groups` VALUES(151, 'Kategorie: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 122);
INSERT INTO `permission_groups` VALUES(152, 'Kategorie: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 122);
INSERT INTO `permission_groups` VALUES(153, 'Artykuły: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 123);
INSERT INTO `permission_groups` VALUES(154, 'Artykuły: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 123);
INSERT INTO `permission_groups` VALUES(155, 'Artykuły: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 123);
INSERT INTO `permission_groups` VALUES(156, 'Artykuły: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 123);
INSERT INTO `permission_groups` VALUES(157, 'Artykuły: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 123);
INSERT INTO `permission_groups` VALUES(158, 'Użytkownicy: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 124);
INSERT INTO `permission_groups` VALUES(159, 'Użytkownicy: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 124);
INSERT INTO `permission_groups` VALUES(160, 'Użytkownicy: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 124);
INSERT INTO `permission_groups` VALUES(161, 'Użytkownicy: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 124);
INSERT INTO `permission_groups` VALUES(162, 'Użytkownicy: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 124);
INSERT INTO `permission_groups` VALUES(163, 'Wiki: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 125);
INSERT INTO `permission_groups` VALUES(164, 'Wiki: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 125);
INSERT INTO `permission_groups` VALUES(165, 'Wiki: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 125);
INSERT INTO `permission_groups` VALUES(166, 'Wiki: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 125);
INSERT INTO `permission_groups` VALUES(167, 'Wiki: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 125);
INSERT INTO `permission_groups` VALUES(168, 'Strony: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 126);
INSERT INTO `permission_groups` VALUES(169, 'Strony: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 126);
INSERT INTO `permission_groups` VALUES(170, 'Strony: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 126);
INSERT INTO `permission_groups` VALUES(171, 'Strony: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 126);
INSERT INTO `permission_groups` VALUES(172, 'Strony: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 126);
INSERT INTO `permission_groups` VALUES(173, 'Szablony: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 127);
INSERT INTO `permission_groups` VALUES(174, 'Szablony: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 127);
INSERT INTO `permission_groups` VALUES(175, 'Szablony: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 127);
INSERT INTO `permission_groups` VALUES(176, 'Szablony: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 127);
INSERT INTO `permission_groups` VALUES(177, 'Szablony: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 127);
INSERT INTO `permission_groups` VALUES(178, 'Kursy: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 128);
INSERT INTO `permission_groups` VALUES(179, 'Kursy: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 128);
INSERT INTO `permission_groups` VALUES(180, 'Kursy: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 128);
INSERT INTO `permission_groups` VALUES(181, 'Kursy: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 128);
INSERT INTO `permission_groups` VALUES(182, 'Kursy: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 128);
INSERT INTO `permission_groups` VALUES(183, 'Testy: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 129);
INSERT INTO `permission_groups` VALUES(184, 'Testy: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 129);
INSERT INTO `permission_groups` VALUES(185, 'Testy: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 129);
INSERT INTO `permission_groups` VALUES(186, 'Testy: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 129);
INSERT INTO `permission_groups` VALUES(187, 'Testy: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 129);
INSERT INTO `permission_groups` VALUES(188, 'Pytania: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 130);
INSERT INTO `permission_groups` VALUES(189, 'Pytania: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 130);
INSERT INTO `permission_groups` VALUES(190, 'Pytania: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 130);
INSERT INTO `permission_groups` VALUES(191, 'Pytania: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 130);
INSERT INTO `permission_groups` VALUES(192, 'Pytania: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 130);
INSERT INTO `permission_groups` VALUES(193, 'Odpowiedzi: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 131);
INSERT INTO `permission_groups` VALUES(194, 'Odpowiedzi: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 131);
INSERT INTO `permission_groups` VALUES(195, 'Odpowiedzi: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 131);
INSERT INTO `permission_groups` VALUES(196, 'Odpowiedzi: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 131);
INSERT INTO `permission_groups` VALUES(197, 'Odpowiedzi: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 131);
INSERT INTO `permission_groups` VALUES(198, 'Moduły: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 132);
INSERT INTO `permission_groups` VALUES(199, 'Moduły: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 132);
INSERT INTO `permission_groups` VALUES(200, 'Moduły: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 132);
INSERT INTO `permission_groups` VALUES(201, 'Moduły: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 132);
INSERT INTO `permission_groups` VALUES(202, 'Moduły: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 132);
INSERT INTO `permission_groups` VALUES(203, 'Pozycje modułów: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 133);
INSERT INTO `permission_groups` VALUES(204, 'Pozycje modułów: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 133);
INSERT INTO `permission_groups` VALUES(205, 'Pozycje modułów: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 133);
INSERT INTO `permission_groups` VALUES(206, 'Pozycje modułów: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 133);
INSERT INTO `permission_groups` VALUES(207, 'Pozycje modułów: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 133);
INSERT INTO `permission_groups` VALUES(208, 'Elementy menu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 134);
INSERT INTO `permission_groups` VALUES(209, 'Elementy menu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 134);
INSERT INTO `permission_groups` VALUES(210, 'Elementy menu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 134);
INSERT INTO `permission_groups` VALUES(211, 'Elementy menu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 134);
INSERT INTO `permission_groups` VALUES(212, 'Elementy menu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 134);
INSERT INTO `permission_groups` VALUES(213, 'Menu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 135);
INSERT INTO `permission_groups` VALUES(214, 'Menu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 135);
INSERT INTO `permission_groups` VALUES(215, 'Menu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 135);
INSERT INTO `permission_groups` VALUES(216, 'Menu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 135);
INSERT INTO `permission_groups` VALUES(217, 'Menu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 135);
INSERT INTO `permission_groups` VALUES(218, 'MegaMenu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 136);
INSERT INTO `permission_groups` VALUES(219, 'MegaMenu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 136);
INSERT INTO `permission_groups` VALUES(220, 'MegaMenu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 136);
INSERT INTO `permission_groups` VALUES(221, 'MegaMenu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 136);
INSERT INTO `permission_groups` VALUES(222, 'MegaMenu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 136);
INSERT INTO `permission_groups` VALUES(223, 'Zdjęcia: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 137);
INSERT INTO `permission_groups` VALUES(224, 'Zdjęcia: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 137);
INSERT INTO `permission_groups` VALUES(225, 'Zdjęcia: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 137);
INSERT INTO `permission_groups` VALUES(226, 'Zdjęcia: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 137);
INSERT INTO `permission_groups` VALUES(227, 'Zdjęcia: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 137);
INSERT INTO `permission_groups` VALUES(228, 'Galerie: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 138);
INSERT INTO `permission_groups` VALUES(229, 'Galerie: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 138);
INSERT INTO `permission_groups` VALUES(230, 'Galerie: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 138);
INSERT INTO `permission_groups` VALUES(231, 'Galerie: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 138);
INSERT INTO `permission_groups` VALUES(232, 'Galerie: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 138);
INSERT INTO `permission_groups` VALUES(233, 'Elementy katalogu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 139);
INSERT INTO `permission_groups` VALUES(234, 'Elementy katalogu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 139);
INSERT INTO `permission_groups` VALUES(235, 'Elementy katalogu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 139);
INSERT INTO `permission_groups` VALUES(236, 'Elementy katalogu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 139);
INSERT INTO `permission_groups` VALUES(237, 'Elementy katalogu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 139);
INSERT INTO `permission_groups` VALUES(238, 'Kategorie katalogu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 140);
INSERT INTO `permission_groups` VALUES(239, 'Kategorie katalogu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 140);
INSERT INTO `permission_groups` VALUES(240, 'Kategorie katalogu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 140);
INSERT INTO `permission_groups` VALUES(241, 'Kategorie katalogu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 140);
INSERT INTO `permission_groups` VALUES(242, 'Kategorie katalogu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 140);
INSERT INTO `permission_groups` VALUES(243, 'Zdjęcia katalogu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 141);
INSERT INTO `permission_groups` VALUES(244, 'Zdjęcia katalogu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 141);
INSERT INTO `permission_groups` VALUES(245, 'Zdjęcia katalogu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 141);
INSERT INTO `permission_groups` VALUES(246, 'Zdjęcia katalogu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 141);
INSERT INTO `permission_groups` VALUES(247, 'Zdjęcia katalogu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 141);
INSERT INTO `permission_groups` VALUES(248, 'Kalendarze: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 142);
INSERT INTO `permission_groups` VALUES(249, 'Kalendarze: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 142);
INSERT INTO `permission_groups` VALUES(250, 'Kalendarze: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 142);
INSERT INTO `permission_groups` VALUES(251, 'Kalendarze: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 142);
INSERT INTO `permission_groups` VALUES(252, 'Kalendarze: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 142);
INSERT INTO `permission_groups` VALUES(253, 'Wydarzenia: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 143);
INSERT INTO `permission_groups` VALUES(254, 'Wydarzenia: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 143);
INSERT INTO `permission_groups` VALUES(255, 'Wydarzenia: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 143);
INSERT INTO `permission_groups` VALUES(256, 'Wydarzenia: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 143);
INSERT INTO `permission_groups` VALUES(257, 'Wydarzenia: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 143);
INSERT INTO `permission_groups` VALUES(258, 'Typy wydarzeń: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 144);
INSERT INTO `permission_groups` VALUES(259, 'Typy wydarzeń: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 144);
INSERT INTO `permission_groups` VALUES(260, 'Typy wydarzeń: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 144);
INSERT INTO `permission_groups` VALUES(261, 'Typy wydarzeń: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 144);
INSERT INTO `permission_groups` VALUES(262, 'Typy wydarzeń: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 144);
INSERT INTO `permission_groups` VALUES(263, 'Kategorie ogłoszeń: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 145);
INSERT INTO `permission_groups` VALUES(264, 'Kategorie ogłoszeń: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 145);
INSERT INTO `permission_groups` VALUES(265, 'Kategorie ogłoszeń: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 145);
INSERT INTO `permission_groups` VALUES(266, 'Kategorie ogłoszeń: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 145);
INSERT INTO `permission_groups` VALUES(267, 'Kategorie ogłoszeń: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 145);
INSERT INTO `permission_groups` VALUES(268, 'Ogłoszenia: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 146);
INSERT INTO `permission_groups` VALUES(269, 'Ogłoszenia: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 146);
INSERT INTO `permission_groups` VALUES(270, 'Ogłoszenia: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 146);
INSERT INTO `permission_groups` VALUES(271, 'Ogłoszenia: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 146);
INSERT INTO `permission_groups` VALUES(272, 'Ogłoszenia: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 146);
INSERT INTO `permission_groups` VALUES(273, 'Zdjęcia ogłoszeń: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, '', 147);
INSERT INTO `permission_groups` VALUES(274, 'Zdjęcia ogłoszeń: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, '', 147);
INSERT INTO `permission_groups` VALUES(275, 'Zdjęcia ogłoszeń: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, '', 147);
INSERT INTO `permission_groups` VALUES(276, 'Zdjęcia ogłoszeń: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, '', 147);
INSERT INTO `permission_groups` VALUES(277, 'Zdjęcia ogłoszeń: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, '', 147);
INSERT INTO `permission_groups` VALUES(278, 'Kategorie: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 97);
INSERT INTO `permission_groups` VALUES(279, 'Kategorie: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 97);
INSERT INTO `permission_groups` VALUES(280, 'Kategorie: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 97);
INSERT INTO `permission_groups` VALUES(281, 'Kategorie: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 97);
INSERT INTO `permission_groups` VALUES(282, 'Kategorie: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 97);
INSERT INTO `permission_groups` VALUES(283, 'Artykuły: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 98);
INSERT INTO `permission_groups` VALUES(284, 'Artykuły: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 98);
INSERT INTO `permission_groups` VALUES(285, 'Artykuły: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 98);
INSERT INTO `permission_groups` VALUES(286, 'Artykuły: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 98);
INSERT INTO `permission_groups` VALUES(287, 'Artykuły: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 98);
INSERT INTO `permission_groups` VALUES(288, 'Użytkownicy: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 99);
INSERT INTO `permission_groups` VALUES(289, 'Użytkownicy: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 99);
INSERT INTO `permission_groups` VALUES(290, 'Użytkownicy: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 99);
INSERT INTO `permission_groups` VALUES(291, 'Użytkownicy: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 99);
INSERT INTO `permission_groups` VALUES(292, 'Użytkownicy: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 99);
INSERT INTO `permission_groups` VALUES(293, 'Wiki: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 100);
INSERT INTO `permission_groups` VALUES(294, 'Wiki: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 100);
INSERT INTO `permission_groups` VALUES(295, 'Wiki: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 100);
INSERT INTO `permission_groups` VALUES(296, 'Wiki: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 100);
INSERT INTO `permission_groups` VALUES(297, 'Wiki: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 100);
INSERT INTO `permission_groups` VALUES(298, 'Strony: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 101);
INSERT INTO `permission_groups` VALUES(299, 'Strony: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 101);
INSERT INTO `permission_groups` VALUES(300, 'Strony: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 101);
INSERT INTO `permission_groups` VALUES(301, 'Strony: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 101);
INSERT INTO `permission_groups` VALUES(302, 'Strony: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 101);
INSERT INTO `permission_groups` VALUES(303, 'Szablony: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 102);
INSERT INTO `permission_groups` VALUES(304, 'Szablony: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 102);
INSERT INTO `permission_groups` VALUES(305, 'Szablony: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 102);
INSERT INTO `permission_groups` VALUES(306, 'Szablony: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 102);
INSERT INTO `permission_groups` VALUES(307, 'Szablony: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 102);
INSERT INTO `permission_groups` VALUES(308, 'Kursy: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 103);
INSERT INTO `permission_groups` VALUES(309, 'Kursy: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 103);
INSERT INTO `permission_groups` VALUES(310, 'Kursy: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 103);
INSERT INTO `permission_groups` VALUES(311, 'Kursy: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 103);
INSERT INTO `permission_groups` VALUES(312, 'Kursy: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 103);
INSERT INTO `permission_groups` VALUES(313, 'Testy: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 104);
INSERT INTO `permission_groups` VALUES(314, 'Testy: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 104);
INSERT INTO `permission_groups` VALUES(315, 'Testy: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 104);
INSERT INTO `permission_groups` VALUES(316, 'Testy: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 104);
INSERT INTO `permission_groups` VALUES(317, 'Testy: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 104);
INSERT INTO `permission_groups` VALUES(318, 'Pytania: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 105);
INSERT INTO `permission_groups` VALUES(319, 'Pytania: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 105);
INSERT INTO `permission_groups` VALUES(320, 'Pytania: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 105);
INSERT INTO `permission_groups` VALUES(321, 'Pytania: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 105);
INSERT INTO `permission_groups` VALUES(322, 'Pytania: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 105);
INSERT INTO `permission_groups` VALUES(323, 'Moduły: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 106);
INSERT INTO `permission_groups` VALUES(324, 'Moduły: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 106);
INSERT INTO `permission_groups` VALUES(325, 'Moduły: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 106);
INSERT INTO `permission_groups` VALUES(326, 'Moduły: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 106);
INSERT INTO `permission_groups` VALUES(327, 'Moduły: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 106);
INSERT INTO `permission_groups` VALUES(328, 'Pozycje modułów: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 107);
INSERT INTO `permission_groups` VALUES(329, 'Pozycje modułów: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 107);
INSERT INTO `permission_groups` VALUES(330, 'Pozycje modułów: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 107);
INSERT INTO `permission_groups` VALUES(331, 'Pozycje modułów: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 107);
INSERT INTO `permission_groups` VALUES(332, 'Pozycje modułów: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 107);
INSERT INTO `permission_groups` VALUES(333, 'Elementy menu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 108);
INSERT INTO `permission_groups` VALUES(334, 'Elementy menu: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 108);
INSERT INTO `permission_groups` VALUES(335, 'Elementy menu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 108);
INSERT INTO `permission_groups` VALUES(336, 'Elementy menu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 108);
INSERT INTO `permission_groups` VALUES(337, 'Elementy menu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 108);
INSERT INTO `permission_groups` VALUES(338, 'Menu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 109);
INSERT INTO `permission_groups` VALUES(339, 'Menu: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 109);
INSERT INTO `permission_groups` VALUES(340, 'Menu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 109);
INSERT INTO `permission_groups` VALUES(341, 'Menu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 109);
INSERT INTO `permission_groups` VALUES(342, 'Menu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 109);
INSERT INTO `permission_groups` VALUES(343, 'MegaMenu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 110);
INSERT INTO `permission_groups` VALUES(344, 'MegaMenu: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 110);
INSERT INTO `permission_groups` VALUES(345, 'MegaMenu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 110);
INSERT INTO `permission_groups` VALUES(346, 'MegaMenu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 110);
INSERT INTO `permission_groups` VALUES(347, 'MegaMenu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 110);
INSERT INTO `permission_groups` VALUES(348, 'Zdjęcia: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 111);
INSERT INTO `permission_groups` VALUES(349, 'Zdjęcia: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 111);
INSERT INTO `permission_groups` VALUES(350, 'Zdjęcia: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 111);
INSERT INTO `permission_groups` VALUES(351, 'Zdjęcia: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 111);
INSERT INTO `permission_groups` VALUES(352, 'Zdjęcia: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 111);
INSERT INTO `permission_groups` VALUES(353, 'Galerie: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 112);
INSERT INTO `permission_groups` VALUES(354, 'Galerie: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 112);
INSERT INTO `permission_groups` VALUES(355, 'Galerie: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 112);
INSERT INTO `permission_groups` VALUES(356, 'Galerie: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 112);
INSERT INTO `permission_groups` VALUES(357, 'Galerie: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 112);
INSERT INTO `permission_groups` VALUES(358, 'Elementy katalogu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 113);
INSERT INTO `permission_groups` VALUES(359, 'Elementy katalogu: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 113);
INSERT INTO `permission_groups` VALUES(360, 'Elementy katalogu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 113);
INSERT INTO `permission_groups` VALUES(361, 'Elementy katalogu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 113);
INSERT INTO `permission_groups` VALUES(362, 'Elementy katalogu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 113);
INSERT INTO `permission_groups` VALUES(363, 'Kategorie katalogu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 114);
INSERT INTO `permission_groups` VALUES(364, 'Kategorie katalogu: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 114);
INSERT INTO `permission_groups` VALUES(365, 'Kategorie katalogu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 114);
INSERT INTO `permission_groups` VALUES(366, 'Kategorie katalogu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 114);
INSERT INTO `permission_groups` VALUES(367, 'Kategorie katalogu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 114);
INSERT INTO `permission_groups` VALUES(368, 'Zdjęcia katalogu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 115);
INSERT INTO `permission_groups` VALUES(369, 'Zdjęcia katalogu: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 115);
INSERT INTO `permission_groups` VALUES(370, 'Zdjęcia katalogu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 115);
INSERT INTO `permission_groups` VALUES(371, 'Zdjęcia katalogu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 115);
INSERT INTO `permission_groups` VALUES(372, 'Zdjęcia katalogu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 115);
INSERT INTO `permission_groups` VALUES(373, 'Kalendarze: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 116);
INSERT INTO `permission_groups` VALUES(374, 'Kalendarze: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 116);
INSERT INTO `permission_groups` VALUES(375, 'Kalendarze: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 116);
INSERT INTO `permission_groups` VALUES(376, 'Kalendarze: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 116);
INSERT INTO `permission_groups` VALUES(377, 'Kalendarze: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 116);
INSERT INTO `permission_groups` VALUES(378, 'Wydarzenia: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 117);
INSERT INTO `permission_groups` VALUES(379, 'Wydarzenia: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 117);
INSERT INTO `permission_groups` VALUES(380, 'Wydarzenia: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 117);
INSERT INTO `permission_groups` VALUES(381, 'Wydarzenia: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 117);
INSERT INTO `permission_groups` VALUES(382, 'Wydarzenia: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 117);
INSERT INTO `permission_groups` VALUES(383, 'Typy wydarzeń: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 118);
INSERT INTO `permission_groups` VALUES(384, 'Typy wydarzeń: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 118);
INSERT INTO `permission_groups` VALUES(385, 'Typy wydarzeń: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 118);
INSERT INTO `permission_groups` VALUES(386, 'Typy wydarzeń: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 118);
INSERT INTO `permission_groups` VALUES(387, 'Typy wydarzeń: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 118);
INSERT INTO `permission_groups` VALUES(388, 'Kategorie ogłoszeń: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 119);
INSERT INTO `permission_groups` VALUES(389, 'Kategorie ogłoszeń: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 119);
INSERT INTO `permission_groups` VALUES(390, 'Kategorie ogłoszeń: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 119);
INSERT INTO `permission_groups` VALUES(391, 'Kategorie ogłoszeń: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 119);
INSERT INTO `permission_groups` VALUES(392, 'Kategorie ogłoszeń: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 119);
INSERT INTO `permission_groups` VALUES(393, 'Ogłoszenia: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 120);
INSERT INTO `permission_groups` VALUES(394, 'Ogłoszenia: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 120);
INSERT INTO `permission_groups` VALUES(395, 'Ogłoszenia: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 120);
INSERT INTO `permission_groups` VALUES(396, 'Ogłoszenia: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 120);
INSERT INTO `permission_groups` VALUES(397, 'Ogłoszenia: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 120);
INSERT INTO `permission_groups` VALUES(398, 'Zdjęcia ogłoszeń: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, '', 121);
INSERT INTO `permission_groups` VALUES(399, 'Zdjęcia ogłoszeń: Admin - Edycja', 0, 0, 1, 0, 0, 0, '', 121);
INSERT INTO `permission_groups` VALUES(400, 'Zdjęcia ogłoszeń: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, '', 121);
INSERT INTO `permission_groups` VALUES(401, 'Zdjęcia ogłoszeń: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, '', 121);
INSERT INTO `permission_groups` VALUES(402, 'Zdjęcia ogłoszeń: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, '', 121);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `registerhash` varchar(255) DEFAULT NULL,
  `userhash` varchar(255) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `lastip` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `registerdate` datetime NOT NULL,
  `emailsenddate` datetime DEFAULT NULL,
  `admincomment` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `profiles`
--

INSERT INTO `profiles` VALUES(3, 'admin', 'admin123', 'your@email.xxx', NULL, NULL, '2011-08-29 10:15:27', '127.0.0.1', 0, 1, '2011-08-28 18:47:23', NULL, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `profiles_permissions`
--

CREATE TABLE `profiles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_id` (`userprofile_id`,`permisiongroup_id`),
  KEY `profiles_permissions_1be3128f` (`userprofile_id`),
  KEY `profiles_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2403 ;

--
-- Zrzut danych tabeli `profiles_permissions`
--

INSERT INTO `profiles_permissions` VALUES(1902, 1, 278);
INSERT INTO `profiles_permissions` VALUES(1903, 1, 279);
INSERT INTO `profiles_permissions` VALUES(1904, 1, 280);
INSERT INTO `profiles_permissions` VALUES(1905, 1, 281);
INSERT INTO `profiles_permissions` VALUES(1906, 1, 282);
INSERT INTO `profiles_permissions` VALUES(1907, 1, 283);
INSERT INTO `profiles_permissions` VALUES(1908, 1, 284);
INSERT INTO `profiles_permissions` VALUES(1909, 1, 285);
INSERT INTO `profiles_permissions` VALUES(1910, 1, 286);
INSERT INTO `profiles_permissions` VALUES(1911, 1, 287);
INSERT INTO `profiles_permissions` VALUES(1912, 1, 288);
INSERT INTO `profiles_permissions` VALUES(1913, 1, 289);
INSERT INTO `profiles_permissions` VALUES(1914, 1, 290);
INSERT INTO `profiles_permissions` VALUES(1915, 1, 291);
INSERT INTO `profiles_permissions` VALUES(1916, 1, 292);
INSERT INTO `profiles_permissions` VALUES(1917, 1, 293);
INSERT INTO `profiles_permissions` VALUES(1918, 1, 294);
INSERT INTO `profiles_permissions` VALUES(1919, 1, 295);
INSERT INTO `profiles_permissions` VALUES(1920, 1, 296);
INSERT INTO `profiles_permissions` VALUES(1921, 1, 297);
INSERT INTO `profiles_permissions` VALUES(1922, 1, 298);
INSERT INTO `profiles_permissions` VALUES(1923, 1, 299);
INSERT INTO `profiles_permissions` VALUES(1924, 1, 300);
INSERT INTO `profiles_permissions` VALUES(1925, 1, 301);
INSERT INTO `profiles_permissions` VALUES(1926, 1, 302);
INSERT INTO `profiles_permissions` VALUES(1927, 1, 303);
INSERT INTO `profiles_permissions` VALUES(1928, 1, 304);
INSERT INTO `profiles_permissions` VALUES(1929, 1, 305);
INSERT INTO `profiles_permissions` VALUES(1930, 1, 306);
INSERT INTO `profiles_permissions` VALUES(1931, 1, 307);
INSERT INTO `profiles_permissions` VALUES(1932, 1, 308);
INSERT INTO `profiles_permissions` VALUES(1933, 1, 309);
INSERT INTO `profiles_permissions` VALUES(1934, 1, 310);
INSERT INTO `profiles_permissions` VALUES(1935, 1, 311);
INSERT INTO `profiles_permissions` VALUES(1936, 1, 312);
INSERT INTO `profiles_permissions` VALUES(1937, 1, 313);
INSERT INTO `profiles_permissions` VALUES(1938, 1, 314);
INSERT INTO `profiles_permissions` VALUES(1939, 1, 315);
INSERT INTO `profiles_permissions` VALUES(1940, 1, 316);
INSERT INTO `profiles_permissions` VALUES(1941, 1, 317);
INSERT INTO `profiles_permissions` VALUES(1942, 1, 318);
INSERT INTO `profiles_permissions` VALUES(1943, 1, 319);
INSERT INTO `profiles_permissions` VALUES(1944, 1, 320);
INSERT INTO `profiles_permissions` VALUES(1945, 1, 321);
INSERT INTO `profiles_permissions` VALUES(1946, 1, 322);
INSERT INTO `profiles_permissions` VALUES(1947, 1, 323);
INSERT INTO `profiles_permissions` VALUES(1948, 1, 324);
INSERT INTO `profiles_permissions` VALUES(1949, 1, 325);
INSERT INTO `profiles_permissions` VALUES(1950, 1, 326);
INSERT INTO `profiles_permissions` VALUES(1951, 1, 327);
INSERT INTO `profiles_permissions` VALUES(1952, 1, 328);
INSERT INTO `profiles_permissions` VALUES(1953, 1, 329);
INSERT INTO `profiles_permissions` VALUES(1954, 1, 330);
INSERT INTO `profiles_permissions` VALUES(1955, 1, 331);
INSERT INTO `profiles_permissions` VALUES(1956, 1, 332);
INSERT INTO `profiles_permissions` VALUES(1957, 1, 333);
INSERT INTO `profiles_permissions` VALUES(1958, 1, 334);
INSERT INTO `profiles_permissions` VALUES(1959, 1, 335);
INSERT INTO `profiles_permissions` VALUES(1960, 1, 336);
INSERT INTO `profiles_permissions` VALUES(1961, 1, 337);
INSERT INTO `profiles_permissions` VALUES(1962, 1, 338);
INSERT INTO `profiles_permissions` VALUES(1963, 1, 339);
INSERT INTO `profiles_permissions` VALUES(1964, 1, 340);
INSERT INTO `profiles_permissions` VALUES(1965, 1, 341);
INSERT INTO `profiles_permissions` VALUES(1966, 1, 342);
INSERT INTO `profiles_permissions` VALUES(1967, 1, 343);
INSERT INTO `profiles_permissions` VALUES(1968, 1, 344);
INSERT INTO `profiles_permissions` VALUES(1969, 1, 345);
INSERT INTO `profiles_permissions` VALUES(1970, 1, 346);
INSERT INTO `profiles_permissions` VALUES(1971, 1, 347);
INSERT INTO `profiles_permissions` VALUES(1972, 1, 348);
INSERT INTO `profiles_permissions` VALUES(1973, 1, 349);
INSERT INTO `profiles_permissions` VALUES(1974, 1, 350);
INSERT INTO `profiles_permissions` VALUES(1975, 1, 351);
INSERT INTO `profiles_permissions` VALUES(1976, 1, 352);
INSERT INTO `profiles_permissions` VALUES(1977, 1, 353);
INSERT INTO `profiles_permissions` VALUES(1978, 1, 354);
INSERT INTO `profiles_permissions` VALUES(1979, 1, 355);
INSERT INTO `profiles_permissions` VALUES(1980, 1, 356);
INSERT INTO `profiles_permissions` VALUES(1981, 1, 357);
INSERT INTO `profiles_permissions` VALUES(1982, 1, 358);
INSERT INTO `profiles_permissions` VALUES(1983, 1, 359);
INSERT INTO `profiles_permissions` VALUES(1984, 1, 360);
INSERT INTO `profiles_permissions` VALUES(1985, 1, 361);
INSERT INTO `profiles_permissions` VALUES(1986, 1, 362);
INSERT INTO `profiles_permissions` VALUES(1987, 1, 363);
INSERT INTO `profiles_permissions` VALUES(1988, 1, 364);
INSERT INTO `profiles_permissions` VALUES(1989, 1, 365);
INSERT INTO `profiles_permissions` VALUES(1990, 1, 366);
INSERT INTO `profiles_permissions` VALUES(1991, 1, 367);
INSERT INTO `profiles_permissions` VALUES(1992, 1, 368);
INSERT INTO `profiles_permissions` VALUES(1993, 1, 369);
INSERT INTO `profiles_permissions` VALUES(1994, 1, 370);
INSERT INTO `profiles_permissions` VALUES(1995, 1, 371);
INSERT INTO `profiles_permissions` VALUES(1996, 1, 372);
INSERT INTO `profiles_permissions` VALUES(1997, 1, 373);
INSERT INTO `profiles_permissions` VALUES(1998, 1, 374);
INSERT INTO `profiles_permissions` VALUES(1999, 1, 375);
INSERT INTO `profiles_permissions` VALUES(2000, 1, 376);
INSERT INTO `profiles_permissions` VALUES(2001, 1, 377);
INSERT INTO `profiles_permissions` VALUES(2002, 1, 378);
INSERT INTO `profiles_permissions` VALUES(2003, 1, 379);
INSERT INTO `profiles_permissions` VALUES(2004, 1, 380);
INSERT INTO `profiles_permissions` VALUES(2005, 1, 381);
INSERT INTO `profiles_permissions` VALUES(2006, 1, 382);
INSERT INTO `profiles_permissions` VALUES(2007, 1, 383);
INSERT INTO `profiles_permissions` VALUES(2008, 1, 384);
INSERT INTO `profiles_permissions` VALUES(2009, 1, 385);
INSERT INTO `profiles_permissions` VALUES(2010, 1, 386);
INSERT INTO `profiles_permissions` VALUES(2011, 1, 387);
INSERT INTO `profiles_permissions` VALUES(2012, 1, 388);
INSERT INTO `profiles_permissions` VALUES(2013, 1, 389);
INSERT INTO `profiles_permissions` VALUES(2014, 1, 390);
INSERT INTO `profiles_permissions` VALUES(2015, 1, 391);
INSERT INTO `profiles_permissions` VALUES(2016, 1, 392);
INSERT INTO `profiles_permissions` VALUES(2017, 1, 393);
INSERT INTO `profiles_permissions` VALUES(2018, 1, 394);
INSERT INTO `profiles_permissions` VALUES(2019, 1, 395);
INSERT INTO `profiles_permissions` VALUES(2020, 1, 396);
INSERT INTO `profiles_permissions` VALUES(2021, 1, 397);
INSERT INTO `profiles_permissions` VALUES(2022, 1, 398);
INSERT INTO `profiles_permissions` VALUES(2023, 1, 399);
INSERT INTO `profiles_permissions` VALUES(2024, 1, 400);
INSERT INTO `profiles_permissions` VALUES(2025, 1, 401);
INSERT INTO `profiles_permissions` VALUES(2026, 1, 402);
INSERT INTO `profiles_permissions` VALUES(2027, 2, 280);
INSERT INTO `profiles_permissions` VALUES(2278, 3, 278);
INSERT INTO `profiles_permissions` VALUES(2279, 3, 279);
INSERT INTO `profiles_permissions` VALUES(2280, 3, 280);
INSERT INTO `profiles_permissions` VALUES(2281, 3, 281);
INSERT INTO `profiles_permissions` VALUES(2282, 3, 282);
INSERT INTO `profiles_permissions` VALUES(2283, 3, 283);
INSERT INTO `profiles_permissions` VALUES(2284, 3, 284);
INSERT INTO `profiles_permissions` VALUES(2285, 3, 285);
INSERT INTO `profiles_permissions` VALUES(2286, 3, 286);
INSERT INTO `profiles_permissions` VALUES(2287, 3, 287);
INSERT INTO `profiles_permissions` VALUES(2288, 3, 288);
INSERT INTO `profiles_permissions` VALUES(2289, 3, 289);
INSERT INTO `profiles_permissions` VALUES(2290, 3, 290);
INSERT INTO `profiles_permissions` VALUES(2291, 3, 291);
INSERT INTO `profiles_permissions` VALUES(2292, 3, 292);
INSERT INTO `profiles_permissions` VALUES(2293, 3, 293);
INSERT INTO `profiles_permissions` VALUES(2294, 3, 294);
INSERT INTO `profiles_permissions` VALUES(2295, 3, 295);
INSERT INTO `profiles_permissions` VALUES(2296, 3, 296);
INSERT INTO `profiles_permissions` VALUES(2297, 3, 297);
INSERT INTO `profiles_permissions` VALUES(2298, 3, 298);
INSERT INTO `profiles_permissions` VALUES(2299, 3, 299);
INSERT INTO `profiles_permissions` VALUES(2300, 3, 300);
INSERT INTO `profiles_permissions` VALUES(2301, 3, 301);
INSERT INTO `profiles_permissions` VALUES(2302, 3, 302);
INSERT INTO `profiles_permissions` VALUES(2303, 3, 303);
INSERT INTO `profiles_permissions` VALUES(2304, 3, 304);
INSERT INTO `profiles_permissions` VALUES(2305, 3, 305);
INSERT INTO `profiles_permissions` VALUES(2306, 3, 306);
INSERT INTO `profiles_permissions` VALUES(2307, 3, 307);
INSERT INTO `profiles_permissions` VALUES(2308, 3, 308);
INSERT INTO `profiles_permissions` VALUES(2309, 3, 309);
INSERT INTO `profiles_permissions` VALUES(2310, 3, 310);
INSERT INTO `profiles_permissions` VALUES(2311, 3, 311);
INSERT INTO `profiles_permissions` VALUES(2312, 3, 312);
INSERT INTO `profiles_permissions` VALUES(2313, 3, 313);
INSERT INTO `profiles_permissions` VALUES(2314, 3, 314);
INSERT INTO `profiles_permissions` VALUES(2315, 3, 315);
INSERT INTO `profiles_permissions` VALUES(2316, 3, 316);
INSERT INTO `profiles_permissions` VALUES(2317, 3, 317);
INSERT INTO `profiles_permissions` VALUES(2318, 3, 318);
INSERT INTO `profiles_permissions` VALUES(2319, 3, 319);
INSERT INTO `profiles_permissions` VALUES(2320, 3, 320);
INSERT INTO `profiles_permissions` VALUES(2321, 3, 321);
INSERT INTO `profiles_permissions` VALUES(2322, 3, 322);
INSERT INTO `profiles_permissions` VALUES(2323, 3, 323);
INSERT INTO `profiles_permissions` VALUES(2324, 3, 324);
INSERT INTO `profiles_permissions` VALUES(2325, 3, 325);
INSERT INTO `profiles_permissions` VALUES(2326, 3, 326);
INSERT INTO `profiles_permissions` VALUES(2327, 3, 327);
INSERT INTO `profiles_permissions` VALUES(2328, 3, 328);
INSERT INTO `profiles_permissions` VALUES(2329, 3, 329);
INSERT INTO `profiles_permissions` VALUES(2330, 3, 330);
INSERT INTO `profiles_permissions` VALUES(2331, 3, 331);
INSERT INTO `profiles_permissions` VALUES(2332, 3, 332);
INSERT INTO `profiles_permissions` VALUES(2333, 3, 333);
INSERT INTO `profiles_permissions` VALUES(2334, 3, 334);
INSERT INTO `profiles_permissions` VALUES(2335, 3, 335);
INSERT INTO `profiles_permissions` VALUES(2336, 3, 336);
INSERT INTO `profiles_permissions` VALUES(2337, 3, 337);
INSERT INTO `profiles_permissions` VALUES(2338, 3, 338);
INSERT INTO `profiles_permissions` VALUES(2339, 3, 339);
INSERT INTO `profiles_permissions` VALUES(2340, 3, 340);
INSERT INTO `profiles_permissions` VALUES(2341, 3, 341);
INSERT INTO `profiles_permissions` VALUES(2342, 3, 342);
INSERT INTO `profiles_permissions` VALUES(2343, 3, 343);
INSERT INTO `profiles_permissions` VALUES(2344, 3, 344);
INSERT INTO `profiles_permissions` VALUES(2345, 3, 345);
INSERT INTO `profiles_permissions` VALUES(2346, 3, 346);
INSERT INTO `profiles_permissions` VALUES(2347, 3, 347);
INSERT INTO `profiles_permissions` VALUES(2348, 3, 348);
INSERT INTO `profiles_permissions` VALUES(2349, 3, 349);
INSERT INTO `profiles_permissions` VALUES(2350, 3, 350);
INSERT INTO `profiles_permissions` VALUES(2351, 3, 351);
INSERT INTO `profiles_permissions` VALUES(2352, 3, 352);
INSERT INTO `profiles_permissions` VALUES(2353, 3, 353);
INSERT INTO `profiles_permissions` VALUES(2354, 3, 354);
INSERT INTO `profiles_permissions` VALUES(2355, 3, 355);
INSERT INTO `profiles_permissions` VALUES(2356, 3, 356);
INSERT INTO `profiles_permissions` VALUES(2357, 3, 357);
INSERT INTO `profiles_permissions` VALUES(2358, 3, 358);
INSERT INTO `profiles_permissions` VALUES(2359, 3, 359);
INSERT INTO `profiles_permissions` VALUES(2360, 3, 360);
INSERT INTO `profiles_permissions` VALUES(2361, 3, 361);
INSERT INTO `profiles_permissions` VALUES(2362, 3, 362);
INSERT INTO `profiles_permissions` VALUES(2363, 3, 363);
INSERT INTO `profiles_permissions` VALUES(2364, 3, 364);
INSERT INTO `profiles_permissions` VALUES(2365, 3, 365);
INSERT INTO `profiles_permissions` VALUES(2366, 3, 366);
INSERT INTO `profiles_permissions` VALUES(2367, 3, 367);
INSERT INTO `profiles_permissions` VALUES(2368, 3, 368);
INSERT INTO `profiles_permissions` VALUES(2369, 3, 369);
INSERT INTO `profiles_permissions` VALUES(2370, 3, 370);
INSERT INTO `profiles_permissions` VALUES(2371, 3, 371);
INSERT INTO `profiles_permissions` VALUES(2372, 3, 372);
INSERT INTO `profiles_permissions` VALUES(2373, 3, 373);
INSERT INTO `profiles_permissions` VALUES(2374, 3, 374);
INSERT INTO `profiles_permissions` VALUES(2375, 3, 375);
INSERT INTO `profiles_permissions` VALUES(2376, 3, 376);
INSERT INTO `profiles_permissions` VALUES(2377, 3, 377);
INSERT INTO `profiles_permissions` VALUES(2378, 3, 378);
INSERT INTO `profiles_permissions` VALUES(2379, 3, 379);
INSERT INTO `profiles_permissions` VALUES(2380, 3, 380);
INSERT INTO `profiles_permissions` VALUES(2381, 3, 381);
INSERT INTO `profiles_permissions` VALUES(2382, 3, 382);
INSERT INTO `profiles_permissions` VALUES(2383, 3, 383);
INSERT INTO `profiles_permissions` VALUES(2384, 3, 384);
INSERT INTO `profiles_permissions` VALUES(2385, 3, 385);
INSERT INTO `profiles_permissions` VALUES(2386, 3, 386);
INSERT INTO `profiles_permissions` VALUES(2387, 3, 387);
INSERT INTO `profiles_permissions` VALUES(2388, 3, 388);
INSERT INTO `profiles_permissions` VALUES(2389, 3, 389);
INSERT INTO `profiles_permissions` VALUES(2390, 3, 390);
INSERT INTO `profiles_permissions` VALUES(2391, 3, 391);
INSERT INTO `profiles_permissions` VALUES(2392, 3, 392);
INSERT INTO `profiles_permissions` VALUES(2393, 3, 393);
INSERT INTO `profiles_permissions` VALUES(2394, 3, 394);
INSERT INTO `profiles_permissions` VALUES(2395, 3, 395);
INSERT INTO `profiles_permissions` VALUES(2396, 3, 396);
INSERT INTO `profiles_permissions` VALUES(2397, 3, 397);
INSERT INTO `profiles_permissions` VALUES(2398, 3, 398);
INSERT INTO `profiles_permissions` VALUES(2399, 3, 399);
INSERT INTO `profiles_permissions` VALUES(2400, 3, 400);
INSERT INTO `profiles_permissions` VALUES(2401, 3, 401);
INSERT INTO `profiles_permissions` VALUES(2402, 3, 402);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `profiles_sites`
--

CREATE TABLE `profiles_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_id` (`userprofile_id`,`site_id`),
  KEY `profiles_sites_1be3128f` (`userprofile_id`),
  KEY `profiles_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `profiles_sites`
--

INSERT INTO `profiles_sites` VALUES(1, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `profile_data`
--

CREATE TABLE `profile_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `post_code` varchar(10) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `shortinfo` longtext,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_data_141c6eec` (`profile_id`),
  KEY `profile_data_b9608dc2` (`state_id`),
  KEY `profile_data_534dd89` (`country_id`),
  KEY `profile_data_5cb3bfcf` (`sex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `profile_data`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_answers`
--

CREATE TABLE `repetitio_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `textanswer` tinyint(1) NOT NULL,
  `points` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repetitio_answers_1f92e550` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_answers`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_answers_languages`
--

CREATE TABLE `repetitio_answers_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioanswer_id` int(11) NOT NULL,
  `repetitioanswerlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioanswer_id` (`repetitioanswer_id`,`repetitioanswerlanguage_id`),
  KEY `repetitio_answers_languages_73cdad58` (`repetitioanswer_id`),
  KEY `repetitio_answers_languages_9bddb91e` (`repetitioanswerlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_answers_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_answers_permissions`
--

CREATE TABLE `repetitio_answers_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioanswer_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioanswer_id` (`repetitioanswer_id`,`permisiongroup_id`),
  KEY `repetitio_answers_permissions_73cdad58` (`repetitioanswer_id`),
  KEY `repetitio_answers_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_answers_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_answers_sites`
--

CREATE TABLE `repetitio_answers_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioanswer_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioanswer_id` (`repetitioanswer_id`,`site_id`),
  KEY `repetitio_answers_sites_73cdad58` (`repetitioanswer_id`),
  KEY `repetitio_answers_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_answers_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_course`
--

CREATE TABLE `repetitio_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `datestart` datetime NOT NULL,
  `dateend` datetime DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `complete` tinyint(1) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repetitio_course_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_course`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_courseusers`
--

CREATE TABLE `repetitio_courseusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `datestart` datetime NOT NULL,
  `points` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repetitio_courseusers_fbfc09f1` (`user_id`),
  KEY `repetitio_courseusers_ff48d8e5` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_courseusers`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_courseusers_sites`
--

CREATE TABLE `repetitio_courseusers_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourseuser_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourseuser_id` (`repetitiocourseuser_id`,`site_id`),
  KEY `repetitio_courseusers_sites_9f351720` (`repetitiocourseuser_id`),
  KEY `repetitio_courseusers_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_courseusers_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_course_active`
--

CREATE TABLE `repetitio_course_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourse_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourse_id` (`repetitiocourse_id`,`site_id`),
  KEY `repetitio_course_active_d4b8a271` (`repetitiocourse_id`),
  KEY `repetitio_course_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_course_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_course_languages`
--

CREATE TABLE `repetitio_course_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourse_id` int(11) NOT NULL,
  `repetitiocourselanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourse_id` (`repetitiocourse_id`,`repetitiocourselanguage_id`),
  KEY `repetitio_course_languages_d4b8a271` (`repetitiocourse_id`),
  KEY `repetitio_course_languages_58e38741` (`repetitiocourselanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_course_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_course_permissions`
--

CREATE TABLE `repetitio_course_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourse_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourse_id` (`repetitiocourse_id`,`permisiongroup_id`),
  KEY `repetitio_course_permissions_d4b8a271` (`repetitiocourse_id`),
  KEY `repetitio_course_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_course_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_course_sites`
--

CREATE TABLE `repetitio_course_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourse_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourse_id` (`repetitiocourse_id`,`site_id`),
  KEY `repetitio_course_sites_d4b8a271` (`repetitiocourse_id`),
  KEY `repetitio_course_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_course_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_questions`
--

CREATE TABLE `repetitio_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `manyanswers` tinyint(1) NOT NULL,
  `textanswers` tinyint(1) NOT NULL,
  `points` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repetitio_questions_a88de8dc` (`test_id`),
  KEY `repetitio_questions_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_questions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_questions_active`
--

CREATE TABLE `repetitio_questions_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioquestion_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioquestion_id` (`repetitioquestion_id`,`site_id`),
  KEY `repetitio_questions_active_88a552a0` (`repetitioquestion_id`),
  KEY `repetitio_questions_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_questions_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_questions_languages`
--

CREATE TABLE `repetitio_questions_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioquestion_id` int(11) NOT NULL,
  `repetitioquestionlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioquestion_id` (`repetitioquestion_id`,`repetitioquestionlanguage_id`),
  KEY `repetitio_questions_languages_88a552a0` (`repetitioquestion_id`),
  KEY `repetitio_questions_languages_a831889e` (`repetitioquestionlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_questions_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_questions_permissions`
--

CREATE TABLE `repetitio_questions_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioquestion_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioquestion_id` (`repetitioquestion_id`,`permisiongroup_id`),
  KEY `repetitio_questions_permissions_88a552a0` (`repetitioquestion_id`),
  KEY `repetitio_questions_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_questions_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_questions_sites`
--

CREATE TABLE `repetitio_questions_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioquestion_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioquestion_id` (`repetitioquestion_id`,`site_id`),
  KEY `repetitio_questions_sites_88a552a0` (`repetitioquestion_id`),
  KEY `repetitio_questions_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_questions_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_tests`
--

CREATE TABLE `repetitio_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `datapath` varchar(255) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repetitio_tests_ff48d8e5` (`course_id`),
  KEY `repetitio_tests_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_tests`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_tests_active`
--

CREATE TABLE `repetitio_tests_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotest_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotest_id` (`repetitiotest_id`,`site_id`),
  KEY `repetitio_tests_active_3a15e6e4` (`repetitiotest_id`),
  KEY `repetitio_tests_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_tests_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_tests_languages`
--

CREATE TABLE `repetitio_tests_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotest_id` int(11) NOT NULL,
  `repetitiotestlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotest_id` (`repetitiotest_id`,`repetitiotestlanguage_id`),
  KEY `repetitio_tests_languages_3a15e6e4` (`repetitiotest_id`),
  KEY `repetitio_tests_languages_3559a5fa` (`repetitiotestlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_tests_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_tests_permissions`
--

CREATE TABLE `repetitio_tests_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotest_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotest_id` (`repetitiotest_id`,`permisiongroup_id`),
  KEY `repetitio_tests_permissions_3a15e6e4` (`repetitiotest_id`),
  KEY `repetitio_tests_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_tests_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_tests_sites`
--

CREATE TABLE `repetitio_tests_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotest_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotest_id` (`repetitiotest_id`,`site_id`),
  KEY `repetitio_tests_sites_3a15e6e4` (`repetitiotest_id`),
  KEY `repetitio_tests_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_tests_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_useranswers`
--

CREATE TABLE `repetitio_useranswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `textanswer` longtext,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repetitio_useranswers_fbfc09f1` (`user_id`),
  KEY `repetitio_useranswers_1f92e550` (`question_id`),
  KEY `repetitio_useranswers_d36b8b30` (`answer_id`),
  KEY `repetitio_useranswers_a88de8dc` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_useranswers`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `repetitio_useranswers_sites`
--

CREATE TABLE `repetitio_useranswers_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotestanswer_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotestanswer_id` (`repetitiotestanswer_id`,`site_id`),
  KEY `repetitio_useranswers_sites_1ffd8550` (`repetitiotestanswer_id`),
  KEY `repetitio_useranswers_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `repetitio_useranswers_sites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `rep_answer_lang`
--

CREATE TABLE `rep_answer_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_ff11d6ed` (`language_id`),
  KEY `rep_answer_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `rep_answer_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `rep_course_lang`
--

CREATE TABLE `rep_course_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `law` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_a1105936` (`language_id`),
  KEY `rep_course_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `rep_course_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `rep_question_lang`
--

CREATE TABLE `rep_question_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `description` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_cfbc1955` (`language_id`),
  KEY `rep_question_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `rep_question_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `rep_test_lang`
--

CREATE TABLE `rep_test_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_39b84fc7` (`language_id`),
  KEY `rep_test_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `rep_test_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sex`
--

CREATE TABLE `sex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `sex`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sheetfiles`
--

CREATE TABLE `sheetfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `path` varchar(150) NOT NULL,
  `info` longtext,
  `sheet_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sheetfiles_abbdb8c4` (`sheet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Zrzut danych tabeli `sheetfiles`
--

INSERT INTO `sheetfiles` VALUES(1, 'admin_portal', 'core/admin/static/portal.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(2, 'admin_sheets_list', 'core/admin/list/sheets.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(3, 'admin_sheets_edit', 'core/admin/edit/sheets.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(4, 'admin_sheet_files_list', 'core/admin/list/sheetfiles.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(5, 'admin_sheet_files_edit', 'core/admin/edit/sheetfiles.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(6, 'admin_articles_edit', 'core/admin/edit/articles.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(7, 'admin_categories_list', 'core/admin/list/categories.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(8, 'admin_calendarium_calendar_edit', 'core/admin/edit/calendar.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(9, 'admin_calendarium_calendar_list', 'core/admin/list/calendar.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(10, 'admin_calendarium_event_edit', 'core/admin/edit/event.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(11, 'admin_calendarium_event_list', 'core/admin/list/event.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(12, 'admin_calendarium_eventtype_edit', 'core/admin/edit/eventtype.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(13, 'admin_calendarium_eventtype_list', 'core/admin/list/eventtype.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(14, 'admin_cms', 'cms/admin/admin.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(15, 'admin_articles_list', 'core/admin/list/articles.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(16, 'admin_categories_edit', 'core/admin/edit/categories.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(17, 'admin_galleries_list', 'core/admin/list/galleries.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(18, 'admin_galleries_edit', 'core/admin/edit/galleries.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(19, 'admin_sites_list', 'core/admin/list/sites.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(20, 'admin_sites_edit', 'core/admin/edit/sites.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(21, 'admin_images_list', 'core/admin/list/images.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(22, 'admin_images_edit', 'core/admin/edit/images.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(23, 'admin_list', 'core/admin/list.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(24, 'admin_edit', 'core/admin/edit.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(25, 'articles_list', 'core/portal/list/article.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(26, 'article', 'core/portal/article.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(27, 'mainsite', 'core/portal/mainsite.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(28, 'admin_user_profile_list', 'core/admin/list/userprofiles.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(29, 'admin_user_profile_edit', 'core/admin/edit/userprofiles.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(30, 'admin_repetitio_courses_list', 'core/admin/list/repetitio_courses.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(32, 'admin_repetitio_courses_edit', 'core/admin/edit/repetitio_courses.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(33, 'admin_repetitio_tests_edit', 'core/admin/edit/repetitio_tests.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(34, 'admin_repetitio_tests_list', 'core/admin/list/repetitio_tests.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(35, 'admin_repetitio_answers_list', 'core/admin/list/repetitio_answers.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(36, 'admin_repetitio_answers_edit', 'core/admin/edit/repetitio_answers.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(37, 'admin_repetitio_questions_edit', 'core/admin/edit/repetitio_questions.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(38, 'admin_repetitio_questions_list', 'core/admin/list/repetitio_questions.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(39, 'admin_ads_images_list', 'core/admin/list/ads_images.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(40, 'admin_ads_images_edit', 'core/admin/edit/ads_images.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(41, 'admin_ads_categories_list', 'core/admin/list/ads_categories.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(42, 'admin_ads_categories_edit', 'core/admin/edit/ads_categories.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(43, 'admin_ads_edit', 'core/admin/edit/ads.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(44, 'admin_ads_list', 'core/admin/list/ads.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(45, 'admin_wiki_list', 'core/admin/list/wiki.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(46, 'admin_wiki_edit', 'core/admin/edit/wiki.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(47, 'admin_catalog_categories_list', 'core/admin/list/catalog_categories.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(48, 'admin_catalog_categories_edit', 'core/admin/edit/catalog_categories.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(49, 'admin_catalog_edit', 'core/admin/edit/catalog.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(50, 'admin_catalog_list', 'core/admin/list/catalog.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(51, 'admin_menu_items_list', 'core/admin/list/menu_items.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(52, 'admin_menu_items_edit', 'core/admin/edit/menu_items.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(53, 'admin_menu_items_edit_module_selection', 'core/admin/edit/menu_items_module_selection.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(54, 'admin_menu_list', 'core/admin/list/menu.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(55, 'admin_menu_edit', 'core/admin/edit/menu.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(56, 'admin_modules_edit', 'core/admin/edit/modules.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(57, 'admin_modules_list', 'core/admin/list/modules.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(58, 'admin_module_positions_list', 'core/admin/list/module_positions.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(59, 'admin_module_positions_edit', 'core/admin/edit/module_positions.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(60, 'categories_list', 'core/portal/list/article.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(61, 'admin_megamenu_edit', 'core/admin/edit/megamenu.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(62, 'admin_megamenu_list', 'core/admin/list/megamenu.html', '', 2, NULL);
INSERT INTO `sheetfiles` VALUES(63, 'admin_login', 'core/admin/login.html', '', 2, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sheetfiles_active`
--

CREATE TABLE `sheetfiles_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheetfiles_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sheetfiles_id` (`sheetfiles_id`,`site_id`),
  KEY `sheetfiles_active_947805ac` (`sheetfiles_id`),
  KEY `sheetfiles_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=196 ;

--
-- Zrzut danych tabeli `sheetfiles_active`
--

INSERT INTO `sheetfiles_active` VALUES(1, 1, 1);
INSERT INTO `sheetfiles_active` VALUES(2, 2, 1);
INSERT INTO `sheetfiles_active` VALUES(42, 3, 1);
INSERT INTO `sheetfiles_active` VALUES(43, 3, 2);
INSERT INTO `sheetfiles_active` VALUES(44, 3, 3);
INSERT INTO `sheetfiles_active` VALUES(30, 4, 1);
INSERT INTO `sheetfiles_active` VALUES(31, 4, 2);
INSERT INTO `sheetfiles_active` VALUES(32, 4, 3);
INSERT INTO `sheetfiles_active` VALUES(33, 5, 1);
INSERT INTO `sheetfiles_active` VALUES(34, 5, 2);
INSERT INTO `sheetfiles_active` VALUES(35, 5, 3);
INSERT INTO `sheetfiles_active` VALUES(86, 6, 1);
INSERT INTO `sheetfiles_active` VALUES(87, 6, 3);
INSERT INTO `sheetfiles_active` VALUES(116, 7, 1);
INSERT INTO `sheetfiles_active` VALUES(117, 7, 3);
INSERT INTO `sheetfiles_active` VALUES(98, 8, 1);
INSERT INTO `sheetfiles_active` VALUES(99, 8, 3);
INSERT INTO `sheetfiles_active` VALUES(96, 9, 1);
INSERT INTO `sheetfiles_active` VALUES(97, 9, 3);
INSERT INTO `sheetfiles_active` VALUES(108, 10, 1);
INSERT INTO `sheetfiles_active` VALUES(109, 10, 3);
INSERT INTO `sheetfiles_active` VALUES(110, 11, 1);
INSERT INTO `sheetfiles_active` VALUES(111, 11, 3);
INSERT INTO `sheetfiles_active` VALUES(104, 12, 1);
INSERT INTO `sheetfiles_active` VALUES(105, 12, 3);
INSERT INTO `sheetfiles_active` VALUES(106, 13, 1);
INSERT INTO `sheetfiles_active` VALUES(107, 13, 3);
INSERT INTO `sheetfiles_active` VALUES(63, 14, 1);
INSERT INTO `sheetfiles_active` VALUES(64, 14, 2);
INSERT INTO `sheetfiles_active` VALUES(65, 14, 3);
INSERT INTO `sheetfiles_active` VALUES(84, 15, 1);
INSERT INTO `sheetfiles_active` VALUES(85, 15, 3);
INSERT INTO `sheetfiles_active` VALUES(114, 16, 1);
INSERT INTO `sheetfiles_active` VALUES(115, 16, 3);
INSERT INTO `sheetfiles_active` VALUES(118, 17, 1);
INSERT INTO `sheetfiles_active` VALUES(119, 17, 3);
INSERT INTO `sheetfiles_active` VALUES(120, 18, 1);
INSERT INTO `sheetfiles_active` VALUES(121, 18, 3);
INSERT INTO `sheetfiles_active` VALUES(36, 19, 1);
INSERT INTO `sheetfiles_active` VALUES(37, 19, 2);
INSERT INTO `sheetfiles_active` VALUES(38, 19, 3);
INSERT INTO `sheetfiles_active` VALUES(39, 20, 1);
INSERT INTO `sheetfiles_active` VALUES(40, 20, 2);
INSERT INTO `sheetfiles_active` VALUES(41, 20, 3);
INSERT INTO `sheetfiles_active` VALUES(140, 21, 1);
INSERT INTO `sheetfiles_active` VALUES(141, 21, 3);
INSERT INTO `sheetfiles_active` VALUES(138, 22, 1);
INSERT INTO `sheetfiles_active` VALUES(139, 22, 3);
INSERT INTO `sheetfiles_active` VALUES(45, 23, 1);
INSERT INTO `sheetfiles_active` VALUES(46, 23, 2);
INSERT INTO `sheetfiles_active` VALUES(47, 23, 3);
INSERT INTO `sheetfiles_active` VALUES(60, 24, 1);
INSERT INTO `sheetfiles_active` VALUES(61, 24, 2);
INSERT INTO `sheetfiles_active` VALUES(62, 24, 3);
INSERT INTO `sheetfiles_active` VALUES(83, 25, 1);
INSERT INTO `sheetfiles_active` VALUES(88, 26, 1);
INSERT INTO `sheetfiles_active` VALUES(89, 26, 3);
INSERT INTO `sheetfiles_active` VALUES(90, 27, 1);
INSERT INTO `sheetfiles_active` VALUES(91, 27, 3);
INSERT INTO `sheetfiles_active` VALUES(92, 28, 1);
INSERT INTO `sheetfiles_active` VALUES(93, 28, 3);
INSERT INTO `sheetfiles_active` VALUES(94, 29, 1);
INSERT INTO `sheetfiles_active` VALUES(95, 29, 3);
INSERT INTO `sheetfiles_active` VALUES(122, 30, 1);
INSERT INTO `sheetfiles_active` VALUES(123, 30, 3);
INSERT INTO `sheetfiles_active` VALUES(124, 32, 1);
INSERT INTO `sheetfiles_active` VALUES(125, 32, 3);
INSERT INTO `sheetfiles_active` VALUES(126, 33, 1);
INSERT INTO `sheetfiles_active` VALUES(127, 33, 3);
INSERT INTO `sheetfiles_active` VALUES(128, 34, 1);
INSERT INTO `sheetfiles_active` VALUES(129, 34, 3);
INSERT INTO `sheetfiles_active` VALUES(130, 35, 1);
INSERT INTO `sheetfiles_active` VALUES(131, 35, 3);
INSERT INTO `sheetfiles_active` VALUES(132, 36, 1);
INSERT INTO `sheetfiles_active` VALUES(133, 36, 3);
INSERT INTO `sheetfiles_active` VALUES(134, 37, 1);
INSERT INTO `sheetfiles_active` VALUES(135, 37, 3);
INSERT INTO `sheetfiles_active` VALUES(136, 38, 1);
INSERT INTO `sheetfiles_active` VALUES(137, 38, 3);
INSERT INTO `sheetfiles_active` VALUES(142, 39, 1);
INSERT INTO `sheetfiles_active` VALUES(143, 39, 3);
INSERT INTO `sheetfiles_active` VALUES(144, 40, 1);
INSERT INTO `sheetfiles_active` VALUES(145, 40, 3);
INSERT INTO `sheetfiles_active` VALUES(146, 41, 1);
INSERT INTO `sheetfiles_active` VALUES(147, 41, 3);
INSERT INTO `sheetfiles_active` VALUES(148, 42, 1);
INSERT INTO `sheetfiles_active` VALUES(149, 42, 3);
INSERT INTO `sheetfiles_active` VALUES(150, 43, 1);
INSERT INTO `sheetfiles_active` VALUES(151, 43, 3);
INSERT INTO `sheetfiles_active` VALUES(152, 44, 1);
INSERT INTO `sheetfiles_active` VALUES(153, 44, 3);
INSERT INTO `sheetfiles_active` VALUES(154, 45, 1);
INSERT INTO `sheetfiles_active` VALUES(155, 45, 3);
INSERT INTO `sheetfiles_active` VALUES(156, 46, 1);
INSERT INTO `sheetfiles_active` VALUES(157, 46, 3);
INSERT INTO `sheetfiles_active` VALUES(158, 47, 1);
INSERT INTO `sheetfiles_active` VALUES(159, 47, 3);
INSERT INTO `sheetfiles_active` VALUES(160, 48, 1);
INSERT INTO `sheetfiles_active` VALUES(161, 48, 3);
INSERT INTO `sheetfiles_active` VALUES(162, 49, 1);
INSERT INTO `sheetfiles_active` VALUES(163, 49, 3);
INSERT INTO `sheetfiles_active` VALUES(164, 50, 1);
INSERT INTO `sheetfiles_active` VALUES(165, 50, 3);
INSERT INTO `sheetfiles_active` VALUES(166, 51, 1);
INSERT INTO `sheetfiles_active` VALUES(167, 51, 3);
INSERT INTO `sheetfiles_active` VALUES(168, 52, 1);
INSERT INTO `sheetfiles_active` VALUES(169, 52, 3);
INSERT INTO `sheetfiles_active` VALUES(170, 53, 1);
INSERT INTO `sheetfiles_active` VALUES(171, 53, 3);
INSERT INTO `sheetfiles_active` VALUES(172, 54, 1);
INSERT INTO `sheetfiles_active` VALUES(173, 54, 3);
INSERT INTO `sheetfiles_active` VALUES(174, 55, 1);
INSERT INTO `sheetfiles_active` VALUES(175, 55, 3);
INSERT INTO `sheetfiles_active` VALUES(176, 56, 1);
INSERT INTO `sheetfiles_active` VALUES(177, 56, 3);
INSERT INTO `sheetfiles_active` VALUES(178, 57, 1);
INSERT INTO `sheetfiles_active` VALUES(179, 57, 3);
INSERT INTO `sheetfiles_active` VALUES(180, 58, 1);
INSERT INTO `sheetfiles_active` VALUES(181, 58, 3);
INSERT INTO `sheetfiles_active` VALUES(182, 59, 1);
INSERT INTO `sheetfiles_active` VALUES(183, 59, 3);
INSERT INTO `sheetfiles_active` VALUES(184, 60, 1);
INSERT INTO `sheetfiles_active` VALUES(185, 60, 3);
INSERT INTO `sheetfiles_active` VALUES(192, 61, 1);
INSERT INTO `sheetfiles_active` VALUES(193, 61, 3);
INSERT INTO `sheetfiles_active` VALUES(190, 62, 1);
INSERT INTO `sheetfiles_active` VALUES(191, 62, 3);
INSERT INTO `sheetfiles_active` VALUES(194, 63, 1);
INSERT INTO `sheetfiles_active` VALUES(195, 63, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sheetlanguages`
--

CREATE TABLE `sheetlanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `systemname` varchar(150) NOT NULL,
  `name` longtext NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sheetlanguages_7ab48146` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

--
-- Zrzut danych tabeli `sheetlanguages`
--

INSERT INTO `sheetlanguages` VALUES(1, '0000-00-00 00:00:00', '__No_articles__', 'Brak artykułów', 1);
INSERT INTO `sheetlanguages` VALUES(2, '0000-00-00 00:00:00', '__No_article__', 'Brak artykułu', 1);
INSERT INTO `sheetlanguages` VALUES(3, '0000-00-00 00:00:00', '__adm_No_article__', 'Brak artykułu', 1);
INSERT INTO `sheetlanguages` VALUES(4, '0000-00-00 00:00:00', '__adm_No_articles__', 'Brak artykułów', 1);
INSERT INTO `sheetlanguages` VALUES(5, '0000-00-00 00:00:00', '__Categories__', 'Kategorie', 1);
INSERT INTO `sheetlanguages` VALUES(6, '0000-00-00 00:00:00', '__Articles__', 'Artykuły', 1);
INSERT INTO `sheetlanguages` VALUES(7, '0000-00-00 00:00:00', '__dummy__', 'Dummy', 1);
INSERT INTO `sheetlanguages` VALUES(8, '0000-00-00 00:00:00', '__adm_Categories__', 'Kategorie', 1);
INSERT INTO `sheetlanguages` VALUES(9, '0000-00-00 00:00:00', '__adm_Articles__', 'Artykuły', 1);
INSERT INTO `sheetlanguages` VALUES(10, '0000-00-00 00:00:00', '__adm_Id__', 'Id', 1);
INSERT INTO `sheetlanguages` VALUES(11, '0000-00-00 00:00:00', '__adm_Title__', 'Tytuł', 1);
INSERT INTO `sheetlanguages` VALUES(12, '0000-00-00 00:00:00', '__adm_Active__', 'Aktywny', 1);
INSERT INTO `sheetlanguages` VALUES(13, '0000-00-00 00:00:00', '__adm_Category__', 'Kategoria', 1);
INSERT INTO `sheetlanguages` VALUES(14, '0000-00-00 00:00:00', '__adm_Author__', 'Autor', 1);
INSERT INTO `sheetlanguages` VALUES(15, '0000-00-00 00:00:00', '__adm_Create_date__', 'Data utworzenia', 1);
INSERT INTO `sheetlanguages` VALUES(16, '0000-00-00 00:00:00', '__adm_Visits__', 'Ilość odsłon', 1);
INSERT INTO `sheetlanguages` VALUES(17, '0000-00-00 00:00:00', '__adm_Delete__', 'Usuń', 1);
INSERT INTO `sheetlanguages` VALUES(18, '0000-00-00 00:00:00', '__adm_LP__', 'Lp', 1);
INSERT INTO `sheetlanguages` VALUES(19, '0000-00-00 00:00:00', '__adm_Activity__', 'Aktywność', 1);
INSERT INTO `sheetlanguages` VALUES(20, '0000-00-00 00:00:00', '__adm_Filter__', 'Filtr', 1);
INSERT INTO `sheetlanguages` VALUES(22, '0000-00-00 00:00:00', '__adm_no_Active__', 'Nieaktywny', 1);
INSERT INTO `sheetlanguages` VALUES(23, '0000-00-00 00:00:00', '__adm_All__', 'Wszystko', 1);
INSERT INTO `sheetlanguages` VALUES(24, '0000-00-00 00:00:00', '__adm_Galeries__', 'Galerie', 1);
INSERT INTO `sheetlanguages` VALUES(25, '0000-00-00 00:00:00', '__adm_Calendarium__', 'Kalendarium', 1);
INSERT INTO `sheetlanguages` VALUES(26, '0000-00-00 00:00:00', '__adm_Classfields__', 'Ogłoszenia', 1);
INSERT INTO `sheetlanguages` VALUES(27, '0000-00-00 00:00:00', '__adm_Forum__', 'Forum', 1);
INSERT INTO `sheetlanguages` VALUES(28, '0000-00-00 00:00:00', '__adm_Wiki__', 'Baza wiedzy', 1);
INSERT INTO `sheetlanguages` VALUES(29, '0000-00-00 00:00:00', '__adm_Catalogs__', 'Katalogi', 1);
INSERT INTO `sheetlanguages` VALUES(30, '0000-00-00 00:00:00', '__adm_Shop__', 'Sklep', 1);
INSERT INTO `sheetlanguages` VALUES(31, '0000-00-00 00:00:00', '__adm_Stats__', 'Statystyki', 1);
INSERT INTO `sheetlanguages` VALUES(32, '0000-00-00 00:00:00', '__adm_Advertisement__', 'Reklamy', 1);
INSERT INTO `sheetlanguages` VALUES(33, '0000-00-00 00:00:00', '__adm_Mailing__', 'Mailing', 1);
INSERT INTO `sheetlanguages` VALUES(34, '0000-00-00 00:00:00', '__adm_Users__', 'Użytkownicy', 1);
INSERT INTO `sheetlanguages` VALUES(35, '0000-00-00 00:00:00', '__adm_Sheets__', 'Szablony', 1);
INSERT INTO `sheetlanguages` VALUES(36, '0000-00-00 00:00:00', '__adm_Logout__', 'Wyloguj', 1);
INSERT INTO `sheetlanguages` VALUES(37, '0000-00-00 00:00:00', '__adm_Editarticle__', 'Edycja artykułu', 1);
INSERT INTO `sheetlanguages` VALUES(38, '0000-00-00 00:00:00', '__adm_Name__', 'Nazwa', 1);
INSERT INTO `sheetlanguages` VALUES(39, '0000-00-00 00:00:00', '__adm_No_categories__', 'Brak kategorii', 1);
INSERT INTO `sheetlanguages` VALUES(40, '0000-00-00 00:00:00', '__adm_Category_parents__', 'Kategorie nadrzędne', 1);
INSERT INTO `sheetlanguages` VALUES(41, '0000-00-00 00:00:00', '__adm_Category_root__', 'Kategoria główna', 1);
INSERT INTO `sheetlanguages` VALUES(42, '0000-00-00 00:00:00', '__adm_Site__', 'Strona', 1);
INSERT INTO `sheetlanguages` VALUES(43, '0000-00-00 00:00:00', '__adm_Editcategory__', 'Edycja kategorii', 1);
INSERT INTO `sheetlanguages` VALUES(44, '0000-00-00 00:00:00', '__adm_Selectlanguage__', 'Wybierz język', 1);
INSERT INTO `sheetlanguages` VALUES(45, '0000-00-00 00:00:00', '__adm_Calendars__', 'Kalendarze', 1);
INSERT INTO `sheetlanguages` VALUES(46, '0000-00-00 00:00:00', '__adm_Event_types__', 'Typy wydarzeń', 1);
INSERT INTO `sheetlanguages` VALUES(47, '0000-00-00 00:00:00', '__adm_Events__', 'Wydarzenia', 1);
INSERT INTO `sheetlanguages` VALUES(48, '0000-00-00 00:00:00', '__adm_Eventtypes__', 'Typy wydarzeń', 1);
INSERT INTO `sheetlanguages` VALUES(49, '0000-00-00 00:00:00', '__adm_Add__', 'Dodaj', 1);
INSERT INTO `sheetlanguages` VALUES(50, '0000-00-00 00:00:00', '__adm_Saveandadd__', 'Zapisz i dodaj', 1);
INSERT INTO `sheetlanguages` VALUES(51, '0000-00-00 00:00:00', '__adm_Cancel__', 'Anuluj', 1);
INSERT INTO `sheetlanguages` VALUES(52, '0000-00-00 00:00:00', '__adm_Duplicate__', 'Duplikuj', 1);
INSERT INTO `sheetlanguages` VALUES(53, '0000-00-00 00:00:00', '__adm_Numberofitems__', 'Ilość obiektów', 1);
INSERT INTO `sheetlanguages` VALUES(54, '0000-00-00 00:00:00', '__adm_No_translation__', 'Brak tłumaczenia', 1);
INSERT INTO `sheetlanguages` VALUES(56, '0000-00-00 00:00:00', '__adm_Save__', 'Zapisz', 1);
INSERT INTO `sheetlanguages` VALUES(57, '2011-07-27 13:15:38', '__adm_Statistics__', 'Statystyki', 1);
INSERT INTO `sheetlanguages` VALUES(58, '2011-07-27 13:15:52', '__adm_Sites__', 'Strony', 1);
INSERT INTO `sheetlanguages` VALUES(59, '2011-07-27 13:16:24', '__adm_SheetFiles__', 'Pliki szablonów', 1);
INSERT INTO `sheetlanguages` VALUES(60, '2011-07-27 13:20:16', '__adm_CMS__', 'CMS', 1);
INSERT INTO `sheetlanguages` VALUES(61, '2011-07-27 13:20:27', '__adm_Portal__', 'Portal', 1);
INSERT INTO `sheetlanguages` VALUES(62, '2011-07-27 13:56:29', '__adm_Images__', 'Zdjęcia', 1);
INSERT INTO `sheetlanguages` VALUES(63, '2011-07-27 13:57:37', '__adm_Selectactivesite__', 'Wybierz aktywną stronę', 1);
INSERT INTO `sheetlanguages` VALUES(64, '2011-07-27 14:02:36', '__adm_Galleries__', 'Galerie', 1);
INSERT INTO `sheetlanguages` VALUES(65, '2011-07-27 15:04:42', '__Are_you_sure?__', 'Czy jesteś pewien?', 1);
INSERT INTO `sheetlanguages` VALUES(66, '2011-07-28 13:37:09', '__adm_Portal_Info__', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mattis elit ut ipsum euismod ut porta libero scelerisque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc id egestas arcu. Pellentesque pharetra aliquet libero. Duis mauris dolor, tristique nec faucibus ut, dictum nec urna. Nulla id lacus id massa gravida viverra et pharetra nulla. Aliquam erat volutpat. Maecenas convallis justo purus, at dignissim ligula. Maecenas facilisis condimentum lectus, a semper magna faucibus vitae. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean vestibulum nisl eget velit sagittis vitae faucibus leo commodo. Nam luctus sagittis molestie. Fusce a arcu leo, quis pellentesque lacus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nNulla facilisi. Ut lacinia, odio sit amet interdum dapibus, augue velit iaculis dolor, non dictum augue lacus quis nibh. Duis tincidunt sem et ante molestie porta. Nam lacinia viverra semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu magna non arcu placerat bibendum. Morbi sit amet tortor metus. Sed at diam at eros lobortis luctus. Ut quis est non massa ultricies fermentum nec quis ipsum. Donec vehicula egestas ante vitae fermentum. Nunc massa ligula, pulvinar condimentum dictum vitae, malesuada nec ligula. Etiam accumsan, odio euismod semper commodo, nibh purus semper erat, ac euismod neque nunc sed odio. Curabitur sit amet dolor nisi, nec accumsan quam.', 1);
INSERT INTO `sheetlanguages` VALUES(67, '2011-08-16 09:18:34', '__adm_User_Profile__', 'Profil użytkownika', 1);
INSERT INTO `sheetlanguages` VALUES(68, '2011-08-16 09:18:59', '__adm_Groups__', 'Grupy', 1);
INSERT INTO `sheetlanguages` VALUES(69, '2011-08-16 09:20:00', '__adm_User_Profiles__', 'Profile użytkowników', 1);
INSERT INTO `sheetlanguages` VALUES(70, '2011-08-16 09:20:49', '__adm_Email__', 'Email', 1);
INSERT INTO `sheetlanguages` VALUES(71, '2011-08-16 09:21:34', '__adm_User_Name__', 'Nazwa użytkownika', 1);
INSERT INTO `sheetlanguages` VALUES(72, '2011-08-16 10:25:34', '__adm_Event_type__', 'Typ wydarzenia', 1);
INSERT INTO `sheetlanguages` VALUES(73, '2011-08-16 10:25:53', '__am_Event_types__', 'Typy wydarzeń', 1);
INSERT INTO `sheetlanguages` VALUES(74, '2011-08-16 10:26:10', '__adm_Start_date__', 'Data początkowa', 1);
INSERT INTO `sheetlanguages` VALUES(75, '2011-08-16 10:26:32', '__adm_End_date__', 'Data końcowa', 1);
INSERT INTO `sheetlanguages` VALUES(76, '2011-08-16 10:27:23', '__adm_Event__', 'Wydarzenie', 1);
INSERT INTO `sheetlanguages` VALUES(77, '2011-08-16 12:01:55', '__adm_Repetitio__', 'Repetitio', 1);
INSERT INTO `sheetlanguages` VALUES(78, '2011-08-16 12:02:11', '__adm_Course__', 'Kurs', 1);
INSERT INTO `sheetlanguages` VALUES(79, '2011-08-16 12:02:23', '__adm_Courses__', 'Kursy', 1);
INSERT INTO `sheetlanguages` VALUES(80, '2011-08-16 12:02:35', '__adm_Test__', 'Test', 1);
INSERT INTO `sheetlanguages` VALUES(81, '2011-08-16 12:02:52', '__adm_Tests__', 'Testy', 1);
INSERT INTO `sheetlanguages` VALUES(82, '2011-08-16 12:03:04', '__adm_Question__', 'Pytanie', 1);
INSERT INTO `sheetlanguages` VALUES(83, '2011-08-16 12:03:17', '__adm_Questions__', 'Pytania', 1);
INSERT INTO `sheetlanguages` VALUES(84, '2011-08-16 12:03:28', '__adm_Answer__', 'Odpowiedź', 1);
INSERT INTO `sheetlanguages` VALUES(85, '2011-08-16 12:03:41', '__adm_Answers__', 'Odpowiedzi', 1);
INSERT INTO `sheetlanguages` VALUES(86, '2011-08-16 15:06:59', '__adm_Show_questions__', 'Pokaż pytania', 1);
INSERT INTO `sheetlanguages` VALUES(87, '2011-08-16 15:21:45', '__adm_Show_tests__', 'Pokaż testy', 1);
INSERT INTO `sheetlanguages` VALUES(88, '2011-08-16 15:24:50', '__adm_Show_answers__', 'Pokaż odpowiedzi', 1);
INSERT INTO `sheetlanguages` VALUES(89, '2011-08-17 10:20:27', '__adm_Ads__', 'Ogłoszenia', 1);
INSERT INTO `sheetlanguages` VALUES(90, '2011-08-17 10:20:40', '__adm_Ad__', 'Ogłoszenie', 1);
INSERT INTO `sheetlanguages` VALUES(91, '2011-08-17 10:20:54', '__adm_Ads_images__', 'Zdjęcia do ogłoszeń', 1);
INSERT INTO `sheetlanguages` VALUES(92, '2011-08-17 10:21:18', '__adm_Ads_image__', 'Zdjęcie do ogłoszenia', 1);
INSERT INTO `sheetlanguages` VALUES(93, '2011-08-17 10:21:37', '__adm_Ads_Categories__', 'Kategorie ogłoszeń', 1);
INSERT INTO `sheetlanguages` VALUES(94, '2011-08-17 10:21:55', '__adm_Ads_Category__', 'Kategoria ogłoszeń', 1);
INSERT INTO `sheetlanguages` VALUES(96, '2011-08-17 13:49:38', '__adm_Catalogs_categories__', 'Kategorie katalogów', 1);
INSERT INTO `sheetlanguages` VALUES(97, '2011-08-17 13:49:54', '__adm_Catalog_categories__', 'Kategorie katalogu', 1);
INSERT INTO `sheetlanguages` VALUES(98, '2011-08-17 13:50:15', '__adm_Catalogs_category__', 'Kategoria katalogów', 1);
INSERT INTO `sheetlanguages` VALUES(99, '2011-08-17 13:50:34', '__adm_Catalog_category__', 'Kategoria katalogu', 1);
INSERT INTO `sheetlanguages` VALUES(101, '2011-08-17 13:51:12', '__adm_Catalog__', 'Katalog', 1);
INSERT INTO `sheetlanguages` VALUES(102, '2011-08-17 14:01:38', '__adm_Catalog_items__', 'Elementy katalogu', 1);
INSERT INTO `sheetlanguages` VALUES(103, '2011-08-17 14:01:55', '__adm_Catalog_item__', 'Element katalogu', 1);
INSERT INTO `sheetlanguages` VALUES(104, '2011-08-18 11:07:00', '__adm_Menu__', 'Menu', 1);
INSERT INTO `sheetlanguages` VALUES(105, '2011-08-18 11:09:40', '__adm_Menu_item__', 'Pozycja menu', 1);
INSERT INTO `sheetlanguages` VALUES(106, '2011-08-18 11:09:58', '__adm_Menu_items__', 'Pozycje menu', 1);
INSERT INTO `sheetlanguages` VALUES(107, '2011-08-18 12:58:23', '__adm_Select_module__', 'Wybierz moduł', 1);
INSERT INTO `sheetlanguages` VALUES(108, '2011-08-20 22:58:40', '__adm_Change__', 'Zmień', 1);
INSERT INTO `sheetlanguages` VALUES(109, '2011-08-20 23:14:25', '__adm_Module__', 'Moduł', 1);
INSERT INTO `sheetlanguages` VALUES(110, '2011-08-20 23:14:38', '__adm_Modules__', 'Moduły', 1);
INSERT INTO `sheetlanguages` VALUES(111, '2011-08-20 23:14:51', '__adm_Position__', 'Pozycja', 1);
INSERT INTO `sheetlanguages` VALUES(112, '2011-08-20 23:15:05', '__adm_Positions__', 'Pozycje', 1);
INSERT INTO `sheetlanguages` VALUES(113, '2011-08-24 08:28:35', '__adm_TopMenu__', 'Menu górne', 1);
INSERT INTO `sheetlanguages` VALUES(114, '2011-08-27 10:41:08', '__adm_Catalogs_images__', 'Zdjęcia katalogów', 1);
INSERT INTO `sheetlanguages` VALUES(115, '2011-08-28 11:20:32', '__adm_No_permissions__', 'Brak uprawnień', 1);
INSERT INTO `sheetlanguages` VALUES(116, '2011-08-29 10:30:39', '__No_articles__', 'No articles', 2);
INSERT INTO `sheetlanguages` VALUES(117, '2011-08-29 10:30:39', '__No_article__', 'No article', 2);
INSERT INTO `sheetlanguages` VALUES(118, '2011-08-29 10:30:39', '__adm_No_article__', 'No article', 2);
INSERT INTO `sheetlanguages` VALUES(119, '2011-08-29 10:30:39', '__adm_No_articles__', 'No articles', 2);
INSERT INTO `sheetlanguages` VALUES(120, '2011-08-29 10:30:39', '__Categories__', 'Categories', 2);
INSERT INTO `sheetlanguages` VALUES(121, '2011-08-29 10:30:39', '__Articles__', 'Articles', 2);
INSERT INTO `sheetlanguages` VALUES(122, '2011-08-29 10:30:39', '__dummy__', 'dummy', 2);
INSERT INTO `sheetlanguages` VALUES(123, '2011-08-29 10:30:39', '__adm_Categories__', 'Categories', 2);
INSERT INTO `sheetlanguages` VALUES(124, '2011-08-29 10:30:39', '__adm_Articles__', 'Articles', 2);
INSERT INTO `sheetlanguages` VALUES(125, '2011-08-29 10:30:39', '__adm_Id__', 'Id', 2);
INSERT INTO `sheetlanguages` VALUES(126, '2011-08-29 10:30:39', '__adm_Title__', 'Title', 2);
INSERT INTO `sheetlanguages` VALUES(127, '2011-08-29 10:30:39', '__adm_Active__', 'Active', 2);
INSERT INTO `sheetlanguages` VALUES(128, '2011-08-29 10:30:39', '__adm_Category__', 'Category', 2);
INSERT INTO `sheetlanguages` VALUES(129, '2011-08-29 10:30:39', '__adm_Author__', 'Author', 2);
INSERT INTO `sheetlanguages` VALUES(130, '2011-08-29 10:30:39', '__adm_Create_date__', 'Create date', 2);
INSERT INTO `sheetlanguages` VALUES(131, '2011-08-29 10:30:39', '__adm_Visits__', 'Visits', 2);
INSERT INTO `sheetlanguages` VALUES(132, '2011-08-29 10:30:39', '__adm_Delete__', 'Delete', 2);
INSERT INTO `sheetlanguages` VALUES(133, '2011-08-29 10:30:39', '__adm_LP__', 'LP', 2);
INSERT INTO `sheetlanguages` VALUES(134, '2011-08-29 10:30:39', '__adm_Activity__', 'Activity', 2);
INSERT INTO `sheetlanguages` VALUES(135, '2011-08-29 10:30:39', '__adm_Filter__', 'Filter', 2);
INSERT INTO `sheetlanguages` VALUES(136, '2011-08-29 10:30:39', '__adm_no_Active__', 'no Active', 2);
INSERT INTO `sheetlanguages` VALUES(137, '2011-08-29 10:30:39', '__adm_All__', 'All', 2);
INSERT INTO `sheetlanguages` VALUES(138, '2011-08-29 10:30:39', '__adm_Galeries__', 'Galeries', 2);
INSERT INTO `sheetlanguages` VALUES(139, '2011-08-29 10:30:39', '__adm_Calendarium__', 'Calendarium', 2);
INSERT INTO `sheetlanguages` VALUES(140, '2011-08-29 10:30:39', '__adm_Classfields__', 'Classfields', 2);
INSERT INTO `sheetlanguages` VALUES(141, '2011-08-29 10:30:39', '__adm_Forum__', 'Forum', 2);
INSERT INTO `sheetlanguages` VALUES(142, '2011-08-29 10:30:39', '__adm_Wiki__', 'Wiki', 2);
INSERT INTO `sheetlanguages` VALUES(143, '2011-08-29 10:30:39', '__adm_Catalogs__', 'Catalogs', 2);
INSERT INTO `sheetlanguages` VALUES(144, '2011-08-29 10:30:39', '__adm_Shop__', 'Shop', 2);
INSERT INTO `sheetlanguages` VALUES(145, '2011-08-29 10:30:39', '__adm_Stats__', 'Stats', 2);
INSERT INTO `sheetlanguages` VALUES(146, '2011-08-29 10:30:39', '__adm_Advertisement__', 'Advertisement', 2);
INSERT INTO `sheetlanguages` VALUES(147, '2011-08-29 10:30:39', '__adm_Mailing__', 'Mailing', 2);
INSERT INTO `sheetlanguages` VALUES(148, '2011-08-29 10:30:39', '__adm_Users__', 'Users', 2);
INSERT INTO `sheetlanguages` VALUES(149, '2011-08-29 10:30:39', '__adm_Sheets__', 'Sheets', 2);
INSERT INTO `sheetlanguages` VALUES(150, '2011-08-29 10:30:39', '__adm_Logout__', 'Logout', 2);
INSERT INTO `sheetlanguages` VALUES(151, '2011-08-29 10:30:39', '__adm_Editarticle__', 'Editarticle', 2);
INSERT INTO `sheetlanguages` VALUES(152, '2011-08-29 10:30:39', '__adm_Name__', 'Name', 2);
INSERT INTO `sheetlanguages` VALUES(153, '2011-08-29 10:30:39', '__adm_No_categories__', 'No categories', 2);
INSERT INTO `sheetlanguages` VALUES(154, '2011-08-29 10:30:39', '__adm_Category_parents__', 'Category parents', 2);
INSERT INTO `sheetlanguages` VALUES(155, '2011-08-29 10:30:39', '__adm_Category_root__', 'Category root', 2);
INSERT INTO `sheetlanguages` VALUES(156, '2011-08-29 10:30:39', '__adm_Site__', 'Site', 2);
INSERT INTO `sheetlanguages` VALUES(157, '2011-08-29 10:30:39', '__adm_Editcategory__', 'Editcategory', 2);
INSERT INTO `sheetlanguages` VALUES(158, '2011-08-29 10:30:39', '__adm_Selectlanguage__', 'Select language', 2);
INSERT INTO `sheetlanguages` VALUES(159, '2011-08-29 10:30:39', '__adm_Calendars__', 'Calendars', 2);
INSERT INTO `sheetlanguages` VALUES(160, '2011-08-29 10:30:39', '__adm_Event_types__', 'Event types', 2);
INSERT INTO `sheetlanguages` VALUES(161, '2011-08-29 10:30:39', '__adm_Events__', 'Events', 2);
INSERT INTO `sheetlanguages` VALUES(162, '2011-08-29 10:30:39', '__adm_Eventtypes__', 'Eventtypes', 2);
INSERT INTO `sheetlanguages` VALUES(163, '2011-08-29 10:30:39', '__adm_Add__', 'Add', 2);
INSERT INTO `sheetlanguages` VALUES(164, '2011-08-29 10:30:39', '__adm_Saveandadd__', 'Saveandadd', 2);
INSERT INTO `sheetlanguages` VALUES(165, '2011-08-29 10:30:39', '__adm_Cancel__', 'Cancel', 2);
INSERT INTO `sheetlanguages` VALUES(166, '2011-08-29 10:30:39', '__adm_Duplicate__', 'Duplicate', 2);
INSERT INTO `sheetlanguages` VALUES(167, '2011-08-29 10:30:39', '__adm_Numberofitems__', 'Number of items', 2);
INSERT INTO `sheetlanguages` VALUES(168, '2011-08-29 10:30:39', '__adm_No_translation__', 'No translation', 2);
INSERT INTO `sheetlanguages` VALUES(169, '2011-08-29 10:30:39', '__adm_Save__', 'Save', 2);
INSERT INTO `sheetlanguages` VALUES(170, '2011-08-29 10:30:39', '__adm_Statistics__', 'Statistics', 2);
INSERT INTO `sheetlanguages` VALUES(171, '2011-08-29 10:30:39', '__adm_Sites__', 'Sites', 2);
INSERT INTO `sheetlanguages` VALUES(172, '2011-08-29 10:30:39', '__adm_SheetFiles__', 'SheetFiles', 2);
INSERT INTO `sheetlanguages` VALUES(173, '2011-08-29 10:30:39', '__adm_CMS__', 'CMS', 2);
INSERT INTO `sheetlanguages` VALUES(174, '2011-08-29 10:30:39', '__adm_Portal__', 'Portal', 2);
INSERT INTO `sheetlanguages` VALUES(175, '2011-08-29 10:30:39', '__adm_Images__', 'Images', 2);
INSERT INTO `sheetlanguages` VALUES(176, '2011-08-29 10:30:39', '__adm_Selectactivesite__', 'Select active site', 2);
INSERT INTO `sheetlanguages` VALUES(177, '2011-08-29 10:30:39', '__adm_Galleries__', 'Galleries', 2);
INSERT INTO `sheetlanguages` VALUES(178, '2011-08-29 10:30:39', '__Are_you_sure?__', 'Are you sure?', 2);
INSERT INTO `sheetlanguages` VALUES(179, '2011-08-29 10:30:39', '__adm_Portal_Info__', 'Portal Info', 2);
INSERT INTO `sheetlanguages` VALUES(180, '2011-08-29 10:30:39', '__adm_User_Profile__', 'User Profile', 2);
INSERT INTO `sheetlanguages` VALUES(181, '2011-08-29 10:30:39', '__adm_Groups__', 'Groups', 2);
INSERT INTO `sheetlanguages` VALUES(182, '2011-08-29 10:30:39', '__adm_User_Profiles__', 'User Profiles', 2);
INSERT INTO `sheetlanguages` VALUES(183, '2011-08-29 10:30:39', '__adm_Email__', 'Email', 2);
INSERT INTO `sheetlanguages` VALUES(184, '2011-08-29 10:30:39', '__adm_User_Name__', 'User Name', 2);
INSERT INTO `sheetlanguages` VALUES(185, '2011-08-29 10:30:39', '__adm_Event_type__', 'Event type', 2);
INSERT INTO `sheetlanguages` VALUES(186, '2011-08-29 10:30:39', '__am_Event_types__', 'Event types', 2);
INSERT INTO `sheetlanguages` VALUES(187, '2011-08-29 10:30:39', '__adm_Start_date__', 'Start date', 2);
INSERT INTO `sheetlanguages` VALUES(188, '2011-08-29 10:30:39', '__adm_End_date__', 'End date', 2);
INSERT INTO `sheetlanguages` VALUES(189, '2011-08-29 10:30:39', '__adm_Event__', 'Event', 2);
INSERT INTO `sheetlanguages` VALUES(190, '2011-08-29 10:30:39', '__adm_Repetitio__', 'Repetitio', 2);
INSERT INTO `sheetlanguages` VALUES(191, '2011-08-29 10:30:39', '__adm_Course__', 'Course', 2);
INSERT INTO `sheetlanguages` VALUES(192, '2011-08-29 10:30:39', '__adm_Courses__', 'Courses', 2);
INSERT INTO `sheetlanguages` VALUES(193, '2011-08-29 10:30:39', '__adm_Test__', 'Test', 2);
INSERT INTO `sheetlanguages` VALUES(194, '2011-08-29 10:30:39', '__adm_Tests__', 'Tests', 2);
INSERT INTO `sheetlanguages` VALUES(195, '2011-08-29 10:30:39', '__adm_Question__', 'Question', 2);
INSERT INTO `sheetlanguages` VALUES(196, '2011-08-29 10:30:39', '__adm_Questions__', 'Questions', 2);
INSERT INTO `sheetlanguages` VALUES(197, '2011-08-29 10:30:39', '__adm_Answer__', 'Answer', 2);
INSERT INTO `sheetlanguages` VALUES(198, '2011-08-29 10:30:39', '__adm_Answers__', 'Answers', 2);
INSERT INTO `sheetlanguages` VALUES(199, '2011-08-29 10:30:39', '__adm_Show_questions__', 'Show questions', 2);
INSERT INTO `sheetlanguages` VALUES(200, '2011-08-29 10:30:39', '__adm_Show_tests__', 'Show tests', 2);
INSERT INTO `sheetlanguages` VALUES(201, '2011-08-29 10:30:39', '__adm_Show_answers__', 'Show answers', 2);
INSERT INTO `sheetlanguages` VALUES(202, '2011-08-29 10:30:39', '__adm_Ads__', 'Ads', 2);
INSERT INTO `sheetlanguages` VALUES(203, '2011-08-29 10:30:39', '__adm_Ad__', 'Ad', 2);
INSERT INTO `sheetlanguages` VALUES(204, '2011-08-29 10:30:39', '__adm_Ads_images__', 'Ads images', 2);
INSERT INTO `sheetlanguages` VALUES(205, '2011-08-29 10:30:39', '__adm_Ads_image__', 'Ads image', 2);
INSERT INTO `sheetlanguages` VALUES(206, '2011-08-29 10:30:39', '__adm_Ads_Categories__', 'Ads Categories', 2);
INSERT INTO `sheetlanguages` VALUES(207, '2011-08-29 10:30:39', '__adm_Ads_Category__', 'Ads Category', 2);
INSERT INTO `sheetlanguages` VALUES(208, '2011-08-29 10:30:39', '__adm_Catalogs_categories__', 'Catalogs categories', 2);
INSERT INTO `sheetlanguages` VALUES(209, '2011-08-29 10:30:39', '__adm_Catalog_categories__', 'Catalog categories', 2);
INSERT INTO `sheetlanguages` VALUES(210, '2011-08-29 10:30:39', '__adm_Catalogs_category__', 'Catalogs category', 2);
INSERT INTO `sheetlanguages` VALUES(211, '2011-08-29 10:30:39', '__adm_Catalog_category__', 'Catalog category', 2);
INSERT INTO `sheetlanguages` VALUES(212, '2011-08-29 10:30:39', '__adm_Catalog__', 'Catalog', 2);
INSERT INTO `sheetlanguages` VALUES(213, '2011-08-29 10:30:39', '__adm_Catalog_items__', 'Catalog items', 2);
INSERT INTO `sheetlanguages` VALUES(214, '2011-08-29 10:30:39', '__adm_Catalog_item__', 'Catalog item', 2);
INSERT INTO `sheetlanguages` VALUES(215, '2011-08-29 10:30:39', '__adm_Menu__', 'Menu', 2);
INSERT INTO `sheetlanguages` VALUES(216, '2011-08-29 10:30:39', '__adm_Menu_item__', 'Menu item', 2);
INSERT INTO `sheetlanguages` VALUES(217, '2011-08-29 10:30:39', '__adm_Menu_items__', 'Menu items', 2);
INSERT INTO `sheetlanguages` VALUES(218, '2011-08-29 10:30:39', '__adm_Select_module__', 'Select module', 2);
INSERT INTO `sheetlanguages` VALUES(219, '2011-08-29 10:30:39', '__adm_Change__', 'Change', 2);
INSERT INTO `sheetlanguages` VALUES(220, '2011-08-29 10:30:39', '__adm_Module__', 'Module', 2);
INSERT INTO `sheetlanguages` VALUES(221, '2011-08-29 10:30:39', '__adm_Modules__', 'Modules', 2);
INSERT INTO `sheetlanguages` VALUES(222, '2011-08-29 10:30:39', '__adm_Position__', 'Position', 2);
INSERT INTO `sheetlanguages` VALUES(223, '2011-08-29 10:30:39', '__adm_Positions__', 'Positions', 2);
INSERT INTO `sheetlanguages` VALUES(224, '2011-08-29 10:30:39', '__adm_TopMenu__', 'TopMenu', 2);
INSERT INTO `sheetlanguages` VALUES(225, '2011-08-29 10:30:39', '__adm_Catalogs_images__', 'Catalogs images', 2);
INSERT INTO `sheetlanguages` VALUES(226, '2011-08-29 10:30:39', '__adm_No_permissions__', 'No permissions', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sheetlanguages_permissions`
--

CREATE TABLE `sheetlanguages_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portalsiteconstlanguage_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portalsiteconstlanguage_id` (`portalsiteconstlanguage_id`,`permisiongroup_id`),
  KEY `sheetlanguages_permissions_f1573e83` (`portalsiteconstlanguage_id`),
  KEY `sheetlanguages_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `sheetlanguages_permissions`
--

INSERT INTO `sheetlanguages_permissions` VALUES(1, 114, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sheetlanguages_sites`
--

CREATE TABLE `sheetlanguages_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portalsiteconstlanguage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portalsiteconstlanguage_id` (`portalsiteconstlanguage_id`,`site_id`),
  KEY `sheetlanguages_sites_f1573e83` (`portalsiteconstlanguage_id`),
  KEY `sheetlanguages_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=186 ;

--
-- Zrzut danych tabeli `sheetlanguages_sites`
--

INSERT INTO `sheetlanguages_sites` VALUES(1, 1, 1);
INSERT INTO `sheetlanguages_sites` VALUES(2, 2, 1);
INSERT INTO `sheetlanguages_sites` VALUES(3, 3, 1);
INSERT INTO `sheetlanguages_sites` VALUES(4, 4, 1);
INSERT INTO `sheetlanguages_sites` VALUES(5, 5, 1);
INSERT INTO `sheetlanguages_sites` VALUES(6, 6, 1);
INSERT INTO `sheetlanguages_sites` VALUES(7, 7, 1);
INSERT INTO `sheetlanguages_sites` VALUES(8, 8, 1);
INSERT INTO `sheetlanguages_sites` VALUES(9, 9, 1);
INSERT INTO `sheetlanguages_sites` VALUES(10, 10, 1);
INSERT INTO `sheetlanguages_sites` VALUES(11, 11, 1);
INSERT INTO `sheetlanguages_sites` VALUES(12, 12, 1);
INSERT INTO `sheetlanguages_sites` VALUES(13, 13, 1);
INSERT INTO `sheetlanguages_sites` VALUES(14, 14, 1);
INSERT INTO `sheetlanguages_sites` VALUES(15, 15, 1);
INSERT INTO `sheetlanguages_sites` VALUES(16, 16, 1);
INSERT INTO `sheetlanguages_sites` VALUES(17, 17, 1);
INSERT INTO `sheetlanguages_sites` VALUES(18, 18, 1);
INSERT INTO `sheetlanguages_sites` VALUES(19, 19, 1);
INSERT INTO `sheetlanguages_sites` VALUES(20, 20, 1);
INSERT INTO `sheetlanguages_sites` VALUES(21, 22, 1);
INSERT INTO `sheetlanguages_sites` VALUES(22, 23, 1);
INSERT INTO `sheetlanguages_sites` VALUES(23, 24, 1);
INSERT INTO `sheetlanguages_sites` VALUES(24, 25, 1);
INSERT INTO `sheetlanguages_sites` VALUES(25, 26, 1);
INSERT INTO `sheetlanguages_sites` VALUES(26, 27, 1);
INSERT INTO `sheetlanguages_sites` VALUES(27, 28, 1);
INSERT INTO `sheetlanguages_sites` VALUES(28, 29, 1);
INSERT INTO `sheetlanguages_sites` VALUES(29, 30, 1);
INSERT INTO `sheetlanguages_sites` VALUES(30, 31, 1);
INSERT INTO `sheetlanguages_sites` VALUES(31, 32, 1);
INSERT INTO `sheetlanguages_sites` VALUES(32, 33, 1);
INSERT INTO `sheetlanguages_sites` VALUES(33, 34, 1);
INSERT INTO `sheetlanguages_sites` VALUES(34, 35, 1);
INSERT INTO `sheetlanguages_sites` VALUES(35, 36, 1);
INSERT INTO `sheetlanguages_sites` VALUES(36, 37, 1);
INSERT INTO `sheetlanguages_sites` VALUES(37, 38, 1);
INSERT INTO `sheetlanguages_sites` VALUES(38, 39, 1);
INSERT INTO `sheetlanguages_sites` VALUES(39, 40, 1);
INSERT INTO `sheetlanguages_sites` VALUES(40, 41, 1);
INSERT INTO `sheetlanguages_sites` VALUES(41, 42, 1);
INSERT INTO `sheetlanguages_sites` VALUES(42, 43, 1);
INSERT INTO `sheetlanguages_sites` VALUES(43, 44, 1);
INSERT INTO `sheetlanguages_sites` VALUES(44, 45, 1);
INSERT INTO `sheetlanguages_sites` VALUES(45, 46, 1);
INSERT INTO `sheetlanguages_sites` VALUES(46, 47, 1);
INSERT INTO `sheetlanguages_sites` VALUES(47, 48, 1);
INSERT INTO `sheetlanguages_sites` VALUES(48, 49, 1);
INSERT INTO `sheetlanguages_sites` VALUES(49, 50, 1);
INSERT INTO `sheetlanguages_sites` VALUES(50, 51, 1);
INSERT INTO `sheetlanguages_sites` VALUES(51, 52, 1);
INSERT INTO `sheetlanguages_sites` VALUES(52, 53, 1);
INSERT INTO `sheetlanguages_sites` VALUES(53, 54, 1);
INSERT INTO `sheetlanguages_sites` VALUES(54, 57, 1);
INSERT INTO `sheetlanguages_sites` VALUES(55, 58, 1);
INSERT INTO `sheetlanguages_sites` VALUES(56, 59, 1);
INSERT INTO `sheetlanguages_sites` VALUES(57, 60, 1);
INSERT INTO `sheetlanguages_sites` VALUES(58, 61, 1);
INSERT INTO `sheetlanguages_sites` VALUES(59, 62, 1);
INSERT INTO `sheetlanguages_sites` VALUES(60, 63, 1);
INSERT INTO `sheetlanguages_sites` VALUES(61, 64, 1);
INSERT INTO `sheetlanguages_sites` VALUES(62, 65, 1);
INSERT INTO `sheetlanguages_sites` VALUES(63, 65, 2);
INSERT INTO `sheetlanguages_sites` VALUES(64, 65, 3);
INSERT INTO `sheetlanguages_sites` VALUES(65, 66, 1);
INSERT INTO `sheetlanguages_sites` VALUES(66, 66, 2);
INSERT INTO `sheetlanguages_sites` VALUES(67, 66, 3);
INSERT INTO `sheetlanguages_sites` VALUES(72, 67, 1);
INSERT INTO `sheetlanguages_sites` VALUES(73, 67, 3);
INSERT INTO `sheetlanguages_sites` VALUES(82, 68, 1);
INSERT INTO `sheetlanguages_sites` VALUES(83, 68, 3);
INSERT INTO `sheetlanguages_sites` VALUES(74, 69, 1);
INSERT INTO `sheetlanguages_sites` VALUES(75, 69, 3);
INSERT INTO `sheetlanguages_sites` VALUES(76, 70, 1);
INSERT INTO `sheetlanguages_sites` VALUES(77, 70, 3);
INSERT INTO `sheetlanguages_sites` VALUES(80, 71, 1);
INSERT INTO `sheetlanguages_sites` VALUES(81, 71, 3);
INSERT INTO `sheetlanguages_sites` VALUES(84, 72, 1);
INSERT INTO `sheetlanguages_sites` VALUES(85, 72, 3);
INSERT INTO `sheetlanguages_sites` VALUES(86, 73, 1);
INSERT INTO `sheetlanguages_sites` VALUES(87, 73, 3);
INSERT INTO `sheetlanguages_sites` VALUES(88, 74, 1);
INSERT INTO `sheetlanguages_sites` VALUES(89, 74, 3);
INSERT INTO `sheetlanguages_sites` VALUES(90, 75, 1);
INSERT INTO `sheetlanguages_sites` VALUES(91, 75, 3);
INSERT INTO `sheetlanguages_sites` VALUES(92, 76, 1);
INSERT INTO `sheetlanguages_sites` VALUES(93, 76, 3);
INSERT INTO `sheetlanguages_sites` VALUES(94, 77, 1);
INSERT INTO `sheetlanguages_sites` VALUES(95, 77, 3);
INSERT INTO `sheetlanguages_sites` VALUES(96, 78, 1);
INSERT INTO `sheetlanguages_sites` VALUES(97, 78, 3);
INSERT INTO `sheetlanguages_sites` VALUES(112, 79, 1);
INSERT INTO `sheetlanguages_sites` VALUES(113, 79, 3);
INSERT INTO `sheetlanguages_sites` VALUES(100, 80, 1);
INSERT INTO `sheetlanguages_sites` VALUES(101, 80, 3);
INSERT INTO `sheetlanguages_sites` VALUES(102, 81, 1);
INSERT INTO `sheetlanguages_sites` VALUES(103, 81, 3);
INSERT INTO `sheetlanguages_sites` VALUES(104, 82, 1);
INSERT INTO `sheetlanguages_sites` VALUES(105, 82, 3);
INSERT INTO `sheetlanguages_sites` VALUES(106, 83, 1);
INSERT INTO `sheetlanguages_sites` VALUES(107, 83, 3);
INSERT INTO `sheetlanguages_sites` VALUES(108, 84, 1);
INSERT INTO `sheetlanguages_sites` VALUES(109, 84, 3);
INSERT INTO `sheetlanguages_sites` VALUES(110, 85, 1);
INSERT INTO `sheetlanguages_sites` VALUES(111, 85, 3);
INSERT INTO `sheetlanguages_sites` VALUES(114, 86, 1);
INSERT INTO `sheetlanguages_sites` VALUES(115, 86, 3);
INSERT INTO `sheetlanguages_sites` VALUES(118, 87, 1);
INSERT INTO `sheetlanguages_sites` VALUES(119, 87, 3);
INSERT INTO `sheetlanguages_sites` VALUES(122, 88, 1);
INSERT INTO `sheetlanguages_sites` VALUES(123, 88, 3);
INSERT INTO `sheetlanguages_sites` VALUES(124, 89, 1);
INSERT INTO `sheetlanguages_sites` VALUES(125, 89, 3);
INSERT INTO `sheetlanguages_sites` VALUES(126, 90, 1);
INSERT INTO `sheetlanguages_sites` VALUES(127, 90, 3);
INSERT INTO `sheetlanguages_sites` VALUES(128, 91, 1);
INSERT INTO `sheetlanguages_sites` VALUES(129, 91, 3);
INSERT INTO `sheetlanguages_sites` VALUES(130, 92, 1);
INSERT INTO `sheetlanguages_sites` VALUES(131, 92, 3);
INSERT INTO `sheetlanguages_sites` VALUES(132, 93, 1);
INSERT INTO `sheetlanguages_sites` VALUES(133, 93, 3);
INSERT INTO `sheetlanguages_sites` VALUES(134, 94, 1);
INSERT INTO `sheetlanguages_sites` VALUES(135, 94, 3);
INSERT INTO `sheetlanguages_sites` VALUES(154, 96, 1);
INSERT INTO `sheetlanguages_sites` VALUES(155, 96, 3);
INSERT INTO `sheetlanguages_sites` VALUES(144, 97, 1);
INSERT INTO `sheetlanguages_sites` VALUES(145, 97, 3);
INSERT INTO `sheetlanguages_sites` VALUES(146, 98, 1);
INSERT INTO `sheetlanguages_sites` VALUES(147, 98, 3);
INSERT INTO `sheetlanguages_sites` VALUES(148, 99, 1);
INSERT INTO `sheetlanguages_sites` VALUES(149, 99, 3);
INSERT INTO `sheetlanguages_sites` VALUES(152, 101, 1);
INSERT INTO `sheetlanguages_sites` VALUES(153, 101, 3);
INSERT INTO `sheetlanguages_sites` VALUES(156, 102, 1);
INSERT INTO `sheetlanguages_sites` VALUES(157, 102, 3);
INSERT INTO `sheetlanguages_sites` VALUES(158, 103, 1);
INSERT INTO `sheetlanguages_sites` VALUES(159, 103, 3);
INSERT INTO `sheetlanguages_sites` VALUES(160, 104, 1);
INSERT INTO `sheetlanguages_sites` VALUES(161, 104, 3);
INSERT INTO `sheetlanguages_sites` VALUES(162, 105, 1);
INSERT INTO `sheetlanguages_sites` VALUES(163, 105, 3);
INSERT INTO `sheetlanguages_sites` VALUES(164, 106, 1);
INSERT INTO `sheetlanguages_sites` VALUES(165, 106, 3);
INSERT INTO `sheetlanguages_sites` VALUES(166, 107, 1);
INSERT INTO `sheetlanguages_sites` VALUES(167, 107, 3);
INSERT INTO `sheetlanguages_sites` VALUES(168, 108, 1);
INSERT INTO `sheetlanguages_sites` VALUES(169, 108, 3);
INSERT INTO `sheetlanguages_sites` VALUES(170, 109, 1);
INSERT INTO `sheetlanguages_sites` VALUES(171, 109, 3);
INSERT INTO `sheetlanguages_sites` VALUES(172, 110, 1);
INSERT INTO `sheetlanguages_sites` VALUES(173, 110, 3);
INSERT INTO `sheetlanguages_sites` VALUES(174, 111, 1);
INSERT INTO `sheetlanguages_sites` VALUES(175, 111, 3);
INSERT INTO `sheetlanguages_sites` VALUES(178, 112, 1);
INSERT INTO `sheetlanguages_sites` VALUES(179, 112, 3);
INSERT INTO `sheetlanguages_sites` VALUES(180, 113, 1);
INSERT INTO `sheetlanguages_sites` VALUES(181, 113, 3);
INSERT INTO `sheetlanguages_sites` VALUES(182, 114, 1);
INSERT INTO `sheetlanguages_sites` VALUES(183, 114, 3);
INSERT INTO `sheetlanguages_sites` VALUES(184, 115, 1);
INSERT INTO `sheetlanguages_sites` VALUES(185, 115, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sheets`
--

CREATE TABLE `sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `sheetpath` varchar(150) NOT NULL,
  `info` longtext,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sheets_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `sheets`
--

INSERT INTO `sheets` VALUES(2, '2011-07-27 13:13:15', 'PortalAdmin', 'portaladmin', '', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sheets_active`
--

CREATE TABLE `sheets_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sheet_id` (`sheet_id`,`site_id`),
  KEY `sheets_active_abbdb8c4` (`sheet_id`),
  KEY `sheets_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Zrzut danych tabeli `sheets_active`
--

INSERT INTO `sheets_active` VALUES(13, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sheets_permissions`
--

CREATE TABLE `sheets_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sheet_id` (`sheet_id`,`permisiongroup_id`),
  KEY `sheets_permissions_abbdb8c4` (`sheet_id`),
  KEY `sheets_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `sheets_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sheets_sites`
--

CREATE TABLE `sheets_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sheet_id` (`sheet_id`,`site_id`),
  KEY `sheets_sites_abbdb8c4` (`sheet_id`),
  KEY `sheets_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Zrzut danych tabeli `sheets_sites`
--

INSERT INTO `sheets_sites` VALUES(10, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `site_portal`
--

CREATE TABLE `site_portal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `visits` int(11) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `domain` varchar(250) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_portal_6223029` (`site_id`),
  KEY `site_portal_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `site_portal`
--

INSERT INTO `site_portal` VALUES(1, '', '<p>\r\n	Example portal</p>\r\n', '', '', NULL, 'Example site', 'example.com', 1, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `site_portal_permissions`
--

CREATE TABLE `site_portal_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteportal_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siteportal_id` (`siteportal_id`,`permisiongroup_id`),
  KEY `site_portal_permissions_63981e25` (`siteportal_id`),
  KEY `site_portal_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `site_portal_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `site_portal_stat`
--

CREATE TABLE `site_portal_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` char(15) DEFAULT NULL,
  `system` longtext,
  `browser` longtext,
  `site_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_portal_stat_6223029` (`site_id`),
  KEY `site_portal_stat_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `site_portal_stat`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `site_portal_stat_permissions`
--

CREATE TABLE `site_portal_stat_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteportalstat_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siteportalstat_id` (`siteportalstat_id`,`permisiongroup_id`),
  KEY `site_portal_stat_permissions_bc8c4d1f` (`siteportalstat_id`),
  KEY `site_portal_stat_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `site_portal_stat_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `states`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `taggit_tag`
--

CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `taggit_tag`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `taggit_taggeditem`
--

CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_3747b463` (`tag_id`),
  KEY `taggit_taggeditem_829e37fd` (`object_id`),
  KEY `taggit_taggeditem_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `taggit_taggeditem`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `thumbnail_kvstore`
--

CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `thumbnail_kvstore`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `wiki`
--

CREATE TABLE `wiki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `mainimage` varchar(100) DEFAULT NULL,
  `mimage_info` varchar(255) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_63f17a16` (`parent_id`),
  KEY `wiki_5d52dd10` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `wiki`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `wiki_active`
--

CREATE TABLE `wiki_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_id` (`wiki_id`,`site_id`),
  KEY `wiki_active_a3b21284` (`wiki_id`),
  KEY `wiki_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `wiki_active`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `wiki_lang`
--

CREATE TABLE `wiki_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `info` longtext,
  `meta` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id_refs_id_246ed0f1` (`language_id`),
  KEY `wiki_lang_a951d5d6` (`slug`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `wiki_lang`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `wiki_languages`
--

CREATE TABLE `wiki_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `wikilanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_id` (`wiki_id`,`wikilanguage_id`),
  KEY `wiki_languages_a3b21284` (`wiki_id`),
  KEY `wiki_languages_526934ea` (`wikilanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `wiki_languages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `wiki_permissions`
--

CREATE TABLE `wiki_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_id` (`wiki_id`,`permisiongroup_id`),
  KEY `wiki_permissions_a3b21284` (`wiki_id`),
  KEY `wiki_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `wiki_permissions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `wiki_sites`
--

CREATE TABLE `wiki_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_id` (`wiki_id`,`site_id`),
  KEY `wiki_sites_a3b21284` (`wiki_id`),
  KEY `wiki_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `wiki_sites`
--


--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ad`
--
ALTER TABLE `ad`
  ADD CONSTRAINT `owner_id_refs_id_a641c670` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `category_id_refs_id_7a482ffa` FOREIGN KEY (`category_id`) REFERENCES `ad_cat` (`id`);

--
-- Ograniczenia dla tabeli `ads_image_lang`
--
ALTER TABLE `ads_image_lang`
  ADD CONSTRAINT `language_id_refs_id_421cd526` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `ad_active`
--
ALTER TABLE `ad_active`
  ADD CONSTRAINT `ad_id_refs_id_2faacbe1` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d2c9274` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `ad_cat`
--
ALTER TABLE `ad_cat`
  ADD CONSTRAINT `owner_id_refs_id_b3a381d9` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_2c08723d` FOREIGN KEY (`parent_id`) REFERENCES `ad_cat` (`id`);

--
-- Ograniczenia dla tabeli `ad_cat_active`
--
ALTER TABLE `ad_cat_active`
  ADD CONSTRAINT `adcategory_id_refs_id_70d55ab` FOREIGN KEY (`adcategory_id`) REFERENCES `ad_cat` (`id`),
  ADD CONSTRAINT `site_id_refs_id_92ec78d1` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `ad_cat_lang`
--
ALTER TABLE `ad_cat_lang`
  ADD CONSTRAINT `language_id_refs_id_b0d7340d` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `ad_cat_languages`
--
ALTER TABLE `ad_cat_languages`
  ADD CONSTRAINT `adcategory_id_refs_id_cf4974d9` FOREIGN KEY (`adcategory_id`) REFERENCES `ad_cat` (`id`),
  ADD CONSTRAINT `adcategorylanguage_id_refs_id_d3fde58b` FOREIGN KEY (`adcategorylanguage_id`) REFERENCES `ad_cat_lang` (`id`);

--
-- Ograniczenia dla tabeli `ad_cat_permissions`
--
ALTER TABLE `ad_cat_permissions`
  ADD CONSTRAINT `adcategory_id_refs_id_99562c6e` FOREIGN KEY (`adcategory_id`) REFERENCES `ad_cat` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_f0ccc813` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `ad_cat_sites`
--
ALTER TABLE `ad_cat_sites`
  ADD CONSTRAINT `adcategory_id_refs_id_d5d1afb8` FOREIGN KEY (`adcategory_id`) REFERENCES `ad_cat` (`id`),
  ADD CONSTRAINT `site_id_refs_id_99249f06` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `ad_image`
--
ALTER TABLE `ad_image`
  ADD CONSTRAINT `owner_id_refs_id_72c31b64` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `ad_images`
--
ALTER TABLE `ad_images`
  ADD CONSTRAINT `ad_id_refs_id_e6128017` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`),
  ADD CONSTRAINT `adimage_id_refs_id_f8fc9c1d` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`);

--
-- Ograniczenia dla tabeli `ad_image_active`
--
ALTER TABLE `ad_image_active`
  ADD CONSTRAINT `adimage_id_refs_id_815c9ab9` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`),
  ADD CONSTRAINT `site_id_refs_id_596ad480` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `ad_image_languages`
--
ALTER TABLE `ad_image_languages`
  ADD CONSTRAINT `adimage_id_refs_id_80ba2579` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`),
  ADD CONSTRAINT `adimagelanguage_id_refs_id_d175cccb` FOREIGN KEY (`adimagelanguage_id`) REFERENCES `ads_image_lang` (`id`);

--
-- Ograniczenia dla tabeli `ad_image_permissions`
--
ALTER TABLE `ad_image_permissions`
  ADD CONSTRAINT `adimage_id_refs_id_1efd6d7c` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_6d135c64` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `ad_image_sites`
--
ALTER TABLE `ad_image_sites`
  ADD CONSTRAINT `adimage_id_refs_id_47817d96` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d6aa6ba3` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `ad_lang`
--
ALTER TABLE `ad_lang`
  ADD CONSTRAINT `language_id_refs_id_b1feb076` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `ad_languages`
--
ALTER TABLE `ad_languages`
  ADD CONSTRAINT `ad_id_refs_id_b451f03f` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`),
  ADD CONSTRAINT `adlanguage_id_refs_id_5a4655cb` FOREIGN KEY (`adlanguage_id`) REFERENCES `ad_lang` (`id`);

--
-- Ograniczenia dla tabeli `ad_permissions`
--
ALTER TABLE `ad_permissions`
  ADD CONSTRAINT `ad_id_refs_id_cc7345b0` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_2a78c104` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `ad_sites`
--
ALTER TABLE `ad_sites`
  ADD CONSTRAINT `ad_id_refs_id_fcd53bfe` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`),
  ADD CONSTRAINT `site_id_refs_id_677fc957` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `articlelanguages`
--
ALTER TABLE `articlelanguages`
  ADD CONSTRAINT `language_id_refs_id_fc54b360` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `owner_id_refs_id_57f2d594` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `category_id_refs_id_c4ff279c` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `event_id_refs_id_a339f69f` FOREIGN KEY (`event_id`) REFERENCES `calendarevents` (`id`),
  ADD CONSTRAINT `gallery_id_refs_id_f5d15fb` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`);

--
-- Ograniczenia dla tabeli `articles_active`
--
ALTER TABLE `articles_active`
  ADD CONSTRAINT `article_id_refs_id_118cbc97` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `site_id_refs_id_6a89008` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `articles_languages`
--
ALTER TABLE `articles_languages`
  ADD CONSTRAINT `article_id_refs_id_c2f3e7e9` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `articlelanguage_id_refs_id_31ce88b7` FOREIGN KEY (`articlelanguage_id`) REFERENCES `articlelanguages` (`id`);

--
-- Ograniczenia dla tabeli `articles_permissions`
--
ALTER TABLE `articles_permissions`
  ADD CONSTRAINT `article_id_refs_id_b463d014` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_8cca0194` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `articles_sites`
--
ALTER TABLE `articles_sites`
  ADD CONSTRAINT `article_id_refs_id_ddddf756` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `site_id_refs_id_be9c23e5` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Ograniczenia dla tabeli `auth_message`
--
ALTER TABLE `auth_message`
  ADD CONSTRAINT `user_id_refs_id_9af0b65a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Ograniczenia dla tabeli `calendareventlanguages`
--
ALTER TABLE `calendareventlanguages`
  ADD CONSTRAINT `language_id_refs_id_6203068a` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `calendarevents`
--
ALTER TABLE `calendarevents`
  ADD CONSTRAINT `state_id_refs_id_3135fcb4` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `calendar_id_refs_id_65499d0` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_1e59c056` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `type_id_refs_id_b87b7794` FOREIGN KEY (`type_id`) REFERENCES `calendartypes` (`id`);

--
-- Ograniczenia dla tabeli `calendarevents_active`
--
ALTER TABLE `calendarevents_active`
  ADD CONSTRAINT `calendarevent_id_refs_id_49baa995` FOREIGN KEY (`calendarevent_id`) REFERENCES `calendarevents` (`id`),
  ADD CONSTRAINT `site_id_refs_id_c4e8dbba` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `calendarevents_languages`
--
ALTER TABLE `calendarevents_languages`
  ADD CONSTRAINT `calendarevent_id_refs_id_832e2563` FOREIGN KEY (`calendarevent_id`) REFERENCES `calendarevents` (`id`),
  ADD CONSTRAINT `calendareventlanguage_id_refs_id_14e355` FOREIGN KEY (`calendareventlanguage_id`) REFERENCES `calendareventlanguages` (`id`);

--
-- Ograniczenia dla tabeli `calendarevents_permissions`
--
ALTER TABLE `calendarevents_permissions`
  ADD CONSTRAINT `calendarevent_id_refs_id_e50a7f78` FOREIGN KEY (`calendarevent_id`) REFERENCES `calendarevents` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_ab4e7b6` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `calendarevents_sites`
--
ALTER TABLE `calendarevents_sites`
  ADD CONSTRAINT `calendarevent_id_refs_id_1b050722` FOREIGN KEY (`calendarevent_id`) REFERENCES `calendarevents` (`id`),
  ADD CONSTRAINT `site_id_refs_id_ddbd44f9` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `calendareventtypelanguages`
--
ALTER TABLE `calendareventtypelanguages`
  ADD CONSTRAINT `language_id_refs_id_f4a6a2b2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `calendarlanguages`
--
ALTER TABLE `calendarlanguages`
  ADD CONSTRAINT `language_id_refs_id_96bade93` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `calendars`
--
ALTER TABLE `calendars`
  ADD CONSTRAINT `owner_id_refs_id_959569b` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `calendars_active`
--
ALTER TABLE `calendars_active`
  ADD CONSTRAINT `calendar_id_refs_id_4fedcd1f` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `site_id_refs_id_232b7baf` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `calendars_languages`
--
ALTER TABLE `calendars_languages`
  ADD CONSTRAINT `calendar_id_refs_id_e5ec7aa3` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `calendarlanguage_id_refs_id_51658bab` FOREIGN KEY (`calendarlanguage_id`) REFERENCES `calendarlanguages` (`id`);

--
-- Ograniczenia dla tabeli `calendars_permissions`
--
ALTER TABLE `calendars_permissions`
  ADD CONSTRAINT `calendar_id_refs_id_7a056b6a` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_408f8065` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `calendars_sites`
--
ALTER TABLE `calendars_sites`
  ADD CONSTRAINT `calendar_id_refs_id_45474908` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `site_id_refs_id_de0d12a` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `calendartypes`
--
ALTER TABLE `calendartypes`
  ADD CONSTRAINT `owner_id_refs_id_c2b5550f` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `calendartypes_active`
--
ALTER TABLE `calendartypes_active`
  ADD CONSTRAINT `calendareventtype_id_refs_id_93c9464f` FOREIGN KEY (`calendareventtype_id`) REFERENCES `calendartypes` (`id`),
  ADD CONSTRAINT `site_id_refs_id_83ecdb45` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `calendartypes_languages`
--
ALTER TABLE `calendartypes_languages`
  ADD CONSTRAINT `calendareventtype_id_refs_id_54855073` FOREIGN KEY (`calendareventtype_id`) REFERENCES `calendartypes` (`id`),
  ADD CONSTRAINT `calendareventtypelanguage_id_refs_id_ae3e87ba` FOREIGN KEY (`calendareventtypelanguage_id`) REFERENCES `calendareventtypelanguages` (`id`);

--
-- Ograniczenia dla tabeli `calendartypes_permissions`
--
ALTER TABLE `calendartypes_permissions`
  ADD CONSTRAINT `calendareventtype_id_refs_id_350959a6` FOREIGN KEY (`calendareventtype_id`) REFERENCES `calendartypes` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_41d54119` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `calendartypes_sites`
--
ALTER TABLE `calendartypes_sites`
  ADD CONSTRAINT `calendareventtype_id_refs_id_9454bff8` FOREIGN KEY (`calendareventtype_id`) REFERENCES `calendartypes` (`id`),
  ADD CONSTRAINT `site_id_refs_id_4ad633c2` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_cat`
--
ALTER TABLE `catalogs_cat`
  ADD CONSTRAINT `parent_id_refs_id_9ceba5a5` FOREIGN KEY (`parent_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_2cfbce88` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_cat_active`
--
ALTER TABLE `catalogs_cat_active`
  ADD CONSTRAINT `catalogcategory_id_refs_id_2c4551d9` FOREIGN KEY (`catalogcategory_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `site_id_refs_id_366ab804` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_cat_lang`
--
ALTER TABLE `catalogs_cat_lang`
  ADD CONSTRAINT `language_id_refs_id_29bca8c2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_cat_languages`
--
ALTER TABLE `catalogs_cat_languages`
  ADD CONSTRAINT `catalogcategory_id_refs_id_f1cbfdf1` FOREIGN KEY (`catalogcategory_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `catalogcategorylanguage_id_refs_id_a8500be5` FOREIGN KEY (`catalogcategorylanguage_id`) REFERENCES `catalogs_cat_lang` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_cat_permissions`
--
ALTER TABLE `catalogs_cat_permissions`
  ADD CONSTRAINT `catalogcategory_id_refs_id_a96f0b14` FOREIGN KEY (`catalogcategory_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_8d370448` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_cat_sites`
--
ALTER TABLE `catalogs_cat_sites`
  ADD CONSTRAINT `catalogcategory_id_refs_id_e0f020f2` FOREIGN KEY (`catalogcategory_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `site_id_refs_id_fddb50d1` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_image`
--
ALTER TABLE `catalogs_image`
  ADD CONSTRAINT `owner_id_refs_id_860773db` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_image_active`
--
ALTER TABLE `catalogs_image_active`
  ADD CONSTRAINT `catalogimage_id_refs_id_eafc36a5` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`),
  ADD CONSTRAINT `site_id_refs_id_5feb4083` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_image_lang`
--
ALTER TABLE `catalogs_image_lang`
  ADD CONSTRAINT `language_id_refs_id_b7ede39f` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_image_languages`
--
ALTER TABLE `catalogs_image_languages`
  ADD CONSTRAINT `catalogimage_id_refs_id_167b1289` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`),
  ADD CONSTRAINT `adimagelanguage_id_refs_id_dc738212` FOREIGN KEY (`adimagelanguage_id`) REFERENCES `ads_image_lang` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_image_permissions`
--
ALTER TABLE `catalogs_image_permissions`
  ADD CONSTRAINT `catalogimage_id_refs_id_cfa9dbba` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_e5862c4f` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_image_sites`
--
ALTER TABLE `catalogs_image_sites`
  ADD CONSTRAINT `catalogimage_id_refs_id_f17aa1a8` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`),
  ADD CONSTRAINT `site_id_refs_id_e7024206` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_item`
--
ALTER TABLE `catalogs_item`
  ADD CONSTRAINT `category_id_refs_id_7575ba87` FOREIGN KEY (`category_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `country_id_refs_id_c5b07bc9` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_24d72fb2` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `state_id_refs_id_cbbd32a8` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_item_active`
--
ALTER TABLE `catalogs_item_active`
  ADD CONSTRAINT `catalogitem_id_refs_id_7d1f09f7` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`),
  ADD CONSTRAINT `site_id_refs_id_403a660e` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_item_images`
--
ALTER TABLE `catalogs_item_images`
  ADD CONSTRAINT `catalogitem_id_refs_id_48815c5b` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`),
  ADD CONSTRAINT `catalogimage_id_refs_id_3dfc32c` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_item_languages`
--
ALTER TABLE `catalogs_item_languages`
  ADD CONSTRAINT `catalogitem_id_refs_id_ff47fcff` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`),
  ADD CONSTRAINT `catalogitemlanguage_id_refs_id_fb0576c0` FOREIGN KEY (`catalogitemlanguage_id`) REFERENCES `catalogs_lang` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_item_permissions`
--
ALTER TABLE `catalogs_item_permissions`
  ADD CONSTRAINT `catalogitem_id_refs_id_1eec8364` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_73c61232` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_item_sites`
--
ALTER TABLE `catalogs_item_sites`
  ADD CONSTRAINT `catalogitem_id_refs_id_25742226` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`),
  ADD CONSTRAINT `site_id_refs_id_1cf044d5` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `catalogs_lang`
--
ALTER TABLE `catalogs_lang`
  ADD CONSTRAINT `language_id_refs_id_8a5613fb` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `parent_id_refs_id_d28b8177` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_e55436a7` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `categories_active`
--
ALTER TABLE `categories_active`
  ADD CONSTRAINT `category_id_refs_id_5dbfafdf` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d0b8cf79` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `categories_galleries`
--
ALTER TABLE `categories_galleries`
  ADD CONSTRAINT `category_id_refs_id_a82b5522` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `gallery_id_refs_id_6ba249c3` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`);

--
-- Ograniczenia dla tabeli `categories_languages`
--
ALTER TABLE `categories_languages`
  ADD CONSTRAINT `category_id_refs_id_2ba099df` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `categorylanguage_id_refs_id_496e19b` FOREIGN KEY (`categorylanguage_id`) REFERENCES `categorylanguages` (`id`);

--
-- Ograniczenia dla tabeli `categories_permissions`
--
ALTER TABLE `categories_permissions`
  ADD CONSTRAINT `category_id_refs_id_a7bbb3f2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_577a734d` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `categories_sites`
--
ALTER TABLE `categories_sites`
  ADD CONSTRAINT `category_id_refs_id_b4b3754` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `site_id_refs_id_f6d46154` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `categorylanguages`
--
ALTER TABLE `categorylanguages`
  ADD CONSTRAINT `language_id_refs_id_2a8937d3` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `parent_id_refs_id_d21fef05` FOREIGN KEY (`parent_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_1a45148a` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `gallerieslanguages`
--
ALTER TABLE `gallerieslanguages`
  ADD CONSTRAINT `language_id_refs_id_d0049166` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `galleries_active`
--
ALTER TABLE `galleries_active`
  ADD CONSTRAINT `gallery_id_refs_id_5c62bbd7` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `site_id_refs_id_db9f19f6` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `galleries_languages`
--
ALTER TABLE `galleries_languages`
  ADD CONSTRAINT `gallery_id_refs_id_c5591a6f` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `gallerylanguage_id_refs_id_31a3ac83` FOREIGN KEY (`gallerylanguage_id`) REFERENCES `gallerieslanguages` (`id`);

--
-- Ograniczenia dla tabeli `galleries_permissions`
--
ALTER TABLE `galleries_permissions`
  ADD CONSTRAINT `gallery_id_refs_id_e5eb186c` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_38b15f52` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `galleries_sites`
--
ALTER TABLE `galleries_sites`
  ADD CONSTRAINT `gallery_id_refs_id_1c841486` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `site_id_refs_id_8f1838d3` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `imagelanguages`
--
ALTER TABLE `imagelanguages`
  ADD CONSTRAINT `language_id_refs_id_c994f155` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `gallery_id_refs_id_396a15a6` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_292119af` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `images_active`
--
ALTER TABLE `images_active`
  ADD CONSTRAINT `image_id_refs_id_ec5a35eb` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `site_id_refs_id_ae207037` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `images_languages`
--
ALTER TABLE `images_languages`
  ADD CONSTRAINT `image_id_refs_id_aca91289` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `imagelanguage_id_refs_id_7aa4a585` FOREIGN KEY (`imagelanguage_id`) REFERENCES `imagelanguages` (`id`);

--
-- Ograniczenia dla tabeli `images_permissions`
--
ALTER TABLE `images_permissions`
  ADD CONSTRAINT `image_id_refs_id_a731fcd2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_48f453db` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `images_sites`
--
ALTER TABLE `images_sites`
  ADD CONSTRAINT `image_id_refs_id_27f9e3b8` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `site_id_refs_id_57a154de` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `languages_active`
--
ALTER TABLE `languages_active`
  ADD CONSTRAINT `language_id_refs_id_2b5c4887` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `site_id_refs_id_8553b3eb` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `languages_sites`
--
ALTER TABLE `languages_sites`
  ADD CONSTRAINT `language_id_refs_id_ee9f1030` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `site_id_refs_id_336ec342` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `megamenu`
--
ALTER TABLE `megamenu`
  ADD CONSTRAINT `owner_id_refs_id_b7b56dba` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `category_id_refs_id_d6c0494a` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `menu_id_refs_id_91e2d43b` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `module_id_refs_id_1c16c6e` FOREIGN KEY (`module_id`) REFERENCES `module_registered` (`id`);

--
-- Ograniczenia dla tabeli `megamenu_active`
--
ALTER TABLE `megamenu_active`
  ADD CONSTRAINT `megamenu_id_refs_id_30b6b3bd` FOREIGN KEY (`megamenu_id`) REFERENCES `megamenu` (`id`),
  ADD CONSTRAINT `site_id_refs_id_a63d68e6` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `megamenu_lang`
--
ALTER TABLE `megamenu_lang`
  ADD CONSTRAINT `language_id_refs_id_6a49f184` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `megamenu_languages`
--
ALTER TABLE `megamenu_languages`
  ADD CONSTRAINT `megamenu_id_refs_id_a540fd4b` FOREIGN KEY (`megamenu_id`) REFERENCES `megamenu` (`id`),
  ADD CONSTRAINT `megamenulanguage_id_refs_id_219fca07` FOREIGN KEY (`megamenulanguage_id`) REFERENCES `megamenu_lang` (`id`);

--
-- Ograniczenia dla tabeli `megamenu_permissions`
--
ALTER TABLE `megamenu_permissions`
  ADD CONSTRAINT `megamenu_id_refs_id_e957e504` FOREIGN KEY (`megamenu_id`) REFERENCES `megamenu` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_1a2974ba` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `megamenu_sites`
--
ALTER TABLE `megamenu_sites`
  ADD CONSTRAINT `megamenu_id_refs_id_81210fc6` FOREIGN KEY (`megamenu_id`) REFERENCES `megamenu` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d31fe563` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `owner_id_refs_id_8fe44a04` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `module_id_refs_id_c5896330` FOREIGN KEY (`module_id`) REFERENCES `module_registered` (`id`);

--
-- Ograniczenia dla tabeli `menuitem`
--
ALTER TABLE `menuitem`
  ADD CONSTRAINT `owner_id_refs_id_85d9bf71` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `menu_id_refs_id_1e6573e0` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `module_id_refs_id_d86a01c3` FOREIGN KEY (`module_id`) REFERENCES `module_registered` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_93836093` FOREIGN KEY (`parent_id`) REFERENCES `menuitem` (`id`);

--
-- Ograniczenia dla tabeli `menuitem_active`
--
ALTER TABLE `menuitem_active`
  ADD CONSTRAINT `menuitem_id_refs_id_77d9ac57` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `site_id_refs_id_58c67bbd` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `menuitem_lang`
--
ALTER TABLE `menuitem_lang`
  ADD CONSTRAINT `language_id_refs_id_4fd5574f` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `menuitem_languages`
--
ALTER TABLE `menuitem_languages`
  ADD CONSTRAINT `menuitem_id_refs_id_e4a82099` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `menuitemlanguage_id_refs_id_98a21747` FOREIGN KEY (`menuitemlanguage_id`) REFERENCES `menuitem_lang` (`id`);

--
-- Ograniczenia dla tabeli `menuitem_permissions`
--
ALTER TABLE `menuitem_permissions`
  ADD CONSTRAINT `menuitem_id_refs_id_3e77aff6` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_7b980849` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `menuitem_sites`
--
ALTER TABLE `menuitem_sites`
  ADD CONSTRAINT `menuitem_id_refs_id_c4d8f3e8` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `site_id_refs_id_55875ede` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `menu_active`
--
ALTER TABLE `menu_active`
  ADD CONSTRAINT `menu_id_refs_id_b7154e19` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `site_id_refs_id_bdf76700` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `menu_permissions`
--
ALTER TABLE `menu_permissions`
  ADD CONSTRAINT `menu_id_refs_id_9a710374` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_a49a6d74` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `menu_sites`
--
ALTER TABLE `menu_sites`
  ADD CONSTRAINT `menu_id_refs_id_608f4d9e` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `site_id_refs_id_7d5cdf7b` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `module_article_list_option`
--
ALTER TABLE `module_article_list_option`
  ADD CONSTRAINT `category_id_refs_id_afaf25e9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `menuitem_id_refs_id_d15289db` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `module_id_refs_id_373ffb25` FOREIGN KEY (`module_id`) REFERENCES `module_registered` (`id`);

--
-- Ograniczenia dla tabeli `module_article_option`
--
ALTER TABLE `module_article_option`
  ADD CONSTRAINT `article_id_refs_id_4a0d21e8` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `menuitem_id_refs_id_845e1a33` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `module_id_refs_id_5654e2a3` FOREIGN KEY (`module_id`) REFERENCES `module_registered` (`id`);

--
-- Ograniczenia dla tabeli `module_menu_option`
--
ALTER TABLE `module_menu_option`
  ADD CONSTRAINT `menu_id_refs_id_61eca25c` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `module_id_refs_id_1a6f2f79` FOREIGN KEY (`module_id`) REFERENCES `module_registered` (`id`);

--
-- Ograniczenia dla tabeli `module_position`
--
ALTER TABLE `module_position`
  ADD CONSTRAINT `owner_id_refs_id_a68935cc` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `module_position_active`
--
ALTER TABLE `module_position_active`
  ADD CONSTRAINT `moduleposition_id_refs_id_689549bf` FOREIGN KEY (`moduleposition_id`) REFERENCES `module_position` (`id`),
  ADD CONSTRAINT `site_id_refs_id_a7402c20` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `module_position_permissions`
--
ALTER TABLE `module_position_permissions`
  ADD CONSTRAINT `moduleposition_id_refs_id_b6c618e8` FOREIGN KEY (`moduleposition_id`) REFERENCES `module_position` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_1a47ee90` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `module_position_sites`
--
ALTER TABLE `module_position_sites`
  ADD CONSTRAINT `moduleposition_id_refs_id_f3748c5e` FOREIGN KEY (`moduleposition_id`) REFERENCES `module_position` (`id`),
  ADD CONSTRAINT `site_id_refs_id_c2833c3d` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `module_registered`
--
ALTER TABLE `module_registered`
  ADD CONSTRAINT `owner_id_refs_id_3876d633` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `position_id_refs_id_34bcb48a` FOREIGN KEY (`position_id`) REFERENCES `module_position` (`id`),
  ADD CONSTRAINT `type_id_refs_id_d8a1cbd5` FOREIGN KEY (`type_id`) REFERENCES `module_type` (`id`);

--
-- Ograniczenia dla tabeli `module_registered_active`
--
ALTER TABLE `module_registered_active`
  ADD CONSTRAINT `registeredmodule_id_refs_id_d39dd5c9` FOREIGN KEY (`registeredmodule_id`) REFERENCES `module_registered` (`id`),
  ADD CONSTRAINT `site_id_refs_id_79c5ba93` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `module_registered_permissions`
--
ALTER TABLE `module_registered_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_54124c6d` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `registeredmodule_id_refs_id_7df1ceea` FOREIGN KEY (`registeredmodule_id`) REFERENCES `module_registered` (`id`);

--
-- Ograniczenia dla tabeli `module_registered_sites`
--
ALTER TABLE `module_registered_sites`
  ADD CONSTRAINT `registeredmodule_id_refs_id_c5c1f594` FOREIGN KEY (`registeredmodule_id`) REFERENCES `module_registered` (`id`),
  ADD CONSTRAINT `site_id_refs_id_79209df0` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `module_type_active`
--
ALTER TABLE `module_type_active`
  ADD CONSTRAINT `moduletype_id_refs_id_2d05261d` FOREIGN KEY (`moduletype_id`) REFERENCES `module_type` (`id`),
  ADD CONSTRAINT `site_id_refs_id_79dd94dd` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `module_type_sites`
--
ALTER TABLE `module_type_sites`
  ADD CONSTRAINT `moduletype_id_refs_id_7b7b1e30` FOREIGN KEY (`moduletype_id`) REFERENCES `module_type` (`id`),
  ADD CONSTRAINT `site_id_refs_id_6958e94a` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `module_visibility`
--
ALTER TABLE `module_visibility`
  ADD CONSTRAINT `model_id_refs_id_519a5e75` FOREIGN KEY (`model_id`) REFERENCES `module_registered` (`id`);

--
-- Ograniczenia dla tabeli `module_visibility_menuitem`
--
ALTER TABLE `module_visibility_menuitem`
  ADD CONSTRAINT `menuitem_id_refs_id_8b148c19` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `modulevisibility_id_refs_id_73af97d5` FOREIGN KEY (`modulevisibility_id`) REFERENCES `module_visibility` (`id`);

--
-- Ograniczenia dla tabeli `module_visibility_sites`
--
ALTER TABLE `module_visibility_sites`
  ADD CONSTRAINT `modulevisibility_id_refs_id_1b67e784` FOREIGN KEY (`modulevisibility_id`) REFERENCES `module_visibility` (`id`),
  ADD CONSTRAINT `site_id_refs_id_19386aac` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD CONSTRAINT `parent_id_refs_id_cb284e13` FOREIGN KEY (`parent_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `profiles_permissions`
--
ALTER TABLE `profiles_permissions`
  ADD CONSTRAINT `userprofile_id_refs_id_391ded56` FOREIGN KEY (`userprofile_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_bda9a079` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `profiles_sites`
--
ALTER TABLE `profiles_sites`
  ADD CONSTRAINT `userprofile_id_refs_id_1c504d5c` FOREIGN KEY (`userprofile_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `site_id_refs_id_1eb5f9d4` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `profile_data`
--
ALTER TABLE `profile_data`
  ADD CONSTRAINT `sex_id_refs_id_776a0b5c` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`id`),
  ADD CONSTRAINT `country_id_refs_id_a96ef35c` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `profile_id_refs_id_b37e1f` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `state_id_refs_id_9fce2f9d` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_answers`
--
ALTER TABLE `repetitio_answers`
  ADD CONSTRAINT `question_id_refs_id_22080e77` FOREIGN KEY (`question_id`) REFERENCES `repetitio_questions` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_answers_languages`
--
ALTER TABLE `repetitio_answers_languages`
  ADD CONSTRAINT `repetitioanswer_id_refs_id_a8715abd` FOREIGN KEY (`repetitioanswer_id`) REFERENCES `repetitio_answers` (`id`),
  ADD CONSTRAINT `repetitioanswerlanguage_id_refs_id_d7850f31` FOREIGN KEY (`repetitioanswerlanguage_id`) REFERENCES `rep_answer_lang` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_answers_permissions`
--
ALTER TABLE `repetitio_answers_permissions`
  ADD CONSTRAINT `repetitioanswer_id_refs_id_239a10d6` FOREIGN KEY (`repetitioanswer_id`) REFERENCES `repetitio_answers` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_71070d69` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_answers_sites`
--
ALTER TABLE `repetitio_answers_sites`
  ADD CONSTRAINT `repetitioanswer_id_refs_id_7436e7b0` FOREIGN KEY (`repetitioanswer_id`) REFERENCES `repetitio_answers` (`id`),
  ADD CONSTRAINT `site_id_refs_id_25a63bca` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_course`
--
ALTER TABLE `repetitio_course`
  ADD CONSTRAINT `owner_id_refs_id_a5def3fe` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_courseusers`
--
ALTER TABLE `repetitio_courseusers`
  ADD CONSTRAINT `course_id_refs_id_15d254a2` FOREIGN KEY (`course_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `user_id_refs_id_44ac5e6d` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_courseusers_sites`
--
ALTER TABLE `repetitio_courseusers_sites`
  ADD CONSTRAINT `repetitiocourseuser_id_refs_id_cb1926c0` FOREIGN KEY (`repetitiocourseuser_id`) REFERENCES `repetitio_courseusers` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d25a5eca` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_course_active`
--
ALTER TABLE `repetitio_course_active`
  ADD CONSTRAINT `repetitiocourse_id_refs_id_4115b125` FOREIGN KEY (`repetitiocourse_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `site_id_refs_id_b220446e` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_course_languages`
--
ALTER TABLE `repetitio_course_languages`
  ADD CONSTRAINT `repetitiocourse_id_refs_id_7f5dd695` FOREIGN KEY (`repetitiocourse_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `repetitiocourselanguage_id_refs_id_54c5370b` FOREIGN KEY (`repetitiocourselanguage_id`) REFERENCES `rep_course_lang` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_course_permissions`
--
ALTER TABLE `repetitio_course_permissions`
  ADD CONSTRAINT `repetitiocourse_id_refs_id_ccb16894` FOREIGN KEY (`repetitiocourse_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_93d8a6a6` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_course_sites`
--
ALTER TABLE `repetitio_course_sites`
  ADD CONSTRAINT `repetitiocourse_id_refs_id_506ec10a` FOREIGN KEY (`repetitiocourse_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `site_id_refs_id_aa5ebe57` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_questions`
--
ALTER TABLE `repetitio_questions`
  ADD CONSTRAINT `test_id_refs_id_60853fc1` FOREIGN KEY (`test_id`) REFERENCES `repetitio_tests` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_5ce77645` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_questions_active`
--
ALTER TABLE `repetitio_questions_active`
  ADD CONSTRAINT `repetitioquestion_id_refs_id_984c9623` FOREIGN KEY (`repetitioquestion_id`) REFERENCES `repetitio_questions` (`id`),
  ADD CONSTRAINT `site_id_refs_id_b31d006b` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_questions_languages`
--
ALTER TABLE `repetitio_questions_languages`
  ADD CONSTRAINT `repetitioquestion_id_refs_id_d7dcdf4d` FOREIGN KEY (`repetitioquestion_id`) REFERENCES `repetitio_questions` (`id`),
  ADD CONSTRAINT `repetitioquestionlanguage_id_refs_id_1eb16943` FOREIGN KEY (`repetitioquestionlanguage_id`) REFERENCES `rep_question_lang` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_questions_permissions`
--
ALTER TABLE `repetitio_questions_permissions`
  ADD CONSTRAINT `repetitioquestion_id_refs_id_4f697cf6` FOREIGN KEY (`repetitioquestion_id`) REFERENCES `repetitio_questions` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_8e873121` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_questions_sites`
--
ALTER TABLE `repetitio_questions_sites`
  ADD CONSTRAINT `repetitioquestion_id_refs_id_ac63a50` FOREIGN KEY (`repetitioquestion_id`) REFERENCES `repetitio_questions` (`id`),
  ADD CONSTRAINT `site_id_refs_id_3aa4edd2` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_tests`
--
ALTER TABLE `repetitio_tests`
  ADD CONSTRAINT `course_id_refs_id_baaa2dea` FOREIGN KEY (`course_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_c3f8ba1f` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_tests_active`
--
ALTER TABLE `repetitio_tests_active`
  ADD CONSTRAINT `repetitiotest_id_refs_id_690201a3` FOREIGN KEY (`repetitiotest_id`) REFERENCES `repetitio_tests` (`id`),
  ADD CONSTRAINT `site_id_refs_id_3ac50a61` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_tests_languages`
--
ALTER TABLE `repetitio_tests_languages`
  ADD CONSTRAINT `repetitiotest_id_refs_id_be682555` FOREIGN KEY (`repetitiotest_id`) REFERENCES `repetitio_tests` (`id`),
  ADD CONSTRAINT `repetitiotestlanguage_id_refs_id_308e9d75` FOREIGN KEY (`repetitiotestlanguage_id`) REFERENCES `rep_test_lang` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_tests_permissions`
--
ALTER TABLE `repetitio_tests_permissions`
  ADD CONSTRAINT `repetitiotest_id_refs_id_bd2921a6` FOREIGN KEY (`repetitiotest_id`) REFERENCES `repetitio_tests` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_e78a42bd` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_tests_sites`
--
ALTER TABLE `repetitio_tests_sites`
  ADD CONSTRAINT `repetitiotest_id_refs_id_1f824a58` FOREIGN KEY (`repetitiotest_id`) REFERENCES `repetitio_tests` (`id`),
  ADD CONSTRAINT `site_id_refs_id_b3424d22` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_useranswers`
--
ALTER TABLE `repetitio_useranswers`
  ADD CONSTRAINT `answer_id_refs_id_9b517f80` FOREIGN KEY (`answer_id`) REFERENCES `repetitio_answers` (`id`),
  ADD CONSTRAINT `question_id_refs_id_e465affc` FOREIGN KEY (`question_id`) REFERENCES `repetitio_questions` (`id`),
  ADD CONSTRAINT `test_id_refs_id_31056650` FOREIGN KEY (`test_id`) REFERENCES `repetitio_tests` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dbb6eec2` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `repetitio_useranswers_sites`
--
ALTER TABLE `repetitio_useranswers_sites`
  ADD CONSTRAINT `repetitiotestanswer_id_refs_id_6db0aefa` FOREIGN KEY (`repetitiotestanswer_id`) REFERENCES `repetitio_useranswers` (`id`),
  ADD CONSTRAINT `site_id_refs_id_37021bbb` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `rep_answer_lang`
--
ALTER TABLE `rep_answer_lang`
  ADD CONSTRAINT `language_id_refs_id_ff11d6ed` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `rep_course_lang`
--
ALTER TABLE `rep_course_lang`
  ADD CONSTRAINT `language_id_refs_id_a1105936` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `rep_question_lang`
--
ALTER TABLE `rep_question_lang`
  ADD CONSTRAINT `language_id_refs_id_cfbc1955` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `rep_test_lang`
--
ALTER TABLE `rep_test_lang`
  ADD CONSTRAINT `language_id_refs_id_39b84fc7` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `sheetfiles`
--
ALTER TABLE `sheetfiles`
  ADD CONSTRAINT `sheet_id_refs_id_dfa10195` FOREIGN KEY (`sheet_id`) REFERENCES `sheets` (`id`);

--
-- Ograniczenia dla tabeli `sheetfiles_active`
--
ALTER TABLE `sheetfiles_active`
  ADD CONSTRAINT `sheetfiles_id_refs_id_deef8a25` FOREIGN KEY (`sheetfiles_id`) REFERENCES `sheetfiles` (`id`),
  ADD CONSTRAINT `site_id_refs_id_9269365b` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `sheetlanguages`
--
ALTER TABLE `sheetlanguages`
  ADD CONSTRAINT `language_id_refs_id_13e38c25` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `sheetlanguages_permissions`
--
ALTER TABLE `sheetlanguages_permissions`
  ADD CONSTRAINT `portalsiteconstlanguage_id_refs_id_a35bad42` FOREIGN KEY (`portalsiteconstlanguage_id`) REFERENCES `sheetlanguages` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_2620ebfb` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `sheetlanguages_sites`
--
ALTER TABLE `sheetlanguages_sites`
  ADD CONSTRAINT `portalsiteconstlanguage_id_refs_id_4c8b95b8` FOREIGN KEY (`portalsiteconstlanguage_id`) REFERENCES `sheetlanguages` (`id`),
  ADD CONSTRAINT `site_id_refs_id_2e111f72` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `sheets`
--
ALTER TABLE `sheets`
  ADD CONSTRAINT `owner_id_refs_id_c38971cf` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `sheets_active`
--
ALTER TABLE `sheets_active`
  ADD CONSTRAINT `sheet_id_refs_id_13de87d1` FOREIGN KEY (`sheet_id`) REFERENCES `sheets` (`id`),
  ADD CONSTRAINT `site_id_refs_id_4d1f0791` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `sheets_permissions`
--
ALTER TABLE `sheets_permissions`
  ADD CONSTRAINT `sheet_id_refs_id_4094cde` FOREIGN KEY (`sheet_id`) REFERENCES `sheets` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_56d8fd85` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `sheets_sites`
--
ALTER TABLE `sheets_sites`
  ADD CONSTRAINT `sheet_id_refs_id_3d5718e4` FOREIGN KEY (`sheet_id`) REFERENCES `sheets` (`id`),
  ADD CONSTRAINT `site_id_refs_id_4ea848dc` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `site_portal`
--
ALTER TABLE `site_portal`
  ADD CONSTRAINT `site_id_refs_id_78054638` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_c422c3f0` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `site_portal_permissions`
--
ALTER TABLE `site_portal_permissions`
  ADD CONSTRAINT `siteportal_id_refs_id_9dcb3d88` FOREIGN KEY (`siteportal_id`) REFERENCES `site_portal` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_5d8d1844` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `site_portal_stat`
--
ALTER TABLE `site_portal_stat`
  ADD CONSTRAINT `site_id_refs_id_b2d7806a` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_99c34bae` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `site_portal_stat_permissions`
--
ALTER TABLE `site_portal_stat_permissions`
  ADD CONSTRAINT `siteportalstat_id_refs_id_f24e506c` FOREIGN KEY (`siteportalstat_id`) REFERENCES `site_portal_stat` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_2aff856` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `taggit_taggeditem`
--
ALTER TABLE `taggit_taggeditem`
  ADD CONSTRAINT `content_type_id_refs_id_5a2b7711` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `tag_id_refs_id_c87e3f85` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`);

--
-- Ograniczenia dla tabeli `wiki`
--
ALTER TABLE `wiki`
  ADD CONSTRAINT `parent_id_refs_id_5713793d` FOREIGN KEY (`parent_id`) REFERENCES `wiki` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_cb2251d7` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

--
-- Ograniczenia dla tabeli `wiki_active`
--
ALTER TABLE `wiki_active`
  ADD CONSTRAINT `wiki_id_refs_id_c00e8741` FOREIGN KEY (`wiki_id`) REFERENCES `wiki` (`id`),
  ADD CONSTRAINT `site_id_refs_id_8eb253c3` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ograniczenia dla tabeli `wiki_lang`
--
ALTER TABLE `wiki_lang`
  ADD CONSTRAINT `language_id_refs_id_246ed0f1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Ograniczenia dla tabeli `wiki_languages`
--
ALTER TABLE `wiki_languages`
  ADD CONSTRAINT `wiki_id_refs_id_6558939f` FOREIGN KEY (`wiki_id`) REFERENCES `wiki` (`id`),
  ADD CONSTRAINT `wikilanguage_id_refs_id_1ab7e709` FOREIGN KEY (`wikilanguage_id`) REFERENCES `wiki_lang` (`id`);

--
-- Ograniczenia dla tabeli `wiki_permissions`
--
ALTER TABLE `wiki_permissions`
  ADD CONSTRAINT `wiki_id_refs_id_dcd8f6c6` FOREIGN KEY (`wiki_id`) REFERENCES `wiki` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_e9a0e5cf` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

--
-- Ograniczenia dla tabeli `wiki_sites`
--
ALTER TABLE `wiki_sites`
  ADD CONSTRAINT `wiki_id_refs_id_48119700` FOREIGN KEY (`wiki_id`) REFERENCES `wiki` (`id`),
  ADD CONSTRAINT `site_id_refs_id_471baf82` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);
