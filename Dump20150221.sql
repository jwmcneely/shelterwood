CREATE DATABASE  IF NOT EXISTS `shelterwood` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shelterwood`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: shelterwood
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `option_text` text,
  `active` int(11) DEFAULT '1',
  `deleted` int(11) DEFAULT '0',
  `dimension` varchar(45) DEFAULT NULL,
  `capability` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `active` (`active`),
  KEY `deleted` (`deleted`),
  KEY `dimension` (`dimension`),
  KEY `capability` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (1,'2014-12-23 09:20:45','2015-01-08 19:45:53','Cupcake ipsum dolor. Sit amet icing topping marshmallow jujubes sugar plum souffle. Muffin pastry jelly marzipan cookie wafer cotton candy. Chocolate!!! 3',1,0,'Physical Wellbeing','Reaction'),(2,'2014-12-23 09:20:45','2014-12-27 02:31:59','Lemon drops gingerbread croissant marshmallow lollipop pudding chupa chups caramels candy canes. Sugar plum macaroon gingerbread tiramisu. Ice cream chocolate oat cake. Icing ice cream souffle chocolate bar pie fruitcake cheesecake marshmallow jelly.',1,0,'Physical Wellbeing','Reaction'),(3,'2014-12-23 09:20:45','2014-12-23 19:09:22','Unerdwear.com muffin apple pie tart carrot cake cotton candy. Wafer unerdwear.com wafer caramels halvah sesame snaps marshmallow cookie. Jujubes tiramisu donut gummi bears candy sweet fruitcake powder.',1,0,'Physical Wellbeing','Activation'),(4,'2014-12-23 09:20:45','2014-12-24 16:30:43','Lemon drops candy canes bonbon fruitcake topping. Pie candy applicake jelly beans jelly-o wafer. Chocolate bar unerdwear.com jujubes pastry apple pie jelly beans gummi bears.',1,0,'Physical Wellbeing','Activation'),(5,'2014-12-23 09:20:45','2014-12-23 19:09:22','Sugar plum caramels candy icing ice cream carrot cake tootsie roll cotton candy dessert. Cake dragée jelly lemon drops sweet cotton candy sweet roll biscuit gingerbread. Unerdwear.com sugar plum jelly dessert pudding candy canes biscuit. Candy cake dessert halvah chocolate bar tart.',1,0,'Spiritual Mindfulness','Reaction'),(6,'2014-12-23 09:20:45','2014-12-23 19:09:22','Gummies fruitcake soufflé. Soufflé muffin gummies muffin. Topping apple pie pie tart. Croissant danish halvah jelly gummi bears candy canes halvah.',1,0,'Spiritual Mindfulness','Reaction'),(7,'2014-12-23 09:20:45','2014-12-23 19:09:22','Sesame snaps chocolate tart. Fruitcake sugar plum lollipop sugar plum applicake jelly oat cake toffee dragée. Chocolate cupcake marshmallow apple pie soufflé.',1,0,'Spiritual Mindfulness','Activation'),(8,'2014-12-23 09:20:45','2014-12-23 19:09:22','Lemon drops oat cake unerdwear.com. Fruitcake apple pie chupa chups cookie lemon drops cotton candy. Gummi bears marshmallow dragée sesame snaps candy canes.',1,0,'Spiritual Mindfulness','Activation'),(9,'2014-12-23 09:20:45','2014-12-23 19:09:22','Donut halvah jujubes apple pie sweet roll candy. Gummi bears sweet roll tart sweet roll lollipop jujubes cake sweet dragée. Bear claw macaroon sweet sweet roll marshmallow. Pudding sweet roll unerdwear.com gummies lollipop.',1,0,'Mental Toughness','Reaction'),(10,'2014-12-23 09:20:45','2014-12-23 19:09:22','Danish marzipan applicake marzipan. Bear claw powder brownie applicake bonbon gingerbread. Sweet roll sugar plum brownie gummies brownie.',1,0,'Mental Toughness','Reaction'),(11,'2014-12-23 09:29:16','2015-01-08 19:43:52','Sesame snaps chocolate tart. Fruitcake sugar plum lollipop sugar plum applicake jelly oat cake toffee dragÃ©e. Chocolate cupcake marshmallow apple pie soufflÃ©.',0,0,'Mental Toughness','Activation'),(13,'2014-12-26 17:54:03','2014-12-27 01:57:25','This is a 4th record that Jim added! How cool is that?',1,1,'Physical Wellbeing','Reaction'),(14,'2014-12-26 17:58:30','2014-12-27 02:31:59','Mary did you know? Of course you did! caramels candy canes. Sugar plum macaroon gingerbread tiramisu. Ice cream chocolate oat cake. Icing ice cream souffle',0,0,'Physical Wellbeing','Reaction'),(15,'2014-12-26 18:01:09','2014-12-27 02:02:02','Here\'s the new one! It\'s got ~ % all kinds & *% ` of weird characters \' for screwing this up!',1,0,'Physical Wellbeing','Activation'),(16,'2014-12-26 18:31:29','2014-12-27 02:31:29','',1,1,'Physical Wellbeing','Reaction'),(17,'2014-12-26 18:32:40','2015-01-08 02:14:31','~!@QWER @#$% WER $%^& FG %^&GHJ &*() {}[]\\| \":HY',0,0,'Physical Wellbeing','Activation'),(18,'2014-12-26 21:42:57','2014-12-27 05:42:57','',1,1,'Physical Wellbeing','Reaction');
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selection`
--

DROP TABLE IF EXISTS `selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_student` int(11) DEFAULT NULL,
  `id_option` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `assessor` varchar(45) NOT NULL COMMENT 'Counselor, House Director, Mentor, Teacher',
  `dimension` varchar(45) NOT NULL,
  `capability` varchar(45) NOT NULL,
  `weekof` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`id_student`,`id_option`,`assessor`,`dimension`,`capability`,`weekof`),
  KEY `id_student` (`id_student`),
  KEY `id_option` (`id_option`),
  KEY `assessor` (`assessor`),
  KEY `dimension` (`dimension`),
  KEY `capability` (`capability`),
  KEY `weekof` (`weekof`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
INSERT INTO `selection` VALUES (2,'2015-01-08 12:04:20','2015-01-08 20:04:20',7,1,1,1,'Mentor','Physical Wellbeing','Reaction','2015-01-07'),(3,'2015-01-08 12:04:20','2015-01-08 20:04:20',7,1,1,1,'Teacher','Physical Wellbeing','Reaction','2015-01-07'),(25,'2015-01-08 16:56:05','2015-01-09 00:56:05',7,1,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-07'),(44,'2015-01-08 16:58:54','2015-01-09 00:58:54',7,9,3,1,'Counselor','Mental Toughness','Reaction','2015-01-07'),(46,'2015-01-08 16:58:56','2015-01-09 00:58:56',7,10,3,0,'Counselor','Mental Toughness','Reaction','2015-01-07'),(47,'2015-01-08 17:39:19','2015-01-09 01:39:19',13,1,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-07'),(48,'2015-01-08 17:39:35','2015-01-09 01:39:35',27,2,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-07'),(49,'2015-01-08 17:40:10','2015-01-09 01:40:10',39,2,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-07'),(50,'2015-01-08 17:40:25','2015-01-09 01:40:25',39,4,3,1,'Counselor','Physical Wellbeing','Activation','2015-01-07'),(51,'2015-01-08 17:40:36','2015-01-09 01:40:36',39,15,3,1,'Counselor','Physical Wellbeing','Activation','2015-01-07'),(52,'2015-01-08 17:41:15','2015-01-09 01:41:15',7,15,3,1,'Counselor','Physical Wellbeing','Activation','2015-01-07'),(53,'2015-01-08 17:58:30','2015-01-09 01:58:30',56,4,3,1,'Counselor','Physical Wellbeing','Activation','2015-01-07'),(54,'2015-01-08 17:58:32','2015-01-09 01:58:32',56,15,3,1,'Counselor','Physical Wellbeing','Activation','2015-01-07'),(81,'2015-01-08 19:39:39','2015-01-09 03:39:39',60,1,3,1,'Mentor','Physical Wellbeing','Reaction','2015-01-07'),(82,'2015-01-08 20:02:53','2015-01-09 04:02:53',60,1,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-07'),(83,'2015-01-08 20:02:56','2015-01-09 04:02:56',60,2,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-07'),(84,'2015-01-08 20:03:02','2015-01-09 04:03:02',60,4,3,1,'Counselor','Physical Wellbeing','Activation','2015-01-07'),(85,'2015-01-08 20:54:52','2015-01-09 04:54:52',6,1,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-07'),(86,NULL,'2015-01-09 05:50:51',50,1,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-07'),(87,NULL,'2015-01-12 20:58:11',27,1,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-14'),(88,NULL,'2015-01-12 21:52:27',61,1,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-14'),(89,NULL,'2015-01-12 21:52:32',61,1,3,1,'House Director','Physical Wellbeing','Reaction','2015-01-14'),(90,NULL,'2015-01-12 21:52:35',61,1,3,1,'Mentor','Physical Wellbeing','Reaction','2015-01-14'),(91,NULL,'2015-01-12 21:52:39',61,1,3,1,'Teacher','Physical Wellbeing','Reaction','2015-01-14'),(92,NULL,'2015-01-12 21:54:25',59,1,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-14'),(93,NULL,'2015-01-12 21:54:36',62,2,3,1,'House Director','Physical Wellbeing','Reaction','2015-01-14'),(94,NULL,'2015-01-12 21:54:46',60,2,3,1,'Mentor','Physical Wellbeing','Reaction','2015-01-14'),(95,NULL,'2015-01-12 21:55:01',63,3,3,1,'Teacher','Physical Wellbeing','Activation','2015-01-14'),(96,NULL,'2015-01-14 15:31:57',7,2,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-07'),(97,NULL,'2015-01-14 18:12:31',7,3,3,1,'Counselor','Physical Wellbeing','Activation','2015-01-07'),(99,NULL,'2015-01-16 22:59:46',57,2,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-14'),(102,NULL,'2015-01-16 23:07:27',57,1,3,1,'Counselor','Physical Wellbeing','Reaction','2015-01-14'),(109,NULL,'2015-01-16 23:08:47',57,15,3,0,'Counselor','Physical Wellbeing','Activation','2015-01-14'),(113,NULL,'2015-01-16 23:08:54',57,4,3,0,'Counselor','Physical Wellbeing','Activation','2015-01-14'),(114,NULL,'2015-01-16 23:08:56',57,3,3,1,'Counselor','Physical Wellbeing','Activation','2015-01-14'),(115,NULL,'2015-01-20 02:04:32',61,2,3,1,'House Director','Physical Wellbeing','Reaction','2015-01-14'),(116,NULL,'2015-01-20 02:04:41',61,1,3,1,'House Director','Physical Wellbeing','Reaction','2015-01-07'),(117,NULL,'2015-01-20 20:07:43',60,1,3,1,'House Director','Physical Wellbeing','Reaction','2015-01-14'),(118,NULL,'2015-01-20 20:08:09',60,3,3,1,'House Director','Physical Wellbeing','Activation','2015-01-14'),(120,NULL,'2015-01-20 20:18:49',60,4,3,0,'House Director','Physical Wellbeing','Activation','2015-01-14'),(121,NULL,'2015-01-20 20:18:51',60,15,3,1,'House Director','Physical Wellbeing','Activation','2015-01-14'),(122,NULL,'2015-01-20 20:49:31',60,3,8,1,'Teacher','Physical Wellbeing','Activation','2015-01-14'),(123,NULL,'2015-01-20 20:49:38',60,4,8,1,'Teacher','Physical Wellbeing','Activation','2015-01-14'),(124,NULL,'2015-01-20 20:49:43',60,2,1,1,'Teacher','Physical Wellbeing','Reaction','2015-01-14'),(125,NULL,'2015-01-20 20:56:00',64,4,8,1,'House Director','Physical Wellbeing','Activation','2015-01-14'),(126,NULL,'2015-01-20 20:56:26',64,1,1,1,'House Director','Physical Wellbeing','Reaction','2015-01-14'),(127,NULL,'2015-01-20 20:56:29',64,2,1,1,'House Director','Physical Wellbeing','Reaction','2015-01-14'),(128,NULL,'2015-01-20 21:23:19',17,1,1,1,'House Director','Physical Wellbeing','Reaction','2015-01-07'),(131,NULL,'2015-01-20 21:26:02',17,2,1,1,'House Director','Physical Wellbeing','Reaction','2015-01-07'),(132,NULL,'2015-01-20 21:56:51',56,2,1,1,'Mentor','Physical Wellbeing','Reaction','2015-01-14'),(134,NULL,'2015-01-20 21:57:02',56,3,8,1,'Mentor','Physical Wellbeing','Activation','2015-01-14'),(135,NULL,'2015-01-20 21:57:30',56,4,8,0,'Mentor','Physical Wellbeing','Activation','2015-01-14'),(136,NULL,'2015-01-20 21:57:32',56,15,8,1,'Mentor','Physical Wellbeing','Activation','2015-01-14'),(137,NULL,'2015-01-21 04:32:42',17,1,1,1,'Mentor','Physical Wellbeing','Reaction','2015-01-14'),(141,NULL,'2015-01-21 05:25:48',13,3,8,0,'Mentor','Physical Wellbeing','Activation','2015-01-14'),(145,NULL,'2015-01-21 05:28:00',13,4,8,0,'Mentor','Physical Wellbeing','Activation','2015-01-14'),(147,NULL,'2015-01-22 00:12:21',59,1,1,0,'Mentor','Physical Wellbeing','Reaction','2015-01-21'),(148,NULL,'2015-01-22 00:12:55',61,1,1,1,'Counselor','Physical Wellbeing','Reaction','2015-01-21'),(149,NULL,'2015-01-22 00:12:57',61,2,1,1,'Counselor','Physical Wellbeing','Reaction','2015-01-21');
/*!40000 ALTER TABLE `selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `date_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name_first` varchar(45) DEFAULT NULL,
  `name_middle` varchar(45) DEFAULT NULL,
  `name_last` varchar(45) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `p1_name_first` varchar(45) DEFAULT NULL,
  `p1_name_last` varchar(45) DEFAULT NULL,
  `p1_carrier` varchar(45) DEFAULT NULL,
  `p1_mobile` varchar(45) DEFAULT NULL,
  `p1_email` varchar(45) DEFAULT NULL,
  `p2_name_first` varchar(45) DEFAULT NULL,
  `p2_name_last` varchar(45) DEFAULT NULL,
  `p2_carrier` varchar(45) DEFAULT NULL,
  `p2_mobile` varchar(45) DEFAULT NULL,
  `p2_email` varchar(45) DEFAULT NULL,
  `uuid5` varchar(10) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid5_UNIQUE` (`uuid5`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'2014-12-15 16:08:47','2015-01-17 00:11:26','Neville','Andrea','Micalizzi',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B2A31',0),(2,'2014-12-15 16:08:47','2015-01-17 00:11:26','Moises','Olen','Lukesh',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'90DB2',0),(3,'2014-12-15 16:08:47','2015-01-17 00:11:26','Norberto','Terence','Mordeci',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'63F11',0),(4,'2014-12-15 16:08:47','2015-01-17 00:11:26','Jefferey','Mitchell','Prime',1,'','','ATT','(360) 343-3434','rib@fake.com',NULL,NULL,'','','','E8997',0),(5,'2014-12-15 16:08:47','2015-01-17 00:11:26','Rhett','Doug','Benedix',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'67E41',0),(6,'2014-12-15 16:08:47','2015-01-17 00:11:26','Garfield','Garfield','Jobs',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'293F8',0),(7,'2014-12-15 16:08:47','2015-01-17 00:11:26','Ezra','Jon','Schaad',1,'Jane','Schaad','Verizon','(360) 555-3434','sam.schaad@gmail.com','Jane','Schaad','Verizon','(360) 555-8989','jane.schaad@hotmail.com','0D46D',0),(8,'2014-12-15 16:08:47','2015-01-17 00:11:26','Jarrett','Josef','Pullins',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'30AEF',0),(9,'2014-12-15 16:08:47','2015-01-17 00:11:26','Milford','Andy','Provino',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'D904B',0),(10,'2014-12-15 16:08:47','2015-01-17 00:11:26','Giovanni','Adrian','Chiz',0,'123456','','','','','','','','','','A894D',0),(11,'2014-12-15 16:08:47','2015-01-17 00:11:26','Bryce','Kent','Grauel',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44D46',0),(12,'2014-12-15 16:08:47','2015-01-17 00:11:26','Chris','Fernando','Lachino',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7C9AD',0),(13,'2014-12-15 16:08:47','2015-01-17 00:11:26','Roscoe','Anibal','Aben',1,'Snippy','Doodiddle','Verizon','360-555-2222','abraham.aben@fakemail.com','','','','','','0740E',0),(14,'2014-12-15 16:08:47','2015-01-17 00:11:26','Donny','Bryant','Milonas',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C1C81',0),(15,'2014-12-15 16:08:47','2015-01-17 00:11:26','Wes','Rory','Sonia',0,'','','','23','',NULL,NULL,'','','','873D6',0),(16,'2014-12-15 16:08:47','2015-01-17 00:11:26','Franklyn','Gerald','Sophy',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'098EC',0),(17,'2014-12-15 16:08:47','2015-01-17 00:11:26','Cedrick','Andre','Allessi',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A9F78',0),(18,'2014-12-15 16:08:47','2015-01-17 00:11:26','Hector','Bryan','Machala',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'D746A',0),(19,'2014-12-15 16:08:47','2015-01-17 00:11:26','Rayford','Pablo','Justino',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1E0B1',0),(20,'2014-12-15 16:08:47','2015-01-17 00:11:26','Trenton','Sean','Khalifah',1,'','','','','',NULL,NULL,'','','','16258',0),(21,'2014-12-15 16:08:47','2015-01-17 00:11:26','Emanuel','Buster','Winans',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C009A',0),(22,'2014-12-15 16:08:47','2015-01-17 00:11:26','Frank','Perry','Peeler',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7E00F',0),(23,'2014-12-15 16:08:47','2015-01-17 00:11:26','Efrain','Elbert','Zeuner',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3AB93',0),(24,'2014-12-15 16:08:47','2015-01-17 00:11:26','Dick','Wilton','Nabb',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B8330',0),(25,'2014-12-15 16:08:47','2015-01-17 00:11:26','Humberto','Brady','Metter',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7B8F4',0),(26,'2014-12-15 16:08:47','2015-01-17 00:11:26','Stuart','Blaine','Trapasso',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4741E',0),(27,'2014-12-15 16:08:47','2015-01-17 00:11:26','Vernon','Mikel','Burlett',1,'Brianna','','Verizon','360-555-1212','burl@burly.com','Brianna','','','','','0A402',0),(28,'2014-12-15 16:08:47','2015-01-17 00:11:26','Jeffery','Warner','Seabert',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9F84A',0),(29,'2014-12-15 16:08:47','2015-01-17 00:11:26','Chi','Hosea','Rothberg',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BD822',0),(30,'2014-12-15 16:08:47','2015-01-17 00:11:26','Jude','Charlie','Olinick',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A5F52',0),(31,'2014-12-15 16:08:47','2015-01-17 00:11:26','Winfred','Jean','Mcclee',1,'','','','','',NULL,NULL,'','','','36C7D',0),(32,'2014-12-15 16:08:47','2015-01-17 00:11:26','Vito','Guillermo','Togashi',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6181E',0),(33,'2014-12-15 16:08:47','2015-01-17 00:11:26','Brenton','Malcom','Linscomb',1,'123123','','','','','','','','','','75D9D',0),(34,'2014-12-15 16:08:47','2015-01-17 00:11:26','Archie','Marcel','Scurry',1,'','','Verizon','(360) 909-9992','',NULL,NULL,'','','','A2847',0),(35,'2014-12-15 16:08:47','2015-01-17 00:11:26','Lindsey','Marcelino','Tsing',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AB76F',0),(36,'2014-12-15 16:08:47','2015-01-17 00:11:26','Andrew','Nathaniel','Redell',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'197D9',0),(37,'2014-12-15 16:08:47','2015-01-17 00:11:26','Pablo','Micah','Brodey',0,'','','Verizon','360-585-6969','',NULL,NULL,'Verizon','360-303-9898','','313FC',0),(38,'2014-12-15 16:08:47','2015-01-17 00:11:26','Aldo','Lynwood','Maleck',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10DC1',0),(39,'2014-12-15 16:08:47','2015-01-17 00:11:26','Troy','Leroy','Heimbuch',1,'','','','','',NULL,NULL,'','','','B06A4',0),(40,'2014-12-15 16:08:47','2015-01-17 00:11:26','Clinton','Trenton','Whitemore',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'83C4D',0),(41,'2014-12-15 16:08:47','2015-01-17 00:11:26','Santiago','Edmundo','Gist',0,'','','','','','','','','','','7508B',0),(42,'2014-12-15 16:08:47','2015-01-17 00:11:26','Merle','Shannon','Mascetti',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CC197',0),(43,'2014-12-15 16:08:47','2015-01-17 00:11:26','Wilfredo','Craig','Mistler',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'D1616',0),(44,'2014-12-15 16:08:47','2015-01-17 00:11:26','Rickey','Benito','Greb',1,'789000','','','','','','','','','','D410B',0),(45,'2014-12-15 16:08:47','2015-01-17 00:11:26','Claude','Kip','Botdorf',1,'','','Sprint','(214) 555-9989','',NULL,NULL,'Sprint','(972) 866-5858','','A77FD',0),(46,'2014-12-15 16:08:47','2015-01-17 00:11:26','Desmond','Raymon','Setaro',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4550F',0),(47,'2014-12-15 16:08:47','2015-01-17 00:11:26','Josiah','Brad','Swensen',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4E80E',0),(48,'2014-12-15 16:08:47','2015-01-17 00:11:26','Shaun','Weldon','Blazon',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7A3BC',0),(49,'2014-12-15 16:08:47','2015-01-17 00:11:26','Kareem','Andreas','Lecato',1,'','','','','',NULL,NULL,'','','','8B307',0),(50,'2014-12-15 16:08:47','2015-01-17 00:11:26','Keith','Ervin','Wanke',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B2AED',0),(53,'2015-01-02 16:33:11','2015-01-17 00:11:26','sammy',NULL,'davis',1,'','','ATT','','','','','','','','D91DA',0),(54,'2015-01-02 16:40:00','2015-01-17 00:11:26','Dean',NULL,'Martin',1,'','','','','','','','','','','50D0B',0),(55,'2015-01-02 16:41:32','2015-01-17 00:11:26','Frank',NULL,'Sinatra',1,'','','','','','','','','','','B8414',0),(56,'2015-01-02 16:44:06','2015-01-17 00:11:26','frank',NULL,'aaba',1,'','','','','','','','','','','CD3FE',0),(57,'2015-01-02 16:47:24','2015-01-17 03:43:23','frank',NULL,'aabb',1,'','','','','','','','','','','208D6',1),(58,'2015-01-02 16:48:13','2015-01-17 00:11:26','flippy',NULL,'doowop',1,'','','Verizon','360-303-6666','','','','','','','20B26',0),(59,'2015-01-02 16:48:42','2015-01-17 00:11:26','jimmy',NULL,'aaab',1,'','','','','','','','','','','27DE2',0),(60,'2015-01-02 16:51:40','2015-01-17 04:24:07','jimmy',NULL,'aaad',1,'','','','','','','','','','','4FA99',1),(61,'2015-01-02 16:52:50','2015-01-17 00:11:26','jimmy',NULL,'aaaa',1,'','','','','','','','','','','04673',0),(62,'2015-01-02 16:56:16','2015-01-17 00:11:26','jimmy',NULL,'aaac',1,'','','','','','','','','','','2D2BE',0),(63,'2015-01-02 16:59:13','2015-01-17 00:12:07','jimmy',NULL,'aaae',1,'','','','','','','','','','','10C2C',1),(64,'2015-01-02 17:00:08','2015-01-17 00:08:26','flip',NULL,'aaca',1,'','','','','','','','','','','BE5AD',1),(65,NULL,'2015-01-19 23:40:07','',NULL,'',1,'','','','234','','','','','','','A8B24',1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `shelterwood`.`student_BEFORE_INSERT` BEFORE INSERT ON `student` FOR EACH ROW
    SET NEW.`uuid5` = UPPER(LEFT(MD5(RAND()), 5)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `date_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2014-12-18 04:14:24','2014-12-26 18:18:55','admin','1234','admin'),(2,'2014-12-18 04:14:35','2014-12-22 22:21:45','staff','1234','staff');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-21 16:32:28
