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
-- Table structure for table `watchdog`
--

DROP TABLE IF EXISTS `watchdog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique watchdog event ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who triggered the event.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'Type of log message, for example "user" or "page not found."',
  `message` longtext NOT NULL COMMENT 'Text of log message to be passed into the t() function.',
  `variables` longblob NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)',
  `link` varchar(255) DEFAULT '' COMMENT 'Link to view the result of the event.',
  `location` text NOT NULL COMMENT 'URL of the origin of the event.',
  `referer` text COMMENT 'URL of referring page.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Hostname of the user who triggered the event.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp of when event occurred.',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `severity` (`severity`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Table that contains logs of all system events.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchdog`
--

LOCK TABLES `watchdog` WRITE;
/*!40000 ALTER TABLE `watchdog` DISABLE KEYS */;
INSERT INTO `watchdog` VALUES (1,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:5:\"dblog\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491608),(2,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:5:\"dblog\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491608),(3,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"field_ui\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491608),(4,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"field_ui\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491608),(5,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"file\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491609),(6,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"file\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491609),(7,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:7:\"options\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491609),(8,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:7:\"options\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491609),(9,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"taxonomy\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491609),(10,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"taxonomy\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491609),(11,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"help\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491609),(12,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"help\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491609),(13,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:5:\"image\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491610),(14,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:5:\"image\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491610),(15,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"list\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491610),(16,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"list\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491610),(17,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"menu\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491610),(18,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"menu\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491611),(19,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:6:\"number\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491612),(20,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:6:\"number\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491612),(21,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:7:\"overlay\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491612),(22,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:7:\"overlay\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491612),(23,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"path\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491612),(24,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"path\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491612),(25,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:3:\"rdf\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491613),(26,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:3:\"rdf\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491613),(27,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:6:\"search\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491613),(28,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:6:\"search\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491613),(29,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"shortcut\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491614),(30,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"shortcut\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491614),(31,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:7:\"toolbar\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491614),(32,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:7:\"toolbar\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491614),(33,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"standard\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491616),(34,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"standard\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=do','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491616),(35,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:15:\"Publish comment\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(36,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:17:\"Unpublish comment\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(37,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:12:\"Save comment\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(38,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:15:\"Publish content\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(39,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:17:\"Unpublish content\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(40,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:19:\"Make content sticky\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(41,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:21:\"Make content unsticky\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(42,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:29:\"Promote content to front page\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(43,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:30:\"Remove content from front page\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(44,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:12:\"Save content\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(45,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:30:\"Ban IP address of current user\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(46,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:18:\"Block current user\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en&id=1&op=finished','http://localhost/Invoicely/install.php?profile=standard&locale=en&op=start&id=1','127.0.0.1',1374491618),(47,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:6:\"update\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en','http://localhost/Invoicely/install.php?profile=standard&locale=en','127.0.0.1',1374491643),(48,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:6:\"update\";}',6,'','http://localhost/Invoicely/install.php?profile=standard&locale=en','http://localhost/Invoicely/install.php?profile=standard&locale=en','127.0.0.1',1374491643),(49,1,'user','Session opened for %name.','a:1:{s:5:\"%name\";s:8:\"geusebio\";}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en','http://localhost/Invoicely/install.php?profile=standard&locale=en','127.0.0.1',1374491643),(50,0,'cron','Cron run completed.','a:0:{}',5,'','http://localhost/Invoicely/install.php?profile=standard&locale=en','http://localhost/Invoicely/install.php?profile=standard&locale=en','127.0.0.1',1374491647);
/*!40000 ALTER TABLE `watchdog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-22 12:16:03