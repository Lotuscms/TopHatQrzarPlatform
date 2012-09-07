-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tophat
-- ------------------------------------------------------
-- Server version 5.5.24-0ubuntu0.12.04.1-log

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
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
INSERT INTO `api_keys` VALUES (1,'73640de25b7d656733ce2f808a330f18cfc26385c2003a3674b57cab555aa1b2',1,1),(2,'cbaf9028078b22030f2ad0a23086f0dc3486af295dd0e82447431ee051ca4e4c',1,6),(3,'013de496f8deac4400b4a2163787ba7f84264a2a6444841e5895c468767b3773',1,7),(4,'904262d63dc98d171e8f6675ab6e5845af2c41a77eaea7e2288edb96214cc1bb',1,8),(5,'0c80028edeb9ed743afb6d69aaee8d563c4b0bd3f3605300734229a67c06d8a1',1,9),(6,'a5280b8756c218e8eec08440fccc8382ed465e1e138206a18e986dc8a014dc7e',1,10),(7,'692606be3bd0092454e9768b2cad16a35589148354927743865feaacb0653cd7',1,11),(8,'f25645344073e437b01c8aac16c7733b762513c45b4926e7a9751e37631127df',1,12),(9,'c6d824f9ac6de18a79e03dffa8b6cdc86852ef3b620c0de220685065db6df6d0',1,13),(10,'ed466312fdf0bf7de863e01781b5ef1d2c1d3b68b636994ccb0183e9ca4d775a',1,14),(11,'0dde7664159ea6a4f9dfa7b299d80dbf1ecf431c74f8b686d6602cfa5150619e',1,15),(12,'eb16bdda6122408771968e0599176c2182b9e6ff0d2c7e1f389cfd65317b01d7',1,16),(13,'18975291e7a188228c0c94e9a2aa8aa30f8bd27319d32ae4b96e7b9263b5e5d6',1,17),(14,'eaa16056f1bab75543a3be23e6f8fbbab33938ae96fd3f0ec0ad664e41ad4c0c',1,18),(15,'380e7ef359e3f5fe3add203fc348f7c3d9e0f87e75ce91abf10475b4f771ee66',1,19),(16,'749d877fbaaad64812ec17cf012fa77996dea86206e69293bc1a45a605969f40',1,20),(17,'14875d9d733e7d7907f50d19f66c77da73fa0cc0f62a6cfcaee6d5a8bdf83def',1,21),(18,'29a4a2bb7e66501be807f74185c7807a64c4a0d947fcf4a782537316a2e0eef4',1,22),(19,'d3f39aa4c595dd202197cf69791729ab4862b6ba21d0f0b4c6d6decc7722673f',1,23),(20,'e6b794bb9ddb268a325893809941ad0c7a7943411a3f978f9350c8ea6157d90c',1,24),(21,'c2b7b819dbc2e14e7e4d86800f363dd9d4f5495a690d373e4642251d90068c97',1,25),(22,'248bbbd272e7c864269a1ddb51e4c97363e48b9511e3a6e7590dcfd6068d35ae',1,26),(23,'187419c27e48522f3e29932498fc65f6ac57f2750f9e08281faf7350834ce53c',1,27),(24,'f4c30756d4cdfe9b3bef16d3070823c1577e3f5b7fe952106fd1b774ab9ca9dc',1,28),(25,'57c816405ab2a5b25f6fb8887e81a1e0edf419e4900728590a2c79fadc2f3a10',1,29),(26,'90bfd4b4a64103a7be94d2c55f70b99df70fd6b45a22b101a7abb94325bd417a',1,30),(27,'4ded0204f6aefdb30b26f0a6593392a33615141bc439c193ec46cfd9bf293994',1,31),(28,'37344c621a5ae4656351758a6145f99139668d1a78ec101add504476ae422a1b',1,32),(29,'04a35da8cad6ee8e9697cc23d150469791f2954417fb3d211fa5d3c4cc158de0',1,33),(30,'1cb9fbf25198b8f4757566c697afe5ec0e8e970173e42f4dd835f87fd1df7c8b',1,34),(31,'207e0cc84c45ec9fa7a5ac5700df8345ae26346b377e3955c0078257a9a6fb24',1,35),(32,'231300814c5c9d0490f54ba6da465bdd9c6a00a3f8d3a3b9a3a13a2f665127e5',1,36),(33,'238639e19c373db571036e930212ed6b9dab4769ea845b5416765bc9e931e87f',1,37),(34,'2e62a8de4b9ba627b2bbd614d07dda5f3a4b8590d12af5db2174635295007714',1,38),(35,'610b21a61a868cb233bbc70a0f9cf7b712d38741b50fe7c488dadedf6c83b7e9',1,39),(36,'4ccff5b4f80cff898c4e6e6511f24b39a5b7d75371764af2bdaf20a3211898e9',1,40),(37,'f21ff92c56dd9a45a9709fd5b23de384c2002a8d98e279c59dae5465f2e23f1e',1,41),(38,'009bcf12f385d15f3928011d733c025e4ab51126b58b71449ea1e454bc8e54e1',1,42),(39,'f98aa368e02a03644cbaa386d93859baec7dd134ada7383aed8b82ecdbd5d25c',1,43),(40,'1a823431e49f655c5245881a17c304cc330a4daebdfaae0ead4178a0de89bc01',1,44),(41,'58e1dc2bff01f2751bfb227b4ebb33faaa3c49518496a6c36815fce72f86b70b',1,45),(42,'d653ba6da70e9b7cab54b3e285e676efca4a05345f91bc936f872c3c156499aa',1,46),(43,'110e8860729f6fc40e36ac46616d38a5f3528650757ddf226c7a7735b3af5df0',1,47),(44,'53a0a3eb9249454a5d87a745750a5729994462bc5bd321968774a9ab56536a7a',1,48),(45,'ff35c4dffff290bbecc2eeb6210905b82d1a68357cc82b3dbda4db92ba11bdbd',1,49),(46,'4f3508b6fc259addbac40c5b4b551dd3945ed320ad13c70f06391ed575b0330a',1,50),(47,'9395619023ecb030d08e7d36cf6636f87ca2b184247c88d8c6e702d97edafb9b',1,51),(48,'9f77ae6c57ed79d03d87bda203c018d75a7150c455f21fb15d227fc156f5b42c',1,52),(49,'c7cd7c889d64f73d269b5451941c6e9606d352850a7c1852da91e1dd4233d24b',1,53),(50,'86a7f87c928e24fa44fe54a163f8afa3de3d29ab2a705c7dec6d7a0915fc2530',1,54),(51,'0d4ea9edfeb7b60e411d987053ee9a88602aa7289322ef1271c2af2395a69ac2',1,55),(52,'b6bc74b53e570d9c68827e10bcd3a1eb758d536e4bf10a46d71e1f5d4e4eac3d',1,56),(53,'becc3195465b05f9368f0547a60ac840c991bc4b8c337f681921aeb621fcc545',1,57),(54,'82f8e170d7cd5bf24f8cd18d1fcc625577e30972238060aa2f61b42b3116e90e',1,58),(55,'700337d22562e2e8f287f40f0008e2eaaea4ccd53d84f3ec78665ed9ce7686e3',1,59),(56,'2247bdcfc50c11f6de54d854ed86fb45451d1815b31cdec8475bd6963ecca528',1,60),(57,'bd283f8d54490ad77f4a2b7f0f12c285218ce21a33f7ea24a622d0f70f3018ce',1,61),(58,'0280512ee38bb5f755ce45e0a70eb79c3d8741080c72aec0d62cc82d1f679d88',1,62),(59,'bea5aec6905d8cf471566836d397018ae19375fb3b1cffe02667728da5bba47c',1,63),(60,'3fd9312646341bef64e97552bdde5f6e276005a88d4a5b670d53140254e21389',1,64),(61,'3ff3bbe047aeb1197863d1f62fbbf144ed78049cfa3f2604f045bc61cc6cd77b',1,65),(62,'1eb773fbecc7f6121b096ba2d1932a337587bfc52b3472a69af388dfb1abf98b',1,66),(63,'d58497ed1bf52be353a602996c9f3ea7adc9d7d0b203a997bbf62fac6d58fb4e',1,67),(64,'2294cb0016558dafb7e6e7b7a6119149fd7dde8d0e056d941ec82c58e42a5cb2',1,68),(65,'25f7c4ce666b0f07b91e8cbea785c06588c51428a3bca775fc1850626761ef87',1,69),(66,'6f14be1864228ba6a9317fc73aee888862ccddb5faad8f33860b42720ab62221',1,70),(67,'136bee78fc5372fec68fa7a6292c674252c09fefa212f2a3eb6de0f76ced3f60',1,71),(68,'d84f2c82a2db124b2072fe3d0f420ac3377f270b9ab35c00218bd17f27bb9459',1,72),(69,'8779eb6239fcc8c147919c71222df545ede0cb03d931b0367856725d584588c4',1,73),(70,'0da36918d713bacda038948f6a9f02cb6a66ff5d1f9af0d9b1a532cf0768cf5a',1,74),(71,'75d404f5433137eab0ac2099b9490247e36ae1e6f04db72d0ee1f47311f16628',1,75),(72,'9cdce1b97f8c5868c55173e502ae1b97c7929adfc5ee3311608d6745283e7824',1,76),(73,'d8aa0e11bebc129b7a1cdf6775e5715690da2e2fd67c5183e280c021bc325cfe',1,77),(74,'6317747efd3eab9bf88675e1b9e8ca10d28e832637af1726039d37111752c889',1,78),(75,'e9e0d1288ee46c51602352febc3fb98bfac816f1625f0e8e58cebb7ddf07503d',1,79),(76,'cc4f1ab2bb6b13ad6311ed480e8e78cb84ecd10b10804592f00ecc93bf059ad8',1,80),(77,'71e0c1f28ac591a58dfecb2d56423e2fe7203302f31d0840d90fc291c233e457',1,81),(78,'87d9c7ec5906e3a6f6beed8162df5004c5d43bc0a0824cb2e9165ab2fada2374',1,82),(79,'826780be180d8657f55e886bb929ce04d9c4fd154de0af6dffba7746e220acec',1,83),(80,'d1fb18b759b4c257c4103a89c10ede0cbe3d963397c15ea171f214692daf75d7',1,84),(81,'6d6a97828edee42cef640d054b4cdbbb4b7a730da1ee47e63f0733fb73ddd852',1,85),(82,'3760dc65b80dcbf8d033f93fb684f7c950f826d65e11e99ffb819712aa30af97',1,86),(83,'0a11d7d86ea6594ea1443684c69b091c74d8776e59524c7d870f3f822ec571f1',1,87),(84,'5ddb80d994fe75423acce918596d4b98162551e7b4593a5d76c1d05fa2c1564b',1,88),(85,'6a7b431eead13de2f9fea9e5860ab8e96dd21ba833e8b65ccc09a3c1072e1670',1,89),(86,'ac1a461a93cd24b8eaa9f0ea113cf04e2c67316649e6504506942f9f68e3595a',1,90),(87,'2dcfa0c6473824a00bac49a4d133201d892cf97164e7c3b15458beca9b1e4c49',1,91),(88,'26e412046516a88e39663489a1893dcccbd9922a9a4f936fa2fb98005c8e62e5',1,92),(89,'bfcbd52e40adafe2ca4172cef302962df18e6b32a64e5f8f17b1a480dc55d6ee',1,93),(90,'753d6a86e647cd270052c5e7461fc781131a8dd9f129100ea1ddae6857b98149',1,94),(91,'37d824766221a54f23136c27f81b8fcad9b9b43e5df5be4b59b6af71528fc528',1,95),(92,'fa04c2144319403c5e55cff120908dd43973a5967f2821f58a85c1907be71cd5',1,96),(93,'5293da0f2a471c236b12537e22d2fc2c90c8cfd9577c930fecca1cd769b2a2ef',1,97),(94,'5a26e2a6d5a735797b8565e8b2bc86441bbc7228da9efa91994fba8a88261cb8',1,98),(95,'29542e1bd980b93b81d77fac7da4deeb9446af43a57b230b56d2a3e06de3e43e',1,99),(96,'bb8f17585fe36a8d60fe14406ee7ed59d8369c7f555878f204c4f282506cea3e',1,100),(97,'c47c93f30dca23ae1b462b800a49159bf19362d6fae9832d3f521672dfbe662c',1,101),(98,'e2873d36313254a7448b5bdd603734e72a23e33e06e8eb317a6bff2a82ab27ff',1,102),(99,'d5d16f57a2902aab25291b9c1d4b553ed85321ed2e77874da6a23f275d56c78b',1,103),(100,'68528e3ade5513be1290e9697342102b327a3c1cc92b99731667b4d9c67c9044',1,104),(101,'80e26bb8fb61ccd80a7b50a4787184fc1d5831ebd758e41e66213410a15344c6',1,105),(102,'4a646f0d2529dafd0d6611878e99f688f9e6514693bf2cef85e1c56761742540',1,106),(103,'c31c7140f3c8a896205e3e1ab65456d5b35e54b5abbb53c58e7b5c41194431d6',1,107),(104,'56ba1d11986443a92ae8991392adcc530157db2ba91963d6729de307d74f8cff',1,108),(105,'5a51e8afddd05b2fdae1fa75162c34ad9c48a5764389304173df33ca01a106bf',1,109),(106,'44fd7736e1e8c872241cc0c6205cd343e9552d1470d55a942054e0cc27eddf64',1,110),(107,'33b787c3cfb85807732c2a80cdc6c3d9200933499995937a75b8d3590cdb8d2e',1,111),(108,'f5f8bb6acd552aecfff8f351fc61a3acf5065640eabf0ede667826b142927bbe',1,112),(109,'78a5d004f4d5a28877497f09ffc7a14a02f4fe04d4bc5bf988e0c66f96e6c524',1,113),(110,'e21c9c3a39165739260e3a16477f2a052674a21e1d1a0e4d6da2c822ae1e9e51',1,114),(111,'29a0eae1b8f4ff3656bcf64def7505fdb5c4c1d6c2c72efa9b5c9a7d28401a01',1,115),(112,'d4c616fed4ec0fb1e12af637fb6b79454392b0e98d893804575a8f1572625dfc',1,116),(113,'d7c1eba7fcbabb52c325e309257c01ac83ebba19a151284804b5a081e0d424ba',1,117),(114,'e97e4c8d5942e2e9c53d5825e794887ef4c64aea63bea94b4a752008657af148',1,118),(115,'6cbdac56b8d826d698cb7d842e6d4721671da1723c643b2e7fdc1364b830291b',1,119),(116,'cebf0468b7815c0c98c8452104199c5574a133d5d674aaaff87752a1467daee4',1,120),(117,'73df5784c1346cc43016e428a9c94da5a5838906813b025e1f65c44a17c37d86',1,121),(118,'10b32c30fc05686c7e20791006c682da5d732a821bc171b4e5318addc8f89f13',1,122),(119,'6d9b550a3b1c760cfdd055dbb345acbe3b41fe49791c624b16a099f1207f35a7',1,123),(120,'d453f114350312b5377992ab03063f8e4ac8e9ef8e9749d383f15caacd489189',1,124);
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Testing Assasin',1,'2012-06-05 12:12:30','2012-08-21 18:02:34','2012-08-21 18:02:53'),(2,'Testing QRZar',1,'2012-06-05 12:12:30','2012-08-21 18:02:34','2012-08-21 18:02:53'),(3,'CS2015 Assassin',2,'2012-06-05 12:12:30','2012-08-21 18:02:34','2012-08-21 18:02:53'),(4,'CS2014 Assassin',1,'2012-06-05 12:12:30','2012-08-21 18:02:34','2012-08-21 18:02:53'),(5,'RAG Week',3,'2012-06-05 12:12:30','2012-08-21 18:02:34','2012-08-21 18:02:53'),(6,'Gee Golly',4,'2012-08-28 14:37:59','2012-08-28 14:37:59','2012-08-28 14:38:25'),(7,'Joe Bush League Tournament',1,'2012-08-30 15:47:39','2012-08-30 15:47:39','2012-08-30 15:47:39'),(8,'Joe Bush League Tournament',1,'2012-08-30 16:09:18','2012-08-30 16:09:18','2012-08-30 16:09:18'),(16,'Joe Bush League Tournament',1,'2012-09-03 14:38:14','2012-09-03 14:38:14','2012-09-03 14:38:14'),(15,'Joe Bush League Tournament',1,'2012-09-03 14:37:30','2012-09-03 14:37:30','2012-09-03 14:37:30'),(14,'Joe Bush League Tournament',1,'2012-09-03 11:34:44','2012-09-03 11:34:44','2012-09-03 11:34:44'),(13,'Joe Bush League Tournament',1,'2012-09-03 11:29:22','2012-09-03 11:29:22','2012-09-03 11:29:22'),(17,'Joe Bush League Tournament',1,'2012-09-03 14:40:04','2012-09-03 14:40:04','2012-09-03 14:40:04'),(18,'Joe Bush League Tournament',1,'2012-09-03 14:42:21','2012-09-03 14:42:21','2012-09-03 14:42:21'),(19,'Joe Bush League Tournament',1,'2012-09-03 14:43:40','2012-09-03 14:43:40','2012-09-03 14:43:40'),(20,'Joe Bush League Tournament',1,'2012-09-03 14:44:38','2012-09-03 14:44:38','2012-09-03 14:44:38'),(21,'Joe Bush League Tournament',1,'2012-09-03 14:44:48','2012-09-03 14:44:48','2012-09-03 14:44:48');
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kills`
--

LOCK TABLES `kills` WRITE;
/*!40000 ALTER TABLE `kills` DISABLE KEYS */;
INSERT INTO `kills` VALUES (1,1,2,'2012-05-22 16:09:02',1),(2,1,5,'2012-05-22 16:09:29',0),(3,1,5,'2012-05-22 16:09:34',1),(4,2,5,'2012-05-22 16:09:40',1),(5,1,2,'2012-05-22 16:09:48',1),(6,2,5,'2012-05-22 16:09:56',0),(7,2,1,'2012-05-22 16:10:05',1),(8,3,4,'2012-05-22 16:10:20',1),(9,3,6,'2012-05-22 16:10:23',1),(10,6,3,'2012-05-22 16:10:31',1),(11,3,4,'2012-05-22 16:10:47',0),(12,4,3,'2012-05-22 16:10:57',1);
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
  `lat` float(10,6) DEFAULT NULL,
  `lon` float(10,6) DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'specialk',1,1,NULL,NULL,6400,'2012-08-28 14:31:15','WAhrQJ',1),(2,'arboroia',1,2,NULL,NULL,3500,'2012-08-28 14:31:15','PldkJH',1),(3,'specialk [IRL]',3,1,NULL,NULL,100,'2012-08-28 14:31:15','YBhnt4',1),(4,'arboroia is god',3,2,NULL,NULL,2300,'2012-08-28 14:31:15','33KFmG',1),(5,'tester',1,3,NULL,NULL,2800,'2012-08-28 14:31:15','o1wJiY',1),(6,'tester',3,3,NULL,NULL,1700,'2012-08-28 14:31:15','yPeTmc',1),(7,'Meme',1,4,NULL,NULL,32700,'2012-08-28 14:31:15','1qHPFr',1),(8,'MagicMan',2,1,NULL,NULL,4500,'2012-08-28 14:31:15','HESIjN',1),(9,'MagicMan',4,1,NULL,NULL,4500,'2012-08-28 14:31:15','JCcEKo',1),(10,'MagicMan',7,1,NULL,NULL,4500,'2012-08-28 14:31:17','j4K6ya',1),(11,'Goose',2,2,NULL,NULL,4500,'2012-08-28 14:31:42','fdk2Dn',1),(12,'Goose',10,2,NULL,NULL,4500,'2012-08-28 14:31:48','fdR2Dn',1),(13,'Goose',9,2,NULL,NULL,3100,'2012-08-28 14:31:59','G3R2Dn',1),(14,'Black Beanz',8,5,NULL,NULL,3100,'2012-08-28 14:32:09','R3R2Dn',1),(16,'Player MAN!',4,1,0.000000,0.000000,0,'2012-09-03 14:42:20','R45454',1);
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
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Blue Team',1,'B'),(2,'Blue Team',2,'B'),(3,'Blue Team',3,'B'),(4,'Red Team',1,'R'),(5,'Yellow Team',2,'Y'),(6,'Green Team',3,'G'),(7,'Green Team',4,'G'),(8,'Green Team',5,'G'),(9,'Blue Team',5,'B'),(10,'Blue Team',6,'B'),(11,'Yellow Team',6,'Y'),(13,'Red Team',4,'R');
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
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Kevin Baker','354d7eff555998e420c54226cb4dc494','banana@tophat.ie','PBKDF2$sha256$100$H7HJ+6gw7qKTZl2j$YYdfGhsybIYSnfbkLVfzEwICWscLKMMh\n','2012-06-05 10:52:57',0),(2,'Kevin Bluett','hfdkjfhakj55998e420c54226cb4dc49','kevin@tophat.ie',NULL,'2012-06-05 10:52:57',0),(3,'Test Subject 1','4aa499b089dff5d89ba44c5281ac883c','ts1@tophat.ie',NULL,'2012-06-05 10:52:57',0),(4,'Testing Subject 2','357843259b856611ebf03f17dfee2d77','ts2@tophat.ie',NULL,'2012-06-05 10:52:57',0),(5,'Bean Stuffie','7adebc519fe505566b07805b50bd3b33','kevinbaker@tophat.ie',NULL,'2012-08-28 14:44:18',1),(6,'Anonymous',NULL,NULL,NULL,'2012-08-29 17:45:40',0),(7,'Anonymous',NULL,NULL,NULL,'2012-08-29 17:45:40',0),(8,'Anonymous',NULL,NULL,NULL,'2012-08-29 17:54:53',0),(111,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:37:30',0),(110,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:36:09',0),(109,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:36:09',0),(108,'Anonymous',NULL,NULL,NULL,'2012-09-03 11:34:44',0),(107,'Anonymous',NULL,NULL,NULL,'2012-09-03 11:34:44',0),(106,'Anonymous',NULL,NULL,NULL,'2012-09-03 11:29:22',0),(105,'Anonymous',NULL,NULL,NULL,'2012-09-03 11:29:22',0),(104,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:16:50',0),(103,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:16:50',0),(102,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:13:46',0),(101,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:13:46',0),(100,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:12:50',0),(99,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:12:50',0),(98,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:12:12',0),(97,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:12:11',0),(96,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:09:19',0),(95,'Anonymous',NULL,NULL,NULL,'2012-08-30 16:09:18',0),(94,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:47:39',0),(93,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:47:39',0),(92,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:43:25',0),(91,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:43:25',0),(90,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:43:13',0),(89,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:43:13',0),(88,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:41:37',0),(87,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:41:37',0),(86,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:41:05',0),(85,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:41:04',0),(84,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:31:13',0),(83,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:31:13',0),(82,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:28:46',0),(81,'Anonymous',NULL,NULL,NULL,'2012-08-30 15:28:46',0),(80,'Anonymous',NULL,NULL,NULL,'2012-08-30 13:36:53',0),(79,'Anonymous',NULL,NULL,NULL,'2012-08-30 13:36:53',0),(78,'Anonymous',NULL,NULL,NULL,'2012-08-30 13:35:06',0),(77,'Anonymous',NULL,NULL,NULL,'2012-08-30 13:35:06',0),(76,'Anonymous',NULL,NULL,NULL,'2012-08-30 13:33:56',0),(75,'Anonymous',NULL,NULL,NULL,'2012-08-30 13:33:56',0),(74,'Anonymous',NULL,NULL,NULL,'2012-08-30 13:17:53',0),(73,'Anonymous',NULL,NULL,NULL,'2012-08-30 13:17:53',0),(112,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:37:30',0),(113,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:38:14',0),(114,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:38:14',0),(115,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:40:04',0),(116,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:40:04',0),(117,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:42:21',0),(118,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:42:21',0),(119,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:43:40',0),(120,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:43:40',0),(121,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:44:38',0),(122,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:44:39',0),(123,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:44:48',0),(124,'Anonymous',NULL,NULL,NULL,'2012-09-03 14:44:48',0);
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

-- Dump completed on 2012-09-03 15:56:19