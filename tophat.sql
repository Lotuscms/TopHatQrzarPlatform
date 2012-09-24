-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tophat
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1-log

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
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_keys` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(64) NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
INSERT INTO `api_keys` VALUES (1,'73640de25b7d656733ce2f808a330f18cfc26385c2003a3674b57cab555aa1b2',2,1),(2,'cbaf9028078b22030f2ad0a23086f0dc3486af295dd0e82447431ee051ca4e4c',1,6),(3,'013de496f8deac4400b4a2163787ba7f84264a2a6444841e5895c468767b3773',1,7),(4,'904262d63dc98d171e8f6675ab6e5845af2c41a77eaea7e2288edb96214cc1bb',1,8),(126,'72920521da75750641c95d26b38789b59c014014420b1e6e0b9a74bc5ef5cf94',1,130),(125,'b390e162d33696dec8746caa6df68baa9f51aea47f8ef62e7e244448bac184d3',1,129);
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL,
  `creator` mediumint(8) unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `creator` (`creator`),
  FULLTEXT KEY `name_ft` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Testing Assasin',3,'2012-06-05 12:12:30','2012-09-19 11:53:51','2012-09-26 15:30:00'),(2,'Testing QRZar',1,'2012-06-05 12:12:30','2012-09-30 13:33:22','2012-09-30 14:00:00'),(3,'CS2015 Assassin',2,'2012-06-05 12:12:30','2012-08-21 18:02:34','2012-08-21 18:02:53'),(4,'CS2014 Assassin',1,'2012-06-05 12:12:30','2012-08-21 18:02:34','2012-08-21 18:02:53'),(5,'RAG Week',3,'2012-06-05 12:12:30','2012-08-21 18:02:34','2012-08-21 18:02:53'),(6,'Gee Golly',4,'2012-08-28 14:37:59','2012-08-28 14:37:59','2012-08-28 14:38:25'),(7,'Joe Bush League Tournament',1,'2012-08-30 15:47:39','2012-09-19 11:53:51','2012-09-30 13:33:22');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_perms`
--

DROP TABLE IF EXISTS `group_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_perms` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(5) unsigned NOT NULL,
  `perm_id` mediumint(8) unsigned NOT NULL,
  `value` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `perm_id` (`perm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_perms`
--

LOCK TABLES `group_perms` WRITE;
/*!40000 ALTER TABLE `group_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Standard');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kills`
--

DROP TABLE IF EXISTS `kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `killer_player_id` mediumint(8) NOT NULL,
  `victim_player_id` mediumint(8) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `verified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `killer_user_id` (`killer_player_id`),
  KEY `victim_usr_id` (`victim_player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kills`
--

LOCK TABLES `kills` WRITE;
/*!40000 ALTER TABLE `kills` DISABLE KEYS */;
INSERT INTO `kills` VALUES (1,1,2,'2012-05-22 16:09:02',1),(2,1,5,'2012-05-22 16:09:29',0),(3,1,5,'2012-05-22 16:09:34',1),(4,2,5,'2012-05-22 16:09:40',1),(5,1,2,'2012-05-22 16:09:48',1),(6,2,5,'2012-05-22 16:09:56',0),(7,2,1,'2012-05-22 16:10:05',1),(8,3,4,'2012-05-22 16:10:20',1),(9,3,6,'2012-05-22 16:10:23',1),(10,6,3,'2012-05-22 16:10:31',1),(11,3,4,'2012-05-22 16:10:47',0),(12,4,3,'2012-05-22 16:10:57',1),(13,1,9,'2012-09-09 21:49:52',0);
/*!40000 ALTER TABLE `kills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perms`
--

DROP TABLE IF EXISTS `perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perms` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `key` char(25) NOT NULL,
  `name` char(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perms`
--

LOCK TABLES `perms` WRITE;
/*!40000 ALTER TABLE `perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `team_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `lat` float(19,15) DEFAULT NULL,
  `lon` float(19,15) DEFAULT NULL,
  `score` smallint(5) DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qrcode` char(6) DEFAULT NULL,
  `alive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `game_id` (`team_id`),
  KEY `user_id` (`user_id`),
  KEY `lat` (`lat`),
  KEY `lon` (`lon`),
  KEY `qrcode` (`qrcode`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'specialk [1]',1,1,53.372535705566406,-6.304271221160889,6401,'2012-09-18 14:53:51','WAhrQJ',1),(2,'arboroia',1,2,53.386619567871094,-6.302257061004639,3500,'2012-09-18 14:53:51','PldkJH',1),(3,'specialk [IRL]',3,1,53.389171600341800,-6.201787948608398,100,'2012-09-18 14:53:51','YBhnt4',1),(4,'arboroia is god',3,2,53.309642791748050,-6.205484867095947,2300,'2012-09-18 14:53:51','33KFmG',1),(5,'tester',1,3,53.304344177246094,-6.350378990173340,2800,'2012-09-18 14:54:00','o1wJiY',1),(6,'tester',3,3,53.341426849365234,-6.338756084442139,1700,'2012-09-18 14:53:51','yPeTmc',1),(7,'Meme',1,4,53.367763519287110,-6.345958232879639,7700,'2012-09-19 12:01:25','1qHPFr',1),(8,'MagicMan',2,1,53.388198852539060,-6.291835784912109,4500,'2012-09-18 14:53:51','HESIjN',1),(9,'MagicMan',4,3,53.311340332031250,-6.324621200561523,4500,'2012-09-20 18:33:50','RCcEKo',0),(10,'MagicMan',7,1,53.390754699707030,-6.225914955139160,4500,'2012-09-18 14:53:51','j4K6ya',1),(11,'Goose',2,2,53.368438720703125,-6.284029006958008,4500,'2012-09-18 14:53:51','fdk2Dn',1),(12,'Goose',10,2,53.368560791015625,-6.345715999603271,4500,'2012-09-18 14:53:51','fdR2Dn',1),(13,'Goose',9,2,53.386135101318360,-6.304810047149658,3100,'2012-09-18 14:53:51','G3R2Dn',1),(14,'Black Beanz',8,5,53.323642730712890,-6.315215110778809,3100,'2012-09-18 14:53:51','R3R2Dn',1),(16,'Player MAN!',4,4,53.358482360839844,-6.339962005615234,6250,'2012-09-20 18:33:29','R45454',1),(18,'Banana',4,131,53.323642730712890,-6.424099922180176,3210,'2012-09-19 12:07:07','R74920',1);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `game_id` mediumint(8) unsigned NOT NULL,
  `reference_code` char(1) NOT NULL,
  `respawn_code` varchar(6) NOT NULL DEFAULT 'RESPAW',
  `color` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Blue Team',1,'B','RESPAW','blue'),(2,'Blue Team',2,'B','RESPAW','blue'),(3,'Blue Team',3,'B','RESPAW','blue'),(4,'Red Team',1,'R','RESPAW','red'),(5,'Yellow Team',2,'Y','RESPAW','yellow'),(6,'Green Team',3,'G','RESPAW','green'),(7,'Green Team',4,'G','RESPAW','green'),(8,'Green Team',5,'G','RESPAW','green'),(9,'Blue Team',5,'B','RESPAW','blue'),(10,'Blue Team',6,'B','RESPAW','blue'),(11,'Yellow Team',6,'Y','RESPAW','yellow'),(13,'Red Team',4,'R','RESPAW','red');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `photo` char(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` char(69) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `registered` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Kevin Baker','354d7eff555998e420c54226cb4dc494','banana@tophat.ie','PBKDF2$sha256$100$H7HJ+6gw7qKTZl2j$YYdfGhsybIYSnfbkLVfzEwICWscLKMMh\n','2012-06-05 10:52:57',1),(2,'Kevin Bluett','hfdkjfhakj55998e420c54226cb4dc49','kevin@tophat.ie',NULL,'2012-06-05 10:52:57',1),(3,'Test Subject 1','4aa499b089dff5d89ba44c5281ac883c','ts1@tophat.ie',NULL,'2012-06-05 10:52:57',1),(4,'Testing Subject 2','357843259b856611ebf03f17dfee2d77','ts2@tophat.ie',NULL,'2012-06-05 10:52:57',1),(5,'Bean Stuffie','7adebc519fe505566b07805b50bd3b33','kevinbaker@tophat.ie',NULL,'2012-08-28 14:44:18',1),(6,'Anonymous',NULL,NULL,NULL,'2012-08-29 17:45:40',0),(7,'Anonymous',NULL,NULL,NULL,'2012-08-29 17:45:40',0),(8,'Anonymous',NULL,NULL,NULL,'2012-08-29 17:54:53',0),(131,'Banana',NULL,'banana2@tophat.ie',NULL,'2012-09-19 12:04:34',1),(130,'Anonymous',NULL,NULL,NULL,'2012-09-13 14:20:19',0),(129,'Anonymous',NULL,NULL,NULL,'2012-09-13 14:20:19',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-24 14:11:17
