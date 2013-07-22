CREATE DATABASE  IF NOT EXISTS `invoicely` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `invoicely`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: invoicely
-- ------------------------------------------------------
-- Server version	5.5.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` longblob NOT NULL COMMENT 'The value of the variable.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Named variable/value pairs created by Drupal core or any...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO `variable` VALUES ('admin_theme','s:5:\"seven\";'),('clean_url','s:1:\"1\";'),('comment_page','i:0;'),('cron_key','s:43:\"9lFfnjwwrecPjwjo0BcrKWHgZd48QwTdndNAKWaXQJA\";'),('cron_last','i:1374491642;'),('css_js_query_string','s:6:\"mqc4je\";'),('date_default_timezone','s:13:\"Europe/London\";'),('drupal_private_key','s:43:\"3ASSwcF0D-wsaawLPRYbVSSz4-bElFB-YuCcCvsNrCY\";'),('file_temporary_path','s:11:\"c:/wamp/tmp\";'),('filter_fallback_format','s:10:\"plain_text\";'),('install_profile','s:8:\"standard\";'),('install_task','s:4:\"done\";'),('install_time','i:1374491642;'),('menu_expanded','a:0:{}'),('menu_masks','a:34:{i:0;i:501;i:1;i:493;i:2;i:250;i:3;i:247;i:4;i:246;i:5;i:245;i:6;i:125;i:7;i:123;i:8;i:122;i:9;i:121;i:10;i:117;i:11;i:63;i:12;i:62;i:13;i:61;i:14;i:60;i:15;i:59;i:16;i:58;i:17;i:44;i:18;i:31;i:19;i:30;i:20;i:29;i:21;i:28;i:22;i:24;i:23;i:21;i:24;i:15;i:25;i:14;i:26;i:13;i:27;i:11;i:28;i:7;i:29;i:6;i:30;i:5;i:31;i:3;i:32;i:2;i:33;i:1;}'),('node_admin_theme','s:1:\"1\";'),('node_options_page','a:1:{i:0;s:6:\"status\";}'),('node_submitted_page','b:0;'),('path_alias_whitelist','a:0:{}'),('site_default_country','s:2:\"GB\";'),('site_mail','s:18:\"matthew@baggett.me\";'),('site_name','s:9:\"Invoicely\";'),('theme_default','s:6:\"bartik\";'),('update_last_check','i:1374491645;'),('update_notify_emails','a:1:{i:0;s:18:\"matthew@baggett.me\";}'),('user_admin_role','s:1:\"3\";'),('user_pictures','s:1:\"1\";'),('user_picture_dimensions','s:9:\"1024x1024\";'),('user_picture_file_size','s:3:\"800\";'),('user_picture_style','s:9:\"thumbnail\";'),('user_register','i:2;');
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-22 12:16:05
