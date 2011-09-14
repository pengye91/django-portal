SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


DROP TABLE IF EXISTS `ad`;
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


DROP TABLE IF EXISTS `ads_image_lang`;
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


DROP TABLE IF EXISTS `adv`;
CREATE TABLE `adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` longtext,
  `link` varchar(255) DEFAULT NULL,
  `info` longtext,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `mainimage` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `clicks` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `in_main` tinyint(1) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `file` text,
  `clickcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adv_bda51c3c` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;


DROP TABLE IF EXISTS `adv_active`;
CREATE TABLE `adv_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adv_id` (`adv_id`,`site_id`),
  KEY `adv_active_f1d84fd4` (`adv_id`),
  KEY `adv_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;


DROP TABLE IF EXISTS `adv_clients`;
CREATE TABLE `adv_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;


DROP TABLE IF EXISTS `adv_clients_active`;
CREATE TABLE `adv_clients_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advclient_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advclient_id` (`advclient_id`,`site_id`),
  KEY `adv_clients_active_4fb4fcd7` (`advclient_id`),
  KEY `adv_clients_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


DROP TABLE IF EXISTS `adv_clients_sites`;
CREATE TABLE `adv_clients_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advclient_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advclient_id` (`advclient_id`,`site_id`),
  KEY `adv_clients_sites_4fb4fcd7` (`advclient_id`),
  KEY `adv_clients_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


DROP TABLE IF EXISTS `adv_groups`;
CREATE TABLE `adv_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `info` longtext,
  `image` varchar(100) DEFAULT NULL,
  `pathinfo` varchar(255) NOT NULL,
  `noedit` tinyint(1) NOT NULL,
  `class_prefix` varchar(255) DEFAULT NULL,
  `dentoid` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;


DROP TABLE IF EXISTS `adv_groups_active`;
CREATE TABLE `adv_groups_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advgroup_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advgroup_id` (`advgroup_id`,`site_id`),
  KEY `adv_groups_active_22f4d8cc` (`advgroup_id`),
  KEY `adv_groups_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;


DROP TABLE IF EXISTS `adv_groups_sites`;
CREATE TABLE `adv_groups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advgroup_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advgroup_id` (`advgroup_id`,`site_id`),
  KEY `adv_groups_sites_22f4d8cc` (`advgroup_id`),
  KEY `adv_groups_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;


DROP TABLE IF EXISTS `adv_menuitem`;
CREATE TABLE `adv_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_id` int(11) NOT NULL,
  `menuitem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adv_id` (`adv_id`,`menuitem_id`),
  KEY `adv_menuitem_f1d84fd4` (`adv_id`),
  KEY `adv_menuitem_f8c10b8c` (`menuitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `adv_sites`;
CREATE TABLE `adv_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adv_id` (`adv_id`,`site_id`),
  KEY `adv_sites_f1d84fd4` (`adv_id`),
  KEY `adv_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;


DROP TABLE IF EXISTS `ad_active`;
CREATE TABLE `ad_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`site_id`),
  KEY `ad_active_51c59e2f` (`ad_id`),
  KEY `ad_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_cat`;
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


DROP TABLE IF EXISTS `ad_cat_active`;
CREATE TABLE `ad_cat_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adcategory_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adcategory_id` (`adcategory_id`,`site_id`),
  KEY `ad_cat_active_92cd3a0d` (`adcategory_id`),
  KEY `ad_cat_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_cat_lang`;
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


DROP TABLE IF EXISTS `ad_cat_languages`;
CREATE TABLE `ad_cat_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adcategory_id` int(11) NOT NULL,
  `adcategorylanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adcategory_id` (`adcategory_id`,`adcategorylanguage_id`),
  KEY `ad_cat_languages_92cd3a0d` (`adcategory_id`),
  KEY `ad_cat_languages_42ce22b7` (`adcategorylanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_cat_permissions`;
CREATE TABLE `ad_cat_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adcategory_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adcategory_id` (`adcategory_id`,`permisiongroup_id`),
  KEY `ad_cat_permissions_92cd3a0d` (`adcategory_id`),
  KEY `ad_cat_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_cat_sites`;
CREATE TABLE `ad_cat_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adcategory_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adcategory_id` (`adcategory_id`,`site_id`),
  KEY `ad_cat_sites_92cd3a0d` (`adcategory_id`),
  KEY `ad_cat_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_image`;
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


DROP TABLE IF EXISTS `ad_images`;
CREATE TABLE `ad_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `adimage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`adimage_id`),
  KEY `ad_images_51c59e2f` (`ad_id`),
  KEY `ad_images_650c9089` (`adimage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_image_active`;
CREATE TABLE `ad_image_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adimage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adimage_id` (`adimage_id`,`site_id`),
  KEY `ad_image_active_650c9089` (`adimage_id`),
  KEY `ad_image_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_image_languages`;
CREATE TABLE `ad_image_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adimage_id` int(11) NOT NULL,
  `adimagelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adimage_id` (`adimage_id`,`adimagelanguage_id`),
  KEY `ad_image_languages_650c9089` (`adimage_id`),
  KEY `ad_image_languages_5ed0d2f7` (`adimagelanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_image_permissions`;
CREATE TABLE `ad_image_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adimage_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adimage_id` (`adimage_id`,`permisiongroup_id`),
  KEY `ad_image_permissions_650c9089` (`adimage_id`),
  KEY `ad_image_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_image_sites`;
CREATE TABLE `ad_image_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adimage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adimage_id` (`adimage_id`,`site_id`),
  KEY `ad_image_sites_650c9089` (`adimage_id`),
  KEY `ad_image_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_lang`;
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


DROP TABLE IF EXISTS `ad_languages`;
CREATE TABLE `ad_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `adlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`adlanguage_id`),
  KEY `ad_languages_51c59e2f` (`ad_id`),
  KEY `ad_languages_768202bb` (`adlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_permissions`;
CREATE TABLE `ad_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`permisiongroup_id`),
  KEY `ad_permissions_51c59e2f` (`ad_id`),
  KEY `ad_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `ad_sites`;
CREATE TABLE `ad_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_id` (`ad_id`,`site_id`),
  KEY `ad_sites_51c59e2f` (`ad_id`),
  KEY `ad_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `articlelanguages`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8411 ;


DROP TABLE IF EXISTS `articles`;
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
  `dentomainimage` text,
  PRIMARY KEY (`id`),
  KEY `articles_42dc49bc` (`category_id`),
  KEY `articles_cb7c733d` (`gallery_id`),
  KEY `articles_e9b82f95` (`event_id`),
  KEY `articles_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4206 ;


DROP TABLE IF EXISTS `articles_active`;
CREATE TABLE `articles_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`site_id`),
  KEY `articles_active_30525a19` (`article_id`),
  KEY `articles_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4204 ;


DROP TABLE IF EXISTS `articles_languages`;
CREATE TABLE `articles_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `articlelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`articlelanguage_id`),
  KEY `articles_languages_30525a19` (`article_id`),
  KEY `articles_languages_1b93cd79` (`articlelanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8411 ;


DROP TABLE IF EXISTS `articles_permissions`;
CREATE TABLE `articles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`permisiongroup_id`),
  KEY `articles_permissions_30525a19` (`article_id`),
  KEY `articles_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `articles_sites`;
CREATE TABLE `articles_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`site_id`),
  KEY `articles_sites_30525a19` (`article_id`),
  KEY `articles_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4204 ;


DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `auth_message`;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_fbfc09f1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=220 ;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add kv store', 1, 'add_kvstore'),
(2, 'Can change kv store', 1, 'change_kvstore'),
(3, 'Can delete kv store', 1, 'delete_kvstore'),
(4, 'Can add Tag', 2, 'add_tag'),
(5, 'Can change Tag', 2, 'change_tag'),
(6, 'Can delete Tag', 2, 'delete_tag'),
(7, 'Can add Tagged Item', 3, 'add_taggeditem'),
(8, 'Can change Tagged Item', 3, 'change_taggeditem'),
(9, 'Can delete Tagged Item', 3, 'delete_taggeditem'),
(10, 'Can add permission', 4, 'add_permission'),
(11, 'Can change permission', 4, 'change_permission'),
(12, 'Can delete permission', 4, 'delete_permission'),
(13, 'Can add group', 5, 'add_group'),
(14, 'Can change group', 5, 'change_group'),
(15, 'Can delete group', 5, 'delete_group'),
(16, 'Can add user', 6, 'add_user'),
(17, 'Can change user', 6, 'change_user'),
(18, 'Can delete user', 6, 'delete_user'),
(19, 'Can add message', 7, 'add_message'),
(20, 'Can change message', 7, 'change_message'),
(21, 'Can delete message', 7, 'delete_message'),
(22, 'Can add content type', 8, 'add_contenttype'),
(23, 'Can change content type', 8, 'change_contenttype'),
(24, 'Can delete content type', 8, 'delete_contenttype'),
(25, 'Can add session', 9, 'add_session'),
(26, 'Can change session', 9, 'change_session'),
(27, 'Can delete session', 9, 'delete_session'),
(28, 'Can add site', 10, 'add_site'),
(29, 'Can change site', 10, 'change_site'),
(30, 'Can delete site', 10, 'delete_site'),
(31, 'Can add log entry', 11, 'add_logentry'),
(32, 'Can change log entry', 11, 'change_logentry'),
(33, 'Can delete log entry', 11, 'delete_logentry'),
(34, 'Can add permision group', 12, 'add_permisiongroup'),
(35, 'Can change permision group', 12, 'change_permisiongroup'),
(36, 'Can delete permision group', 12, 'delete_permisiongroup'),
(37, 'Can add state', 13, 'add_state'),
(38, 'Can change state', 13, 'change_state'),
(39, 'Can delete state', 13, 'delete_state'),
(40, 'Can add country', 14, 'add_country'),
(41, 'Can change country', 14, 'change_country'),
(42, 'Can delete country', 14, 'delete_country'),
(43, 'Can add sex', 15, 'add_sex'),
(44, 'Can change sex', 15, 'change_sex'),
(45, 'Can delete sex', 15, 'delete_sex'),
(46, 'Can add user profile', 16, 'add_userprofile'),
(47, 'Can change user profile', 16, 'change_userprofile'),
(48, 'Can delete user profile', 16, 'delete_userprofile'),
(49, 'Can add user profile data', 17, 'add_userprofiledata'),
(50, 'Can change user profile data', 17, 'change_userprofiledata'),
(51, 'Can delete user profile data', 17, 'delete_userprofiledata'),
(52, 'Can add language', 18, 'add_language'),
(53, 'Can change language', 18, 'change_language'),
(54, 'Can delete language', 18, 'delete_language'),
(55, 'Can add portal site const language', 19, 'add_portalsiteconstlanguage'),
(56, 'Can change portal site const language', 19, 'change_portalsiteconstlanguage'),
(57, 'Can delete portal site const language', 19, 'delete_portalsiteconstlanguage'),
(58, 'Can add gallery language', 20, 'add_gallerylanguage'),
(59, 'Can change gallery language', 20, 'change_gallerylanguage'),
(60, 'Can delete gallery language', 20, 'delete_gallerylanguage'),
(61, 'Can add gallery', 21, 'add_gallery'),
(62, 'Can change gallery', 21, 'change_gallery'),
(63, 'Can delete gallery', 21, 'delete_gallery'),
(64, 'Can add calendar language', 22, 'add_calendarlanguage'),
(65, 'Can change calendar language', 22, 'change_calendarlanguage'),
(66, 'Can delete calendar language', 22, 'delete_calendarlanguage'),
(67, 'Can add calendar event type language', 23, 'add_calendareventtypelanguage'),
(68, 'Can change calendar event type language', 23, 'change_calendareventtypelanguage'),
(69, 'Can delete calendar event type language', 23, 'delete_calendareventtypelanguage'),
(70, 'Can add calendar event language', 24, 'add_calendareventlanguage'),
(71, 'Can change calendar event language', 24, 'change_calendareventlanguage'),
(72, 'Can delete calendar event language', 24, 'delete_calendareventlanguage'),
(73, 'Can add calendar', 25, 'add_calendar'),
(74, 'Can change calendar', 25, 'change_calendar'),
(75, 'Can delete calendar', 25, 'delete_calendar'),
(76, 'Can add calendar event type', 26, 'add_calendareventtype'),
(77, 'Can change calendar event type', 26, 'change_calendareventtype'),
(78, 'Can delete calendar event type', 26, 'delete_calendareventtype'),
(79, 'Can add calendar event', 27, 'add_calendarevent'),
(80, 'Can change calendar event', 27, 'change_calendarevent'),
(81, 'Can delete calendar event', 27, 'delete_calendarevent'),
(82, 'Can add category language', 28, 'add_categorylanguage'),
(83, 'Can change category language', 28, 'change_categorylanguage'),
(84, 'Can delete category language', 28, 'delete_categorylanguage'),
(85, 'Can add category', 29, 'add_category'),
(86, 'Can change category', 29, 'change_category'),
(87, 'Can delete category', 29, 'delete_category'),
(88, 'Can add article language', 30, 'add_articlelanguage'),
(89, 'Can change article language', 30, 'change_articlelanguage'),
(90, 'Can delete article language', 30, 'delete_articlelanguage'),
(91, 'Can add article', 31, 'add_article'),
(92, 'Can change article', 31, 'change_article'),
(93, 'Can delete article', 31, 'delete_article'),
(94, 'Can add sheet', 32, 'add_sheet'),
(95, 'Can change sheet', 32, 'change_sheet'),
(96, 'Can delete sheet', 32, 'delete_sheet'),
(97, 'Can add sheet files', 33, 'add_sheetfiles'),
(98, 'Can change sheet files', 33, 'change_sheetfiles'),
(99, 'Can delete sheet files', 33, 'delete_sheetfiles'),
(100, 'Can add image language', 34, 'add_imagelanguage'),
(101, 'Can change image language', 34, 'change_imagelanguage'),
(102, 'Can delete image language', 34, 'delete_imagelanguage'),
(103, 'Can add image', 35, 'add_image'),
(104, 'Can change image', 35, 'change_image'),
(105, 'Can delete image', 35, 'delete_image'),
(106, 'Can add repetitio course language', 36, 'add_repetitiocourselanguage'),
(107, 'Can change repetitio course language', 36, 'change_repetitiocourselanguage'),
(108, 'Can delete repetitio course language', 36, 'delete_repetitiocourselanguage'),
(109, 'Can add repetitio course', 37, 'add_repetitiocourse'),
(110, 'Can change repetitio course', 37, 'change_repetitiocourse'),
(111, 'Can delete repetitio course', 37, 'delete_repetitiocourse'),
(112, 'Can add repetitio test language', 38, 'add_repetitiotestlanguage'),
(113, 'Can change repetitio test language', 38, 'change_repetitiotestlanguage'),
(114, 'Can delete repetitio test language', 38, 'delete_repetitiotestlanguage'),
(115, 'Can add repetitio test', 39, 'add_repetitiotest'),
(116, 'Can change repetitio test', 39, 'change_repetitiotest'),
(117, 'Can delete repetitio test', 39, 'delete_repetitiotest'),
(118, 'Can add repetitio question language', 40, 'add_repetitioquestionlanguage'),
(119, 'Can change repetitio question language', 40, 'change_repetitioquestionlanguage'),
(120, 'Can delete repetitio question language', 40, 'delete_repetitioquestionlanguage'),
(121, 'Can add repetitio question', 41, 'add_repetitioquestion'),
(122, 'Can change repetitio question', 41, 'change_repetitioquestion'),
(123, 'Can delete repetitio question', 41, 'delete_repetitioquestion'),
(124, 'Can add repetitio answer language', 42, 'add_repetitioanswerlanguage'),
(125, 'Can change repetitio answer language', 42, 'change_repetitioanswerlanguage'),
(126, 'Can delete repetitio answer language', 42, 'delete_repetitioanswerlanguage'),
(127, 'Can add repetitio answer', 43, 'add_repetitioanswer'),
(128, 'Can change repetitio answer', 43, 'change_repetitioanswer'),
(129, 'Can delete repetitio answer', 43, 'delete_repetitioanswer'),
(130, 'Can add repetitio test answer', 44, 'add_repetitiotestanswer'),
(131, 'Can change repetitio test answer', 44, 'change_repetitiotestanswer'),
(132, 'Can delete repetitio test answer', 44, 'delete_repetitiotestanswer'),
(133, 'Can add repetitio course user', 45, 'add_repetitiocourseuser'),
(134, 'Can change repetitio course user', 45, 'change_repetitiocourseuser'),
(135, 'Can delete repetitio course user', 45, 'delete_repetitiocourseuser'),
(136, 'Can add ad image language', 46, 'add_adimagelanguage'),
(137, 'Can change ad image language', 46, 'change_adimagelanguage'),
(138, 'Can delete ad image language', 46, 'delete_adimagelanguage'),
(139, 'Can add ad image', 47, 'add_adimage'),
(140, 'Can change ad image', 47, 'change_adimage'),
(141, 'Can delete ad image', 47, 'delete_adimage'),
(142, 'Can add ad category language', 48, 'add_adcategorylanguage'),
(143, 'Can change ad category language', 48, 'change_adcategorylanguage'),
(144, 'Can delete ad category language', 48, 'delete_adcategorylanguage'),
(145, 'Can add ad category', 49, 'add_adcategory'),
(146, 'Can change ad category', 49, 'change_adcategory'),
(147, 'Can delete ad category', 49, 'delete_adcategory'),
(148, 'Can add ad language', 50, 'add_adlanguage'),
(149, 'Can change ad language', 50, 'change_adlanguage'),
(150, 'Can delete ad language', 50, 'delete_adlanguage'),
(151, 'Can add ad', 51, 'add_ad'),
(152, 'Can change ad', 51, 'change_ad'),
(153, 'Can delete ad', 51, 'delete_ad'),
(154, 'Can add wiki language', 52, 'add_wikilanguage'),
(155, 'Can change wiki language', 52, 'change_wikilanguage'),
(156, 'Can delete wiki language', 52, 'delete_wikilanguage'),
(157, 'Can add wiki', 53, 'add_wiki'),
(158, 'Can change wiki', 53, 'change_wiki'),
(159, 'Can delete wiki', 53, 'delete_wiki'),
(160, 'Can add site portal', 54, 'add_siteportal'),
(161, 'Can change site portal', 54, 'change_siteportal'),
(162, 'Can delete site portal', 54, 'delete_siteportal'),
(163, 'Can add site portal stat', 55, 'add_siteportalstat'),
(164, 'Can change site portal stat', 55, 'change_siteportalstat'),
(165, 'Can delete site portal stat', 55, 'delete_siteportalstat'),
(166, 'Can add catalog image language', 56, 'add_catalogimagelanguage'),
(167, 'Can change catalog image language', 56, 'change_catalogimagelanguage'),
(168, 'Can delete catalog image language', 56, 'delete_catalogimagelanguage'),
(169, 'Can add catalog image', 57, 'add_catalogimage'),
(170, 'Can change catalog image', 57, 'change_catalogimage'),
(171, 'Can delete catalog image', 57, 'delete_catalogimage'),
(172, 'Can add catalog category language', 58, 'add_catalogcategorylanguage'),
(173, 'Can change catalog category language', 58, 'change_catalogcategorylanguage'),
(174, 'Can delete catalog category language', 58, 'delete_catalogcategorylanguage'),
(175, 'Can add catalog category', 59, 'add_catalogcategory'),
(176, 'Can change catalog category', 59, 'change_catalogcategory'),
(177, 'Can delete catalog category', 59, 'delete_catalogcategory'),
(178, 'Can add catalog item language', 60, 'add_catalogitemlanguage'),
(179, 'Can change catalog item language', 60, 'change_catalogitemlanguage'),
(180, 'Can delete catalog item language', 60, 'delete_catalogitemlanguage'),
(181, 'Can add catalog item', 61, 'add_catalogitem'),
(182, 'Can change catalog item', 61, 'change_catalogitem'),
(183, 'Can delete catalog item', 61, 'delete_catalogitem'),
(184, 'Can add module position', 62, 'add_moduleposition'),
(185, 'Can change module position', 62, 'change_moduleposition'),
(186, 'Can delete module position', 62, 'delete_moduleposition'),
(187, 'Can add module type', 63, 'add_moduletype'),
(188, 'Can change module type', 63, 'change_moduletype'),
(189, 'Can delete module type', 63, 'delete_moduletype'),
(190, 'Can add registered module', 64, 'add_registeredmodule'),
(191, 'Can change registered module', 64, 'change_registeredmodule'),
(192, 'Can delete registered module', 64, 'delete_registeredmodule'),
(193, 'Can add menu', 65, 'add_menu'),
(194, 'Can change menu', 65, 'change_menu'),
(195, 'Can delete menu', 65, 'delete_menu'),
(196, 'Can add menu item language', 66, 'add_menuitemlanguage'),
(197, 'Can change menu item language', 66, 'change_menuitemlanguage'),
(198, 'Can delete menu item language', 66, 'delete_menuitemlanguage'),
(199, 'Can add menu item', 67, 'add_menuitem'),
(200, 'Can change menu item', 67, 'change_menuitem'),
(201, 'Can delete menu item', 67, 'delete_menuitem'),
(202, 'Can add mega menu language', 68, 'add_megamenulanguage'),
(203, 'Can change mega menu language', 68, 'change_megamenulanguage'),
(204, 'Can delete mega menu language', 68, 'delete_megamenulanguage'),
(205, 'Can add mega menu', 69, 'add_megamenu'),
(206, 'Can change mega menu', 69, 'change_megamenu'),
(207, 'Can delete mega menu', 69, 'delete_megamenu'),
(208, 'Can add article module option', 70, 'add_articlemoduleoption'),
(209, 'Can change article module option', 70, 'change_articlemoduleoption'),
(210, 'Can delete article module option', 70, 'delete_articlemoduleoption'),
(211, 'Can add article list module option', 71, 'add_articlelistmoduleoption'),
(212, 'Can change article list module option', 71, 'change_articlelistmoduleoption'),
(213, 'Can delete article list module option', 71, 'delete_articlelistmoduleoption'),
(214, 'Can add menu module option', 72, 'add_menumoduleoption'),
(215, 'Can change menu module option', 72, 'change_menumoduleoption'),
(216, 'Can delete menu module option', 72, 'delete_menumoduleoption'),
(217, 'Can add module visibility', 73, 'add_modulevisibility'),
(218, 'Can change module visibility', 73, 'change_modulevisibility'),
(219, 'Can delete module visibility', 73, 'delete_modulevisibility');

DROP TABLE IF EXISTS `auth_user`;
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

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'admin', '', '', 'admin@amaa.pl', 'sha1$154fe$2f76bab1bb2cebbc2cdc2b59837da4f630ea1058', 1, 1, 1, '2011-09-14 08:34:51', '2011-08-30 13:56:08');

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `calendareventlanguages`;
CREATE TABLE `calendareventlanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext,
  `text` longtext,
  `contact` longtext,
  `shortinfo` longtext,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendareventlanguages_7ab48146` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23041 ;


DROP TABLE IF EXISTS `calendarevents`;
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
  `textcolor` varchar(255) DEFAULT NULL,
  `dentois` text,
  `dentoim` text,
  `dentoih` text,
  PRIMARY KEY (`id`),
  KEY `calendarevents_777d41c8` (`type_id`),
  KEY `calendarevents_b9608dc2` (`state_id`),
  KEY `calendarevents_447205e2` (`calendar_id`),
  KEY `calendarevents_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11521 ;


DROP TABLE IF EXISTS `calendarevents_active`;
CREATE TABLE `calendarevents_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendarevent_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendarevent_id` (`calendarevent_id`,`site_id`),
  KEY `calendarevents_active_bcb39b1d` (`calendarevent_id`),
  KEY `calendarevents_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11521 ;


DROP TABLE IF EXISTS `calendarevents_languages`;
CREATE TABLE `calendarevents_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendarevent_id` int(11) NOT NULL,
  `calendareventlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendarevent_id` (`calendarevent_id`,`calendareventlanguage_id`),
  KEY `calendarevents_languages_bcb39b1d` (`calendarevent_id`),
  KEY `calendarevents_languages_569dbb8d` (`calendareventlanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23041 ;


DROP TABLE IF EXISTS `calendarevents_permissions`;
CREATE TABLE `calendarevents_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendarevent_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendarevent_id` (`calendarevent_id`,`permisiongroup_id`),
  KEY `calendarevents_permissions_bcb39b1d` (`calendarevent_id`),
  KEY `calendarevents_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `calendarevents_sites`;
CREATE TABLE `calendarevents_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendarevent_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendarevent_id` (`calendarevent_id`,`site_id`),
  KEY `calendarevents_sites_bcb39b1d` (`calendarevent_id`),
  KEY `calendarevents_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11521 ;


DROP TABLE IF EXISTS `calendareventtypelanguages`;
CREATE TABLE `calendareventtypelanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `info` longtext,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendareventtypelanguages_7ab48146` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=155 ;


DROP TABLE IF EXISTS `calendarlanguages`;
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


DROP TABLE IF EXISTS `calendars`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `calendars_active`;
CREATE TABLE `calendars_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_id` (`calendar_id`,`site_id`),
  KEY `calendars_active_447205e2` (`calendar_id`),
  KEY `calendars_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `calendars_languages`;
CREATE TABLE `calendars_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `calendarlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_id` (`calendar_id`,`calendarlanguage_id`),
  KEY `calendars_languages_447205e2` (`calendar_id`),
  KEY `calendars_languages_a93315c0` (`calendarlanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


DROP TABLE IF EXISTS `calendars_permissions`;
CREATE TABLE `calendars_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_id` (`calendar_id`,`permisiongroup_id`),
  KEY `calendars_permissions_447205e2` (`calendar_id`),
  KEY `calendars_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `calendars_sites`;
CREATE TABLE `calendars_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_id` (`calendar_id`,`site_id`),
  KEY `calendars_sites_447205e2` (`calendar_id`),
  KEY `calendars_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `calendartypes`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;


DROP TABLE IF EXISTS `calendartypes_active`;
CREATE TABLE `calendartypes_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendareventtype_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendareventtype_id` (`calendareventtype_id`,`site_id`),
  KEY `calendartypes_active_5ec8c85f` (`calendareventtype_id`),
  KEY `calendartypes_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;


DROP TABLE IF EXISTS `calendartypes_languages`;
CREATE TABLE `calendartypes_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendareventtype_id` int(11) NOT NULL,
  `calendareventtypelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendareventtype_id` (`calendareventtype_id`,`calendareventtypelanguage_id`),
  KEY `calendartypes_languages_5ec8c85f` (`calendareventtype_id`),
  KEY `calendartypes_languages_17162c91` (`calendareventtypelanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=155 ;


DROP TABLE IF EXISTS `calendartypes_permissions`;
CREATE TABLE `calendartypes_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendareventtype_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendareventtype_id` (`calendareventtype_id`,`permisiongroup_id`),
  KEY `calendartypes_permissions_5ec8c85f` (`calendareventtype_id`),
  KEY `calendartypes_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `calendartypes_sites`;
CREATE TABLE `calendartypes_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendareventtype_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendareventtype_id` (`calendareventtype_id`,`site_id`),
  KEY `calendartypes_sites_5ec8c85f` (`calendareventtype_id`),
  KEY `calendartypes_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;


DROP TABLE IF EXISTS `catalogs_cat`;
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


DROP TABLE IF EXISTS `catalogs_cat_active`;
CREATE TABLE `catalogs_cat_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogcategory_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogcategory_id` (`catalogcategory_id`,`site_id`),
  KEY `catalogs_cat_active_41624eb6` (`catalogcategory_id`),
  KEY `catalogs_cat_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_cat_lang`;
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


DROP TABLE IF EXISTS `catalogs_cat_languages`;
CREATE TABLE `catalogs_cat_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogcategory_id` int(11) NOT NULL,
  `catalogcategorylanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogcategory_id` (`catalogcategory_id`,`catalogcategorylanguage_id`),
  KEY `catalogs_cat_languages_41624eb6` (`catalogcategory_id`),
  KEY `catalogs_cat_languages_eca20c14` (`catalogcategorylanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_cat_permissions`;
CREATE TABLE `catalogs_cat_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogcategory_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogcategory_id` (`catalogcategory_id`,`permisiongroup_id`),
  KEY `catalogs_cat_permissions_41624eb6` (`catalogcategory_id`),
  KEY `catalogs_cat_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_cat_sites`;
CREATE TABLE `catalogs_cat_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogcategory_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogcategory_id` (`catalogcategory_id`,`site_id`),
  KEY `catalogs_cat_sites_41624eb6` (`catalogcategory_id`),
  KEY `catalogs_cat_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_image`;
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


DROP TABLE IF EXISTS `catalogs_image_active`;
CREATE TABLE `catalogs_image_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogimage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogimage_id` (`catalogimage_id`,`site_id`),
  KEY `catalogs_image_active_743b2c4c` (`catalogimage_id`),
  KEY `catalogs_image_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_image_lang`;
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


DROP TABLE IF EXISTS `catalogs_image_languages`;
CREATE TABLE `catalogs_image_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogimage_id` int(11) NOT NULL,
  `adimagelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogimage_id` (`catalogimage_id`,`adimagelanguage_id`),
  KEY `catalogs_image_languages_743b2c4c` (`catalogimage_id`),
  KEY `catalogs_image_languages_5ed0d2f7` (`adimagelanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_image_permissions`;
CREATE TABLE `catalogs_image_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogimage_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogimage_id` (`catalogimage_id`,`permisiongroup_id`),
  KEY `catalogs_image_permissions_743b2c4c` (`catalogimage_id`),
  KEY `catalogs_image_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_image_sites`;
CREATE TABLE `catalogs_image_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogimage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogimage_id` (`catalogimage_id`,`site_id`),
  KEY `catalogs_image_sites_743b2c4c` (`catalogimage_id`),
  KEY `catalogs_image_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_item`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `catalogs_item_active`;
CREATE TABLE `catalogs_item_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`site_id`),
  KEY `catalogs_item_active_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `catalogs_item_images`;
CREATE TABLE `catalogs_item_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `catalogimage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`catalogimage_id`),
  KEY `catalogs_item_images_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_images_743b2c4c` (`catalogimage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_item_languages`;
CREATE TABLE `catalogs_item_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `catalogitemlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`catalogitemlanguage_id`),
  KEY `catalogs_item_languages_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_languages_66c758e5` (`catalogitemlanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


DROP TABLE IF EXISTS `catalogs_item_permissions`;
CREATE TABLE `catalogs_item_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`permisiongroup_id`),
  KEY `catalogs_item_permissions_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `catalogs_item_sites`;
CREATE TABLE `catalogs_item_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogitem_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogitem_id` (`catalogitem_id`,`site_id`),
  KEY `catalogs_item_sites_8d975423` (`catalogitem_id`),
  KEY `catalogs_item_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `catalogs_lang`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


DROP TABLE IF EXISTS `categories`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=204 ;

INSERT INTO `categories` (`id`, `date`, `temp`, `required`, `order`, `visits`, `parent_id`, `image`, `pathinfo`, `noedit`, `show_title`, `show_footer`, `show_info`, `show_more`, `fetch_subcategories`, `subcategories_depth`, `link_title`, `show_mainimage`, `exposefirst`, `page_title`, `show_page_title`, `class_prefix`, `dentoid`, `owner_id`) VALUES
(203, '2011-09-14 08:34:55', 1, 1, 0, 0, NULL, '', '2011/9', 1, 1, 1, 1, 1, 0, NULL, 1, 1, 1, '', 0, '', NULL, NULL);

DROP TABLE IF EXISTS `categories_active`;
CREATE TABLE `categories_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`site_id`),
  KEY `categories_active_42dc49bc` (`category_id`),
  KEY `categories_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=214 ;

INSERT INTO `categories_active` (`id`, `category_id`, `site_id`) VALUES
(210, 203, 1),
(211, 203, 2),
(212, 203, 3),
(213, 203, 4);

DROP TABLE IF EXISTS `categories_galleries`;
CREATE TABLE `categories_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`gallery_id`),
  KEY `categories_galleries_42dc49bc` (`category_id`),
  KEY `categories_galleries_cb7c733d` (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `categories_languages`;
CREATE TABLE `categories_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `categorylanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`categorylanguage_id`),
  KEY `categories_languages_42dc49bc` (`category_id`),
  KEY `categories_languages_c246ffe6` (`categorylanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=411 ;

INSERT INTO `categories_languages` (`id`, `category_id`, `categorylanguage_id`) VALUES
(409, 203, 405),
(410, 203, 406);

DROP TABLE IF EXISTS `categories_permissions`;
CREATE TABLE `categories_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`permisiongroup_id`),
  KEY `categories_permissions_42dc49bc` (`category_id`),
  KEY `categories_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `categories_sites`;
CREATE TABLE `categories_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`site_id`),
  KEY `categories_sites_42dc49bc` (`category_id`),
  KEY `categories_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=211 ;

INSERT INTO `categories_sites` (`id`, `category_id`, `site_id`) VALUES
(207, 203, 1),
(208, 203, 2),
(209, 203, 3),
(210, 203, 4);

DROP TABLE IF EXISTS `categorylanguages`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=407 ;

INSERT INTO `categorylanguages` (`id`, `name`, `temp`, `slug`, `info`, `meta`, `altname`, `language_id`) VALUES
(405, 'Root', 0, '8212195-root', '', '', '', 2),
(406, 'Główna', 0, '8213495-gowna', '', '', '', 1);

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `django_admin_log`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2011-08-30 14:05:38', 1, 18, '1', 'Polski', 1, ''),
(2, '2011-08-30 14:05:49', 1, 18, '2', 'English', 1, ''),
(3, '2011-08-30 14:06:55', 1, 32, '1', 'Lekarze', 1, ''),
(4, '2011-08-30 14:07:11', 1, 32, '2', 'Pacjenci', 1, ''),
(5, '2011-08-30 14:07:27', 1, 32, '3', 'Studenci', 1, ''),
(6, '2011-08-30 14:08:07', 1, 32, '4', 'Default', 1, ''),
(7, '2011-08-30 14:13:15', 1, 16, '1', 'Admin', 1, ''),
(8, '2011-08-30 14:20:45', 1, 16, '1', 'Admin', 2, 'Zmieniono permissions'),
(9, '2011-08-30 14:21:10', 1, 16, '1', 'Admin', 2, 'Zmieniono confirmed'),
(10, '2011-08-30 14:26:31', 1, 16, '1', 'Admin', 2, 'Żadne pole nie zmienione.'),
(11, '2011-08-30 14:29:08', 1, 16, '1', 'Admin', 2, 'Zmieniono permissions'),
(12, '2011-08-30 14:38:06', 1, 63, '6', 'Top Menu', 2, 'Zmieniono date, sites i active'),
(13, '2011-08-30 14:38:12', 1, 63, '5', 'Lista artykułów (menu)', 2, 'Zmieniono sites i active'),
(14, '2011-08-30 14:38:18', 1, 63, '4', 'Lista artykułów', 2, 'Zmieniono sites i active'),
(15, '2011-08-30 14:38:23', 1, 63, '3', 'Menu', 2, 'Zmieniono sites i active'),
(16, '2011-08-30 14:38:28', 1, 63, '2', 'Artykul', 2, 'Zmieniono sites i active'),
(17, '2011-08-30 14:39:22', 1, 28, '1', 'Gówna', 1, ''),
(18, '2011-08-30 14:39:31', 1, 28, '2', 'Root', 1, ''),
(19, '2011-08-30 14:39:46', 1, 29, '1', 'None', 1, ''),
(20, '2011-08-30 14:43:19', 1, 10, '2', 'pacjenci.dentonet.pl', 1, ''),
(21, '2011-08-30 14:43:28', 1, 10, '3', 'studenci.dentonet.pl', 1, ''),
(22, '2011-08-30 14:45:25', 1, 29, '1', 'None', 2, 'Zmieniono tags i active'),
(23, '2011-08-30 14:45:36', 1, 29, '1', 'None', 2, 'Zmieniono sites i tags'),
(24, '2011-08-30 15:04:10', 1, 64, '22', 'Lista Artykułów (domyślne)', 2, 'Zmieniono sites i active'),
(25, '2011-08-30 15:04:17', 1, 64, '21', 'Lista Artykułów (menu)', 2, 'Zmieniono sites i active'),
(26, '2011-08-30 15:04:24', 1, 64, '20', 'Lista Artykułów', 2, 'Zmieniono sites i active'),
(27, '2011-08-30 15:04:31', 1, 64, '1', 'Artykul (menu)', 2, 'Zmieniono sites i active'),
(28, '2011-08-30 15:08:51', 1, 28, '1', 'Główna', 2, 'Zmieniono name'),
(29, '2011-08-30 15:26:08', 1, 10, '4', 'dentonet.pl', 1, ''),
(30, '2011-08-30 15:47:18', 1, 32, '4', 'Default', 2, 'Zmieniono default, sites i active'),
(31, '2011-08-30 15:56:52', 1, 32, '1', 'Lekarze', 2, 'Żadne pole nie zmienione.'),
(32, '2011-08-30 15:57:02', 1, 32, '2', 'Pacjenci', 2, 'Zmieniono sites i active'),
(33, '2011-08-30 15:57:10', 1, 32, '3', 'Studenci', 2, 'Zmieniono sites i active'),
(34, '2011-08-30 15:57:16', 1, 32, '4', 'Default', 2, 'Zmieniono sites'),
(35, '2011-08-30 20:57:28', 1, 19, '227', 'Pokaż elementy', 1, ''),
(36, '2011-08-31 08:43:07', 1, 10, '4', 'site1.com', 2, 'Zmieniono domain'),
(37, '2011-08-31 08:43:18', 1, 10, '2', 'site2.com', 2, 'Zmieniono domain i name'),
(38, '2011-08-31 08:43:29', 1, 10, '3', 'site3.com', 2, 'Zmieniono domain i name'),
(39, '2011-08-31 08:43:34', 1, 10, '2', 'site2.com', 2, 'Zmieniono name'),
(40, '2011-08-31 08:43:43', 1, 10, '4', 'site1.com', 2, 'Zmieniono name'),
(41, '2011-08-31 08:43:53', 1, 10, '1', 'site4.com', 2, 'Zmieniono domain i name'),
(42, '2011-08-31 08:50:13', 1, 32, '3', 'Sheet 1', 2, 'Zmieniono name i sheetpath'),
(43, '2011-08-31 08:50:21', 1, 32, '4', 'Default', 2, 'Zmieniono sheetpath'),
(44, '2011-08-31 08:50:29', 1, 32, '2', 'Sheet 2', 2, 'Zmieniono name i sheetpath'),
(45, '2011-08-31 08:50:38', 1, 32, '1', 'Sheet 3', 2, 'Zmieniono name i sheetpath'),
(46, '2011-09-14 08:26:25', 1, 32, '5', 'PortalAdmin', 1, ''),
(47, '2011-09-14 08:35:21', 1, 28, '405', 'Root', 1, ''),
(48, '2011-09-14 08:35:34', 1, 28, '406', 'Główna', 1, ''),
(49, '2011-09-14 08:35:44', 1, 29, '203', 'None', 1, ''),
(50, '2011-09-14 08:39:03', 1, 33, '4238', 'admin_module_edit_module_selection', 1, '');

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'kv store', 'thumbnail', 'kvstore'),
(2, 'Tag', 'taggit', 'tag'),
(3, 'Tagged Item', 'taggit', 'taggeditem'),
(4, 'permission', 'auth', 'permission'),
(5, 'group', 'auth', 'group'),
(6, 'user', 'auth', 'user'),
(7, 'message', 'auth', 'message'),
(8, 'content type', 'contenttypes', 'contenttype'),
(9, 'session', 'sessions', 'session'),
(10, 'site', 'sites', 'site'),
(11, 'log entry', 'admin', 'logentry'),
(12, 'permision group', 'core', 'permisiongroup'),
(13, 'state', 'core', 'state'),
(14, 'country', 'core', 'country'),
(15, 'sex', 'core', 'sex'),
(16, 'user profile', 'core', 'userprofile'),
(17, 'user profile data', 'core', 'userprofiledata'),
(18, 'language', 'core', 'language'),
(19, 'portal site const language', 'core', 'portalsiteconstlanguage'),
(20, 'gallery language', 'core', 'gallerylanguage'),
(21, 'gallery', 'core', 'gallery'),
(22, 'calendar language', 'core', 'calendarlanguage'),
(23, 'calendar event type language', 'core', 'calendareventtypelanguage'),
(24, 'calendar event language', 'core', 'calendareventlanguage'),
(25, 'calendar', 'core', 'calendar'),
(26, 'calendar event type', 'core', 'calendareventtype'),
(27, 'calendar event', 'core', 'calendarevent'),
(28, 'category language', 'core', 'categorylanguage'),
(29, 'category', 'core', 'category'),
(30, 'article language', 'core', 'articlelanguage'),
(31, 'article', 'core', 'article'),
(32, 'sheet', 'core', 'sheet'),
(33, 'sheet files', 'core', 'sheetfiles'),
(34, 'image language', 'core', 'imagelanguage'),
(35, 'image', 'core', 'image'),
(36, 'repetitio course language', 'core', 'repetitiocourselanguage'),
(37, 'repetitio course', 'core', 'repetitiocourse'),
(38, 'repetitio test language', 'core', 'repetitiotestlanguage'),
(39, 'repetitio test', 'core', 'repetitiotest'),
(40, 'repetitio question language', 'core', 'repetitioquestionlanguage'),
(41, 'repetitio question', 'core', 'repetitioquestion'),
(42, 'repetitio answer language', 'core', 'repetitioanswerlanguage'),
(43, 'repetitio answer', 'core', 'repetitioanswer'),
(44, 'repetitio test answer', 'core', 'repetitiotestanswer'),
(45, 'repetitio course user', 'core', 'repetitiocourseuser'),
(46, 'ad image language', 'core', 'adimagelanguage'),
(47, 'ad image', 'core', 'adimage'),
(48, 'ad category language', 'core', 'adcategorylanguage'),
(49, 'ad category', 'core', 'adcategory'),
(50, 'ad language', 'core', 'adlanguage'),
(51, 'ad', 'core', 'ad'),
(52, 'wiki language', 'core', 'wikilanguage'),
(53, 'wiki', 'core', 'wiki'),
(54, 'site portal', 'core', 'siteportal'),
(55, 'site portal stat', 'core', 'siteportalstat'),
(56, 'catalog image language', 'core', 'catalogimagelanguage'),
(57, 'catalog image', 'core', 'catalogimage'),
(58, 'catalog category language', 'core', 'catalogcategorylanguage'),
(59, 'catalog category', 'core', 'catalogcategory'),
(60, 'catalog item language', 'core', 'catalogitemlanguage'),
(61, 'catalog item', 'core', 'catalogitem'),
(62, 'module position', 'core', 'moduleposition'),
(63, 'module type', 'core', 'moduletype'),
(64, 'registered module', 'core', 'registeredmodule'),
(65, 'menu', 'core', 'menu'),
(66, 'menu item language', 'core', 'menuitemlanguage'),
(67, 'menu item', 'core', 'menuitem'),
(68, 'mega menu language', 'core', 'megamenulanguage'),
(69, 'mega menu', 'core', 'megamenu'),
(70, 'article module option', 'core', 'articlemoduleoption'),
(71, 'article list module option', 'core', 'articlelistmoduleoption'),
(72, 'menu module option', 'core', 'menumoduleoption'),
(73, 'module visibility', 'core', 'modulevisibility');

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('288d3c64d1c3109d662d6048efa88f04', 'Y2I5ZGY2OWMxMzMxNjU4NGU3NWY1YmRlNzIyOWY4ZDVlMmRiZmY0OTqAAn1xAShVBGxhbmdVAnBs\nVQlwYWdlc2luZm99cQJVEHNlbGVjdGVkY2F0ZWdvcnlOVQphY3RpdmVzaXRlSwFVBXBwcmV2TlUQ\nc2VsZWN0ZWRxdWVzdGlvbk5VBXBhZ2VzXXEDVQNwbmlLClULY3VycmVudGRhdGVjZGF0ZXRpbWUK\nZGF0ZXRpbWUKcQRVCgfbCB4OAQYMeAaFUnEFVQ5zZWxlY3RlZGNvdXJzZU5VBXBuZXh0SwFVDHNl\nbGVjdGVkdGVzdE5VEHNlbGVjdGVkYWN0aXZpdHlK/////1UCcm1OVQRwYWdlWAEAAAAxVQhhZG1p\nbmFsbIh1Lg==\n', '2011-09-13 14:01:06'),
('56e70734d5f42637ac1eb266e6645f42', 'ODNjNjRmNTAwMjRmOGQ3ODY1ZjIwNmY2NWI3NDc5NTJlM2JjYjMzZDqAAn1xAShVFV9fYWRtX0Fy\ndGljbGVzX19wbmV4dEsCVRNfX2FkbV9TaGVldHNfX3BwcmV2TlURX19hZG1fU2l0ZXNfX3BhZ2VL\nAFUUX19hZG1fQXJ0aWNsZXNfX3BhZ2VLAFUcX19hZG1fTW9kdWxlX3Bvc2l0aW9uX19wYWdlc11V\nFF9fYWRtX01vZHVsZXNfX3BhZ2VzXVUVX19hZG1fQXJ0aWNsZXNfX3BwcmV2TlUMc2VsZWN0ZWR0\nZXN0TlUUX19hZG1fTW9kdWxlc19fcG5leHRLAlUTX19hZG1fQXJ0aWNsZXNfX3BuaUsKVRRfX2Fk\nbV9Ub3BNZW51X19wcHJldk5VEl9fYWRtX1NpdGVzX19wbmV4dEsCVRBfX2FkbV9NZW51X19wYWdl\nSwBVFF9fYWRtX01vZHVsZXNfX3BwcmV2TlUVX19hZG1fQ2F0ZWdvcmllc19fcG5pWAIAAAAyNVUJ\ncGFnZXNpbmZvfVUNX2F1dGhfdXNlcl9pZIoBAVUSX19hZG1fTW9kdWxlc19fcG5pWAMAAAAxMDBV\nCmFjdGl2ZXNpdGVLBFUXX19hZG1fQ2F0ZWdvcmllc19fcHByZXZOVRNfX2FkbV9TaGVldHNfX3Bu\nZXh0SwJVG19fYWRtX01vZHVsZV9wb3NpdGlvbl9fcGFnZUsAVRNfX2FkbV9TaGVldHNfX3BhZ2Vz\nXVUTX19hZG1fTW9kdWxlc19fcGFnZUsAVRRfX2FkbV9Ub3BNZW51X19wbmV4dEsCVQVwbmV4dEsC\nVRdfX2FkbV9DYXRlZ29yaWVzX19wYWdlc11VAnJtTlUTX19hZG1fVG9wTWVudV9fcGFnZUsAVRJf\nX2FkbV9TaXRlc19fcGFnZXNdVRRfX2FkbV9Ub3BNZW51X19wYWdlc11VDHNlbGVjdGVkbWVudUr/\n////VQVwcHJldk5VEHNlbGVjdGVkcXVlc3Rpb25OVRJfX2FkbV9TaXRlc19fcHByZXZOVQZsb2dp\nbnSKAQFVIGUzYWZlZDAwNDdiMDgwNTlkMGZhZGExMGY0MDBjMWU1hlUDcG5pSxlVEl9fYWRtX1Rv\ncE1lbnVfX3BuaUsKVRJfX2FkbV9TaGVldHNfX3BhZ2VLAFULY3VycmVudGRhdGVjZGF0ZXRpbWUK\nZGF0ZXRpbWUKcQJVCgfbCB8IMxABzVKFUnEDVRdfX2FkbV9DYXRlZ29yaWVzX19wbmV4dEsCVRFf\nX2FkbV9NZW51X19wYWdlc11xBFUFcGFnZXNoBFUcX19hZG1fTW9kdWxlX3Bvc2l0aW9uX19wbmV4\ndEsCVRFfX2FkbV9TaGVldHNfX3BuaUsKVQRsYW5nWAIAAABlblUWX19hZG1fQ2F0ZWdvcmllc19f\ncGFnZUsAVQ9fX2FkbV9NZW51X19wbmlYAgAAADI1VRpfX2FkbV9Nb2R1bGVfcG9zaXRpb25fX3Bu\naUsKVQdyZXFzaXRlSwFVEHNlbGVjdGVkY2F0ZWdvcnlOVRBfX2FkbV9TaXRlc19fcG5pSwpVEl9h\ndXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tl\nbmRVDnNlbGVjdGVkY291cnNlTlURX19hZG1fTWVudV9fcG5leHRLAlUVX19hZG1fQXJ0aWNsZXNf\nX3BhZ2VzXVUQc2VsZWN0ZWRhY3Rpdml0eVgCAAAALTFVHF9fYWRtX01vZHVsZV9wb3NpdGlvbl9f\ncHByZXZOVRFfX2FkbV9NZW51X19wcHJldk5VBHBhZ2VLAFUIYWRtaW5hbGyIdS4=\n', '2011-09-14 08:51:16'),
('c3ca808461a2c7fd4c79d23bca749486', 'YjE4Y2ZlMGU3MjZjNGU3NTg1ODcxNWJhNTYwZTRkZmMyYjY5Yzc2NjqAAn1xAShVFV9fYWRtX0Fy\ndGljbGVzX19wbmV4dEsCVRRfX2FkbV9BcnRpY2xlc19fcGFnZUsAVRRfX2FkbV9Nb2R1bGVzX19w\nYWdlc11xAlUVX19hZG1fQXJ0aWNsZXNfX3BwcmV2TlUMc2VsZWN0ZWR0ZXN0TlUUX19hZG1fTW9k\ndWxlc19fcG5leHRLAlUTX19hZG1fQXJ0aWNsZXNfX3BuaUsKVRBfX2FkbV9NZW51X19wYWdlSwBV\nFF9fYWRtX01vZHVsZXNfX3BwcmV2TlUJcGFnZXNpbmZvfVUHcmVxc2l0ZUsBVRJfX2FkbV9Nb2R1\nbGVzX19wbmlLClUKYWN0aXZlc2l0ZUsBVRdfX2FkbV9DYXRlZ29yaWVzX19wcHJldk5VE19fYWRt\nX01vZHVsZXNfX3BhZ2VLAFUXX19hZG1fQ2F0ZWdvcmllc19fcGFnZXNdVQJybU5VEV9fYWRtX01l\nbnVfX3BhZ2VzXVUMc2VsZWN0ZWRtZW51Sv////9VBXBwcmV2TlUQc2VsZWN0ZWRxdWVzdGlvbk5V\nBmxvZ2ludIoBAVUgZTNhZmVkMDA0N2IwODA1OWQwZmFkYTEwZjQwMGMxZTWGVQNwbmlLClULY3Vy\ncmVudGRhdGVjZGF0ZXRpbWUKZGF0ZXRpbWUKcQNVCgfbCQ4IJwgL9DGFUnEEVRdfX2FkbV9DYXRl\nZ29yaWVzX19wbmV4dEsCVRVfX2FkbV9DYXRlZ29yaWVzX19wbmlLClUFcGFnZXNoAlUFcG5leHRL\nAlUEbGFuZ1UCcGxVFl9fYWRtX0NhdGVnb3JpZXNfX3BhZ2VLAFUPX19hZG1fTWVudV9fcG5pSwpV\nDV9hdXRoX3VzZXJfaWSKAQFVEHNlbGVjdGVkY2F0ZWdvcnlOVRJfYXV0aF91c2VyX2JhY2tlbmRV\nKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kVQ5zZWxlY3RlZGNvdXJz\nZU5VEV9fYWRtX01lbnVfX3BuZXh0SwJVFV9fYWRtX0FydGljbGVzX19wYWdlc11VEHNlbGVjdGVk\nYWN0aXZpdHlK/////1URX19hZG1fTWVudV9fcHByZXZOVQRwYWdlSwBVCGFkbWluYWxsiHUu\n', '2011-09-28 08:39:09'),
('d23c4137e3ca07f976e37a114525cf1b', 'N2ZmNjNmMDcyZGI0NmU2YzUzMzIxYWQwMDZkNjQ2NjBlZmIwYTMwNTqAAn1xAShVFV9fYWRtX0Fy\ndGljbGVzX19wbmV4dEsCVRRfX2FkbV9BcnRpY2xlc19fcGFnZUsAVRVfX2FkbV9BcnRpY2xlc19f\ncHByZXZOVQxzZWxlY3RlZHRlc3RxAk5VE19fYWRtX0FydGljbGVzX19wbmlLClUJcGFnZXNpbmZv\ncQN9VQdyZXFzaXRlcQRLAVUKYWN0aXZlc2l0ZXEFSwFVAnJtcQZOVQxzZWxlY3RlZG1lbnVxB05V\nBXBwcmV2cQhOVRBzZWxlY3RlZHF1ZXN0aW9ucQlOVQZsb2dpbnSKAQFVIGUzYWZlZDAwNDdiMDgw\nNTlkMGZhZGExMGY0MDBjMWU1hlUDcG5pcQpLClULY3VycmVudGRhdGVxC2NkYXRldGltZQpkYXRl\ndGltZQpxDFUKB9sJDgghMgV2GIVScQ1VBXBhZ2VzcQ5dcQ9VBXBuZXh0cRBLAlUEbGFuZ3ERVQJw\nbHESVRBzZWxlY3RlZGNhdGVnb3J5cRNOVQ5zZWxlY3RlZGNvdXJzZXEUTlUVX19hZG1fQXJ0aWNs\nZXNfX3BhZ2VzaA9VEHNlbGVjdGVkYWN0aXZpdHlxFUr/////VQRwYWdlcRZLAFUIYWRtaW5hbGxx\nF4h1Lg==\n', '2011-09-28 08:33:51');

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'site4.com', 'Site 4'),
(2, 'site2.com', 'Site 2'),
(3, 'site3.com', 'Site 3'),
(4, 'site1.com', 'Site 1');

DROP TABLE IF EXISTS `galleries`;
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


DROP TABLE IF EXISTS `gallerieslanguages`;
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


DROP TABLE IF EXISTS `galleries_active`;
CREATE TABLE `galleries_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`site_id`),
  KEY `galleries_active_cb7c733d` (`gallery_id`),
  KEY `galleries_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `galleries_languages`;
CREATE TABLE `galleries_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `gallerylanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`gallerylanguage_id`),
  KEY `galleries_languages_cb7c733d` (`gallery_id`),
  KEY `galleries_languages_3cf670ab` (`gallerylanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `galleries_permissions`;
CREATE TABLE `galleries_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`permisiongroup_id`),
  KEY `galleries_permissions_cb7c733d` (`gallery_id`),
  KEY `galleries_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `galleries_sites`;
CREATE TABLE `galleries_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`site_id`),
  KEY `galleries_sites_cb7c733d` (`gallery_id`),
  KEY `galleries_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `imagelanguages`;
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


DROP TABLE IF EXISTS `images`;
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


DROP TABLE IF EXISTS `images_active`;
CREATE TABLE `images_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`site_id`),
  KEY `images_active_6682136` (`image_id`),
  KEY `images_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `images_languages`;
CREATE TABLE `images_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `imagelanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`imagelanguage_id`),
  KEY `images_languages_6682136` (`image_id`),
  KEY `images_languages_46b4dec` (`imagelanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `images_permissions`;
CREATE TABLE `images_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`permisiongroup_id`),
  KEY `images_permissions_6682136` (`image_id`),
  KEY `images_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `images_sites`;
CREATE TABLE `images_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`site_id`),
  KEY `images_sites_6682136` (`image_id`),
  KEY `images_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `currencysymbol` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `languages` (`id`, `date`, `name`, `symbol`, `currencysymbol`) VALUES
(1, '2011-08-30 14:05:27', 'Polski', 'pl', 'PLN'),
(2, '2011-08-30 14:05:38', 'English', 'en', '$');

DROP TABLE IF EXISTS `languages_active`;
CREATE TABLE `languages_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_id` (`language_id`,`site_id`),
  KEY `languages_active_7ab48146` (`language_id`),
  KEY `languages_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `languages_active` (`id`, `language_id`, `site_id`) VALUES
(1, 1, 1),
(2, 2, 1);

DROP TABLE IF EXISTS `languages_sites`;
CREATE TABLE `languages_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_id` (`language_id`,`site_id`),
  KEY `languages_sites_7ab48146` (`language_id`),
  KEY `languages_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `languages_sites` (`id`, `language_id`, `site_id`) VALUES
(1, 1, 1),
(2, 2, 1);

DROP TABLE IF EXISTS `megamenu`;
CREATE TABLE `megamenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `noedit` tinyint(1) NOT NULL,
  `registered_module_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `rootmenu_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `adv_id` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `megamenu_f53ed95e` (`registered_module_id`),
  KEY `megamenu_143efa3` (`menu_id`),
  KEY `megamenu_640b20cf` (`rootmenu_id`),
  KEY `megamenu_42dc49bc` (`category_id`),
  KEY `megamenu_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;


DROP TABLE IF EXISTS `megamenu_active`;
CREATE TABLE `megamenu_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `megamenu_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megamenu_id` (`megamenu_id`,`site_id`),
  KEY `megamenu_active_2d9d23f3` (`megamenu_id`),
  KEY `megamenu_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;


DROP TABLE IF EXISTS `megamenu_lang`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;


DROP TABLE IF EXISTS `megamenu_languages`;
CREATE TABLE `megamenu_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `megamenu_id` int(11) NOT NULL,
  `megamenulanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megamenu_id` (`megamenu_id`,`megamenulanguage_id`),
  KEY `megamenu_languages_2d9d23f3` (`megamenu_id`),
  KEY `megamenu_languages_67e9139` (`megamenulanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;


DROP TABLE IF EXISTS `megamenu_permissions`;
CREATE TABLE `megamenu_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `megamenu_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megamenu_id` (`megamenu_id`,`permisiongroup_id`),
  KEY `megamenu_permissions_2d9d23f3` (`megamenu_id`),
  KEY `megamenu_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `megamenu_sites`;
CREATE TABLE `megamenu_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `megamenu_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `megamenu_id` (`megamenu_id`,`site_id`),
  KEY `megamenu_sites_2d9d23f3` (`megamenu_id`),
  KEY `megamenu_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;


DROP TABLE IF EXISTS `menu`;
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
  `registered_module_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_f53ed95e` (`registered_module_id`),
  KEY `menu_5d52dd10` (`owner_id`),
  KEY `menu_63f17a16` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;


DROP TABLE IF EXISTS `menuitem`;
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
  `registered_module_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menuitem_63f17a16` (`parent_id`),
  KEY `menuitem_f53ed95e` (`registered_module_id`),
  KEY `menuitem_143efa3` (`menu_id`),
  KEY `menuitem_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;


DROP TABLE IF EXISTS `menuitem_active`;
CREATE TABLE `menuitem_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuitem_id` (`menuitem_id`,`site_id`),
  KEY `menuitem_active_f8c10b8c` (`menuitem_id`),
  KEY `menuitem_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;


DROP TABLE IF EXISTS `menuitem_lang`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;


DROP TABLE IF EXISTS `menuitem_languages`;
CREATE TABLE `menuitem_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(11) NOT NULL,
  `menuitemlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuitem_id` (`menuitem_id`,`menuitemlanguage_id`),
  KEY `menuitem_languages_f8c10b8c` (`menuitem_id`),
  KEY `menuitem_languages_ace3ffae` (`menuitemlanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;


DROP TABLE IF EXISTS `menuitem_permissions`;
CREATE TABLE `menuitem_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuitem_id` (`menuitem_id`,`permisiongroup_id`),
  KEY `menuitem_permissions_f8c10b8c` (`menuitem_id`),
  KEY `menuitem_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `menuitem_sites`;
CREATE TABLE `menuitem_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuitem_id` (`menuitem_id`,`site_id`),
  KEY `menuitem_sites_f8c10b8c` (`menuitem_id`),
  KEY `menuitem_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;


DROP TABLE IF EXISTS `menu_active`;
CREATE TABLE `menu_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id` (`menu_id`,`site_id`),
  KEY `menu_active_143efa3` (`menu_id`),
  KEY `menu_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;


DROP TABLE IF EXISTS `menu_permissions`;
CREATE TABLE `menu_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id` (`menu_id`,`permisiongroup_id`),
  KEY `menu_permissions_143efa3` (`menu_id`),
  KEY `menu_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `menu_sites`;
CREATE TABLE `menu_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id` (`menu_id`,`site_id`),
  KEY `menu_sites_143efa3` (`menu_id`),
  KEY `menu_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;


DROP TABLE IF EXISTS `module_adv_option`;
CREATE TABLE `module_adv_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `title` longtext,
  `show_title` tinyint(1) NOT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `advgroup_id` int(11) DEFAULT NULL,
  `adv_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `registered_module_id` int(11) DEFAULT NULL,
  `ammount` int(11) DEFAULT NULL,
  `class_prefix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registered_module_id_refs_id_ea9a60a2` (`registered_module_id`),
  KEY `advgroup_id_refs_id_17b8be30` (`advgroup_id`),
  KEY `module_id_refs_id_9f6d65e8` (`module_id`),
  KEY `adv_id_refs_id_60258c44` (`adv_id`),
  KEY `module_adv_option_a951d5d6` (`slug`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


DROP TABLE IF EXISTS `module_adv_option_sites`;
CREATE TABLE `module_adv_option_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advmoduleoption_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advmoduleoption_id` (`advmoduleoption_id`,`site_id`),
  KEY `module_adv_option_sites_4ac7cc2f` (`advmoduleoption_id`),
  KEY `module_adv_option_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;


DROP TABLE IF EXISTS `module_article_list_option`;
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
  `registered_module_id` int(11) DEFAULT NULL,
  `small` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_article_list_option_f8c10b8c` (`menuitem_id`),
  KEY `module_article_list_option_42dc49bc` (`category_id`),
  KEY `module_article_list_option_f53ed95e` (`registered_module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;


DROP TABLE IF EXISTS `module_article_option`;
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
  `registered_module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_article_option_f8c10b8c` (`menuitem_id`),
  KEY `module_article_option_30525a19` (`article_id`),
  KEY `module_article_option_f53ed95e` (`registered_module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;


DROP TABLE IF EXISTS `module_htmlbox_option`;
CREATE TABLE `module_htmlbox_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `title` longtext,
  `html` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `registered_module_id` int(11) DEFAULT NULL,
  `menuitem_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registered_module_id_refs_id_9872b383` (`registered_module_id`),
  KEY `module_id_refs_id_fa878041` (`module_id`),
  KEY `module_htmlbox_option_a951d5d6` (`slug`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;


DROP TABLE IF EXISTS `module_htmlbox_option_sites`;
CREATE TABLE `module_htmlbox_option_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `htmlboxmoduleoption_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `htmlboxmoduleoption_id` (`htmlboxmoduleoption_id`,`site_id`),
  KEY `module_htmlbox_option_sites_19f76772` (`htmlboxmoduleoption_id`),
  KEY `module_htmlbox_option_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;


DROP TABLE IF EXISTS `module_link_option`;
CREATE TABLE `module_link_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `title` longtext,
  `link` longtext,
  `slug` varchar(900) DEFAULT NULL,
  `show_title` tinyint(1) NOT NULL,
  `new_window` tinyint(1) NOT NULL,
  `menuitem_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `registered_module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menuitem_id_refs_id_62d5904` (`menuitem_id`),
  KEY `module_id_refs_id_fc2200c8` (`module_id`),
  KEY `registered_module_id_refs_id_d4cf7cae` (`registered_module_id`),
  KEY `module_link_option_a951d5d6` (`slug`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;


DROP TABLE IF EXISTS `module_link_option_sites`;
CREATE TABLE `module_link_option_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkmoduleoption_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `linkmoduleoption_id` (`linkmoduleoption_id`,`site_id`),
  KEY `module_link_option_sites_8ab45dd3` (`linkmoduleoption_id`),
  KEY `module_link_option_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;


DROP TABLE IF EXISTS `module_menu_option`;
CREATE TABLE `module_menu_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_name` tinyint(1) NOT NULL,
  `show_info` tinyint(1) NOT NULL,
  `show_images` tinyint(1) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `show_page_title` tinyint(1) NOT NULL,
  `class_prefix` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `registered_module_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_menu_option_143efa3` (`menu_id`),
  KEY `module_menu_option_f53ed95e` (`registered_module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;


DROP TABLE IF EXISTS `module_newsflash_c_option`;
CREATE TABLE `module_newsflash_c_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `show_title` tinyint(1) NOT NULL,
  `show_footer` tinyint(1) NOT NULL,
  `show_more` tinyint(1) NOT NULL,
  `show_info` tinyint(1) NOT NULL,
  `link_title` tinyint(1) NOT NULL,
  `show_mainimage` tinyint(1) NOT NULL,
  `exposefirst` tinyint(1) NOT NULL,
  `columns` int(11) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `show_page_title` tinyint(1) NOT NULL,
  `class_prefix` varchar(255) DEFAULT NULL,
  `info` longtext,
  `image` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `registered_module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_newsflash_c_option_42dc49bc` (`category_id`),
  KEY `module_newsflash_c_option_f53ed95e` (`module_id`),
  KEY `module_newsflash_c_option_6b2d3de` (`registered_module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;


DROP TABLE IF EXISTS `module_newsflash_c_option_sites`;
CREATE TABLE `module_newsflash_c_option_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsflashcolumnmoduleoption_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsflashcolumnmoduleoption_id` (`newsflashcolumnmoduleoption_id`,`site_id`),
  KEY `module_newsflash_c_option_sites_614fc391` (`newsflashcolumnmoduleoption_id`),
  KEY `module_newsflash_c_option_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;


DROP TABLE IF EXISTS `module_position`;
CREATE TABLE `module_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_position_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;


DROP TABLE IF EXISTS `module_position_active`;
CREATE TABLE `module_position_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleposition_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduleposition_id` (`moduleposition_id`,`site_id`),
  KEY `module_position_active_a9f4973f` (`moduleposition_id`),
  KEY `module_position_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;


DROP TABLE IF EXISTS `module_position_permissions`;
CREATE TABLE `module_position_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleposition_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduleposition_id` (`moduleposition_id`,`permisiongroup_id`),
  KEY `module_position_permissions_a9f4973f` (`moduleposition_id`),
  KEY `module_position_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `module_position_sites`;
CREATE TABLE `module_position_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleposition_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduleposition_id` (`moduleposition_id`,`site_id`),
  KEY `module_position_sites_a9f4973f` (`moduleposition_id`),
  KEY `module_position_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;


DROP TABLE IF EXISTS `module_registered`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=179 ;

INSERT INTO `module_registered` (`id`, `date`, `name`, `info`, `modulename`, `order`, `type_id`, `position_id`, `owner_id`) VALUES
(176, '2011-09-14 08:36:39', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(177, '2011-09-14 08:37:23', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(178, '2011-09-14 08:39:06', NULL, NULL, NULL, 1, NULL, NULL, NULL);

DROP TABLE IF EXISTS `module_registered_active`;
CREATE TABLE `module_registered_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registeredmodule_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registeredmodule_id` (`registeredmodule_id`,`site_id`),
  KEY `module_registered_active_a89b7aec` (`registeredmodule_id`),
  KEY `module_registered_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=197 ;

INSERT INTO `module_registered_active` (`id`, `registeredmodule_id`, `site_id`) VALUES
(194, 176, 1),
(195, 177, 1),
(196, 178, 1);

DROP TABLE IF EXISTS `module_registered_permissions`;
CREATE TABLE `module_registered_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registeredmodule_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registeredmodule_id` (`registeredmodule_id`,`permisiongroup_id`),
  KEY `module_registered_permissions_a89b7aec` (`registeredmodule_id`),
  KEY `module_registered_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `module_registered_sites`;
CREATE TABLE `module_registered_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registeredmodule_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registeredmodule_id` (`registeredmodule_id`,`site_id`),
  KEY `module_registered_sites_a89b7aec` (`registeredmodule_id`),
  KEY `module_registered_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=163 ;

INSERT INTO `module_registered_sites` (`id`, `registeredmodule_id`, `site_id`) VALUES
(160, 176, 1),
(161, 177, 1),
(162, 178, 1);

DROP TABLE IF EXISTS `module_sitemap_option`;
CREATE TABLE `module_sitemap_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `show_name` tinyint(1) NOT NULL,
  `show_info` tinyint(1) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `show_page_title` tinyint(1) NOT NULL,
  `class_prefix` varchar(255) DEFAULT NULL,
  `slug` varchar(900) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `registered_module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registered_module_id_refs_id_150aadc0` (`registered_module_id`),
  KEY `module_id_refs_id_ca7b1ab6` (`module_id`),
  KEY `menu_id_refs_id_a69303dd` (`menu_id`),
  KEY `module_sitemap_option_a951d5d6` (`slug`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `module_sitemap_option_sites`;
CREATE TABLE `module_sitemap_option_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sitemapmoduleoption_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sitemapmoduleoption_id` (`sitemapmoduleoption_id`,`site_id`),
  KEY `module_sitemap_option_sites_7fae7945` (`sitemapmoduleoption_id`),
  KEY `module_sitemap_option_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `module_type`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

INSERT INTO `module_type` (`id`, `date`, `name`, `info`, `slug`, `menu`, `options_modelname`, `options_formname`, `filemodel`, `fileform`, `filetemplate`, `fileview`) VALUES
(2, '2011-08-20 23:07:17', 'Artykul', '', '7444718-artykul', 1, 'ArticleModuleOption', 'ArticleOptionForm', 'artykul_module', 'artykul_module', '', ''),
(3, '2011-08-21 14:50:04', 'Menu', '', '3103994-menu', 0, 'MenuModuleOption', 'MenuOptionForm', 'menu_module', 'menu_module', 'menu_module', 'menu_module'),
(4, '2011-08-22 00:00:00', 'Lista artykułów', '', 'articles-list', 0, 'ArticleListModuleOption', 'ArticleListOptionForm', 'article_list_module', 'article_list_module', 'article_list_module', 'article_list_module'),
(5, '2011-08-22 00:00:00', 'Lista artykułów', '', 'articles-list-menu', 1, 'ArticleListModuleOption', 'ArticleListOptionForm', 'article_list_module', 'article_list_module', 'article_list_module', 'article_list_module'),
(6, '2011-08-30 14:38:02', 'Top Menu', '', 'topmenu', 0, '', '', '', '', 'megamenu', 'megamenu'),
(7, '2011-08-31 08:58:49', 'Column News Flash', '', '7405507-column-news-flash', 0, 'NewsFlashColumnModuleOption', 'NewsFlashColumnModuleOptionForm', 'newsflash_column_module', 'newsflash_column_module', 'newsflash_column_module', 'newsflash_column_module'),
(8, '2011-09-05 09:47:47', 'Html Box', '', '0899177-html-box', 1, 'HTMLBoxModuleOption', 'HTMLBoxModuleOptionForm', 'htmlbox_module', 'htmlbox_module', 'htmlbox_module', 'htmlbox_menu_module'),
(9, '2011-09-05 09:50:28', 'Html Box', '', '0904747-html-box', 0, 'HTMLBoxModuleOption', 'HTMLBoxModuleOptionForm', 'htmlbox_module', 'htmlbox_module', 'htmlbox_module', 'htmlbox_module'),
(10, '2011-09-05 11:20:14', 'Link zewnętrzny', '', '1485533-link-zewnetrzny', 1, 'LinkModuleOption', 'LinkModuleOptionForm', 'link_module', 'link_module', 'link_module', 'link_module'),
(11, '2011-09-05 12:26:21', 'SiteMap', '', '1843041-sitemap', 0, 'SiteMapModuleOption', 'SiteMapOptionForm', 'sitemap_module', 'sitemap_module', 'sitemap_module', 'sitemap_module'),
(12, '2011-09-07 08:03:12', 'Reklama', '', '7547358-reklama', 0, 'AdvModuleOption', 'AdvModuleOptionForm', 'adv_module', 'adv_module', 'adv_module', 'adv_module');

DROP TABLE IF EXISTS `module_type_active`;
CREATE TABLE `module_type_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduletype_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduletype_id` (`moduletype_id`,`site_id`),
  KEY `module_type_active_9cb16fae` (`moduletype_id`),
  KEY `module_type_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

INSERT INTO `module_type_active` (`id`, `moduletype_id`, `site_id`) VALUES
(5, 2, 1),
(4, 3, 1),
(3, 4, 1),
(2, 5, 1),
(1, 6, 1),
(6, 7, 1),
(7, 7, 2),
(8, 7, 3),
(9, 7, 4),
(14, 8, 1),
(15, 8, 2),
(16, 8, 3),
(17, 8, 4),
(18, 9, 1),
(19, 9, 2),
(20, 9, 3),
(21, 9, 4),
(22, 10, 1),
(23, 10, 2),
(24, 10, 3),
(25, 10, 4),
(34, 11, 1),
(35, 11, 2),
(36, 11, 3),
(37, 11, 4),
(38, 12, 1),
(39, 12, 2),
(40, 12, 3),
(41, 12, 4);

DROP TABLE IF EXISTS `module_type_sites`;
CREATE TABLE `module_type_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduletype_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduletype_id` (`moduletype_id`,`site_id`),
  KEY `module_type_sites_9cb16fae` (`moduletype_id`),
  KEY `module_type_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

INSERT INTO `module_type_sites` (`id`, `moduletype_id`, `site_id`) VALUES
(5, 2, 1),
(4, 3, 1),
(3, 4, 1),
(2, 5, 1),
(1, 6, 1),
(6, 7, 1),
(7, 7, 2),
(8, 7, 3),
(9, 7, 4),
(14, 8, 1),
(15, 8, 2),
(16, 8, 3),
(17, 8, 4),
(18, 9, 1),
(19, 9, 2),
(20, 9, 3),
(21, 9, 4),
(22, 10, 1),
(23, 10, 2),
(24, 10, 3),
(25, 10, 4),
(34, 11, 1),
(35, 11, 2),
(36, 11, 3),
(37, 11, 4),
(38, 12, 1),
(39, 12, 2),
(40, 12, 3),
(41, 12, 4);

DROP TABLE IF EXISTS `module_visibility`;
CREATE TABLE `module_visibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_visibility_aff30766` (`model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;


DROP TABLE IF EXISTS `module_visibility_menuitem`;
CREATE TABLE `module_visibility_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulevisibility_id` int(11) NOT NULL,
  `menuitem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modulevisibility_id` (`modulevisibility_id`,`menuitem_id`),
  KEY `module_visibility_menuitem_a47bb30` (`modulevisibility_id`),
  KEY `module_visibility_menuitem_f8c10b8c` (`menuitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `module_visibility_sites`;
CREATE TABLE `module_visibility_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulevisibility_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modulevisibility_id` (`modulevisibility_id`,`site_id`),
  KEY `module_visibility_sites_a47bb30` (`modulevisibility_id`),
  KEY `module_visibility_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


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
  `login` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_groups_63f17a16` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=816 ;

INSERT INTO `permission_groups` (`id`, `name`, `public`, `read`, `write`, `delete`, `add`, `own_only`, `model`, `parent_id`, `login`) VALUES
(1, 'User', 1, 1, 0, 0, 0, 0, '0', 0, NULL),
(2, 'Admin', 0, 1, 1, 1, 1, 0, '1', 0, NULL),
(403, 'Kategorie', 0, 1, 1, 1, 1, 0, 'Category', 2, 1),
(404, 'Artykuły', 0, 1, 1, 1, 1, 0, 'Article', 2, 1),
(405, 'Użytkownicy', 0, 1, 1, 1, 1, 0, 'UserProfile', 2, 1),
(406, 'Wiki', 0, 1, 1, 1, 1, 0, 'Wiki', 2, 1),
(407, 'Strony', 0, 1, 1, 1, 1, 0, 'SitePortal', 2, 1),
(408, 'Szablony', 0, 1, 1, 1, 1, 0, 'Sheet', 2, 1),
(409, 'Pliki Szablonów', 0, 1, 1, 1, 1, 0, 'SheetFile', 2, 1),
(410, 'Kursy', 0, 1, 1, 1, 1, 0, 'RepetitioCourse', 2, 1),
(411, 'Testy', 0, 1, 1, 1, 1, 0, 'RepetitioTest', 2, 1),
(412, 'Pytania', 0, 1, 1, 1, 1, 0, 'RepetitioQuestion', 2, 1),
(413, 'Moduły', 0, 1, 1, 1, 1, 0, 'RegisteredModule', 2, 1),
(414, 'Pozycje modułów', 0, 1, 1, 1, 1, 0, 'ModulePosition', 2, 1),
(415, 'Elementy menu', 0, 1, 1, 1, 1, 0, 'MenuItem', 2, 1),
(416, 'Menu', 0, 1, 1, 1, 1, 0, 'Menu', 2, 1),
(417, 'MegaMenu', 0, 1, 1, 1, 1, 0, 'MegaMenu', 2, 1),
(418, 'Zdjęcia', 0, 1, 1, 1, 1, 0, 'Image', 2, 1),
(419, 'Galerie', 0, 1, 1, 1, 1, 0, 'Gallery', 2, 1),
(420, 'Elementy katalogu', 0, 1, 1, 1, 1, 0, 'CatalogItem', 2, 1),
(421, 'Kategorie katalogu', 0, 1, 1, 1, 1, 0, 'CatalogCategory', 2, 1),
(422, 'Zdjęcia katalogu', 0, 1, 1, 1, 1, 0, 'CatalogImage', 2, 1),
(423, 'Kalendarze', 0, 1, 1, 1, 1, 0, 'Calendar', 2, 1),
(424, 'Wydarzenia', 0, 1, 1, 1, 1, 0, 'CalendarEvent', 2, 1),
(425, 'Typy wydarzeń', 0, 1, 1, 1, 1, 0, 'CalendarEventType', 2, 1),
(426, 'Kategorie ogłoszeń', 0, 1, 1, 1, 1, 0, 'AdCategory', 2, 1),
(427, 'Ogłoszenia', 0, 1, 1, 1, 1, 0, 'Ad', 2, 1),
(428, 'Zdjęcia ogłoszeń', 0, 1, 1, 1, 1, 0, 'AdImage', 2, 1),
(429, 'Grupy reklam', 0, 1, 1, 1, 1, 0, 'AdvGroup', 2, 1),
(430, 'Reklamy', 0, 1, 1, 1, 1, 0, 'Adv', 2, 1),
(431, 'Reklamy - klienci', 0, 1, 1, 1, 1, 0, 'AdvClient', 2, 1),
(432, 'Kategorie', 1, 1, 0, 0, 0, 0, 'Category', 1, 0),
(433, 'Artykuły', 1, 1, 0, 0, 0, 0, 'Article', 1, 0),
(434, 'Użytkownicy', 1, 1, 0, 0, 0, 0, 'UserProfile', 1, 0),
(435, 'Wiki', 1, 1, 0, 0, 0, 0, 'Wiki', 1, 0),
(436, 'Strony', 1, 1, 0, 0, 0, 0, 'SitePortal', 1, 0),
(437, 'Szablony', 1, 1, 0, 0, 0, 0, 'Sheet', 1, 0),
(438, 'Pliki Szablonów', 1, 1, 0, 0, 0, 0, 'SheetFile', 1, 0),
(439, 'Kursy', 1, 1, 0, 0, 0, 0, 'RepetitioCourse', 1, 0),
(440, 'Testy', 1, 1, 0, 0, 0, 0, 'RepetitioTest', 1, 0),
(441, 'Pytania', 1, 1, 0, 0, 0, 0, 'RepetitioQuestion', 1, 0),
(442, 'Odpowiedzi', 1, 1, 0, 0, 0, 0, 'RepetitioAnswer', 1, 0),
(443, 'Moduły', 1, 1, 0, 0, 0, 0, 'RegisteredModule', 1, 0),
(444, 'Pozycje modułów', 1, 1, 0, 0, 0, 0, 'ModulePosition', 1, 0),
(445, 'Elementy menu', 1, 1, 0, 0, 0, 0, 'MenuItem', 1, 0),
(446, 'Menu', 1, 1, 0, 0, 0, 0, 'Menu', 1, 0),
(447, 'MegaMenu', 1, 1, 0, 0, 0, 0, 'MegaMenu', 1, 0),
(448, 'Zdjęcia', 1, 1, 0, 0, 0, 0, 'Image', 1, 0),
(449, 'Galerie', 1, 1, 0, 0, 0, 0, 'Gallery', 1, 0),
(450, 'Elementy katalogu', 1, 1, 0, 0, 0, 0, 'CatalogItem', 1, 0),
(451, 'Kategorie katalogu', 1, 1, 0, 0, 0, 0, 'CatalogCategory', 1, 0),
(452, 'Zdjęcia katalogu', 1, 1, 0, 0, 0, 0, 'CatalogImage', 1, 0),
(453, 'Kalendarze', 1, 1, 0, 0, 0, 0, 'Calendar', 1, 0),
(454, 'Wydarzenia', 1, 1, 0, 0, 0, 0, 'CalendarEvent', 1, 0),
(455, 'Typy wydarzeń', 1, 1, 0, 0, 0, 0, 'CalendarEventType', 1, 0),
(456, 'Kategorie ogłoszeń', 1, 1, 0, 0, 0, 0, 'AdCategory', 1, 0),
(457, 'Ogłoszenia', 1, 1, 0, 0, 0, 0, 'Ad', 1, 0),
(458, 'Zdjęcia ogłoszeń', 1, 1, 0, 0, 0, 0, 'AdImage', 1, 0),
(459, 'Grupy reklam', 0, 1, 1, 1, 1, 0, 'AdvGroup', 1, 0),
(460, 'Reklamy', 0, 1, 1, 1, 1, 0, 'Adv', 1, 0),
(461, 'Reklamy - klienci', 0, 1, 1, 1, 1, 0, 'AdvClient', 1, 0),
(462, 'Kategorie: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 432, 0),
(463, 'Kategorie: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 432, 1),
(464, 'Kategorie: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 432, 1),
(465, 'Kategorie: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 432, 1),
(466, 'Kategorie: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 432, 1),
(467, 'Kategorie: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 432, 1),
(468, 'Artykuły: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 433, 0),
(469, 'Artykuły: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 433, 1),
(470, 'Artykuły: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 433, 1),
(471, 'Artykuły: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 433, 1),
(472, 'Artykuły: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 433, 1),
(473, 'Artykuły: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 433, 1),
(474, 'Użytkownicy: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 434, 0),
(475, 'Użytkownicy: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 434, 1),
(476, 'Użytkownicy: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 434, 1),
(477, 'Użytkownicy: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 434, 1),
(478, 'Użytkownicy: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 434, 1),
(479, 'Użytkownicy: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 434, 1),
(480, 'Wiki: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 435, 0),
(481, 'Wiki: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 435, 1),
(482, 'Wiki: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 435, 1),
(483, 'Wiki: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 435, 1),
(484, 'Wiki: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 435, 1),
(485, 'Wiki: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 435, 1),
(486, 'Strony: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 436, 0),
(487, 'Strony: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 436, 1),
(488, 'Strony: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 436, 1),
(489, 'Strony: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 436, 1),
(490, 'Strony: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 436, 1),
(491, 'Strony: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 436, 1),
(492, 'Szablony: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 437, 0),
(493, 'Szablony: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 437, 1),
(494, 'Szablony: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 437, 1),
(495, 'Szablony: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 437, 1),
(496, 'Szablony: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 437, 1),
(497, 'Szablony: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 437, 1),
(498, 'Pliki Szablonów: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 438, 0),
(499, 'Pliki Szablonów: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 438, 1),
(500, 'Pliki Szablonów: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 438, 1),
(501, 'Pliki Szablonów: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 438, 1),
(502, 'Pliki Szablonów: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 438, 1),
(503, 'Pliki Szablonów: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 438, 1),
(504, 'Kursy: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 439, 0),
(505, 'Kursy: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 439, 1),
(506, 'Kursy: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 439, 1),
(507, 'Kursy: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 439, 1),
(508, 'Kursy: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 439, 1),
(509, 'Kursy: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 439, 1),
(510, 'Testy: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 440, 0),
(511, 'Testy: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 440, 1),
(512, 'Testy: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 440, 1),
(513, 'Testy: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 440, 1),
(514, 'Testy: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 440, 1),
(515, 'Testy: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 440, 1),
(516, 'Pytania: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 441, 0),
(517, 'Pytania: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 441, 1),
(518, 'Pytania: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 441, 1),
(519, 'Pytania: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 441, 1),
(520, 'Pytania: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 441, 1),
(521, 'Pytania: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 441, 1),
(522, 'Odpowiedzi: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 442, 0),
(523, 'Odpowiedzi: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 442, 1),
(524, 'Odpowiedzi: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 442, 1),
(525, 'Odpowiedzi: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 442, 1),
(526, 'Odpowiedzi: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 442, 1),
(527, 'Odpowiedzi: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 442, 1),
(528, 'Moduły: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 443, 0),
(529, 'Moduły: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 443, 1),
(530, 'Moduły: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 443, 1),
(531, 'Moduły: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 443, 1),
(532, 'Moduły: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 443, 1),
(533, 'Moduły: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 443, 1),
(534, 'Pozycje modułów: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 444, 0),
(535, 'Pozycje modułów: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 444, 1),
(536, 'Pozycje modułów: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 444, 1),
(537, 'Pozycje modułów: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 444, 1),
(538, 'Pozycje modułów: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 444, 1),
(539, 'Pozycje modułów: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 444, 1),
(540, 'Elementy menu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 445, 0),
(541, 'Elementy menu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 445, 1),
(542, 'Elementy menu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 445, 1),
(543, 'Elementy menu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 445, 1),
(544, 'Elementy menu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 445, 1),
(545, 'Elementy menu: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 445, 1),
(546, 'Menu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 446, 0),
(547, 'Menu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 446, 1),
(548, 'Menu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 446, 1),
(549, 'Menu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 446, 1),
(550, 'Menu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 446, 1),
(551, 'Menu: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 446, 1),
(552, 'MegaMenu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 447, 0),
(553, 'MegaMenu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 447, 1),
(554, 'MegaMenu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 447, 1),
(555, 'MegaMenu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 447, 1),
(556, 'MegaMenu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 447, 1),
(557, 'MegaMenu: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 447, 1),
(558, 'Zdjęcia: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 448, 0),
(559, 'Zdjęcia: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 448, 1),
(560, 'Zdjęcia: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 448, 1),
(561, 'Zdjęcia: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 448, 1),
(562, 'Zdjęcia: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 448, 1),
(563, 'Zdjęcia: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 448, 1),
(564, 'Galerie: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 449, 0),
(565, 'Galerie: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 449, 1),
(566, 'Galerie: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 449, 1),
(567, 'Galerie: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 449, 1),
(568, 'Galerie: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 449, 1),
(569, 'Galerie: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 449, 1),
(570, 'Elementy katalogu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 450, 0),
(571, 'Elementy katalogu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 450, 1),
(572, 'Elementy katalogu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 450, 1),
(573, 'Elementy katalogu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 450, 1),
(574, 'Elementy katalogu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 450, 1),
(575, 'Elementy katalogu: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 450, 1),
(576, 'Kategorie katalogu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 451, 0),
(577, 'Kategorie katalogu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 451, 1),
(578, 'Kategorie katalogu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 451, 1),
(579, 'Kategorie katalogu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 451, 1),
(580, 'Kategorie katalogu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 451, 1),
(581, 'Kategorie katalogu: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 451, 1),
(582, 'Zdjęcia katalogu: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 452, 0),
(583, 'Zdjęcia katalogu: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 452, 1),
(584, 'Zdjęcia katalogu: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 452, 1),
(585, 'Zdjęcia katalogu: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 452, 1),
(586, 'Zdjęcia katalogu: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 452, 1),
(587, 'Zdjęcia katalogu: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 452, 1),
(588, 'Kalendarze: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 453, 0),
(589, 'Kalendarze: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 453, 1),
(590, 'Kalendarze: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 453, 1),
(591, 'Kalendarze: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 453, 1),
(592, 'Kalendarze: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 453, 1),
(593, 'Kalendarze: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 453, 1),
(594, 'Wydarzenia: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 454, 0),
(595, 'Wydarzenia: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 454, 1),
(596, 'Wydarzenia: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 454, 1),
(597, 'Wydarzenia: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 454, 1),
(598, 'Wydarzenia: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 454, 1),
(599, 'Wydarzenia: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 454, 1),
(600, 'Typy wydarzeń: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 455, 0),
(601, 'Typy wydarzeń: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 455, 1),
(602, 'Typy wydarzeń: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 455, 1),
(603, 'Typy wydarzeń: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 455, 1),
(604, 'Typy wydarzeń: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 455, 1),
(605, 'Typy wydarzeń: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 455, 1),
(606, 'Kategorie ogłoszeń: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 456, 0),
(607, 'Kategorie ogłoszeń: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 456, 1),
(608, 'Kategorie ogłoszeń: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 456, 1),
(609, 'Kategorie ogłoszeń: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 456, 1),
(610, 'Kategorie ogłoszeń: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 456, 1),
(611, 'Kategorie ogłoszeń: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 456, 1),
(612, 'Ogłoszenia: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 457, 0),
(613, 'Ogłoszenia: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 457, 1),
(614, 'Ogłoszenia: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 457, 1),
(615, 'Ogłoszenia: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 457, 1),
(616, 'Ogłoszenia: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 457, 1),
(617, 'Ogłoszenia: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 457, 1),
(618, 'Zdjęcia ogłoszeń: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 458, 0),
(619, 'Zdjęcia ogłoszeń: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 458, 1),
(620, 'Zdjęcia ogłoszeń: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 458, 1),
(621, 'Zdjęcia ogłoszeń: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 458, 1),
(622, 'Zdjęcia ogłoszeń: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 458, 1),
(623, 'Zdjęcia ogłoszeń: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 458, 1),
(624, 'Grupy reklam: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 459, 0),
(625, 'Grupy reklam: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 459, 1),
(626, 'Grupy reklam: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 459, 1),
(627, 'Grupy reklam: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 459, 1),
(628, 'Grupy reklam: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 459, 1),
(629, 'Grupy reklam: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 459, 1),
(630, 'Reklamy: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 460, 0),
(631, 'Reklamy: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 460, 1),
(632, 'Reklamy: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 460, 1),
(633, 'Reklamy: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 460, 1),
(634, 'Reklamy: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 460, 1),
(635, 'Reklamy: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 460, 1),
(636, 'Reklamy - klienci: Użytkownik - Przeglądanie', 1, 1, 0, 0, 0, 0, NULL, 461, 0),
(637, 'Reklamy - klienci: Użytkownik - Edycja', 1, 0, 1, 0, 0, 0, NULL, 461, 1),
(638, 'Reklamy - klienci: Użytkownik - Dodawanie', 1, 0, 0, 0, 1, 0, NULL, 461, 1),
(639, 'Reklamy - klienci: Użytkownik - Kasowanie', 1, 0, 0, 1, 0, 0, NULL, 461, 1),
(640, 'Reklamy - klienci: Użytkownik - Tylko własne', 1, 0, 0, 0, 0, 1, NULL, 461, 1),
(641, 'Reklamy - klienci: Użytkownik - Zalogowany', 0, 0, 0, 0, 0, 0, NULL, 461, 1),
(642, 'Kategorie: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 403, 1),
(643, 'Kategorie: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 403, 1),
(644, 'Kategorie: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 403, 1),
(645, 'Kategorie: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 403, 1),
(646, 'Kategorie: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 403, 1),
(647, 'Kategorie: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 403, 1),
(648, 'Artykuły: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 404, 1),
(649, 'Artykuły: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 404, 1),
(650, 'Artykuły: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 404, 1),
(651, 'Artykuły: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 404, 1),
(652, 'Artykuły: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 404, 1),
(653, 'Artykuły: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 404, 1),
(654, 'Użytkownicy: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 405, 1),
(655, 'Użytkownicy: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 405, 1),
(656, 'Użytkownicy: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 405, 1),
(657, 'Użytkownicy: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 405, 1),
(658, 'Użytkownicy: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 405, 1),
(659, 'Użytkownicy: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 405, 1),
(660, 'Wiki: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 406, 1),
(661, 'Wiki: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 406, 1),
(662, 'Wiki: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 406, 1),
(663, 'Wiki: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 406, 1),
(664, 'Wiki: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 406, 1),
(665, 'Wiki: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 406, 1),
(666, 'Strony: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 407, 1),
(667, 'Strony: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 407, 1),
(668, 'Strony: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 407, 1),
(669, 'Strony: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 407, 1),
(670, 'Strony: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 407, 1),
(671, 'Strony: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 407, 1),
(672, 'Szablony: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 408, 1),
(673, 'Szablony: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 408, 1),
(674, 'Szablony: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 408, 1),
(675, 'Szablony: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 408, 1),
(676, 'Szablony: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 408, 1),
(677, 'Szablony: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 408, 1),
(678, 'Pliki Szablonów: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 409, 1),
(679, 'Pliki Szablonów: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 409, 1),
(680, 'Pliki Szablonów: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 409, 1),
(681, 'Pliki Szablonów: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 409, 1),
(682, 'Pliki Szablonów: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 409, 1),
(683, 'Pliki Szablonów: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 409, 1),
(684, 'Kursy: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 410, 1),
(685, 'Kursy: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 410, 1),
(686, 'Kursy: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 410, 1),
(687, 'Kursy: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 410, 1),
(688, 'Kursy: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 410, 1),
(689, 'Kursy: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 410, 1),
(690, 'Testy: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 411, 1),
(691, 'Testy: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 411, 1),
(692, 'Testy: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 411, 1),
(693, 'Testy: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 411, 1),
(694, 'Testy: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 411, 1),
(695, 'Testy: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 411, 1),
(696, 'Pytania: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 412, 1),
(697, 'Pytania: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 412, 1),
(698, 'Pytania: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 412, 1),
(699, 'Pytania: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 412, 1),
(700, 'Pytania: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 412, 1),
(701, 'Pytania: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 412, 1),
(702, 'Moduły: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 413, 1),
(703, 'Moduły: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 413, 1),
(704, 'Moduły: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 413, 1),
(705, 'Moduły: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 413, 1),
(706, 'Moduły: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 413, 1),
(707, 'Moduły: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 413, 1),
(708, 'Pozycje modułów: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 414, 1),
(709, 'Pozycje modułów: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 414, 1),
(710, 'Pozycje modułów: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 414, 1),
(711, 'Pozycje modułów: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 414, 1),
(712, 'Pozycje modułów: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 414, 1),
(713, 'Pozycje modułów: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 414, 1),
(714, 'Elementy menu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 415, 1),
(715, 'Elementy menu: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 415, 1),
(716, 'Elementy menu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 415, 1),
(717, 'Elementy menu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 415, 1),
(718, 'Elementy menu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 415, 1),
(719, 'Elementy menu: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 415, 1),
(720, 'Menu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 416, 1),
(721, 'Menu: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 416, 1),
(722, 'Menu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 416, 1),
(723, 'Menu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 416, 1),
(724, 'Menu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 416, 1),
(725, 'Menu: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 416, 1),
(726, 'MegaMenu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 417, 1),
(727, 'MegaMenu: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 417, 1),
(728, 'MegaMenu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 417, 1),
(729, 'MegaMenu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 417, 1),
(730, 'MegaMenu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 417, 1),
(731, 'MegaMenu: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 417, 1),
(732, 'Zdjęcia: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 418, 1),
(733, 'Zdjęcia: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 418, 1),
(734, 'Zdjęcia: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 418, 1),
(735, 'Zdjęcia: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 418, 1),
(736, 'Zdjęcia: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 418, 1),
(737, 'Zdjęcia: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 418, 1),
(738, 'Galerie: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 419, 1),
(739, 'Galerie: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 419, 1),
(740, 'Galerie: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 419, 1),
(741, 'Galerie: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 419, 1),
(742, 'Galerie: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 419, 1),
(743, 'Galerie: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 419, 1),
(744, 'Elementy katalogu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 420, 1),
(745, 'Elementy katalogu: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 420, 1),
(746, 'Elementy katalogu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 420, 1),
(747, 'Elementy katalogu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 420, 1),
(748, 'Elementy katalogu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 420, 1),
(749, 'Elementy katalogu: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 420, 1),
(750, 'Kategorie katalogu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 421, 1),
(751, 'Kategorie katalogu: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 421, 1),
(752, 'Kategorie katalogu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 421, 1),
(753, 'Kategorie katalogu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 421, 1),
(754, 'Kategorie katalogu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 421, 1),
(755, 'Kategorie katalogu: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 421, 1),
(756, 'Zdjęcia katalogu: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 422, 1),
(757, 'Zdjęcia katalogu: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 422, 1),
(758, 'Zdjęcia katalogu: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 422, 1),
(759, 'Zdjęcia katalogu: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 422, 1),
(760, 'Zdjęcia katalogu: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 422, 1),
(761, 'Zdjęcia katalogu: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 422, 1),
(762, 'Kalendarze: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 423, 1),
(763, 'Kalendarze: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 423, 1),
(764, 'Kalendarze: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 423, 1),
(765, 'Kalendarze: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 423, 1),
(766, 'Kalendarze: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 423, 1),
(767, 'Kalendarze: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 423, 1),
(768, 'Wydarzenia: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 424, 1),
(769, 'Wydarzenia: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 424, 1),
(770, 'Wydarzenia: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 424, 1),
(771, 'Wydarzenia: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 424, 1),
(772, 'Wydarzenia: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 424, 1),
(773, 'Wydarzenia: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 424, 1),
(774, 'Typy wydarzeń: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 425, 1),
(775, 'Typy wydarzeń: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 425, 1),
(776, 'Typy wydarzeń: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 425, 1),
(777, 'Typy wydarzeń: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 425, 1),
(778, 'Typy wydarzeń: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 425, 1),
(779, 'Typy wydarzeń: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 425, 1),
(780, 'Kategorie ogłoszeń: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 426, 1),
(781, 'Kategorie ogłoszeń: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 426, 1),
(782, 'Kategorie ogłoszeń: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 426, 1),
(783, 'Kategorie ogłoszeń: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 426, 1),
(784, 'Kategorie ogłoszeń: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 426, 1),
(785, 'Kategorie ogłoszeń: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 426, 1),
(786, 'Ogłoszenia: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 427, 1),
(787, 'Ogłoszenia: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 427, 1),
(788, 'Ogłoszenia: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 427, 1),
(789, 'Ogłoszenia: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 427, 1),
(790, 'Ogłoszenia: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 427, 1),
(791, 'Ogłoszenia: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 427, 1),
(792, 'Zdjęcia ogłoszeń: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 428, 1),
(793, 'Zdjęcia ogłoszeń: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 428, 1),
(794, 'Zdjęcia ogłoszeń: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 428, 1),
(795, 'Zdjęcia ogłoszeń: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 428, 1),
(796, 'Zdjęcia ogłoszeń: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 428, 1),
(797, 'Zdjęcia ogłoszeń: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 428, 1),
(798, 'Grupy reklam: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 429, 1),
(799, 'Grupy reklam: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 429, 1),
(800, 'Grupy reklam: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 429, 1),
(801, 'Grupy reklam: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 429, 1),
(802, 'Grupy reklam: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 429, 1),
(803, 'Grupy reklam: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 429, 1),
(804, 'Reklamy: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 430, 1),
(805, 'Reklamy: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 430, 1),
(806, 'Reklamy: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 430, 1),
(807, 'Reklamy: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 430, 1),
(808, 'Reklamy: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 430, 1),
(809, 'Reklamy: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 430, 1),
(810, 'Reklamy - klienci: Admin - Przeglądanie', 0, 1, 0, 0, 0, 0, NULL, 431, 1),
(811, 'Reklamy - klienci: Admin - Edycja', 0, 0, 1, 0, 0, 0, NULL, 431, 1),
(812, 'Reklamy - klienci: Admin - Dodawanie', 0, 0, 0, 0, 1, 0, NULL, 431, 1),
(813, 'Reklamy - klienci: Admin - Kasowanie', 0, 0, 0, 1, 0, 0, NULL, 431, 1),
(814, 'Reklamy - klienci: Admin - Tylko własne', 0, 0, 0, 0, 0, 1, NULL, 431, 1),
(815, 'Reklamy - klienci: Admin - Zalogowany', 0, 0, 0, 0, 0, 1, NULL, 431, 1);

DROP TABLE IF EXISTS `profiles`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

INSERT INTO `profiles` (`id`, `username`, `password`, `email`, `registerhash`, `userhash`, `lastlogin`, `lastip`, `is_active`, `confirmed`, `registerdate`, `emailsenddate`, `admincomment`) VALUES
(1, 'Admin', 'admin123', 'admin@admin.pl', '', '', '2011-09-14 08:33:50', '127.0.0.1', 1, 1, '2011-08-30 14:12:58', NULL, '');

DROP TABLE IF EXISTS `profiles_permissions`;
CREATE TABLE `profiles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_id` (`userprofile_id`,`permisiongroup_id`),
  KEY `profiles_permissions_1be3128f` (`userprofile_id`),
  KEY `profiles_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2881 ;

INSERT INTO `profiles_permissions` (`id`, `userprofile_id`, `permisiongroup_id`) VALUES
(2822, 1, 403),
(2823, 1, 404),
(2824, 1, 405),
(2825, 1, 406),
(2826, 1, 407),
(2827, 1, 408),
(2828, 1, 409),
(2829, 1, 410),
(2830, 1, 411),
(2831, 1, 412),
(2832, 1, 413),
(2833, 1, 414),
(2834, 1, 415),
(2835, 1, 416),
(2836, 1, 417),
(2837, 1, 418),
(2838, 1, 419),
(2839, 1, 420),
(2840, 1, 421),
(2841, 1, 422),
(2842, 1, 423),
(2843, 1, 424),
(2844, 1, 425),
(2845, 1, 426),
(2846, 1, 427),
(2847, 1, 428),
(2848, 1, 429),
(2849, 1, 430),
(2850, 1, 431),
(2851, 1, 432),
(2852, 1, 433),
(2853, 1, 434),
(2854, 1, 435),
(2855, 1, 436),
(2856, 1, 437),
(2857, 1, 438),
(2858, 1, 439),
(2859, 1, 440),
(2860, 1, 441),
(2861, 1, 442),
(2862, 1, 443),
(2863, 1, 444),
(2864, 1, 445),
(2865, 1, 446),
(2866, 1, 447),
(2867, 1, 448),
(2868, 1, 449),
(2869, 1, 450),
(2870, 1, 451),
(2871, 1, 452),
(2872, 1, 453),
(2873, 1, 454),
(2874, 1, 455),
(2875, 1, 456),
(2876, 1, 457),
(2877, 1, 458),
(2878, 1, 459),
(2879, 1, 460),
(2880, 1, 461),
(2648, 1, 642),
(2649, 1, 643),
(2650, 1, 644),
(2651, 1, 645),
(2652, 1, 646),
(2653, 1, 647),
(2654, 1, 648),
(2655, 1, 649),
(2656, 1, 650),
(2657, 1, 651),
(2658, 1, 652),
(2659, 1, 653),
(2660, 1, 654),
(2661, 1, 655),
(2662, 1, 656),
(2663, 1, 657),
(2664, 1, 658),
(2665, 1, 659),
(2666, 1, 660),
(2667, 1, 661),
(2668, 1, 662),
(2669, 1, 663),
(2670, 1, 664),
(2671, 1, 665),
(2672, 1, 666),
(2673, 1, 667),
(2674, 1, 668),
(2675, 1, 669),
(2676, 1, 670),
(2677, 1, 671),
(2678, 1, 672),
(2679, 1, 673),
(2680, 1, 674),
(2681, 1, 675),
(2682, 1, 676),
(2683, 1, 677),
(2684, 1, 678),
(2685, 1, 679),
(2686, 1, 680),
(2687, 1, 681),
(2688, 1, 682),
(2689, 1, 683),
(2690, 1, 684),
(2691, 1, 685),
(2692, 1, 686),
(2693, 1, 687),
(2694, 1, 688),
(2695, 1, 689),
(2696, 1, 690),
(2697, 1, 691),
(2698, 1, 692),
(2699, 1, 693),
(2700, 1, 694),
(2701, 1, 695),
(2702, 1, 696),
(2703, 1, 697),
(2704, 1, 698),
(2705, 1, 699),
(2706, 1, 700),
(2707, 1, 701),
(2708, 1, 702),
(2709, 1, 703),
(2710, 1, 704),
(2711, 1, 705),
(2712, 1, 706),
(2713, 1, 707),
(2714, 1, 708),
(2715, 1, 709),
(2716, 1, 710),
(2717, 1, 711),
(2718, 1, 712),
(2719, 1, 713),
(2720, 1, 714),
(2721, 1, 715),
(2722, 1, 716),
(2723, 1, 717),
(2724, 1, 718),
(2725, 1, 719),
(2726, 1, 720),
(2727, 1, 721),
(2728, 1, 722),
(2729, 1, 723),
(2730, 1, 724),
(2731, 1, 725),
(2732, 1, 726),
(2733, 1, 727),
(2734, 1, 728),
(2735, 1, 729),
(2736, 1, 730),
(2737, 1, 731),
(2738, 1, 732),
(2739, 1, 733),
(2740, 1, 734),
(2741, 1, 735),
(2742, 1, 736),
(2743, 1, 737),
(2744, 1, 738),
(2745, 1, 739),
(2746, 1, 740),
(2747, 1, 741),
(2748, 1, 742),
(2749, 1, 743),
(2750, 1, 744),
(2751, 1, 745),
(2752, 1, 746),
(2753, 1, 747),
(2754, 1, 748),
(2755, 1, 749),
(2756, 1, 750),
(2757, 1, 751),
(2758, 1, 752),
(2759, 1, 753),
(2760, 1, 754),
(2761, 1, 755),
(2762, 1, 756),
(2763, 1, 757),
(2764, 1, 758),
(2765, 1, 759),
(2766, 1, 760),
(2767, 1, 761),
(2768, 1, 762),
(2769, 1, 763),
(2770, 1, 764),
(2771, 1, 765),
(2772, 1, 766),
(2773, 1, 767),
(2774, 1, 768),
(2775, 1, 769),
(2776, 1, 770),
(2777, 1, 771),
(2778, 1, 772),
(2779, 1, 773),
(2780, 1, 774),
(2781, 1, 775),
(2782, 1, 776),
(2783, 1, 777),
(2784, 1, 778),
(2785, 1, 779),
(2786, 1, 780),
(2787, 1, 781),
(2788, 1, 782),
(2789, 1, 783),
(2790, 1, 784),
(2791, 1, 785),
(2792, 1, 786),
(2793, 1, 787),
(2794, 1, 788),
(2795, 1, 789),
(2796, 1, 790),
(2797, 1, 791),
(2798, 1, 792),
(2799, 1, 793),
(2800, 1, 794),
(2801, 1, 795),
(2802, 1, 796),
(2803, 1, 797),
(2804, 1, 798),
(2805, 1, 799),
(2806, 1, 800),
(2807, 1, 801),
(2808, 1, 802),
(2809, 1, 803),
(2810, 1, 804),
(2811, 1, 805),
(2812, 1, 806),
(2813, 1, 807),
(2814, 1, 808),
(2815, 1, 809),
(2816, 1, 810),
(2817, 1, 811),
(2818, 1, 812),
(2819, 1, 813),
(2820, 1, 814),
(2821, 1, 815),
(2027, 2, 280),
(2278, 3, 278),
(2279, 3, 279),
(2280, 3, 280),
(2281, 3, 281),
(2282, 3, 282),
(2283, 3, 283),
(2284, 3, 284),
(2285, 3, 285),
(2286, 3, 286),
(2287, 3, 287),
(2288, 3, 288),
(2289, 3, 289),
(2290, 3, 290),
(2291, 3, 291),
(2292, 3, 292),
(2293, 3, 293),
(2294, 3, 294),
(2295, 3, 295),
(2296, 3, 296),
(2297, 3, 297),
(2298, 3, 298),
(2299, 3, 299),
(2300, 3, 300),
(2301, 3, 301),
(2302, 3, 302),
(2303, 3, 303),
(2304, 3, 304),
(2305, 3, 305),
(2306, 3, 306),
(2307, 3, 307),
(2308, 3, 308),
(2309, 3, 309),
(2310, 3, 310),
(2311, 3, 311),
(2312, 3, 312),
(2313, 3, 313),
(2314, 3, 314),
(2315, 3, 315),
(2316, 3, 316),
(2317, 3, 317),
(2318, 3, 318),
(2319, 3, 319),
(2320, 3, 320),
(2321, 3, 321),
(2322, 3, 322),
(2323, 3, 323),
(2324, 3, 324),
(2325, 3, 325),
(2326, 3, 326),
(2327, 3, 327),
(2328, 3, 328),
(2329, 3, 329),
(2330, 3, 330),
(2331, 3, 331),
(2332, 3, 332),
(2333, 3, 333),
(2334, 3, 334),
(2335, 3, 335),
(2336, 3, 336),
(2337, 3, 337),
(2338, 3, 338),
(2339, 3, 339),
(2340, 3, 340),
(2341, 3, 341),
(2342, 3, 342),
(2343, 3, 343),
(2344, 3, 344),
(2345, 3, 345),
(2346, 3, 346),
(2347, 3, 347),
(2348, 3, 348),
(2349, 3, 349),
(2350, 3, 350),
(2351, 3, 351),
(2352, 3, 352),
(2353, 3, 353),
(2354, 3, 354),
(2355, 3, 355),
(2356, 3, 356),
(2357, 3, 357),
(2358, 3, 358),
(2359, 3, 359),
(2360, 3, 360),
(2361, 3, 361),
(2362, 3, 362),
(2363, 3, 363),
(2364, 3, 364),
(2365, 3, 365),
(2366, 3, 366),
(2367, 3, 367),
(2368, 3, 368),
(2369, 3, 369),
(2370, 3, 370),
(2371, 3, 371),
(2372, 3, 372),
(2373, 3, 373),
(2374, 3, 374),
(2375, 3, 375),
(2376, 3, 376),
(2377, 3, 377),
(2378, 3, 378),
(2379, 3, 379),
(2380, 3, 380),
(2381, 3, 381),
(2382, 3, 382),
(2383, 3, 383),
(2384, 3, 384),
(2385, 3, 385),
(2386, 3, 386),
(2387, 3, 387),
(2388, 3, 388),
(2389, 3, 389),
(2390, 3, 390),
(2391, 3, 391),
(2392, 3, 392),
(2393, 3, 393),
(2394, 3, 394),
(2395, 3, 395),
(2396, 3, 396),
(2397, 3, 397),
(2398, 3, 398),
(2399, 3, 399),
(2400, 3, 400),
(2401, 3, 401),
(2402, 3, 402);

DROP TABLE IF EXISTS `profiles_sites`;
CREATE TABLE `profiles_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_id` (`userprofile_id`,`site_id`),
  KEY `profiles_sites_1be3128f` (`userprofile_id`),
  KEY `profiles_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

INSERT INTO `profiles_sites` (`id`, `userprofile_id`, `site_id`) VALUES
(5, 1, 1);

DROP TABLE IF EXISTS `profile_data`;
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


DROP TABLE IF EXISTS `repetitio_answers`;
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


DROP TABLE IF EXISTS `repetitio_answers_languages`;
CREATE TABLE `repetitio_answers_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioanswer_id` int(11) NOT NULL,
  `repetitioanswerlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioanswer_id` (`repetitioanswer_id`,`repetitioanswerlanguage_id`),
  KEY `repetitio_answers_languages_73cdad58` (`repetitioanswer_id`),
  KEY `repetitio_answers_languages_9bddb91e` (`repetitioanswerlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_answers_permissions`;
CREATE TABLE `repetitio_answers_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioanswer_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioanswer_id` (`repetitioanswer_id`,`permisiongroup_id`),
  KEY `repetitio_answers_permissions_73cdad58` (`repetitioanswer_id`),
  KEY `repetitio_answers_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_answers_sites`;
CREATE TABLE `repetitio_answers_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioanswer_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioanswer_id` (`repetitioanswer_id`,`site_id`),
  KEY `repetitio_answers_sites_73cdad58` (`repetitioanswer_id`),
  KEY `repetitio_answers_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_course`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `repetitio_courseusers`;
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


DROP TABLE IF EXISTS `repetitio_courseusers_sites`;
CREATE TABLE `repetitio_courseusers_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourseuser_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourseuser_id` (`repetitiocourseuser_id`,`site_id`),
  KEY `repetitio_courseusers_sites_9f351720` (`repetitiocourseuser_id`),
  KEY `repetitio_courseusers_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_course_active`;
CREATE TABLE `repetitio_course_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourse_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourse_id` (`repetitiocourse_id`,`site_id`),
  KEY `repetitio_course_active_d4b8a271` (`repetitiocourse_id`),
  KEY `repetitio_course_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_course_languages`;
CREATE TABLE `repetitio_course_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourse_id` int(11) NOT NULL,
  `repetitiocourselanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourse_id` (`repetitiocourse_id`,`repetitiocourselanguage_id`),
  KEY `repetitio_course_languages_d4b8a271` (`repetitiocourse_id`),
  KEY `repetitio_course_languages_58e38741` (`repetitiocourselanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


DROP TABLE IF EXISTS `repetitio_course_permissions`;
CREATE TABLE `repetitio_course_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourse_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourse_id` (`repetitiocourse_id`,`permisiongroup_id`),
  KEY `repetitio_course_permissions_d4b8a271` (`repetitiocourse_id`),
  KEY `repetitio_course_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_course_sites`;
CREATE TABLE `repetitio_course_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiocourse_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiocourse_id` (`repetitiocourse_id`,`site_id`),
  KEY `repetitio_course_sites_d4b8a271` (`repetitiocourse_id`),
  KEY `repetitio_course_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_questions`;
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


DROP TABLE IF EXISTS `repetitio_questions_active`;
CREATE TABLE `repetitio_questions_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioquestion_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioquestion_id` (`repetitioquestion_id`,`site_id`),
  KEY `repetitio_questions_active_88a552a0` (`repetitioquestion_id`),
  KEY `repetitio_questions_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_questions_languages`;
CREATE TABLE `repetitio_questions_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioquestion_id` int(11) NOT NULL,
  `repetitioquestionlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioquestion_id` (`repetitioquestion_id`,`repetitioquestionlanguage_id`),
  KEY `repetitio_questions_languages_88a552a0` (`repetitioquestion_id`),
  KEY `repetitio_questions_languages_a831889e` (`repetitioquestionlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_questions_permissions`;
CREATE TABLE `repetitio_questions_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioquestion_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioquestion_id` (`repetitioquestion_id`,`permisiongroup_id`),
  KEY `repetitio_questions_permissions_88a552a0` (`repetitioquestion_id`),
  KEY `repetitio_questions_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_questions_sites`;
CREATE TABLE `repetitio_questions_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitioquestion_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitioquestion_id` (`repetitioquestion_id`,`site_id`),
  KEY `repetitio_questions_sites_88a552a0` (`repetitioquestion_id`),
  KEY `repetitio_questions_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_tests`;
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


DROP TABLE IF EXISTS `repetitio_tests_active`;
CREATE TABLE `repetitio_tests_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotest_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotest_id` (`repetitiotest_id`,`site_id`),
  KEY `repetitio_tests_active_3a15e6e4` (`repetitiotest_id`),
  KEY `repetitio_tests_active_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_tests_languages`;
CREATE TABLE `repetitio_tests_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotest_id` int(11) NOT NULL,
  `repetitiotestlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotest_id` (`repetitiotest_id`,`repetitiotestlanguage_id`),
  KEY `repetitio_tests_languages_3a15e6e4` (`repetitiotest_id`),
  KEY `repetitio_tests_languages_3559a5fa` (`repetitiotestlanguage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_tests_permissions`;
CREATE TABLE `repetitio_tests_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotest_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotest_id` (`repetitiotest_id`,`permisiongroup_id`),
  KEY `repetitio_tests_permissions_3a15e6e4` (`repetitiotest_id`),
  KEY `repetitio_tests_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_tests_sites`;
CREATE TABLE `repetitio_tests_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotest_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotest_id` (`repetitiotest_id`,`site_id`),
  KEY `repetitio_tests_sites_3a15e6e4` (`repetitiotest_id`),
  KEY `repetitio_tests_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `repetitio_useranswers`;
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


DROP TABLE IF EXISTS `repetitio_useranswers_sites`;
CREATE TABLE `repetitio_useranswers_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repetitiotestanswer_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repetitiotestanswer_id` (`repetitiotestanswer_id`,`site_id`),
  KEY `repetitio_useranswers_sites_1ffd8550` (`repetitiotestanswer_id`),
  KEY `repetitio_useranswers_sites_6223029` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `rep_answer_lang`;
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


DROP TABLE IF EXISTS `rep_course_lang`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


DROP TABLE IF EXISTS `rep_question_lang`;
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


DROP TABLE IF EXISTS `rep_test_lang`;
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


DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `schID` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `countrydistinctsID` int(11) NOT NULL,
  `schedule_typeID` int(11) NOT NULL,
  `bannerLink` varchar(100) NOT NULL,
  `infoLink` varchar(255) NOT NULL,
  `support` varchar(122) NOT NULL,
  `backgroundColor` varchar(10) NOT NULL,
  `borderColor` varchar(10) NOT NULL,
  `borderWidth` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `promotor` varchar(128) NOT NULL,
  `formMail` varchar(32) NOT NULL,
  `profesor` varchar(128) NOT NULL,
  `city` varchar(32) NOT NULL,
  `date` varchar(64) NOT NULL,
  `ord` int(11) NOT NULL,
  PRIMARY KEY (`schID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `schedule_special`;
CREATE TABLE `schedule_special` (
  `specID` int(11) NOT NULL AUTO_INCREMENT,
  `desc` longtext NOT NULL,
  `date` date NOT NULL,
  `schID` int(11) NOT NULL,
  PRIMARY KEY (`specID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `schedule_type`;
CREATE TABLE `schedule_type` (
  `schedule_typeID` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  PRIMARY KEY (`schedule_typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `sex`;
CREATE TABLE `sex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `sheetfiles`;
CREATE TABLE `sheetfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `path` varchar(150) NOT NULL,
  `info` longtext,
  `sheet_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sheetfiles_abbdb8c4` (`sheet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4239 ;

INSERT INTO `sheetfiles` (`id`, `name`, `path`, `info`, `sheet_id`, `owner_id`) VALUES
(1, 'admin_portal', 'core/admin/static/portal.html', '', 5, NULL),
(2, 'admin_sheets_list', 'core/admin/list/sheets.html', '', 5, NULL),
(3, 'admin_sheets_edit', 'core/admin/edit/sheets.html', '', 5, NULL),
(4, 'admin_sheet_files_list', 'core/admin/list/sheetfiles.html', '', 5, NULL),
(5, 'admin_sheet_files_edit', 'core/admin/edit/sheetfiles.html', '', 5, NULL),
(6, 'admin_articles_edit', 'core/admin/edit/articles.html', '', 5, NULL),
(7, 'admin_categories_list', 'core/admin/list/categories.html', '', 5, NULL),
(8, 'admin_calendarium_calendar_edit', 'core/admin/edit/calendar.html', '', 5, NULL),
(9, 'admin_calendarium_calendar_list', 'core/admin/list/calendar.html', '', 5, NULL),
(10, 'admin_calendarium_event_edit', 'core/admin/edit/event.html', '', 5, NULL),
(11, 'admin_calendarium_event_list', 'core/admin/list/event.html', '', 5, NULL),
(12, 'admin_calendarium_eventtype_edit', 'core/admin/edit/eventtype.html', '', 5, NULL),
(13, 'admin_calendarium_eventtype_list', 'core/admin/list/eventtype.html', '', 5, NULL),
(14, 'admin_cms', 'cms/admin/admin.html', '', 5, NULL),
(15, 'admin_articles_list', 'core/admin/list/articles.html', '', 5, NULL),
(16, 'admin_categories_edit', 'core/admin/edit/categories.html', '', 5, NULL),
(17, 'admin_galleries_list', 'core/admin/list/galleries.html', '', 5, NULL),
(18, 'admin_galleries_edit', 'core/admin/edit/galleries.html', '', 5, NULL),
(19, 'admin_sites_list', 'core/admin/list/sites.html', '', 5, NULL),
(20, 'admin_sites_edit', 'core/admin/edit/sites.html', '', 5, NULL),
(21, 'admin_images_list', 'core/admin/list/images.html', '', 5, NULL),
(22, 'admin_images_edit', 'core/admin/edit/images.html', '', 5, NULL),
(23, 'admin_list', 'core/admin/list.html', '', 5, NULL),
(24, 'admin_edit', 'core/admin/edit.html', '', 5, NULL),
(25, 'articles_list', 'core/portal/list/article.html', '', 5, NULL),
(26, 'article', 'core/portal/article.html', '', 5, NULL),
(27, 'mainsite', 'core/portal/mainsite_content.html', '', 5, NULL),
(28, 'admin_user_profile_list', 'core/admin/list/userprofiles.html', '', 5, NULL),
(29, 'admin_user_profile_edit', 'core/admin/edit/userprofiles.html', '', 5, NULL),
(30, 'admin_repetitio_courses_list', 'core/admin/list/repetitio_courses.html', '', 5, NULL),
(32, 'admin_repetitio_courses_edit', 'core/admin/edit/repetitio_courses.html', '', 5, NULL),
(33, 'admin_repetitio_tests_edit', 'core/admin/edit/repetitio_tests.html', '', 5, NULL),
(34, 'admin_repetitio_tests_list', 'core/admin/list/repetitio_tests.html', '', 5, NULL),
(35, 'admin_repetitio_answers_list', 'core/admin/list/repetitio_answers.html', '', 5, NULL),
(36, 'admin_repetitio_answers_edit', 'core/admin/edit/repetitio_answers.html', '', 5, NULL),
(37, 'admin_repetitio_questions_edit', 'core/admin/edit/repetitio_questions.html', '', 5, NULL),
(38, 'admin_repetitio_questions_list', 'core/admin/list/repetitio_questions.html', '', 5, NULL),
(39, 'admin_ads_images_list', 'core/admin/list/ads_images.html', '', 5, NULL),
(40, 'admin_ads_images_edit', 'core/admin/edit/ads_images.html', '', 5, NULL),
(41, 'admin_ads_categories_list', 'core/admin/list/ads_categories.html', '', 5, NULL),
(42, 'admin_ads_categories_edit', 'core/admin/edit/ads_categories.html', '', 5, NULL),
(43, 'admin_ads_edit', 'core/admin/edit/ads.html', '', 5, NULL),
(44, 'admin_ads_list', 'core/admin/list/ads.html', '', 5, NULL),
(45, 'admin_wiki_list', 'core/admin/list/wiki.html', '', 5, NULL),
(46, 'admin_wiki_edit', 'core/admin/edit/wiki.html', '', 5, NULL),
(47, 'admin_catalog_categories_list', 'core/admin/list/catalog_categories.html', '', 5, NULL),
(48, 'admin_catalog_categories_edit', 'core/admin/edit/catalog_categories.html', '', 5, NULL),
(49, 'admin_catalog_edit', 'core/admin/edit/catalog.html', '', 5, NULL),
(50, 'admin_catalog_list', 'core/admin/list/catalog.html', '', 5, NULL),
(51, 'admin_menu_items_list', 'core/admin/list/menu_items.html', '', 5, NULL),
(52, 'admin_menu_items_edit', 'core/admin/edit/menu_items.html', '', 5, NULL),
(53, 'admin_menu_items_edit_module_selection', 'core/admin/edit/menu_items_module_selection.html', '', 5, NULL),
(54, 'admin_menu_list', 'core/admin/list/menu.html', '', 5, NULL),
(55, 'admin_menu_edit', 'core/admin/edit/menu.html', '', 5, NULL),
(56, 'admin_modules_edit', 'core/admin/edit/modules.html', '', 5, NULL),
(57, 'admin_modules_list', 'core/admin/list/modules.html', '', 5, NULL),
(58, 'admin_module_positions_list', 'core/admin/list/module_positions.html', '', 5, NULL),
(59, 'admin_module_positions_edit', 'core/admin/edit/module_positions.html', '', 5, NULL),
(60, 'categories_list', 'core/portal/list/article.html', '', 5, NULL),
(61, 'admin_megamenu_edit', 'core/admin/edit/megamenu.html', '', 5, NULL),
(62, 'admin_megamenu_list', 'core/admin/list/megamenu.html', '', 5, NULL),
(63, 'admin_login', 'core/admin/login.html', '', 5, NULL),
(4238, 'admin_module_edit_module_selection', 'core/admin/edit/module_module_selection.html', '', 5, NULL);

DROP TABLE IF EXISTS `sheetfiles_active`;
CREATE TABLE `sheetfiles_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheetfiles_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sheetfiles_id` (`sheetfiles_id`,`site_id`),
  KEY `sheetfiles_active_947805ac` (`sheetfiles_id`),
  KEY `sheetfiles_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

INSERT INTO `sheetfiles_active` (`id`, `sheetfiles_id`, `site_id`) VALUES
(11, 27, 2),
(9, 127, 1),
(10, 227, 3),
(7, 4227, 4),
(1, 4228, 1),
(2, 4228, 2),
(3, 4228, 3),
(4, 4228, 4),
(16, 4229, 1),
(17, 4229, 2),
(18, 4229, 3),
(19, 4229, 4),
(20, 4230, 1),
(21, 4231, 1),
(22, 4232, 1),
(23, 4233, 1),
(24, 4234, 1),
(25, 4235, 1),
(26, 4236, 1),
(27, 4237, 1),
(28, 4237, 2),
(29, 4237, 3),
(30, 4237, 4),
(31, 4238, 1),
(32, 4238, 2),
(33, 4238, 3),
(34, 4238, 4);

DROP TABLE IF EXISTS `sheetlanguages`;
CREATE TABLE `sheetlanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `systemname` varchar(150) NOT NULL,
  `name` longtext NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sheetlanguages_7ab48146` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=229 ;

INSERT INTO `sheetlanguages` (`id`, `date`, `systemname`, `name`, `language_id`) VALUES
(1, '0000-00-00 00:00:00', '__No_articles__', 'Brak artykułów', 1),
(2, '0000-00-00 00:00:00', '__No_article__', 'Brak artykułu', 1),
(3, '0000-00-00 00:00:00', '__adm_No_article__', 'Brak artykułu', 1),
(4, '0000-00-00 00:00:00', '__adm_No_articles__', 'Brak artykułów', 1),
(5, '0000-00-00 00:00:00', '__Categories__', 'Kategorie', 1),
(6, '0000-00-00 00:00:00', '__Articles__', 'Artykuły', 1),
(7, '0000-00-00 00:00:00', '__dummy__', 'Dummy', 1),
(8, '0000-00-00 00:00:00', '__adm_Categories__', 'Kategorie', 1),
(9, '0000-00-00 00:00:00', '__adm_Articles__', 'Artykuły', 1),
(10, '0000-00-00 00:00:00', '__adm_Id__', 'Id', 1),
(11, '0000-00-00 00:00:00', '__adm_Title__', 'Tytuł', 1),
(12, '0000-00-00 00:00:00', '__adm_Active__', 'Aktywny', 1),
(13, '0000-00-00 00:00:00', '__adm_Category__', 'Kategoria', 1),
(14, '0000-00-00 00:00:00', '__adm_Author__', 'Autor', 1),
(15, '0000-00-00 00:00:00', '__adm_Create_date__', 'Data utworzenia', 1),
(16, '0000-00-00 00:00:00', '__adm_Visits__', 'Ilość odsłon', 1),
(17, '0000-00-00 00:00:00', '__adm_Delete__', 'Usuń', 1),
(18, '0000-00-00 00:00:00', '__adm_LP__', 'Lp', 1),
(19, '0000-00-00 00:00:00', '__adm_Activity__', 'Aktywność', 1),
(20, '0000-00-00 00:00:00', '__adm_Filter__', 'Filtr', 1),
(22, '0000-00-00 00:00:00', '__adm_no_Active__', 'Nieaktywny', 1),
(23, '0000-00-00 00:00:00', '__adm_All__', 'Wszystko', 1),
(24, '0000-00-00 00:00:00', '__adm_Galeries__', 'Galerie', 1),
(25, '0000-00-00 00:00:00', '__adm_Calendarium__', 'Kalendarium', 1),
(26, '0000-00-00 00:00:00', '__adm_Classfields__', 'Ogłoszenia', 1),
(27, '0000-00-00 00:00:00', '__adm_Forum__', 'Forum', 1),
(28, '0000-00-00 00:00:00', '__adm_Wiki__', 'Baza wiedzy', 1),
(29, '0000-00-00 00:00:00', '__adm_Catalogs__', 'Katalogi', 1),
(30, '0000-00-00 00:00:00', '__adm_Shop__', 'Sklep', 1),
(31, '0000-00-00 00:00:00', '__adm_Stats__', 'Statystyki', 1),
(32, '0000-00-00 00:00:00', '__adm_Advertisement__', 'Reklamy', 1),
(33, '0000-00-00 00:00:00', '__adm_Mailing__', 'Mailing', 1),
(34, '0000-00-00 00:00:00', '__adm_Users__', 'Użytkownicy', 1),
(35, '0000-00-00 00:00:00', '__adm_Sheets__', 'Szablony', 1),
(36, '0000-00-00 00:00:00', '__adm_Logout__', 'Wyloguj', 1),
(37, '0000-00-00 00:00:00', '__adm_Editarticle__', 'Edycja artykułu', 1),
(38, '0000-00-00 00:00:00', '__adm_Name__', 'Nazwa', 1),
(39, '0000-00-00 00:00:00', '__adm_No_categories__', 'Brak kategorii', 1),
(40, '0000-00-00 00:00:00', '__adm_Category_parents__', 'Kategorie nadrzędne', 1),
(41, '0000-00-00 00:00:00', '__adm_Category_root__', 'Kategoria główna', 1),
(42, '0000-00-00 00:00:00', '__adm_Site__', 'Strona', 1),
(43, '0000-00-00 00:00:00', '__adm_Editcategory__', 'Edycja kategorii', 1),
(44, '0000-00-00 00:00:00', '__adm_Selectlanguage__', 'Wybierz język', 1),
(45, '0000-00-00 00:00:00', '__adm_Calendars__', 'Kalendarze', 1),
(46, '0000-00-00 00:00:00', '__adm_Event_types__', 'Typy wydarzeń', 1),
(47, '0000-00-00 00:00:00', '__adm_Events__', 'Wydarzenia', 1),
(48, '0000-00-00 00:00:00', '__adm_Eventtypes__', 'Typy wydarzeń', 1),
(49, '0000-00-00 00:00:00', '__adm_Add__', 'Dodaj', 1),
(50, '0000-00-00 00:00:00', '__adm_Saveandadd__', 'Zapisz i dodaj', 1),
(51, '0000-00-00 00:00:00', '__adm_Cancel__', 'Anuluj', 1),
(52, '0000-00-00 00:00:00', '__adm_Duplicate__', 'Duplikuj', 1),
(53, '0000-00-00 00:00:00', '__adm_Numberofitems__', 'Ilość obiektów', 1),
(54, '0000-00-00 00:00:00', '__adm_No_translation__', 'Brak tłumaczenia', 1),
(56, '0000-00-00 00:00:00', '__adm_Save__', 'Zapisz', 1),
(57, '2011-07-27 13:15:38', '__adm_Statistics__', 'Statystyki', 1),
(58, '2011-07-27 13:15:52', '__adm_Sites__', 'Strony', 1),
(59, '2011-07-27 13:16:24', '__adm_SheetFiles__', 'Pliki szablonów', 1),
(60, '2011-07-27 13:20:16', '__adm_CMS__', 'CMS', 1),
(61, '2011-07-27 13:20:27', '__adm_Portal__', 'Portal', 1),
(62, '2011-07-27 13:56:29', '__adm_Images__', 'Zdjęcia', 1),
(63, '2011-07-27 13:57:37', '__adm_Selectactivesite__', 'Wybierz aktywną stronę', 1),
(64, '2011-07-27 14:02:36', '__adm_Galleries__', 'Galerie', 1),
(65, '2011-07-27 15:04:42', '__Are_you_sure?__', 'Czy jesteś pewien?', 1),
(66, '2011-07-28 13:37:09', '__adm_Portal_Info__', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mattis elit ut ipsum euismod ut porta libero scelerisque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc id egestas arcu. Pellentesque pharetra aliquet libero. Duis mauris dolor, tristique nec faucibus ut, dictum nec urna. Nulla id lacus id massa gravida viverra et pharetra nulla. Aliquam erat volutpat. Maecenas convallis justo purus, at dignissim ligula. Maecenas facilisis condimentum lectus, a semper magna faucibus vitae. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean vestibulum nisl eget velit sagittis vitae faucibus leo commodo. Nam luctus sagittis molestie. Fusce a arcu leo, quis pellentesque lacus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nNulla facilisi. Ut lacinia, odio sit amet interdum dapibus, augue velit iaculis dolor, non dictum augue lacus quis nibh. Duis tincidunt sem et ante molestie porta. Nam lacinia viverra semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu magna non arcu placerat bibendum. Morbi sit amet tortor metus. Sed at diam at eros lobortis luctus. Ut quis est non massa ultricies fermentum nec quis ipsum. Donec vehicula egestas ante vitae fermentum. Nunc massa ligula, pulvinar condimentum dictum vitae, malesuada nec ligula. Etiam accumsan, odio euismod semper commodo, nibh purus semper erat, ac euismod neque nunc sed odio. Curabitur sit amet dolor nisi, nec accumsan quam.', 1),
(67, '2011-08-16 09:18:34', '__adm_User_Profile__', 'Profil użytkownika', 1),
(68, '2011-08-16 09:18:59', '__adm_Groups__', 'Grupy', 1),
(69, '2011-08-16 09:20:00', '__adm_User_Profiles__', 'Profile użytkowników', 1),
(70, '2011-08-16 09:20:49', '__adm_Email__', 'Email', 1),
(71, '2011-08-16 09:21:34', '__adm_User_Name__', 'Nazwa użytkownika', 1),
(72, '2011-08-16 10:25:34', '__adm_Event_type__', 'Typ wydarzenia', 1),
(73, '2011-08-16 10:25:53', '__am_Event_types__', 'Typy wydarzeń', 1),
(74, '2011-08-16 10:26:10', '__adm_Start_date__', 'Data początkowa', 1),
(75, '2011-08-16 10:26:32', '__adm_End_date__', 'Data końcowa', 1),
(76, '2011-08-16 10:27:23', '__adm_Event__', 'Wydarzenie', 1),
(77, '2011-08-16 12:01:55', '__adm_Repetitio__', 'Repetitio', 1),
(78, '2011-08-16 12:02:11', '__adm_Course__', 'Kurs', 1),
(79, '2011-08-16 12:02:23', '__adm_Courses__', 'Kursy', 1),
(80, '2011-08-16 12:02:35', '__adm_Test__', 'Test', 1),
(81, '2011-08-16 12:02:52', '__adm_Tests__', 'Testy', 1),
(82, '2011-08-16 12:03:04', '__adm_Question__', 'Pytanie', 1),
(83, '2011-08-16 12:03:17', '__adm_Questions__', 'Pytania', 1),
(84, '2011-08-16 12:03:28', '__adm_Answer__', 'Odpowiedź', 1),
(85, '2011-08-16 12:03:41', '__adm_Answers__', 'Odpowiedzi', 1),
(86, '2011-08-16 15:06:59', '__adm_Show_questions__', 'Pokaż pytania', 1),
(87, '2011-08-16 15:21:45', '__adm_Show_tests__', 'Pokaż testy', 1),
(88, '2011-08-16 15:24:50', '__adm_Show_answers__', 'Pokaż odpowiedzi', 1),
(89, '2011-08-17 10:20:27', '__adm_Ads__', 'Ogłoszenia', 1),
(90, '2011-08-17 10:20:40', '__adm_Ad__', 'Ogłoszenie', 1),
(91, '2011-08-17 10:20:54', '__adm_Ads_images__', 'Zdjęcia do ogłoszeń', 1),
(92, '2011-08-17 10:21:18', '__adm_Ads_image__', 'Zdjęcie do ogłoszenia', 1),
(93, '2011-08-17 10:21:37', '__adm_Ads_Categories__', 'Kategorie ogłoszeń', 1),
(94, '2011-08-17 10:21:55', '__adm_Ads_Category__', 'Kategoria ogłoszeń', 1),
(96, '2011-08-17 13:49:38', '__adm_Catalogs_categories__', 'Kategorie katalogów', 1),
(97, '2011-08-17 13:49:54', '__adm_Catalog_categories__', 'Kategorie katalogu', 1),
(98, '2011-08-17 13:50:15', '__adm_Catalogs_category__', 'Kategoria katalogów', 1),
(99, '2011-08-17 13:50:34', '__adm_Catalog_category__', 'Kategoria katalogu', 1),
(101, '2011-08-17 13:51:12', '__adm_Catalog__', 'Katalog', 1),
(102, '2011-08-17 14:01:38', '__adm_Catalog_items__', 'Elementy katalogu', 1),
(103, '2011-08-17 14:01:55', '__adm_Catalog_item__', 'Element katalogu', 1),
(104, '2011-08-18 11:07:00', '__adm_Menu__', 'Menu', 1),
(105, '2011-08-18 11:09:40', '__adm_Menu_item__', 'Pozycja menu', 1),
(106, '2011-08-18 11:09:58', '__adm_Menu_items__', 'Pozycje menu', 1),
(107, '2011-08-18 12:58:23', '__adm_Select_module__', 'Wybierz moduł', 1),
(108, '2011-08-20 22:58:40', '__adm_Change__', 'Zmień', 1),
(109, '2011-08-20 23:14:25', '__adm_Module__', 'Moduł', 1),
(110, '2011-08-20 23:14:38', '__adm_Modules__', 'Moduły', 1),
(111, '2011-08-20 23:14:51', '__adm_Position__', 'Pozycja', 1),
(112, '2011-08-20 23:15:05', '__adm_Positions__', 'Pozycje', 1),
(113, '2011-08-24 08:28:35', '__adm_TopMenu__', 'Menu górne', 1),
(114, '2011-08-27 10:41:08', '__adm_Catalogs_images__', 'Zdjęcia katalogów', 1),
(115, '2011-08-28 11:20:32', '__adm_No_permissions__', 'Brak uprawnień', 1),
(116, '2011-08-29 10:30:39', '__No_articles__', 'No articles', 2),
(117, '2011-08-29 10:30:39', '__No_article__', 'No article', 2),
(118, '2011-08-29 10:30:39', '__adm_No_article__', 'No article', 2),
(119, '2011-08-29 10:30:39', '__adm_No_articles__', 'No articles', 2),
(120, '2011-08-29 10:30:39', '__Categories__', 'Categories', 2),
(121, '2011-08-29 10:30:39', '__Articles__', 'Articles', 2),
(122, '2011-08-29 10:30:39', '__dummy__', 'dummy', 2),
(123, '2011-08-29 10:30:39', '__adm_Categories__', 'Categories', 2),
(124, '2011-08-29 10:30:39', '__adm_Articles__', 'Articles', 2),
(125, '2011-08-29 10:30:39', '__adm_Id__', 'Id', 2),
(126, '2011-08-29 10:30:39', '__adm_Title__', 'Title', 2),
(127, '2011-08-29 10:30:39', '__adm_Active__', 'Active', 2),
(128, '2011-08-29 10:30:39', '__adm_Category__', 'Category', 2),
(129, '2011-08-29 10:30:39', '__adm_Author__', 'Author', 2),
(130, '2011-08-29 10:30:39', '__adm_Create_date__', 'Create date', 2),
(131, '2011-08-29 10:30:39', '__adm_Visits__', 'Visits', 2),
(132, '2011-08-29 10:30:39', '__adm_Delete__', 'Delete', 2),
(133, '2011-08-29 10:30:39', '__adm_LP__', 'LP', 2),
(134, '2011-08-29 10:30:39', '__adm_Activity__', 'Activity', 2),
(135, '2011-08-29 10:30:39', '__adm_Filter__', 'Filter', 2),
(136, '2011-08-29 10:30:39', '__adm_no_Active__', 'no Active', 2),
(137, '2011-08-29 10:30:39', '__adm_All__', 'All', 2),
(138, '2011-08-29 10:30:39', '__adm_Galeries__', 'Galeries', 2),
(139, '2011-08-29 10:30:39', '__adm_Calendarium__', 'Calendarium', 2),
(140, '2011-08-29 10:30:39', '__adm_Classfields__', 'Classfields', 2),
(141, '2011-08-29 10:30:39', '__adm_Forum__', 'Forum', 2),
(142, '2011-08-29 10:30:39', '__adm_Wiki__', 'Wiki', 2),
(143, '2011-08-29 10:30:39', '__adm_Catalogs__', 'Catalogs', 2),
(144, '2011-08-29 10:30:39', '__adm_Shop__', 'Shop', 2),
(145, '2011-08-29 10:30:39', '__adm_Stats__', 'Stats', 2),
(146, '2011-08-29 10:30:39', '__adm_Advertisement__', 'Advertisement', 2),
(147, '2011-08-29 10:30:39', '__adm_Mailing__', 'Mailing', 2),
(148, '2011-08-29 10:30:39', '__adm_Users__', 'Users', 2),
(149, '2011-08-29 10:30:39', '__adm_Sheets__', 'Sheets', 2),
(150, '2011-08-29 10:30:39', '__adm_Logout__', 'Logout', 2),
(151, '2011-08-29 10:30:39', '__adm_Editarticle__', 'Editarticle', 2),
(152, '2011-08-29 10:30:39', '__adm_Name__', 'Name', 2),
(153, '2011-08-29 10:30:39', '__adm_No_categories__', 'No categories', 2),
(154, '2011-08-29 10:30:39', '__adm_Category_parents__', 'Category parents', 2),
(155, '2011-08-29 10:30:39', '__adm_Category_root__', 'Category root', 2),
(156, '2011-08-29 10:30:39', '__adm_Site__', 'Site', 2),
(157, '2011-08-29 10:30:39', '__adm_Editcategory__', 'Editcategory', 2),
(158, '2011-08-29 10:30:39', '__adm_Selectlanguage__', 'Selectlanguage', 2),
(159, '2011-08-29 10:30:39', '__adm_Calendars__', 'Calendars', 2),
(160, '2011-08-29 10:30:39', '__adm_Event_types__', 'Event types', 2),
(161, '2011-08-29 10:30:39', '__adm_Events__', 'Events', 2),
(162, '2011-08-29 10:30:39', '__adm_Eventtypes__', 'Eventtypes', 2),
(163, '2011-08-29 10:30:39', '__adm_Add__', 'Add', 2),
(164, '2011-08-29 10:30:39', '__adm_Saveandadd__', 'Saveandadd', 2),
(165, '2011-08-29 10:30:39', '__adm_Cancel__', 'Cancel', 2),
(166, '2011-08-29 10:30:39', '__adm_Duplicate__', 'Duplicate', 2),
(167, '2011-08-29 10:30:39', '__adm_Numberofitems__', 'Numberofitems', 2),
(168, '2011-08-29 10:30:39', '__adm_No_translation__', 'No translation', 2),
(169, '2011-08-29 10:30:39', '__adm_Save__', 'Save', 2),
(170, '2011-08-29 10:30:39', '__adm_Statistics__', 'Statistics', 2),
(171, '2011-08-29 10:30:39', '__adm_Sites__', 'Sites', 2),
(172, '2011-08-29 10:30:39', '__adm_SheetFiles__', 'SheetFiles', 2),
(173, '2011-08-29 10:30:39', '__adm_CMS__', 'CMS', 2),
(174, '2011-08-29 10:30:39', '__adm_Portal__', 'Portal', 2),
(175, '2011-08-29 10:30:39', '__adm_Images__', 'Images', 2),
(176, '2011-08-29 10:30:39', '__adm_Selectactivesite__', 'Selectactivesite', 2),
(177, '2011-08-29 10:30:39', '__adm_Galleries__', 'Galleries', 2),
(178, '2011-08-29 10:30:39', '__Are_you_sure?__', 'Are you sure?', 2),
(179, '2011-08-29 10:30:39', '__adm_Portal_Info__', 'Portal Info', 2),
(180, '2011-08-29 10:30:39', '__adm_User_Profile__', 'User Profile', 2),
(181, '2011-08-29 10:30:39', '__adm_Groups__', 'Groups', 2),
(182, '2011-08-29 10:30:39', '__adm_User_Profiles__', 'User Profiles', 2),
(183, '2011-08-29 10:30:39', '__adm_Email__', 'Email', 2),
(184, '2011-08-29 10:30:39', '__adm_User_Name__', 'User Name', 2),
(185, '2011-08-29 10:30:39', '__adm_Event_type__', 'Event type', 2),
(186, '2011-08-29 10:30:39', '__am_Event_types__', 'am Event types', 2),
(187, '2011-08-29 10:30:39', '__adm_Start_date__', 'Start date', 2),
(188, '2011-08-29 10:30:39', '__adm_End_date__', 'End date', 2),
(189, '2011-08-29 10:30:39', '__adm_Event__', 'Event', 2),
(190, '2011-08-29 10:30:39', '__adm_Repetitio__', 'Repetitio', 2),
(191, '2011-08-29 10:30:39', '__adm_Course__', 'Course', 2),
(192, '2011-08-29 10:30:39', '__adm_Courses__', 'Courses', 2),
(193, '2011-08-29 10:30:39', '__adm_Test__', 'Test', 2),
(194, '2011-08-29 10:30:39', '__adm_Tests__', 'Tests', 2),
(195, '2011-08-29 10:30:39', '__adm_Question__', 'Question', 2),
(196, '2011-08-29 10:30:39', '__adm_Questions__', 'Questions', 2),
(197, '2011-08-29 10:30:39', '__adm_Answer__', 'Answer', 2),
(198, '2011-08-29 10:30:39', '__adm_Answers__', 'Answers', 2),
(199, '2011-08-29 10:30:39', '__adm_Show_questions__', 'Show questions', 2),
(200, '2011-08-29 10:30:39', '__adm_Show_tests__', 'Show tests', 2),
(201, '2011-08-29 10:30:39', '__adm_Show_answers__', 'Show answers', 2),
(202, '2011-08-29 10:30:39', '__adm_Ads__', 'Ads', 2),
(203, '2011-08-29 10:30:39', '__adm_Ad__', 'Ad', 2),
(204, '2011-08-29 10:30:39', '__adm_Ads_images__', 'Ads images', 2),
(205, '2011-08-29 10:30:39', '__adm_Ads_image__', 'Ads image', 2),
(206, '2011-08-29 10:30:39', '__adm_Ads_Categories__', 'Ads Categories', 2),
(207, '2011-08-29 10:30:39', '__adm_Ads_Category__', 'Ads Category', 2),
(208, '2011-08-29 10:30:39', '__adm_Catalogs_categories__', 'Catalogs categories', 2),
(209, '2011-08-29 10:30:39', '__adm_Catalog_categories__', 'Catalog categories', 2),
(210, '2011-08-29 10:30:39', '__adm_Catalogs_category__', 'Catalogs category', 2),
(211, '2011-08-29 10:30:39', '__adm_Catalog_category__', 'Catalog category', 2),
(212, '2011-08-29 10:30:39', '__adm_Catalog__', 'Catalog', 2),
(213, '2011-08-29 10:30:39', '__adm_Catalog_items__', 'Catalog items', 2),
(214, '2011-08-29 10:30:39', '__adm_Catalog_item__', 'Catalog item', 2),
(215, '2011-08-29 10:30:39', '__adm_Menu__', 'Menu', 2),
(216, '2011-08-29 10:30:39', '__adm_Menu_item__', 'Menu item', 2),
(217, '2011-08-29 10:30:39', '__adm_Menu_items__', 'Menu items', 2),
(218, '2011-08-29 10:30:39', '__adm_Select_module__', 'Select module', 2),
(219, '2011-08-29 10:30:39', '__adm_Change__', 'Change', 2),
(220, '2011-08-29 10:30:39', '__adm_Module__', 'Module', 2),
(221, '2011-08-29 10:30:39', '__adm_Modules__', 'Modules', 2),
(222, '2011-08-29 10:30:39', '__adm_Position__', 'Position', 2),
(223, '2011-08-29 10:30:39', '__adm_Positions__', 'Positions', 2),
(224, '2011-08-29 10:30:39', '__adm_TopMenu__', 'TopMenu', 2),
(225, '2011-08-29 10:30:39', '__adm_Catalogs_images__', 'Catalogs images', 2),
(226, '2011-08-29 10:30:39', '__adm_No_permissions__', 'No permissions', 2),
(227, '2011-08-30 20:57:09', '__adm_Show_items__', 'Pokaż elementy', 1),
(228, '2011-09-06 11:53:42', '__adm_Clients__', 'Klienci', 1);

DROP TABLE IF EXISTS `sheetlanguages_permissions`;
CREATE TABLE `sheetlanguages_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portalsiteconstlanguage_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portalsiteconstlanguage_id` (`portalsiteconstlanguage_id`,`permisiongroup_id`),
  KEY `sheetlanguages_permissions_f1573e83` (`portalsiteconstlanguage_id`),
  KEY `sheetlanguages_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `sheetlanguages_sites`;
CREATE TABLE `sheetlanguages_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portalsiteconstlanguage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portalsiteconstlanguage_id` (`portalsiteconstlanguage_id`,`site_id`),
  KEY `sheetlanguages_sites_f1573e83` (`portalsiteconstlanguage_id`),
  KEY `sheetlanguages_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

INSERT INTO `sheetlanguages_sites` (`id`, `portalsiteconstlanguage_id`, `site_id`) VALUES
(1, 227, 1),
(2, 227, 2),
(3, 227, 3),
(4, 227, 4),
(5, 228, 1),
(6, 228, 2),
(7, 228, 3),
(8, 228, 4);

DROP TABLE IF EXISTS `sheets`;
CREATE TABLE `sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `sheetpath` varchar(150) NOT NULL,
  `info` longtext,
  `owner_id` int(11) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sheets_5d52dd10` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

INSERT INTO `sheets` (`id`, `date`, `name`, `sheetpath`, `info`, `owner_id`, `default`) VALUES
(5, '2011-09-14 08:25:57', 'PortalAdmin', 'portaladmin', '', NULL, 1);

DROP TABLE IF EXISTS `sheets_active`;
CREATE TABLE `sheets_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sheet_id` (`sheet_id`,`site_id`),
  KEY `sheets_active_abbdb8c4` (`sheet_id`),
  KEY `sheets_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

INSERT INTO `sheets_active` (`id`, `sheet_id`, `site_id`) VALUES
(18, 5, 1),
(19, 5, 2),
(20, 5, 3),
(21, 5, 4);

DROP TABLE IF EXISTS `sheets_permissions`;
CREATE TABLE `sheets_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sheet_id` (`sheet_id`,`permisiongroup_id`),
  KEY `sheets_permissions_abbdb8c4` (`sheet_id`),
  KEY `sheets_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `sheets_sites`;
CREATE TABLE `sheets_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sheet_id` (`sheet_id`,`site_id`),
  KEY `sheets_sites_abbdb8c4` (`sheet_id`),
  KEY `sheets_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

INSERT INTO `sheets_sites` (`id`, `sheet_id`, `site_id`) VALUES
(18, 5, 1),
(19, 5, 2),
(20, 5, 3),
(21, 5, 4);

DROP TABLE IF EXISTS `site_portal`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


DROP TABLE IF EXISTS `site_portal_active`;
CREATE TABLE `site_portal_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteportal_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siteportal_id` (`siteportal_id`,`site_id`),
  KEY `site_portal_active_63981e25` (`siteportal_id`),
  KEY `site_portal_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;


DROP TABLE IF EXISTS `site_portal_permissions`;
CREATE TABLE `site_portal_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteportal_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siteportal_id` (`siteportal_id`,`permisiongroup_id`),
  KEY `site_portal_permissions_63981e25` (`siteportal_id`),
  KEY `site_portal_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `site_portal_stat`;
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


DROP TABLE IF EXISTS `site_portal_stat_permissions`;
CREATE TABLE `site_portal_stat_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteportalstat_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siteportalstat_id` (`siteportalstat_id`,`permisiongroup_id`),
  KEY `site_portal_stat_permissions_bc8c4d1f` (`siteportalstat_id`),
  KEY `site_portal_stat_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `systemStructure`;
CREATE TABLE `systemStructure` (
  `idStr` int(11) NOT NULL AUTO_INCREMENT,
  `idOver` int(11) NOT NULL,
  `name` varchar(122) NOT NULL,
  `ZmianaNa` int(11) NOT NULL,
  `orderStr` int(11) NOT NULL,
  `actionID` int(11) NOT NULL,
  `bannersType` varchar(3) NOT NULL,
  `bannersHere` varchar(122) NOT NULL,
  `pollID` int(11) NOT NULL,
  `pollPosition` varchar(122) NOT NULL,
  `hintID` int(11) NOT NULL,
  `hintPosition` varchar(122) NOT NULL,
  `freeAccess` varchar(122) NOT NULL,
  `isEzin` varchar(122) NOT NULL,
  `display` varchar(122) NOT NULL,
  `altSys` int(11) NOT NULL,
  `altName` varchar(50) NOT NULL,
  PRIMARY KEY (`idStr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `taggit_tag`;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `taggit_tag` (`id`, `name`, `slug`) VALUES
(2, 'cat', 'cat');

DROP TABLE IF EXISTS `taggit_taggeditem`;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_3747b463` (`tag_id`),
  KEY `taggit_taggeditem_829e37fd` (`object_id`),
  KEY `taggit_taggeditem_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

INSERT INTO `taggit_taggeditem` (`id`, `tag_id`, `object_id`, `content_type_id`) VALUES
(4, 2, 203, 29);

DROP TABLE IF EXISTS `thumbnail_kvstore`;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wiki`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `wiki_active`;
CREATE TABLE `wiki_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_id` (`wiki_id`,`site_id`),
  KEY `wiki_active_a3b21284` (`wiki_id`),
  KEY `wiki_active_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


DROP TABLE IF EXISTS `wiki_lang`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


DROP TABLE IF EXISTS `wiki_languages`;
CREATE TABLE `wiki_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `wikilanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_id` (`wiki_id`,`wikilanguage_id`),
  KEY `wiki_languages_a3b21284` (`wiki_id`),
  KEY `wiki_languages_526934ea` (`wikilanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


DROP TABLE IF EXISTS `wiki_permissions`;
CREATE TABLE `wiki_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `permisiongroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_id` (`wiki_id`,`permisiongroup_id`),
  KEY `wiki_permissions_a3b21284` (`wiki_id`),
  KEY `wiki_permissions_912eb7a3` (`permisiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `wiki_sites`;
CREATE TABLE `wiki_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_id` (`wiki_id`,`site_id`),
  KEY `wiki_sites_a3b21284` (`wiki_id`),
  KEY `wiki_sites_6223029` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;



ALTER TABLE `ad`
  ADD CONSTRAINT `category_id_refs_id_7a482ffa` FOREIGN KEY (`category_id`) REFERENCES `ad_cat` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_a641c670` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `ads_image_lang`
  ADD CONSTRAINT `language_id_refs_id_421cd526` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `adv`
  ADD CONSTRAINT `group_id_refs_id_c415e7f1` FOREIGN KEY (`group_id`) REFERENCES `adv_groups` (`id`);

ALTER TABLE `adv_active`
  ADD CONSTRAINT `adv_id_refs_id_6d1b8cc3` FOREIGN KEY (`adv_id`) REFERENCES `adv` (`id`),
  ADD CONSTRAINT `site_id_refs_id_b6b60c27` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `adv_clients_active`
  ADD CONSTRAINT `advclient_id_refs_id_462d3d71` FOREIGN KEY (`advclient_id`) REFERENCES `adv_clients` (`id`),
  ADD CONSTRAINT `site_id_refs_id_97cc75a8` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `adv_clients_sites`
  ADD CONSTRAINT `advclient_id_refs_id_31a7295a` FOREIGN KEY (`advclient_id`) REFERENCES `adv_clients` (`id`),
  ADD CONSTRAINT `site_id_refs_id_8f7d78dd` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `adv_groups_active`
  ADD CONSTRAINT `advgroup_id_refs_id_e8799b65` FOREIGN KEY (`advgroup_id`) REFERENCES `adv_groups` (`id`),
  ADD CONSTRAINT `site_id_refs_id_ee194b23` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `adv_groups_sites`
  ADD CONSTRAINT `advgroup_id_refs_id_895694c0` FOREIGN KEY (`advgroup_id`) REFERENCES `adv_groups` (`id`),
  ADD CONSTRAINT `site_id_refs_id_f7499afe` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `adv_menuitem`
  ADD CONSTRAINT `adv_id_refs_id_aba45ea5` FOREIGN KEY (`adv_id`) REFERENCES `adv` (`id`),
  ADD CONSTRAINT `menuitem_id_refs_id_6fd57903` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`);

ALTER TABLE `adv_sites`
  ADD CONSTRAINT `adv_id_refs_id_69778f00` FOREIGN KEY (`adv_id`) REFERENCES `adv` (`id`),
  ADD CONSTRAINT `site_id_refs_id_68e3a39e` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `ad_active`
  ADD CONSTRAINT `ad_id_refs_id_2faacbe1` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d2c9274` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `ad_cat`
  ADD CONSTRAINT `owner_id_refs_id_b3a381d9` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_2c08723d` FOREIGN KEY (`parent_id`) REFERENCES `ad_cat` (`id`);

ALTER TABLE `ad_cat_active`
  ADD CONSTRAINT `adcategory_id_refs_id_70d55ab` FOREIGN KEY (`adcategory_id`) REFERENCES `ad_cat` (`id`),
  ADD CONSTRAINT `site_id_refs_id_92ec78d1` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `ad_cat_lang`
  ADD CONSTRAINT `language_id_refs_id_b0d7340d` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `ad_cat_languages`
  ADD CONSTRAINT `adcategorylanguage_id_refs_id_d3fde58b` FOREIGN KEY (`adcategorylanguage_id`) REFERENCES `ad_cat_lang` (`id`),
  ADD CONSTRAINT `adcategory_id_refs_id_cf4974d9` FOREIGN KEY (`adcategory_id`) REFERENCES `ad_cat` (`id`);

ALTER TABLE `ad_cat_permissions`
  ADD CONSTRAINT `adcategory_id_refs_id_99562c6e` FOREIGN KEY (`adcategory_id`) REFERENCES `ad_cat` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_f0ccc813` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `ad_cat_sites`
  ADD CONSTRAINT `adcategory_id_refs_id_d5d1afb8` FOREIGN KEY (`adcategory_id`) REFERENCES `ad_cat` (`id`),
  ADD CONSTRAINT `site_id_refs_id_99249f06` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `ad_image`
  ADD CONSTRAINT `owner_id_refs_id_72c31b64` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `ad_images`
  ADD CONSTRAINT `adimage_id_refs_id_f8fc9c1d` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`),
  ADD CONSTRAINT `ad_id_refs_id_e6128017` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`);

ALTER TABLE `ad_image_active`
  ADD CONSTRAINT `adimage_id_refs_id_815c9ab9` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`),
  ADD CONSTRAINT `site_id_refs_id_596ad480` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `ad_image_languages`
  ADD CONSTRAINT `adimagelanguage_id_refs_id_d175cccb` FOREIGN KEY (`adimagelanguage_id`) REFERENCES `ads_image_lang` (`id`),
  ADD CONSTRAINT `adimage_id_refs_id_80ba2579` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`);

ALTER TABLE `ad_image_permissions`
  ADD CONSTRAINT `adimage_id_refs_id_1efd6d7c` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_6d135c64` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `ad_image_sites`
  ADD CONSTRAINT `adimage_id_refs_id_47817d96` FOREIGN KEY (`adimage_id`) REFERENCES `ad_image` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d6aa6ba3` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `ad_lang`
  ADD CONSTRAINT `language_id_refs_id_b1feb076` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `ad_languages`
  ADD CONSTRAINT `adlanguage_id_refs_id_5a4655cb` FOREIGN KEY (`adlanguage_id`) REFERENCES `ad_lang` (`id`),
  ADD CONSTRAINT `ad_id_refs_id_b451f03f` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`);

ALTER TABLE `ad_permissions`
  ADD CONSTRAINT `ad_id_refs_id_cc7345b0` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_2a78c104` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `ad_sites`
  ADD CONSTRAINT `ad_id_refs_id_fcd53bfe` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`),
  ADD CONSTRAINT `site_id_refs_id_677fc957` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `articlelanguages`
  ADD CONSTRAINT `language_id_refs_id_fc54b360` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `articles`
  ADD CONSTRAINT `category_id_refs_id_c4ff279c` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `event_id_refs_id_a339f69f` FOREIGN KEY (`event_id`) REFERENCES `calendarevents` (`id`),
  ADD CONSTRAINT `gallery_id_refs_id_f5d15fb` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_57f2d594` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `articles_active`
  ADD CONSTRAINT `article_id_refs_id_118cbc97` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `site_id_refs_id_6a89008` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `articles_languages`
  ADD CONSTRAINT `articlelanguage_id_refs_id_31ce88b7` FOREIGN KEY (`articlelanguage_id`) REFERENCES `articlelanguages` (`id`),
  ADD CONSTRAINT `article_id_refs_id_c2f3e7e9` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);

ALTER TABLE `articles_permissions`
  ADD CONSTRAINT `article_id_refs_id_b463d014` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_8cca0194` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `articles_sites`
  ADD CONSTRAINT `article_id_refs_id_ddddf756` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `site_id_refs_id_be9c23e5` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

ALTER TABLE `auth_message`
  ADD CONSTRAINT `user_id_refs_id_9af0b65a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `calendareventlanguages`
  ADD CONSTRAINT `language_id_refs_id_6203068a` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `calendarevents`
  ADD CONSTRAINT `calendar_id_refs_id_65499d0` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_1e59c056` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `state_id_refs_id_3135fcb4` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `type_id_refs_id_b87b7794` FOREIGN KEY (`type_id`) REFERENCES `calendartypes` (`id`);

ALTER TABLE `calendarevents_active`
  ADD CONSTRAINT `calendarevent_id_refs_id_49baa995` FOREIGN KEY (`calendarevent_id`) REFERENCES `calendarevents` (`id`),
  ADD CONSTRAINT `site_id_refs_id_c4e8dbba` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `calendarevents_languages`
  ADD CONSTRAINT `calendareventlanguage_id_refs_id_14e355` FOREIGN KEY (`calendareventlanguage_id`) REFERENCES `calendareventlanguages` (`id`),
  ADD CONSTRAINT `calendarevent_id_refs_id_832e2563` FOREIGN KEY (`calendarevent_id`) REFERENCES `calendarevents` (`id`);

ALTER TABLE `calendarevents_permissions`
  ADD CONSTRAINT `calendarevent_id_refs_id_e50a7f78` FOREIGN KEY (`calendarevent_id`) REFERENCES `calendarevents` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_ab4e7b6` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `calendarevents_sites`
  ADD CONSTRAINT `calendarevent_id_refs_id_1b050722` FOREIGN KEY (`calendarevent_id`) REFERENCES `calendarevents` (`id`),
  ADD CONSTRAINT `site_id_refs_id_ddbd44f9` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `calendareventtypelanguages`
  ADD CONSTRAINT `language_id_refs_id_f4a6a2b2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `calendarlanguages`
  ADD CONSTRAINT `language_id_refs_id_96bade93` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `calendars`
  ADD CONSTRAINT `owner_id_refs_id_959569b` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `calendars_active`
  ADD CONSTRAINT `calendar_id_refs_id_4fedcd1f` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `site_id_refs_id_232b7baf` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `calendars_languages`
  ADD CONSTRAINT `calendarlanguage_id_refs_id_51658bab` FOREIGN KEY (`calendarlanguage_id`) REFERENCES `calendarlanguages` (`id`),
  ADD CONSTRAINT `calendar_id_refs_id_e5ec7aa3` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`);

ALTER TABLE `calendars_permissions`
  ADD CONSTRAINT `calendar_id_refs_id_7a056b6a` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_408f8065` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `calendars_sites`
  ADD CONSTRAINT `calendar_id_refs_id_45474908` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `site_id_refs_id_de0d12a` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `calendartypes`
  ADD CONSTRAINT `owner_id_refs_id_c2b5550f` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `calendartypes_active`
  ADD CONSTRAINT `calendareventtype_id_refs_id_93c9464f` FOREIGN KEY (`calendareventtype_id`) REFERENCES `calendartypes` (`id`),
  ADD CONSTRAINT `site_id_refs_id_83ecdb45` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `calendartypes_languages`
  ADD CONSTRAINT `calendareventtypelanguage_id_refs_id_ae3e87ba` FOREIGN KEY (`calendareventtypelanguage_id`) REFERENCES `calendareventtypelanguages` (`id`),
  ADD CONSTRAINT `calendareventtype_id_refs_id_54855073` FOREIGN KEY (`calendareventtype_id`) REFERENCES `calendartypes` (`id`);

ALTER TABLE `calendartypes_permissions`
  ADD CONSTRAINT `calendareventtype_id_refs_id_350959a6` FOREIGN KEY (`calendareventtype_id`) REFERENCES `calendartypes` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_41d54119` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `calendartypes_sites`
  ADD CONSTRAINT `calendareventtype_id_refs_id_9454bff8` FOREIGN KEY (`calendareventtype_id`) REFERENCES `calendartypes` (`id`),
  ADD CONSTRAINT `site_id_refs_id_4ad633c2` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `catalogs_cat`
  ADD CONSTRAINT `owner_id_refs_id_2cfbce88` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_9ceba5a5` FOREIGN KEY (`parent_id`) REFERENCES `catalogs_cat` (`id`);

ALTER TABLE `catalogs_cat_active`
  ADD CONSTRAINT `catalogcategory_id_refs_id_2c4551d9` FOREIGN KEY (`catalogcategory_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `site_id_refs_id_366ab804` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `catalogs_cat_lang`
  ADD CONSTRAINT `language_id_refs_id_29bca8c2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `catalogs_cat_languages`
  ADD CONSTRAINT `catalogcategorylanguage_id_refs_id_a8500be5` FOREIGN KEY (`catalogcategorylanguage_id`) REFERENCES `catalogs_cat_lang` (`id`),
  ADD CONSTRAINT `catalogcategory_id_refs_id_f1cbfdf1` FOREIGN KEY (`catalogcategory_id`) REFERENCES `catalogs_cat` (`id`);

ALTER TABLE `catalogs_cat_permissions`
  ADD CONSTRAINT `catalogcategory_id_refs_id_a96f0b14` FOREIGN KEY (`catalogcategory_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_8d370448` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `catalogs_cat_sites`
  ADD CONSTRAINT `catalogcategory_id_refs_id_e0f020f2` FOREIGN KEY (`catalogcategory_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `site_id_refs_id_fddb50d1` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `catalogs_image`
  ADD CONSTRAINT `owner_id_refs_id_860773db` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `catalogs_image_active`
  ADD CONSTRAINT `catalogimage_id_refs_id_eafc36a5` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`),
  ADD CONSTRAINT `site_id_refs_id_5feb4083` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `catalogs_image_lang`
  ADD CONSTRAINT `language_id_refs_id_b7ede39f` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `catalogs_image_languages`
  ADD CONSTRAINT `adimagelanguage_id_refs_id_dc738212` FOREIGN KEY (`adimagelanguage_id`) REFERENCES `ads_image_lang` (`id`),
  ADD CONSTRAINT `catalogimage_id_refs_id_167b1289` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`);

ALTER TABLE `catalogs_image_permissions`
  ADD CONSTRAINT `catalogimage_id_refs_id_cfa9dbba` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_e5862c4f` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `catalogs_image_sites`
  ADD CONSTRAINT `catalogimage_id_refs_id_f17aa1a8` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`),
  ADD CONSTRAINT `site_id_refs_id_e7024206` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `catalogs_item`
  ADD CONSTRAINT `category_id_refs_id_7575ba87` FOREIGN KEY (`category_id`) REFERENCES `catalogs_cat` (`id`),
  ADD CONSTRAINT `country_id_refs_id_c5b07bc9` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_24d72fb2` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `state_id_refs_id_cbbd32a8` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

ALTER TABLE `catalogs_item_active`
  ADD CONSTRAINT `catalogitem_id_refs_id_7d1f09f7` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`),
  ADD CONSTRAINT `site_id_refs_id_403a660e` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `catalogs_item_images`
  ADD CONSTRAINT `catalogimage_id_refs_id_3dfc32c` FOREIGN KEY (`catalogimage_id`) REFERENCES `catalogs_image` (`id`),
  ADD CONSTRAINT `catalogitem_id_refs_id_48815c5b` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`);

ALTER TABLE `catalogs_item_languages`
  ADD CONSTRAINT `catalogitemlanguage_id_refs_id_fb0576c0` FOREIGN KEY (`catalogitemlanguage_id`) REFERENCES `catalogs_lang` (`id`),
  ADD CONSTRAINT `catalogitem_id_refs_id_ff47fcff` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`);

ALTER TABLE `catalogs_item_permissions`
  ADD CONSTRAINT `catalogitem_id_refs_id_1eec8364` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_73c61232` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `catalogs_item_sites`
  ADD CONSTRAINT `catalogitem_id_refs_id_25742226` FOREIGN KEY (`catalogitem_id`) REFERENCES `catalogs_item` (`id`),
  ADD CONSTRAINT `site_id_refs_id_1cf044d5` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `catalogs_lang`
  ADD CONSTRAINT `language_id_refs_id_8a5613fb` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `categories`
  ADD CONSTRAINT `owner_id_refs_id_e55436a7` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_d28b8177` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

ALTER TABLE `categories_active`
  ADD CONSTRAINT `category_id_refs_id_5dbfafdf` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d0b8cf79` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `categories_galleries`
  ADD CONSTRAINT `category_id_refs_id_a82b5522` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `gallery_id_refs_id_6ba249c3` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`);

ALTER TABLE `categories_languages`
  ADD CONSTRAINT `categorylanguage_id_refs_id_496e19b` FOREIGN KEY (`categorylanguage_id`) REFERENCES `categorylanguages` (`id`),
  ADD CONSTRAINT `category_id_refs_id_2ba099df` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

ALTER TABLE `categories_permissions`
  ADD CONSTRAINT `category_id_refs_id_a7bbb3f2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_577a734d` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `categories_sites`
  ADD CONSTRAINT `category_id_refs_id_b4b3754` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `site_id_refs_id_f6d46154` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `categorylanguages`
  ADD CONSTRAINT `language_id_refs_id_2a8937d3` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `galleries`
  ADD CONSTRAINT `owner_id_refs_id_1a45148a` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_d21fef05` FOREIGN KEY (`parent_id`) REFERENCES `galleries` (`id`);

ALTER TABLE `gallerieslanguages`
  ADD CONSTRAINT `language_id_refs_id_d0049166` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `galleries_active`
  ADD CONSTRAINT `gallery_id_refs_id_5c62bbd7` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `site_id_refs_id_db9f19f6` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `galleries_languages`
  ADD CONSTRAINT `gallerylanguage_id_refs_id_31a3ac83` FOREIGN KEY (`gallerylanguage_id`) REFERENCES `gallerieslanguages` (`id`),
  ADD CONSTRAINT `gallery_id_refs_id_c5591a6f` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`);

ALTER TABLE `galleries_permissions`
  ADD CONSTRAINT `gallery_id_refs_id_e5eb186c` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_38b15f52` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `galleries_sites`
  ADD CONSTRAINT `gallery_id_refs_id_1c841486` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `site_id_refs_id_8f1838d3` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `imagelanguages`
  ADD CONSTRAINT `language_id_refs_id_c994f155` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `images`
  ADD CONSTRAINT `gallery_id_refs_id_396a15a6` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_292119af` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `images_active`
  ADD CONSTRAINT `image_id_refs_id_ec5a35eb` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `site_id_refs_id_ae207037` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `images_languages`
  ADD CONSTRAINT `imagelanguage_id_refs_id_7aa4a585` FOREIGN KEY (`imagelanguage_id`) REFERENCES `imagelanguages` (`id`),
  ADD CONSTRAINT `image_id_refs_id_aca91289` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`);

ALTER TABLE `images_permissions`
  ADD CONSTRAINT `image_id_refs_id_a731fcd2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_48f453db` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `images_sites`
  ADD CONSTRAINT `image_id_refs_id_27f9e3b8` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `site_id_refs_id_57a154de` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `languages_active`
  ADD CONSTRAINT `language_id_refs_id_2b5c4887` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `site_id_refs_id_8553b3eb` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `languages_sites`
  ADD CONSTRAINT `language_id_refs_id_ee9f1030` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `site_id_refs_id_336ec342` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `megamenu`
  ADD CONSTRAINT `category_id_refs_id_d6c0494a` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `menu_id_refs_id_91e2d43b` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_b7b56dba` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_1c16c6e` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`),
  ADD CONSTRAINT `rootmenu_id_refs_id_91e2d43b` FOREIGN KEY (`rootmenu_id`) REFERENCES `menu` (`id`);

ALTER TABLE `megamenu_active`
  ADD CONSTRAINT `megamenu_id_refs_id_30b6b3bd` FOREIGN KEY (`megamenu_id`) REFERENCES `megamenu` (`id`),
  ADD CONSTRAINT `site_id_refs_id_a63d68e6` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `megamenu_lang`
  ADD CONSTRAINT `language_id_refs_id_6a49f184` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `megamenu_languages`
  ADD CONSTRAINT `megamenulanguage_id_refs_id_219fca07` FOREIGN KEY (`megamenulanguage_id`) REFERENCES `megamenu_lang` (`id`),
  ADD CONSTRAINT `megamenu_id_refs_id_a540fd4b` FOREIGN KEY (`megamenu_id`) REFERENCES `megamenu` (`id`);

ALTER TABLE `megamenu_permissions`
  ADD CONSTRAINT `megamenu_id_refs_id_e957e504` FOREIGN KEY (`megamenu_id`) REFERENCES `megamenu` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_1a2974ba` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `megamenu_sites`
  ADD CONSTRAINT `megamenu_id_refs_id_81210fc6` FOREIGN KEY (`megamenu_id`) REFERENCES `megamenu` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d31fe563` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `menu`
  ADD CONSTRAINT `owner_id_refs_id_8fe44a04` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_2ff559ed` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_c5896330` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `menuitem`
  ADD CONSTRAINT `menu_id_refs_id_1e6573e0` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_85d9bf71` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_93836093` FOREIGN KEY (`parent_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_d86a01c3` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `menuitem_active`
  ADD CONSTRAINT `menuitem_id_refs_id_77d9ac57` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `site_id_refs_id_58c67bbd` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `menuitem_lang`
  ADD CONSTRAINT `language_id_refs_id_4fd5574f` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `menuitem_languages`
  ADD CONSTRAINT `menuitemlanguage_id_refs_id_98a21747` FOREIGN KEY (`menuitemlanguage_id`) REFERENCES `menuitem_lang` (`id`),
  ADD CONSTRAINT `menuitem_id_refs_id_e4a82099` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`);

ALTER TABLE `menuitem_permissions`
  ADD CONSTRAINT `menuitem_id_refs_id_3e77aff6` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_7b980849` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `menuitem_sites`
  ADD CONSTRAINT `menuitem_id_refs_id_c4d8f3e8` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `site_id_refs_id_55875ede` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `menu_active`
  ADD CONSTRAINT `menu_id_refs_id_b7154e19` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `site_id_refs_id_bdf76700` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `menu_permissions`
  ADD CONSTRAINT `menu_id_refs_id_9a710374` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_a49a6d74` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `menu_sites`
  ADD CONSTRAINT `menu_id_refs_id_608f4d9e` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `site_id_refs_id_7d5cdf7b` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_adv_option`
  ADD CONSTRAINT `advgroup_id_refs_id_17b8be30` FOREIGN KEY (`advgroup_id`) REFERENCES `adv_groups` (`id`),
  ADD CONSTRAINT `adv_id_refs_id_60258c44` FOREIGN KEY (`adv_id`) REFERENCES `adv` (`id`),
  ADD CONSTRAINT `module_id_refs_id_9f6d65e8` FOREIGN KEY (`module_id`) REFERENCES `module_type` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_ea9a60a2` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_adv_option_sites`
  ADD CONSTRAINT `advmoduleoption_id_refs_id_64683cda` FOREIGN KEY (`advmoduleoption_id`) REFERENCES `module_adv_option` (`id`),
  ADD CONSTRAINT `site_id_refs_id_925e0091` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_article_list_option`
  ADD CONSTRAINT `category_id_refs_id_afaf25e9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `menuitem_id_refs_id_d15289db` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_373ffb25` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_article_option`
  ADD CONSTRAINT `article_id_refs_id_4a0d21e8` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `menuitem_id_refs_id_845e1a33` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_5654e2a3` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_htmlbox_option`
  ADD CONSTRAINT `module_id_refs_id_fa878041` FOREIGN KEY (`module_id`) REFERENCES `module_type` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_9872b383` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_htmlbox_option_sites`
  ADD CONSTRAINT `htmlboxmoduleoption_id_refs_id_12e66068` FOREIGN KEY (`htmlboxmoduleoption_id`) REFERENCES `module_htmlbox_option` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d126699e` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_link_option`
  ADD CONSTRAINT `menuitem_id_refs_id_62d5904` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `module_id_refs_id_fc2200c8` FOREIGN KEY (`module_id`) REFERENCES `module_type` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_d4cf7cae` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_link_option_sites`
  ADD CONSTRAINT `linkmoduleoption_id_refs_id_e0f9fd9e` FOREIGN KEY (`linkmoduleoption_id`) REFERENCES `module_link_option` (`id`),
  ADD CONSTRAINT `site_id_refs_id_13ef6d37` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_menu_option`
  ADD CONSTRAINT `menu_id_refs_id_61eca25c` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_1a6f2f79` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_newsflash_c_option`
  ADD CONSTRAINT `category_id_refs_id_2c9c8c56` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `module_id_refs_id_1f4e1984` FOREIGN KEY (`module_id`) REFERENCES `module_type` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_ddc9cdf2` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_newsflash_c_option_sites`
  ADD CONSTRAINT `newsflashcolumnmoduleoption_id_refs_id_45927eda` FOREIGN KEY (`newsflashcolumnmoduleoption_id`) REFERENCES `module_newsflash_c_option` (`id`),
  ADD CONSTRAINT `site_id_refs_id_5e45345d` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_position`
  ADD CONSTRAINT `owner_id_refs_id_a68935cc` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `module_position_active`
  ADD CONSTRAINT `moduleposition_id_refs_id_689549bf` FOREIGN KEY (`moduleposition_id`) REFERENCES `module_position` (`id`),
  ADD CONSTRAINT `site_id_refs_id_a7402c20` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_position_permissions`
  ADD CONSTRAINT `moduleposition_id_refs_id_b6c618e8` FOREIGN KEY (`moduleposition_id`) REFERENCES `module_position` (`id`),
  ADD CONSTRAINT `permisiongroup_id_refs_id_1a47ee90` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`);

ALTER TABLE `module_position_sites`
  ADD CONSTRAINT `moduleposition_id_refs_id_f3748c5e` FOREIGN KEY (`moduleposition_id`) REFERENCES `module_position` (`id`),
  ADD CONSTRAINT `site_id_refs_id_c2833c3d` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_registered_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_54124c6d` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `registeredmodule_id_refs_id_7df1ceea` FOREIGN KEY (`registeredmodule_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_registered_sites`
  ADD CONSTRAINT `registeredmodule_id_refs_id_c5c1f594` FOREIGN KEY (`registeredmodule_id`) REFERENCES `module_registered` (`id`),
  ADD CONSTRAINT `site_id_refs_id_79209df0` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_sitemap_option`
  ADD CONSTRAINT `menu_id_refs_id_a69303dd` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `module_id_refs_id_ca7b1ab6` FOREIGN KEY (`module_id`) REFERENCES `module_type` (`id`),
  ADD CONSTRAINT `registered_module_id_refs_id_150aadc0` FOREIGN KEY (`registered_module_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_sitemap_option_sites`
  ADD CONSTRAINT `sitemapmoduleoption_id_refs_id_c0236bb6` FOREIGN KEY (`sitemapmoduleoption_id`) REFERENCES `module_sitemap_option` (`id`),
  ADD CONSTRAINT `site_id_refs_id_de33bf53` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_type_active`
  ADD CONSTRAINT `moduletype_id_refs_id_2d05261d` FOREIGN KEY (`moduletype_id`) REFERENCES `module_type` (`id`),
  ADD CONSTRAINT `site_id_refs_id_79dd94dd` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_type_sites`
  ADD CONSTRAINT `moduletype_id_refs_id_7b7b1e30` FOREIGN KEY (`moduletype_id`) REFERENCES `module_type` (`id`),
  ADD CONSTRAINT `site_id_refs_id_6958e94a` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `module_visibility`
  ADD CONSTRAINT `model_id_refs_id_519a5e75` FOREIGN KEY (`model_id`) REFERENCES `module_registered` (`id`);

ALTER TABLE `module_visibility_menuitem`
  ADD CONSTRAINT `menuitem_id_refs_id_8b148c19` FOREIGN KEY (`menuitem_id`) REFERENCES `menuitem` (`id`),
  ADD CONSTRAINT `modulevisibility_id_refs_id_73af97d5` FOREIGN KEY (`modulevisibility_id`) REFERENCES `module_visibility` (`id`);

ALTER TABLE `module_visibility_sites`
  ADD CONSTRAINT `modulevisibility_id_refs_id_1b67e784` FOREIGN KEY (`modulevisibility_id`) REFERENCES `module_visibility` (`id`),
  ADD CONSTRAINT `site_id_refs_id_19386aac` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `profiles_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_bda9a079` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `userprofile_id_refs_id_391ded56` FOREIGN KEY (`userprofile_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `profiles_sites`
  ADD CONSTRAINT `site_id_refs_id_1eb5f9d4` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  ADD CONSTRAINT `userprofile_id_refs_id_1c504d5c` FOREIGN KEY (`userprofile_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `profile_data`
  ADD CONSTRAINT `country_id_refs_id_a96ef35c` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `profile_id_refs_id_b37e1f` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `sex_id_refs_id_776a0b5c` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`id`),
  ADD CONSTRAINT `state_id_refs_id_9fce2f9d` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

ALTER TABLE `repetitio_answers`
  ADD CONSTRAINT `question_id_refs_id_22080e77` FOREIGN KEY (`question_id`) REFERENCES `repetitio_questions` (`id`);

ALTER TABLE `repetitio_answers_languages`
  ADD CONSTRAINT `repetitioanswerlanguage_id_refs_id_d7850f31` FOREIGN KEY (`repetitioanswerlanguage_id`) REFERENCES `rep_answer_lang` (`id`),
  ADD CONSTRAINT `repetitioanswer_id_refs_id_a8715abd` FOREIGN KEY (`repetitioanswer_id`) REFERENCES `repetitio_answers` (`id`);

ALTER TABLE `repetitio_answers_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_71070d69` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `repetitioanswer_id_refs_id_239a10d6` FOREIGN KEY (`repetitioanswer_id`) REFERENCES `repetitio_answers` (`id`);

ALTER TABLE `repetitio_answers_sites`
  ADD CONSTRAINT `repetitioanswer_id_refs_id_7436e7b0` FOREIGN KEY (`repetitioanswer_id`) REFERENCES `repetitio_answers` (`id`),
  ADD CONSTRAINT `site_id_refs_id_25a63bca` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `repetitio_course`
  ADD CONSTRAINT `owner_id_refs_id_a5def3fe` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `repetitio_courseusers`
  ADD CONSTRAINT `course_id_refs_id_15d254a2` FOREIGN KEY (`course_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `user_id_refs_id_44ac5e6d` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `repetitio_courseusers_sites`
  ADD CONSTRAINT `repetitiocourseuser_id_refs_id_cb1926c0` FOREIGN KEY (`repetitiocourseuser_id`) REFERENCES `repetitio_courseusers` (`id`),
  ADD CONSTRAINT `site_id_refs_id_d25a5eca` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `repetitio_course_active`
  ADD CONSTRAINT `repetitiocourse_id_refs_id_4115b125` FOREIGN KEY (`repetitiocourse_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `site_id_refs_id_b220446e` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `repetitio_course_languages`
  ADD CONSTRAINT `repetitiocourselanguage_id_refs_id_54c5370b` FOREIGN KEY (`repetitiocourselanguage_id`) REFERENCES `rep_course_lang` (`id`),
  ADD CONSTRAINT `repetitiocourse_id_refs_id_7f5dd695` FOREIGN KEY (`repetitiocourse_id`) REFERENCES `repetitio_course` (`id`);

ALTER TABLE `repetitio_course_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_93d8a6a6` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `repetitiocourse_id_refs_id_ccb16894` FOREIGN KEY (`repetitiocourse_id`) REFERENCES `repetitio_course` (`id`);

ALTER TABLE `repetitio_course_sites`
  ADD CONSTRAINT `repetitiocourse_id_refs_id_506ec10a` FOREIGN KEY (`repetitiocourse_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `site_id_refs_id_aa5ebe57` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `repetitio_questions`
  ADD CONSTRAINT `owner_id_refs_id_5ce77645` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `test_id_refs_id_60853fc1` FOREIGN KEY (`test_id`) REFERENCES `repetitio_tests` (`id`);

ALTER TABLE `repetitio_questions_active`
  ADD CONSTRAINT `repetitioquestion_id_refs_id_984c9623` FOREIGN KEY (`repetitioquestion_id`) REFERENCES `repetitio_questions` (`id`),
  ADD CONSTRAINT `site_id_refs_id_b31d006b` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `repetitio_questions_languages`
  ADD CONSTRAINT `repetitioquestionlanguage_id_refs_id_1eb16943` FOREIGN KEY (`repetitioquestionlanguage_id`) REFERENCES `rep_question_lang` (`id`),
  ADD CONSTRAINT `repetitioquestion_id_refs_id_d7dcdf4d` FOREIGN KEY (`repetitioquestion_id`) REFERENCES `repetitio_questions` (`id`);

ALTER TABLE `repetitio_questions_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_8e873121` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `repetitioquestion_id_refs_id_4f697cf6` FOREIGN KEY (`repetitioquestion_id`) REFERENCES `repetitio_questions` (`id`);

ALTER TABLE `repetitio_questions_sites`
  ADD CONSTRAINT `repetitioquestion_id_refs_id_ac63a50` FOREIGN KEY (`repetitioquestion_id`) REFERENCES `repetitio_questions` (`id`),
  ADD CONSTRAINT `site_id_refs_id_3aa4edd2` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `repetitio_tests`
  ADD CONSTRAINT `course_id_refs_id_baaa2dea` FOREIGN KEY (`course_id`) REFERENCES `repetitio_course` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_c3f8ba1f` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `repetitio_tests_active`
  ADD CONSTRAINT `repetitiotest_id_refs_id_690201a3` FOREIGN KEY (`repetitiotest_id`) REFERENCES `repetitio_tests` (`id`),
  ADD CONSTRAINT `site_id_refs_id_3ac50a61` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `repetitio_tests_languages`
  ADD CONSTRAINT `repetitiotestlanguage_id_refs_id_308e9d75` FOREIGN KEY (`repetitiotestlanguage_id`) REFERENCES `rep_test_lang` (`id`),
  ADD CONSTRAINT `repetitiotest_id_refs_id_be682555` FOREIGN KEY (`repetitiotest_id`) REFERENCES `repetitio_tests` (`id`);

ALTER TABLE `repetitio_tests_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_e78a42bd` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `repetitiotest_id_refs_id_bd2921a6` FOREIGN KEY (`repetitiotest_id`) REFERENCES `repetitio_tests` (`id`);

ALTER TABLE `repetitio_tests_sites`
  ADD CONSTRAINT `repetitiotest_id_refs_id_1f824a58` FOREIGN KEY (`repetitiotest_id`) REFERENCES `repetitio_tests` (`id`),
  ADD CONSTRAINT `site_id_refs_id_b3424d22` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `repetitio_useranswers`
  ADD CONSTRAINT `answer_id_refs_id_9b517f80` FOREIGN KEY (`answer_id`) REFERENCES `repetitio_answers` (`id`),
  ADD CONSTRAINT `question_id_refs_id_e465affc` FOREIGN KEY (`question_id`) REFERENCES `repetitio_questions` (`id`),
  ADD CONSTRAINT `test_id_refs_id_31056650` FOREIGN KEY (`test_id`) REFERENCES `repetitio_tests` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dbb6eec2` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `repetitio_useranswers_sites`
  ADD CONSTRAINT `repetitiotestanswer_id_refs_id_6db0aefa` FOREIGN KEY (`repetitiotestanswer_id`) REFERENCES `repetitio_useranswers` (`id`),
  ADD CONSTRAINT `site_id_refs_id_37021bbb` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `rep_answer_lang`
  ADD CONSTRAINT `language_id_refs_id_ff11d6ed` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `rep_course_lang`
  ADD CONSTRAINT `language_id_refs_id_a1105936` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `rep_question_lang`
  ADD CONSTRAINT `language_id_refs_id_cfbc1955` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `rep_test_lang`
  ADD CONSTRAINT `language_id_refs_id_39b84fc7` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `sheetfiles`
  ADD CONSTRAINT `sheet_id_refs_id_dfa10195` FOREIGN KEY (`sheet_id`) REFERENCES `sheets` (`id`);

ALTER TABLE `sheetfiles_active`
  ADD CONSTRAINT `sheetfiles_id_refs_id_deef8a25` FOREIGN KEY (`sheetfiles_id`) REFERENCES `sheetfiles` (`id`),
  ADD CONSTRAINT `site_id_refs_id_9269365b` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `sheetlanguages`
  ADD CONSTRAINT `language_id_refs_id_13e38c25` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `sheetlanguages_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_2620ebfb` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `portalsiteconstlanguage_id_refs_id_a35bad42` FOREIGN KEY (`portalsiteconstlanguage_id`) REFERENCES `sheetlanguages` (`id`);

ALTER TABLE `sheetlanguages_sites`
  ADD CONSTRAINT `portalsiteconstlanguage_id_refs_id_4c8b95b8` FOREIGN KEY (`portalsiteconstlanguage_id`) REFERENCES `sheetlanguages` (`id`),
  ADD CONSTRAINT `site_id_refs_id_2e111f72` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `sheets`
  ADD CONSTRAINT `owner_id_refs_id_c38971cf` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`);

ALTER TABLE `sheets_active`
  ADD CONSTRAINT `sheet_id_refs_id_13de87d1` FOREIGN KEY (`sheet_id`) REFERENCES `sheets` (`id`),
  ADD CONSTRAINT `site_id_refs_id_4d1f0791` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `sheets_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_56d8fd85` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `sheet_id_refs_id_4094cde` FOREIGN KEY (`sheet_id`) REFERENCES `sheets` (`id`);

ALTER TABLE `sheets_sites`
  ADD CONSTRAINT `sheet_id_refs_id_3d5718e4` FOREIGN KEY (`sheet_id`) REFERENCES `sheets` (`id`),
  ADD CONSTRAINT `site_id_refs_id_4ea848dc` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `site_portal`
  ADD CONSTRAINT `owner_id_refs_id_c422c3f0` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `site_id_refs_id_78054638` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `site_portal_active`
  ADD CONSTRAINT `siteportal_id_refs_id_5c137a59` FOREIGN KEY (`siteportal_id`) REFERENCES `site_portal` (`id`),
  ADD CONSTRAINT `site_id_refs_id_be0aa76c` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `site_portal_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_5d8d1844` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `siteportal_id_refs_id_9dcb3d88` FOREIGN KEY (`siteportal_id`) REFERENCES `site_portal` (`id`);

ALTER TABLE `site_portal_stat`
  ADD CONSTRAINT `owner_id_refs_id_99c34bae` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `site_id_refs_id_b2d7806a` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

ALTER TABLE `site_portal_stat_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_2aff856` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `siteportalstat_id_refs_id_f24e506c` FOREIGN KEY (`siteportalstat_id`) REFERENCES `site_portal_stat` (`id`);

ALTER TABLE `taggit_taggeditem`
  ADD CONSTRAINT `content_type_id_refs_id_5a2b7711` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `tag_id_refs_id_c87e3f85` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`);

ALTER TABLE `wiki`
  ADD CONSTRAINT `owner_id_refs_id_cb2251d7` FOREIGN KEY (`owner_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_5713793d` FOREIGN KEY (`parent_id`) REFERENCES `wiki` (`id`);

ALTER TABLE `wiki_active`
  ADD CONSTRAINT `site_id_refs_id_8eb253c3` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  ADD CONSTRAINT `wiki_id_refs_id_c00e8741` FOREIGN KEY (`wiki_id`) REFERENCES `wiki` (`id`);

ALTER TABLE `wiki_lang`
  ADD CONSTRAINT `language_id_refs_id_246ed0f1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `wiki_languages`
  ADD CONSTRAINT `wikilanguage_id_refs_id_1ab7e709` FOREIGN KEY (`wikilanguage_id`) REFERENCES `wiki_lang` (`id`),
  ADD CONSTRAINT `wiki_id_refs_id_6558939f` FOREIGN KEY (`wiki_id`) REFERENCES `wiki` (`id`);

ALTER TABLE `wiki_permissions`
  ADD CONSTRAINT `permisiongroup_id_refs_id_e9a0e5cf` FOREIGN KEY (`permisiongroup_id`) REFERENCES `permission_groups` (`id`),
  ADD CONSTRAINT `wiki_id_refs_id_dcd8f6c6` FOREIGN KEY (`wiki_id`) REFERENCES `wiki` (`id`);

ALTER TABLE `wiki_sites`
  ADD CONSTRAINT `site_id_refs_id_471baf82` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  ADD CONSTRAINT `wiki_id_refs_id_48119700` FOREIGN KEY (`wiki_id`) REFERENCES `wiki` (`id`);
SET FOREIGN_KEY_CHECKS=1;
