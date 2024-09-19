# ************************************************************
# Sequel Ace SQL dump
# Version 20067
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: erlangga_0
# Generation Time: 2024-07-09 02:45:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bolt_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bolt_categories`;

CREATE TABLE `bolt_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table bolt_collections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bolt_collections`;

CREATE TABLE `bolt_collections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table bolt_field_responses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bolt_field_responses`;

CREATE TABLE `bolt_field_responses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) unsigned NOT NULL,
  `field_id` bigint(20) unsigned NOT NULL,
  `response_id` bigint(20) unsigned NOT NULL,
  `response` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bolt_field_responses_form_id_foreign` (`form_id`),
  KEY `bolt_field_responses_field_id_foreign` (`field_id`),
  KEY `bolt_field_responses_response_id_foreign` (`response_id`),
  CONSTRAINT `bolt_field_responses_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `bolt_fields` (`id`),
  CONSTRAINT `bolt_field_responses_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `bolt_forms` (`id`),
  CONSTRAINT `bolt_field_responses_response_id_foreign` FOREIGN KEY (`response_id`) REFERENCES `bolt_responses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table bolt_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bolt_fields`;

CREATE TABLE `bolt_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` bigint(20) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bolt_fields_section_id_foreign` (`section_id`),
  CONSTRAINT `bolt_fields_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `bolt_sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `bolt_fields` WRITE;
/*!40000 ALTER TABLE `bolt_fields` DISABLE KEYS */;

INSERT INTO `bolt_fields` (`id`, `section_id`, `name`, `description`, `type`, `ordering`, `options`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'{\"id\":\"Nama\"}',NULL,'\\LaraZeus\\Bolt\\Fields\\Classes\\TextInput',1,'{\"visibility\":{\"active\":false,\"fieldID\":null,\"values\":null},\"htmlId\":\"jNlxuit8\",\"hint\":{\"text\":null,\"icon\":null,\"color\":null,\"icon-tooltip\":null},\"is_required\":true,\"column_span_full\":false,\"dateType\":\"string\",\"minValue\":null,\"maxValue\":null,\"suffix\":null,\"suffix-icon\":null,\"suffix-icon-color\":null,\"prefix\":null,\"prefix-icon\":null,\"prefix-icon-color\":null}','2024-07-08 19:16:25','2024-07-08 19:21:10',NULL),
	(2,1,'{\"id\":\"Email\"}',NULL,'\\LaraZeus\\Bolt\\Fields\\Classes\\TextInput',2,'{\"visibility\":{\"active\":false,\"fieldID\":null,\"values\":null},\"htmlId\":\"QTtt5X\",\"hint\":{\"text\":null,\"icon\":null,\"color\":null,\"icon-tooltip\":null},\"is_required\":true,\"column_span_full\":false,\"dateType\":\"email\",\"minValue\":null,\"maxValue\":null,\"suffix\":null,\"suffix-icon\":null,\"suffix-icon-color\":null,\"prefix\":null,\"prefix-icon\":null,\"prefix-icon-color\":null}','2024-07-08 19:16:25','2024-07-08 19:21:10',NULL),
	(3,1,'{\"id\":\"Pesan\"}',NULL,'\\LaraZeus\\Bolt\\Fields\\Classes\\Textarea',3,'{\"visibility\":{\"active\":false,\"fieldID\":null,\"values\":null},\"htmlId\":\"lUd2Wk\",\"hint\":{\"text\":null,\"icon\":null,\"color\":null,\"icon-tooltip\":null},\"is_required\":false,\"column_span_full\":false,\"rows\":null,\"cols\":null,\"minLength\":null,\"maxLength\":null}','2024-07-08 19:16:25','2024-07-08 19:16:25',NULL);

/*!40000 ALTER TABLE `bolt_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table bolt_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bolt_forms`;

CREATE TABLE `bolt_forms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `options` longtext COLLATE utf8mb4_unicode_ci,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `bolt_forms_user_id_foreign` (`user_id`),
  KEY `bolt_forms_category_id_foreign` (`category_id`),
  CONSTRAINT `bolt_forms_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `bolt_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bolt_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `bolt_forms` WRITE;
/*!40000 ALTER TABLE `bolt_forms` DISABLE KEYS */;

INSERT INTO `bolt_forms` (`id`, `user_id`, `category_id`, `name`, `description`, `slug`, `ordering`, `is_active`, `details`, `options`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`, `extensions`)
VALUES
	(1,1,NULL,'{\"id\":\"Contact Us\"}','{\"id\":null}','contact-us',1,1,'{\"id\":null}','{\"confirmation-message\":null,\"require-login\":false,\"show-as\":\"page\",\"emails-notification\":null}',NULL,NULL,'2024-07-08 19:16:25','2024-07-08 19:21:10',NULL,NULL);

/*!40000 ALTER TABLE `bolt_forms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table bolt_responses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bolt_responses`;

CREATE TABLE `bolt_responses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NEW',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `extension_item_id` int(11) DEFAULT NULL,
  `grades` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bolt_responses_form_id_foreign` (`form_id`),
  KEY `bolt_responses_user_id_foreign` (`user_id`),
  CONSTRAINT `bolt_responses_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `bolt_forms` (`id`),
  CONSTRAINT `bolt_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table bolt_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bolt_sections`;

CREATE TABLE `bolt_sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `columns` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aside` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `compact` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `bolt_sections_form_id_foreign` (`form_id`),
  CONSTRAINT `bolt_sections_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `bolt_forms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `bolt_sections` WRITE;
/*!40000 ALTER TABLE `bolt_sections` DISABLE KEYS */;

INSERT INTO `bolt_sections` (`id`, `form_id`, `name`, `ordering`, `columns`, `description`, `icon`, `aside`, `created_at`, `updated_at`, `deleted_at`, `compact`, `options`)
VALUES
	(1,1,'{\"id\":\"Contact Us\"}',1,1,NULL,NULL,0,'2024-07-08 19:16:25','2024-07-08 19:16:25',NULL,0,'{\"visibility\":{\"active\":0,\"fieldID\":null,\"values\":null}}');

/*!40000 ALTER TABLE `bolt_sections` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
