-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: r21
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `encounters`
--

DROP TABLE IF EXISTS `encounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `encounters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `playerA_id` int(11) NOT NULL,
  `playerB_id` int(11) NOT NULL,
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounters`
--

LOCK TABLES `encounters` WRITE;
/*!40000 ALTER TABLE `encounters` DISABLE KEYS */;
INSERT INTO `encounters` VALUES (1,1,2,'2018-10-16 19:18:45',NULL),(2,2,3,'2018-10-16 19:19:19',NULL),(3,1,3,'2018-10-16 19:19:54',NULL),(4,4,1,'2018-10-16 19:19:54',NULL),(5,4,2,'2018-10-16 19:20:45',NULL),(6,5,2,'2018-10-16 19:21:29',NULL),(7,6,2,'2018-10-16 19:21:29',NULL),(8,7,3,'2018-10-16 19:21:29',NULL),(9,8,3,'2018-10-16 19:21:29',NULL),(10,5,1,'2018-10-16 19:21:29',NULL),(11,6,1,'2018-10-16 19:21:29',NULL),(12,7,2,'2018-10-16 19:21:30',NULL),(13,8,2,'2018-10-16 19:21:30',NULL),(14,2,2,'2018-10-16 19:21:30',NULL),(15,3,3,'2018-10-16 19:21:30',NULL),(16,4,3,'2018-10-16 19:21:30',NULL),(17,9,2,'2018-10-16 19:21:30',NULL),(18,10,1,'2018-10-16 19:21:30',NULL),(19,10,2,'2018-10-16 19:23:39',NULL),(20,10,3,'2018-10-16 19:23:39',NULL),(21,8,6,'2018-10-16 19:23:39',NULL),(22,3,5,'2018-10-16 19:23:40',NULL),(23,4,6,'2018-10-16 19:23:40',NULL),(24,7,1,'2018-10-16 19:25:09',NULL);
/*!40000 ALTER TABLE `encounters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `games` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scoreplayerA` int(2) NOT NULL DEFAULT '99',
  `scoreplayerB` int(2) NOT NULL DEFAULT '99',
  `encounter_id` int(11) NOT NULL,
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,1,0,1,0,'2018-10-16 19:18:45',NULL),(2,1,0,1,0,'2018-10-16 19:19:01',NULL),(3,0,1,1,0,'2018-10-16 19:19:01',NULL),(4,1,0,1,0,'2018-10-16 19:19:19',NULL),(5,0,1,1,0,'2018-10-16 19:19:19',NULL),(6,1,0,2,0,'2018-10-16 19:19:19',NULL),(7,1,0,2,0,'2018-10-16 19:19:19',NULL),(8,1,0,1,0,'2018-10-16 19:19:54',NULL),(9,0,1,1,0,'2018-10-16 19:19:54',NULL),(10,1,0,2,0,'2018-10-16 19:19:54',NULL),(11,0,1,3,0,'2018-10-16 19:19:54',NULL),(12,1,0,4,0,'2018-10-16 19:19:54',NULL),(13,1,0,3,0,'2018-10-16 19:19:54',NULL),(14,0,1,2,0,'2018-10-16 19:19:54',NULL),(15,0,1,1,0,'2018-10-16 19:19:54',NULL),(16,1,0,1,0,'2018-10-16 19:20:06',NULL),(17,0,1,1,0,'2018-10-16 19:20:07',NULL),(18,1,0,2,0,'2018-10-16 19:20:07',NULL),(19,0,1,3,0,'2018-10-16 19:20:07',NULL),(20,1,0,4,0,'2018-10-16 19:20:07',NULL),(21,1,0,3,0,'2018-10-16 19:20:07',NULL),(22,0,1,2,0,'2018-10-16 19:20:07',NULL),(23,0,1,1,0,'2018-10-16 19:20:07',NULL),(24,1,0,1,0,'2018-10-16 19:20:07',NULL),(25,0,1,1,0,'2018-10-16 19:20:07',NULL),(26,1,0,2,0,'2018-10-16 19:20:07',NULL),(27,0,1,3,0,'2018-10-16 19:20:07',NULL),(28,1,0,4,0,'2018-10-16 19:20:07',NULL),(29,1,0,3,0,'2018-10-16 19:20:07',NULL),(30,0,1,2,0,'2018-10-16 19:20:07',NULL),(31,0,1,1,0,'2018-10-16 19:20:07',NULL),(32,1,0,1,0,'2018-10-16 19:20:45',NULL),(33,0,1,1,0,'2018-10-16 19:20:45',NULL),(34,1,0,2,0,'2018-10-16 19:20:45',NULL),(35,0,1,3,0,'2018-10-16 19:20:45',NULL),(36,1,0,4,0,'2018-10-16 19:20:45',NULL),(37,1,0,3,0,'2018-10-16 19:20:45',NULL),(38,0,1,2,0,'2018-10-16 19:20:45',NULL),(39,0,1,1,0,'2018-10-16 19:20:45',NULL),(40,1,0,1,0,'2018-10-16 19:20:45',NULL),(41,0,1,1,0,'2018-10-16 19:20:45',NULL),(42,1,0,2,0,'2018-10-16 19:20:45',NULL),(43,0,1,3,0,'2018-10-16 19:20:45',NULL),(44,1,0,4,0,'2018-10-16 19:20:45',NULL),(45,1,0,3,0,'2018-10-16 19:20:45',NULL),(46,0,1,2,0,'2018-10-16 19:20:45',NULL),(47,0,1,1,0,'2018-10-16 19:20:45',NULL),(48,0,1,5,0,'2018-10-16 19:20:45',NULL),(49,0,1,4,0,'2018-10-16 19:20:45',NULL),(50,1,0,1,0,'2018-10-16 19:21:28',NULL),(51,0,1,1,0,'2018-10-16 19:21:28',NULL),(52,1,0,2,0,'2018-10-16 19:21:28',NULL),(53,0,1,3,0,'2018-10-16 19:21:28',NULL),(54,1,0,4,0,'2018-10-16 19:21:28',NULL),(55,1,0,3,0,'2018-10-16 19:21:28',NULL),(56,0,1,2,0,'2018-10-16 19:21:28',NULL),(57,0,1,1,0,'2018-10-16 19:21:29',NULL),(58,1,0,1,0,'2018-10-16 19:21:29',NULL),(59,0,1,1,0,'2018-10-16 19:21:29',NULL),(60,1,0,2,0,'2018-10-16 19:21:29',NULL),(61,0,1,3,0,'2018-10-16 19:21:29',NULL),(62,1,0,4,0,'2018-10-16 19:21:29',NULL),(63,1,0,3,0,'2018-10-16 19:21:29',NULL),(64,0,1,2,0,'2018-10-16 19:21:29',NULL),(65,0,1,1,0,'2018-10-16 19:21:29',NULL),(66,0,1,5,0,'2018-10-16 19:21:29',NULL),(67,0,1,4,0,'2018-10-16 19:21:29',NULL),(68,1,0,6,0,'2018-10-16 19:21:29',NULL),(69,0,1,7,0,'2018-10-16 19:21:29',NULL),(70,1,0,8,0,'2018-10-16 19:21:29',NULL),(71,0,1,9,0,'2018-10-16 19:21:29',NULL),(72,1,0,10,0,'2018-10-16 19:21:29',NULL),(73,0,1,11,0,'2018-10-16 19:21:29',NULL),(74,1,0,12,0,'2018-10-16 19:21:30',NULL),(75,0,1,13,0,'2018-10-16 19:21:30',NULL),(76,1,0,1,0,'2018-10-16 19:21:30',NULL),(77,0,1,14,0,'2018-10-16 19:21:30',NULL),(78,1,0,15,0,'2018-10-16 19:21:30',NULL),(79,0,1,16,0,'2018-10-16 19:21:30',NULL),(80,1,0,10,0,'2018-10-16 19:21:30',NULL),(81,0,1,11,0,'2018-10-16 19:21:30',NULL),(82,1,0,12,0,'2018-10-16 19:21:30',NULL),(83,0,1,13,0,'2018-10-16 19:21:30',NULL),(84,0,1,17,0,'2018-10-16 19:21:30',NULL),(85,0,1,18,0,'2018-10-16 19:21:30',NULL),(86,1,0,1,0,'2018-10-16 19:23:37',NULL),(87,0,1,1,0,'2018-10-16 19:23:37',NULL),(88,1,0,2,0,'2018-10-16 19:23:37',NULL),(89,0,1,3,0,'2018-10-16 19:23:37',NULL),(90,1,0,4,0,'2018-10-16 19:23:37',NULL),(91,1,0,3,0,'2018-10-16 19:23:37',NULL),(92,0,1,2,0,'2018-10-16 19:23:37',NULL),(93,0,1,1,0,'2018-10-16 19:23:37',NULL),(94,1,0,1,0,'2018-10-16 19:23:37',NULL),(95,0,1,1,0,'2018-10-16 19:23:38',NULL),(96,1,0,2,0,'2018-10-16 19:23:38',NULL),(97,0,1,3,0,'2018-10-16 19:23:38',NULL),(98,1,0,4,0,'2018-10-16 19:23:38',NULL),(99,1,0,3,0,'2018-10-16 19:23:38',NULL),(100,0,1,2,0,'2018-10-16 19:23:38',NULL),(101,0,1,1,0,'2018-10-16 19:23:38',NULL),(102,0,1,5,0,'2018-10-16 19:23:38',NULL),(103,0,1,4,0,'2018-10-16 19:23:38',NULL),(104,1,0,6,0,'2018-10-16 19:23:38',NULL),(105,0,1,7,0,'2018-10-16 19:23:38',NULL),(106,1,0,8,0,'2018-10-16 19:23:38',NULL),(107,0,1,9,0,'2018-10-16 19:23:38',NULL),(108,1,0,10,0,'2018-10-16 19:23:38',NULL),(109,0,1,11,0,'2018-10-16 19:23:38',NULL),(110,1,0,12,0,'2018-10-16 19:23:38',NULL),(111,0,1,13,0,'2018-10-16 19:23:38',NULL),(112,1,0,1,0,'2018-10-16 19:23:38',NULL),(113,1,0,1,0,'2018-10-16 19:23:39',NULL),(114,0,1,2,0,'2018-10-16 19:23:39',NULL),(115,0,1,16,0,'2018-10-16 19:23:39',NULL),(116,1,0,10,0,'2018-10-16 19:23:39',NULL),(117,0,1,11,0,'2018-10-16 19:23:39',NULL),(118,1,0,12,0,'2018-10-16 19:23:39',NULL),(119,0,1,13,0,'2018-10-16 19:23:39',NULL),(120,0,1,17,0,'2018-10-16 19:23:39',NULL),(121,0,1,18,0,'2018-10-16 19:23:39',NULL),(122,1,0,19,0,'2018-10-16 19:23:39',NULL),(123,0,1,7,0,'2018-10-16 19:23:39',NULL),(124,1,0,20,0,'2018-10-16 19:23:39',NULL),(125,0,1,9,0,'2018-10-16 19:23:39',NULL),(126,1,0,18,0,'2018-10-16 19:23:39',NULL),(127,0,1,11,0,'2018-10-16 19:23:39',NULL),(128,1,0,7,0,'2018-10-16 19:23:39',NULL),(129,0,1,21,0,'2018-10-16 19:23:39',NULL),(130,1,0,13,0,'2018-10-16 19:23:40',NULL),(131,1,0,13,0,'2018-10-16 19:23:40',NULL),(132,1,0,22,0,'2018-10-16 19:23:40',NULL),(133,0,1,23,0,'2018-10-16 19:23:40',NULL),(134,1,0,10,0,'2018-10-16 19:23:40',NULL),(135,0,1,11,0,'2018-10-16 19:23:40',NULL),(136,1,0,12,0,'2018-10-16 19:23:40',NULL),(137,0,1,13,0,'2018-10-16 19:23:50',NULL),(138,0,1,17,0,'2018-10-16 19:23:50',NULL),(139,0,1,18,0,'2018-10-16 19:23:50',NULL),(140,1,0,1,0,'2018-10-16 19:23:53',NULL),(141,0,1,1,0,'2018-10-16 19:23:53',NULL),(142,1,0,2,0,'2018-10-16 19:23:53',NULL),(143,0,1,3,0,'2018-10-16 19:23:53',NULL),(144,1,0,4,0,'2018-10-16 19:23:53',NULL),(145,1,0,3,0,'2018-10-16 19:23:53',NULL),(146,0,1,2,0,'2018-10-16 19:23:53',NULL),(147,0,1,1,0,'2018-10-16 19:23:53',NULL),(148,1,0,1,0,'2018-10-16 19:23:53',NULL),(149,0,1,1,0,'2018-10-16 19:23:53',NULL),(150,1,0,2,0,'2018-10-16 19:23:53',NULL),(151,0,1,3,0,'2018-10-16 19:23:54',NULL),(152,1,0,4,0,'2018-10-16 19:23:54',NULL),(153,1,0,3,0,'2018-10-16 19:23:54',NULL),(154,0,1,2,0,'2018-10-16 19:23:54',NULL),(155,0,1,1,0,'2018-10-16 19:23:54',NULL),(156,0,1,5,0,'2018-10-16 19:23:54',NULL),(157,0,1,4,0,'2018-10-16 19:23:54',NULL),(158,1,0,6,0,'2018-10-16 19:23:54',NULL),(159,0,1,7,0,'2018-10-16 19:23:54',NULL),(160,1,0,8,0,'2018-10-16 19:23:54',NULL),(161,0,1,9,0,'2018-10-16 19:23:54',NULL),(162,1,0,10,0,'2018-10-16 19:23:54',NULL),(163,0,1,11,0,'2018-10-16 19:23:54',NULL),(164,1,0,12,0,'2018-10-16 19:23:54',NULL),(165,0,1,13,0,'2018-10-16 19:23:54',NULL),(166,1,0,1,0,'2018-10-16 19:23:54',NULL),(167,1,0,1,0,'2018-10-16 19:23:54',NULL),(168,0,1,2,0,'2018-10-16 19:23:54',NULL),(169,0,1,16,0,'2018-10-16 19:23:54',NULL),(170,1,0,10,0,'2018-10-16 19:23:55',NULL),(171,0,1,11,0,'2018-10-16 19:23:55',NULL),(172,1,0,12,0,'2018-10-16 19:23:55',NULL),(173,0,1,13,0,'2018-10-16 19:23:55',NULL),(174,0,1,17,0,'2018-10-16 19:23:55',NULL),(175,0,1,18,0,'2018-10-16 19:23:55',NULL),(176,1,0,19,0,'2018-10-16 19:23:55',NULL),(177,0,1,7,0,'2018-10-16 19:23:55',NULL),(178,1,0,20,0,'2018-10-16 19:23:55',NULL),(179,0,1,9,0,'2018-10-16 19:23:55',NULL),(180,1,0,18,0,'2018-10-16 19:23:55',NULL),(181,0,1,11,0,'2018-10-16 19:23:55',NULL),(182,1,0,7,0,'2018-10-16 19:23:55',NULL),(183,0,1,21,0,'2018-10-16 19:23:55',NULL),(184,1,0,13,0,'2018-10-16 19:23:55',NULL),(185,1,0,13,0,'2018-10-16 19:23:55',NULL),(186,1,0,22,0,'2018-10-16 19:23:55',NULL),(187,0,1,23,0,'2018-10-16 19:23:55',NULL),(188,1,0,10,0,'2018-10-16 19:23:56',NULL),(189,0,1,11,0,'2018-10-16 19:23:56',NULL),(190,1,0,12,0,'2018-10-16 19:23:56',NULL),(191,0,1,13,0,'2018-10-16 19:23:57',NULL),(192,0,1,17,0,'2018-10-16 19:23:58',NULL),(193,0,1,18,0,'2018-10-16 19:23:58',NULL),(194,1,0,1,0,'2018-10-16 19:24:00',NULL),(195,0,1,1,0,'2018-10-16 19:24:00',NULL),(196,1,0,2,0,'2018-10-16 19:24:00',NULL),(197,0,1,3,0,'2018-10-16 19:24:00',NULL),(198,1,0,4,0,'2018-10-16 19:24:00',NULL),(199,1,0,3,0,'2018-10-16 19:24:01',NULL),(200,0,1,2,0,'2018-10-16 19:24:01',NULL),(201,0,1,1,0,'2018-10-16 19:24:01',NULL),(202,1,0,1,0,'2018-10-16 19:24:01',NULL),(203,0,1,1,0,'2018-10-16 19:24:01',NULL),(204,1,0,2,0,'2018-10-16 19:24:01',NULL),(205,0,1,3,0,'2018-10-16 19:24:01',NULL),(206,1,0,4,0,'2018-10-16 19:24:01',NULL),(207,1,0,3,0,'2018-10-16 19:24:01',NULL),(208,0,1,2,0,'2018-10-16 19:24:01',NULL),(209,0,1,1,0,'2018-10-16 19:24:01',NULL),(210,0,1,5,0,'2018-10-16 19:24:01',NULL),(211,0,1,4,0,'2018-10-16 19:24:01',NULL),(212,1,0,6,0,'2018-10-16 19:24:01',NULL),(213,0,1,7,0,'2018-10-16 19:24:01',NULL),(214,1,0,8,0,'2018-10-16 19:24:01',NULL),(215,0,1,9,0,'2018-10-16 19:24:01',NULL),(216,1,0,10,0,'2018-10-16 19:24:01',NULL),(217,0,1,11,0,'2018-10-16 19:24:02',NULL),(218,1,0,12,0,'2018-10-16 19:24:02',NULL),(219,0,1,13,0,'2018-10-16 19:24:02',NULL),(220,1,0,1,0,'2018-10-16 19:24:02',NULL),(221,1,0,1,0,'2018-10-16 19:24:02',NULL),(222,0,1,2,0,'2018-10-16 19:24:02',NULL),(223,0,1,16,0,'2018-10-16 19:24:02',NULL),(224,1,0,10,0,'2018-10-16 19:24:02',NULL),(225,0,1,11,0,'2018-10-16 19:24:02',NULL),(226,1,0,12,0,'2018-10-16 19:24:02',NULL),(227,0,1,13,0,'2018-10-16 19:24:02',NULL),(228,0,1,17,0,'2018-10-16 19:24:02',NULL),(229,0,1,18,0,'2018-10-16 19:24:02',NULL),(230,1,0,19,0,'2018-10-16 19:24:02',NULL),(231,0,1,7,0,'2018-10-16 19:24:02',NULL),(232,1,0,20,0,'2018-10-16 19:24:02',NULL),(233,0,1,9,0,'2018-10-16 19:24:02',NULL),(234,1,0,18,0,'2018-10-16 19:24:02',NULL),(235,0,1,11,0,'2018-10-16 19:24:02',NULL),(236,1,0,7,0,'2018-10-16 19:24:03',NULL),(237,0,1,21,0,'2018-10-16 19:24:03',NULL),(238,1,0,13,0,'2018-10-16 19:24:03',NULL),(239,1,0,13,0,'2018-10-16 19:24:03',NULL),(240,1,0,22,0,'2018-10-16 19:24:03',NULL),(241,0,1,23,0,'2018-10-16 19:24:03',NULL),(242,1,0,10,0,'2018-10-16 19:24:03',NULL),(243,0,1,11,0,'2018-10-16 19:24:03',NULL),(244,1,0,12,0,'2018-10-16 19:24:03',NULL),(245,0,1,13,0,'2018-10-16 19:24:05',NULL),(246,0,1,17,0,'2018-10-16 19:24:05',NULL),(247,0,1,18,0,'2018-10-16 19:24:05',NULL),(248,1,0,1,0,'2018-10-16 19:24:33',NULL),(249,0,1,1,0,'2018-10-16 19:24:33',NULL),(250,1,0,2,0,'2018-10-16 19:24:34',NULL),(251,0,1,3,0,'2018-10-16 19:24:34',NULL),(252,1,0,4,0,'2018-10-16 19:24:34',NULL),(253,1,0,3,0,'2018-10-16 19:24:34',NULL),(254,0,1,2,0,'2018-10-16 19:24:34',NULL),(255,0,1,1,0,'2018-10-16 19:24:34',NULL),(256,1,0,1,0,'2018-10-16 19:24:34',NULL),(257,0,1,1,0,'2018-10-16 19:24:34',NULL),(258,1,0,2,0,'2018-10-16 19:24:34',NULL),(259,0,1,3,0,'2018-10-16 19:24:34',NULL),(260,1,0,4,0,'2018-10-16 19:24:34',NULL),(261,1,0,3,0,'2018-10-16 19:24:34',NULL),(262,0,1,2,0,'2018-10-16 19:24:34',NULL),(263,0,1,1,0,'2018-10-16 19:24:34',NULL),(264,0,1,5,0,'2018-10-16 19:24:34',NULL),(265,0,1,4,0,'2018-10-16 19:24:34',NULL),(266,1,0,6,0,'2018-10-16 19:24:34',NULL),(267,0,1,7,0,'2018-10-16 19:24:34',NULL),(268,1,0,8,0,'2018-10-16 19:24:35',NULL),(269,0,1,9,0,'2018-10-16 19:24:35',NULL),(270,1,0,10,0,'2018-10-16 19:24:35',NULL),(271,0,1,11,0,'2018-10-16 19:24:35',NULL),(272,1,0,12,0,'2018-10-16 19:24:35',NULL),(273,0,1,13,0,'2018-10-16 19:24:35',NULL),(274,1,0,1,0,'2018-10-16 19:24:35',NULL),(275,1,0,1,0,'2018-10-16 19:24:35',NULL),(276,0,1,2,0,'2018-10-16 19:24:35',NULL),(277,0,1,16,0,'2018-10-16 19:24:35',NULL),(278,1,0,10,0,'2018-10-16 19:24:35',NULL),(279,0,1,11,0,'2018-10-16 19:24:35',NULL),(280,1,0,12,0,'2018-10-16 19:24:35',NULL),(281,0,1,13,0,'2018-10-16 19:24:35',NULL),(282,0,1,17,0,'2018-10-16 19:24:35',NULL),(283,0,1,18,0,'2018-10-16 19:24:35',NULL),(284,1,0,19,0,'2018-10-16 19:24:35',NULL),(285,0,1,7,0,'2018-10-16 19:24:35',NULL),(286,1,0,20,0,'2018-10-16 19:24:36',NULL),(287,0,1,9,0,'2018-10-16 19:24:36',NULL),(288,1,0,18,0,'2018-10-16 19:24:36',NULL),(289,0,1,11,0,'2018-10-16 19:24:36',NULL),(290,1,0,7,0,'2018-10-16 19:24:36',NULL),(291,0,1,21,0,'2018-10-16 19:24:36',NULL),(292,1,0,13,0,'2018-10-16 19:24:36',NULL),(293,1,0,13,0,'2018-10-16 19:24:36',NULL),(294,1,0,22,0,'2018-10-16 19:24:36',NULL),(295,0,1,23,0,'2018-10-16 19:24:36',NULL),(296,1,0,10,0,'2018-10-16 19:24:36',NULL),(297,0,1,11,0,'2018-10-16 19:24:36',NULL),(298,1,0,12,0,'2018-10-16 19:24:36',NULL),(299,0,1,13,0,'2018-10-16 19:24:49',NULL),(300,0,1,17,0,'2018-10-16 19:24:49',NULL),(301,0,1,18,0,'2018-10-16 19:24:49',NULL),(302,1,0,1,0,'2018-10-16 19:24:49',NULL),(303,0,1,1,0,'2018-10-16 19:24:49',NULL),(304,1,0,2,0,'2018-10-16 19:24:49',NULL),(305,0,1,3,0,'2018-10-16 19:24:49',NULL),(306,1,0,4,0,'2018-10-16 19:24:49',NULL),(307,1,0,3,0,'2018-10-16 19:24:49',NULL),(308,0,1,2,0,'2018-10-16 19:24:49',NULL),(309,0,1,1,0,'2018-10-16 19:24:49',NULL),(310,1,0,1,0,'2018-10-16 19:24:50',NULL),(311,0,1,1,0,'2018-10-16 19:24:50',NULL),(312,1,0,2,0,'2018-10-16 19:24:50',NULL),(313,0,1,3,0,'2018-10-16 19:24:50',NULL),(314,1,0,4,0,'2018-10-16 19:24:50',NULL),(315,1,0,3,0,'2018-10-16 19:24:50',NULL),(316,0,1,2,0,'2018-10-16 19:24:50',NULL),(317,0,1,1,0,'2018-10-16 19:24:50',NULL),(318,0,1,5,0,'2018-10-16 19:24:50',NULL),(319,0,1,4,0,'2018-10-16 19:24:50',NULL),(320,1,0,6,0,'2018-10-16 19:24:50',NULL),(321,0,1,7,0,'2018-10-16 19:24:50',NULL),(322,1,0,8,0,'2018-10-16 19:24:50',NULL),(323,0,1,9,0,'2018-10-16 19:24:50',NULL),(324,1,0,10,0,'2018-10-16 19:24:50',NULL),(325,0,1,11,0,'2018-10-16 19:24:50',NULL),(326,1,0,12,0,'2018-10-16 19:24:50',NULL),(327,0,1,13,0,'2018-10-16 19:24:50',NULL),(328,1,0,1,0,'2018-10-16 19:24:50',NULL),(329,1,0,1,0,'2018-10-16 19:24:51',NULL),(330,0,1,2,0,'2018-10-16 19:24:51',NULL),(331,0,1,16,0,'2018-10-16 19:24:51',NULL),(332,1,0,10,0,'2018-10-16 19:24:51',NULL),(333,0,1,11,0,'2018-10-16 19:24:51',NULL),(334,1,0,12,0,'2018-10-16 19:24:51',NULL),(335,0,1,13,0,'2018-10-16 19:24:51',NULL),(336,0,1,17,0,'2018-10-16 19:24:51',NULL),(337,0,1,18,0,'2018-10-16 19:24:51',NULL),(338,1,0,19,0,'2018-10-16 19:24:51',NULL),(339,0,1,7,0,'2018-10-16 19:24:51',NULL),(340,1,0,20,0,'2018-10-16 19:24:51',NULL),(341,0,1,9,0,'2018-10-16 19:24:51',NULL),(342,1,0,18,0,'2018-10-16 19:24:51',NULL),(343,0,1,11,0,'2018-10-16 19:24:51',NULL),(344,1,0,7,0,'2018-10-16 19:24:51',NULL),(345,0,1,21,0,'2018-10-16 19:24:51',NULL),(346,1,0,13,0,'2018-10-16 19:24:51',NULL),(347,1,0,13,0,'2018-10-16 19:24:51',NULL),(348,1,0,22,0,'2018-10-16 19:24:51',NULL),(349,0,1,23,0,'2018-10-16 19:24:52',NULL),(350,1,0,10,0,'2018-10-16 19:24:52',NULL),(351,0,1,11,0,'2018-10-16 19:24:52',NULL),(352,1,0,12,0,'2018-10-16 19:24:52',NULL),(353,0,1,13,0,'2018-10-16 19:24:52',NULL),(354,0,1,17,0,'2018-10-16 19:24:52',NULL),(355,0,1,18,0,'2018-10-16 19:24:52',NULL),(356,0,1,24,0,'2018-10-16 19:25:09',NULL),(357,0,1,12,0,'2018-10-16 19:25:09',NULL),(358,0,1,24,0,'2018-10-16 19:25:10',NULL),(359,0,1,12,0,'2018-10-16 19:25:10',NULL),(360,0,1,24,0,'2018-10-16 19:25:11',NULL),(361,0,1,12,0,'2018-10-16 19:25:11',NULL);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `players` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `games_total` int(11) NOT NULL DEFAULT '0',
  `games_won` int(11) NOT NULL DEFAULT '0',
  `games_lost` int(11) NOT NULL DEFAULT '0',
  `games_win_lost` float DEFAULT NULL,
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'test1',183,91,92,49.7268,'2018-10-16 19:18:44','2018-10-17 18:03:43',5),(2,'Test2',202,105,97,51.9802,'2018-10-16 19:18:45','2018-10-16 19:25:11',0),(3,'Test3',110,62,48,56.3636,'2018-10-16 19:19:19','2018-10-16 19:24:52',0),(4,'Test4',42,17,25,40.4762,'2018-10-16 19:19:54','2018-10-16 19:24:52',0),(5,'Test5',28,23,5,82.1429,'2018-10-16 19:21:29','2018-10-16 19:24:52',0),(6,'Test6',48,15,33,31.25,'2018-10-16 19:21:29','2018-10-16 19:24:52',0),(7,'Test7',29,23,6,79.3103,'2018-10-16 19:21:29','2018-10-16 19:25:11',0),(8,'Test8',43,10,33,23.2558,'2018-10-16 19:21:29','2018-10-16 19:24:52',0),(9,'Test9',11,0,11,0,'2018-10-16 19:21:30','2018-10-16 19:24:52',0),(10,'schwiddi',26,15,11,57.6923,'2018-10-16 19:21:30','2018-10-17 18:03:38',1);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `settings` (
  `key_id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value_int` int(11) DEFAULT NULL,
  `ts_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `key_UNIQUE` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'stats_last_calc_game',361,'2018-10-16 19:25:11');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `p_tot_g` int(11) DEFAULT '0',
  `p_loss_g` int(11) DEFAULT '0',
  `p_won_g` int(11) DEFAULT '0',
  `p_win_percent` float DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `playerid_UNIQUE` (`playerid`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,1,183,92,91,49.7268),(2,2,202,97,105,51.9802),(3,3,110,48,62,56.3636),(4,4,42,25,17,40.4762),(5,5,28,5,23,82.1429),(6,6,48,33,15,31.25),(7,7,29,6,23,79.3103),(8,8,43,33,10,23.2558),(9,9,11,11,0,0),(10,10,26,11,15,57.6923);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(1024) NOT NULL DEFAULT '',
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ts_lastlogin` timestamp NULL DEFAULT NULL,
  `isAdmin` tinyint(4) NOT NULL DEFAULT '0',
  `canAddGame` tinyint(4) NOT NULL DEFAULT '0',
  `isApproved` tinyint(4) NOT NULL DEFAULT '0',
  `claimedPlayerId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idusers_UNIQUE` (`id`),
  UNIQUE KEY `usermail_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'schwiddi','schwiddi@me.com','$2b$10$klROO8em03BCzowbc8pUDu07jNSqnmvICcJ1BUMoT5HmysXb6YzAa','2018-10-16 16:46:14','2018-10-17 18:06:41','2018-10-17 18:06:41',1,1,1,10),(5,'test1','test1@me.com','$2b$10$.qa.RjJPXArY5.OtuWqxpODvDgqf8l40DsHwNkpiggudpPH9D.A4e','2018-10-16 22:24:41','2018-10-17 18:06:33','2018-10-17 18:06:33',0,0,1,1),(6,'test2','test2@me.com','$2b$10$J7ThkP0/5FoL1qv6tr86aerdZ2e9G45L1oRrH64417VOyrYNkjuh2','2018-10-17 18:02:47','2018-10-17 18:04:37','2018-10-17 18:03:18',0,0,1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'r21'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `AddGame`(IN playerA_p VARCHAR(50), IN playerB_p VARCHAR(50), IN scoreplayerA_p VARCHAR(1), IN scoreplayerB_p VARCHAR(1))
BEGIN
	SET @playerA_id = '0';
	SET @playerB_id = '0';
	SELECT id INTO @playerA_id FROM players p WHERE p.`name` = playerA_p;
	SELECT id INTO @playerB_id FROM players p WHERE p.`name` = playerB_p;
	IF @playerA_id = '0' THEN
    	INSERT INTO players (name) VALUES (playerA_p);
    	SET @playerA_id := LAST_INSERT_ID();
    END IF;

    IF @playerB_id = '0' THEN
    	INSERT INTO players (name) VALUES (playerB_p);
    	SET @playerB_id := LAST_INSERT_ID();
    END IF;





	/* then get encouters id, when not exist add */
    SET @encounter_id_a = '0';
    SET @encounter_id_b = '0';
    SELECT id INTO @encounter_id_a FROM encounters WHERE playerA_id = @playerA_id AND playerB_id = @playerB_id;
	SELECT id INTO @encounter_id_b FROM encounters WHERE playerA_id = @playerB_id AND playerB_id = @playerA_id;
	IF ( @encounter_id_a = '0' AND @encounter_id_b = '0') THEN
    	INSERT INTO encounters (`playerA_id`, `playerB_id`) VALUES (@playerA_id, @playerB_id);
    	SET @encounter_id_a := LAST_INSERT_ID();
	END IF;


	/* add the game with the corespoding id's */
	/* check if all is set */
	IF @encounter_id_a <> '0' THEN
      INSERT INTO games (`scoreplayerA`,`scoreplayerB`,`encounter_id`) VALUES (scoreplayerA_p, scoreplayerB_p, @encounter_id_a);
      SET @gameid := LAST_INSERT_ID();
    END IF;
	IF @encounter_id_b <> '0' THEN
      INSERT INTO games (`scoreplayerA`,`scoreplayerB`,`encounter_id`) VALUES (scoreplayerB_p, scoreplayerA_p, @encounter_id_b);
      SET @gameid := LAST_INSERT_ID();
    END IF;
    IF @gameid <> '0' THEN
    	SELECT g.`id`, a.`name` AS 'playerA', b.`name` AS 'playerB', g.`scoreplayerA`, g.`scoreplayerB`,g.`isApproved`,g.`encounter_id`, g.`ts_insert`, g.`ts_update`
		FROM games g
		LEFT JOIN encounters as e
			ON g.encounter_id = e.id
		LEFT JOIN players AS a
			ON e.playerA_id = a.id
		LEFT JOIN players AS b
			ON e.playerB_id = b.id
		WHERE g.id = @gameid;
    END IF;
    
    /* raise games_total for playerA */
	IF @playerA_id <> '0' THEN
		UPDATE players p SET p.games_total = p.games_total + 1 WHERE p.id = @playerA_id;
    END IF;

    /* raise games_total for playerB */
	IF @playerB_id <> '0' THEN
		UPDATE players p SET p.games_total = p.games_total + 1 WHERE p.id = @playerB_id;
    END IF;
    
    
    
    
    
    /* raise games_won and games_lost from both players */
    /* if scoreplayerA is greater then scoreplayerB
		then raise games_won from playerA and raise games_lost playerB otherwhise do oposit */
	IF scoreplayerA_p > scoreplayerB_p THEN
		UPDATE players p SET p.games_won = p.games_won + 1 WHERE p.id = @playerA_id;
        UPDATE players p SET p.games_lost = p.games_lost + 1 WHERE p.id = @playerB_id;
	ELSE
		UPDATE players p SET p.games_won = p.games_won + 1 WHERE p.id = @playerB_id;
        UPDATE players p SET p.games_lost = p.games_lost + 1 WHERE p.id = @playerA_id;
    END IF;
    
    /* now calculate ratio and write */
    /* handle player A */
    UPDATE players p SET p.games_win_lost = ( games_won / games_total ) * 100 WHERE p.id = @playerA_id;
    
    /* handle player B */
    UPDATE players p SET p.games_win_lost = ( games_won / games_total ) * 100 WHERE p.id = @playerB_id;

	CALL CalcStats;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddGameWithDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `AddGameWithDate`(IN playerA_p VARCHAR(50), IN playerB_p VARCHAR(50), IN scoreplayerA_p VARCHAR(1), IN scoreplayerB_p VARCHAR(1), IN date_p VARCHAR(20))
BEGIN
	SET @playerA_id = '0';
	SET @playerB_id = '0';
	SELECT id INTO @playerA_id FROM players p WHERE p.`name` = playerA_p;
	SELECT id INTO @playerB_id FROM players p WHERE p.`name` = playerB_p;
	IF @playerA_id = '0' THEN
    	INSERT INTO players (name) VALUES (playerA_p);
    	SET @playerA_id := LAST_INSERT_ID();
    END IF;

    IF @playerB_id = '0' THEN
    	INSERT INTO players (name) VALUES (playerB_p);
    	SET @playerB_id := LAST_INSERT_ID();
    END IF;





	/* then get encouters id, when not exist add */
	SET @encounter_id = '0';
	SELECT id INTO @encounter_id FROM encounters WHERE playerA_id = @playerA_id AND playerB_id = @playerB_id;
	IF @encounter_id = '0' THEN
    	INSERT INTO encounters (`playerA_id`, `playerB_id`) VALUES (@playerA_id, @playerB_id);
    	SET @encounter_id := LAST_INSERT_ID();
    END IF;


	/* add the game with the corespoding id's */
	/* check if all is set */
	IF @encounter_id <> '0' THEN
      INSERT INTO games (`scoreplayerA`,`scoreplayerB`,`encounter_id`,`ts_insert` ) VALUES (scoreplayerA_p, scoreplayerB_p, @encounter_id, STR_TO_DATE(date_p, '%d.%m.%Y'));
      SET @gameid := LAST_INSERT_ID();
    END IF;
    IF @gameid <> '0' THEN
    	SELECT g.`id`, a.`name` AS 'playerA', b.`name` AS 'playerB', g.`scoreplayerA`, g.`scoreplayerB`,g.`isApproved`,g.`encounter_id`, g.`ts_insert`, g.`ts_update`
		FROM games g
		LEFT JOIN encounters as e
			ON g.encounter_id = e.id
		LEFT JOIN players AS a
			ON e.playerA_id = a.id
		LEFT JOIN players AS b
			ON e.playerB_id = b.id
		WHERE g.id = @gameid;
    END IF;
    
    /* raise games_total for playerA */
	IF @playerA_id <> '0' THEN
		UPDATE players p SET p.games_total = p.games_total + 1 WHERE p.id = @playerA_id;
    END IF;

    /* raise games_total for playerB */
	IF @playerB_id <> '0' THEN
		UPDATE players p SET p.games_total = p.games_total + 1 WHERE p.id = @playerB_id;
    END IF;
    
    
    
    
    
    /* raise games_won and games_lost from both players */
    /* if scoreplayerA is greater then scoreplayerB
		then raise games_won from playerA and raise games_lost playerB otherwhise do oposit */
	IF scoreplayerA_p > scoreplayerB_p THEN
		UPDATE players p SET p.games_won = p.games_won + 1 WHERE p.id = @playerA_id;
        UPDATE players p SET p.games_lost = p.games_lost + 1 WHERE p.id = @playerB_id;
	ELSE
		UPDATE players p SET p.games_won = p.games_won + 1 WHERE p.id = @playerB_id;
        UPDATE players p SET p.games_lost = p.games_lost + 1 WHERE p.id = @playerA_id;
    END IF;
    
    /* now calculate ratio and write */
    /* handle player A */
    UPDATE players p SET p.games_win_lost = ( games_won / games_total ) * 100 WHERE p.id = @playerA_id;
    
    /* handle player B */
    UPDATE players p SET p.games_win_lost = ( games_won / games_total ) * 100 WHERE p.id = @playerB_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `AddUser`(IN name_p VARCHAR(255), IN email_p VARCHAR(255), IN password_p VARCHAR(1024))
BEGIN
	INSERT INTO users (name, email, password)
	VALUES (name_p, email_p, password_p);
    SET @user_id := LAST_INSERT_ID();
    SELECT id, name, email FROM users WHERE id = @user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ApproveUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `ApproveUser`(IN user_p INT(11))
BEGIN
	SELECT isApproved INTO @state FROM users WHERE id = user_p;
    
    IF @state = 0 THEN
		UPDATE users SET isApproved = 1 WHERE id = user_p;
    END IF;
    IF @state = 1 THEN
		UPDATE users SET isApproved = 0 WHERE id = user_p;
    END IF;
    SELECT * FROM users u WHERE id = user_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalcStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `CalcStats`()
BEGIN
	/* first get the last calculated game from settings table */
    SET @last_calc_game = 0;
    SELECT value_int INTO @last_calc_game FROM settings s WHERE s.key LIKE "%stats_last_calc_game%";
    
    /* now find out how many games there actualy are */
	SET @games_count = 0;
    SELECT COUNT(*) INTO @games_count FROM games;
    
    /* initiate cursor */ 
    SET @cursor = @last_calc_game;
    
    /* and now you can check if the last calculated and the games count campare when not calc the shit out of it */
    WHILE @cursor < @games_count DO
		/* the default in settings table is 0 for the last calc game */
        /* so in order to use the cursor as a cursor we need to rause the cursor by one cause this is the next game we wanna process right? */
        SET @cursor = @cursor + 1;
        
        /*  hol dir nun die ids der players und schreib die mal in den stats table */
        SET @playerida = 0;
        SET @playeridb = 0;
        SELECT p.id INTO @playerida FROM games g JOIN encounters e ON g.encounter_id = e.id JOIN players p ON e.playerA_id = p.id WHERE g.id = @cursor ;
        SELECT p.id INTO @playeridb FROM games g JOIN encounters e ON g.encounter_id = e.id JOIN players p ON e.playerB_id = p.id WHERE g.id = @cursor ;
        
        
        IF NOT EXISTS(SELECT * FROM stats WHERE playerid = @playerida) THEN
			INSERT INTO stats (playerid) VALUES(@playerida);			
		END IF;
        
		IF NOT EXISTS(SELECT * FROM stats WHERE playerid = @playeridb) THEN
			INSERT INTO stats (playerid) VALUES(@playeridb);
		END IF;
        
        /* als nächstes raisen wir die totals von beiden playern */
		IF @playerida <> '0' THEN
			UPDATE stats s SET s.p_tot_g = s.p_tot_g + 1 WHERE s.playerid = @playerida;
		END IF;
        
		IF @playeridb <> '0' THEN
			UPDATE stats s SET s.p_tot_g = s.p_tot_g + 1 WHERE s.playerid = @playeridb;
		END IF;
        
        
        /* nun holen wir die scores der beiden playern und raisen wins beim winner und losses beim looser */
        SELECT scoreplayerA INTO @playerAscore FROM games g WHERE g.id = @cursor;
        SELECT scoreplayerB INTO @playerBscore FROM games g WHERE g.id = @cursor;
        IF @playerAscore > @playerBscore THEN
			UPDATE stats s SET s.p_won_g = s.p_won_g + 1 WHERE s.playerid = @playerida;
			UPDATE stats s SET s.p_loss_g = s.p_loss_g + 1 WHERE s.playerid = @playeridb;
		ELSE
			UPDATE stats s SET s.p_won_g = s.p_won_g + 1 WHERE s.playerid = @playeridb;
			UPDATE stats s SET s.p_loss_g = s.p_loss_g + 1 WHERE s.playerid = @playerida;
		END IF;
        
		/* und dann rechne von beiden playern den % wert neu und schreib diesen */
		UPDATE stats s SET s.p_win_percent = ( p_won_g / p_tot_g ) * 100 WHERE s.playerid = @playerida;
		UPDATE stats s SET s.p_win_percent = ( p_won_g / p_tot_g ) * 100 WHERE s.playerid = @playeridb;
        
        
        
		
        
        /* when all good with this record you're processing then update the settings table */
        UPDATE settings s SET s.value_int = @cursor WHERE s.key LIKE "%stats_last_calc_game%";
        
	END WHILE;
    
    
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckIfUserExist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `CheckIfUserExist`(IN email_p VARCHAR(255))
BEGIN
	SELECT u.id FROM users u WHERE u.email = email_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckMailAlreadyRegistered` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `CheckMailAlreadyRegistered`(IN email_p VARCHAR(255))
BEGIN
	SELECT u.id FROM users u WHERE u.email = email_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteAllGames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `DeleteAllGames`()
BEGIN
	DELETE FROM games;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `DeleteGame`(IN gameId_p INT(11))
BEGIN
	/* init some needed vars */
    SET @id_winner = '0';
    SET @id_looser = '0';
    SET @tmp_winnderfinder = '99';
    
    /* find the winner */
    SELECT g.scoreplayerA INTO @tmp_winnerfinder FROM games g WHERE g.id = gameId_p;
	
    IF @tmp_winnerfinder = '1' THEN
    	SELECT a.`id` INTO @id_winner FROM games g
			LEFT OUTER JOIN encounters as e
				ON g.encounter_id = e.id
			LEFT OUTER JOIN players AS a
				ON e.playerA_id = a.id
			LEFT OUTER JOIN players AS b
				ON e.playerB_id = b.id
			WHERE g.id = gameId_p;
		SELECT b.`id` INTO @id_looser FROM games g
			LEFT OUTER JOIN encounters as e
				ON g.encounter_id = e.id
			LEFT OUTER JOIN players AS a
				ON e.playerA_id = a.id
			LEFT OUTER JOIN players AS b
				ON e.playerB_id = b.id
			WHERE g.id = gameId_p;
	ELSE
    	SELECT b.`id` INTO @id_winner FROM games g
			LEFT OUTER JOIN encounters as e
				ON g.encounter_id = e.id
			LEFT OUTER JOIN players AS a
				ON e.playerA_id = a.id
			LEFT OUTER JOIN players AS b
				ON e.playerB_id = b.id
			WHERE g.id = gameId_p;
		SELECT a.`id` INTO @id_looser FROM games g
			LEFT OUTER JOIN encounters as e
				ON g.encounter_id = e.id
			LEFT OUTER JOIN players AS a
				ON e.playerA_id = a.id
			LEFT OUTER JOIN players AS b
				ON e.playerB_id = b.id
			WHERE g.id = gameId_p;
    END IF;    

    
    IF @id_winner <> '0' THEN
    	UPDATE players p SET p.games_won = p.games_won - 1 WHERE p.id = @id_winner;
        UPDATE players p SET p.games_total = p.games_total - 1 WHERE p.id = @id_winner;
        
        /* handle 0 games */
        SELECT p.games_total INTO @total_games_winner FROM players p WHERE p.id = @id_winner;
        IF @total_games_winner = '0' THEN
			UPDATE players p SET p.games_win_lost = 0 WHERE p.id = @id_winner;
		ELSE
			UPDATE players p SET p.games_win_lost = ( games_won / games_total ) * 100 WHERE p.id = @id_winner;
		END IF;
    END IF;
    
    IF @id_looser <> '0' THEN
    	UPDATE players p SET p.games_lost = p.games_lost - 1 WHERE p.id = @id_looser;
        UPDATE players p SET p.games_total = p.games_total - 1 WHERE p.id = @id_looser;
        
        /* handle 0 games */
        SELECT p.games_total INTO @total_games_looser FROM players p WHERE p.id = @id_looser;
        IF @total_games_looser = '0' THEN
			UPDATE players p SET p.games_win_lost = 0 WHERE p.id = @id_looser;
		ELSE
			UPDATE players p SET p.games_win_lost = ( games_won / games_total ) * 100 WHERE p.id = @id_looser;
		END IF;
    END IF;

    
	DELETE FROM games WHERE id = gameId_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllEncounters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetAllEncounters`()
BEGIN
	SELECT e.id,a.id AS 'playerA_id', a.name AS 'playerA_name', b.id AS 'playerB_id', b.name AS 'playerB_name'
	FROM encounters AS e
	INNER JOIN (SELECT * FROM players) AS a
		ON e.playerA_id=a.id
	INNER JOIN (SELECT * FROM players) AS b
		ON e.playerB_id=b.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllEncountersFromPlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetAllEncountersFromPlayer`(IN playerId_p INT(11))
BEGIN
	SELECT e.id,a.id AS 'playerA_id', a.name AS 'playerA_name', b.id AS 'playerB_id', b.name AS 'playerB_name'
	FROM encounters AS e
	INNER JOIN (SELECT * FROM players) AS a
		ON e.playerA_id=a.id
	INNER JOIN (SELECT * FROM players) AS b
		ON e.playerB_id=b.id
	WHERE a.id = playerId_p OR b.id = playerId_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllGames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetAllGames`()
BEGIN
SELECT g.`id`, a.`id` AS 'playerAid', a.`name` AS 'playerA', b.`id` AS 'playerBid', b.`name` AS 'playerB', g.`scoreplayerA`, g.`scoreplayerB`,g.`isApproved`, g.`ts_insert`, g.`ts_update`
	FROM games g
LEFT OUTER JOIN encounters as e
	ON g.encounter_id = e.id
LEFT OUTER JOIN players AS a
	ON e.playerA_id = a.id
LEFT OUTER JOIN players AS b
	ON e.playerB_id = b.id
ORDER BY g.`id` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPlayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetAllPlayers`()
BEGIN
	SELECT * FROM players p ORDER by name ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllRankedPlayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetAllRankedPlayers`()
BEGIN
	SELECT 
		*
	FROM
		players p
	WHERE
		p.games_total >= 20
	ORDER BY p.games_win_lost DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllUnrankedPlayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetAllUnrankedPlayers`()
BEGIN
	SELECT 
		*
	FROM
		players p
	WHERE
		p.games_total < 20
	ORDER BY p.name ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetAllUsers`()
BEGIN
	SELECT u.id AS id, p.id AS playerid, u.name AS name, u.email, u.isAdmin, u.canAddGame, u.isApproved, u.claimedPlayerId, p.games_total, p.games_won, p.games_lost, p.games_win_lost 
	FROM users u
	LEFT JOIN players p ON u.id = p.user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetGameById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetGameById`(IN id_p INT(11))
BEGIN
SELECT g.`id`, a.`name` AS 'playerA', b.`name` AS 'playerB', g.`scoreplayerA`, g.`scoreplayerB`,g.`isApproved`, g.`ts_insert`, g.`ts_update`
	FROM games g
LEFT OUTER JOIN encounters as e
	ON g.encounter_id = e.id
LEFT OUTER JOIN players AS a
	ON e.playerA_id = a.id
LEFT OUTER JOIN players AS b
	ON e.playerB_id = b.id
	WHERE g.id = id_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHashedPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetHashedPassword`(IN email_p VARCHAR(255))
BEGIN
	SELECT u.password FROM users u WHERE u.email = email_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPlayerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetPlayerId`(IN playerA CHAR(20))
BEGIN
  SELECT id FROM players
  WHERE name = playerA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUnclaimedPlayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetUnclaimedPlayers`()
BEGIN
	SELECT id, name FROM players WHERE user_id = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `GetUser`(IN email_p VARCHAR(255))
BEGIN    
    SELECT u.id, u.name, u.email, u.password, u.ts_insert, u.ts_update, u.ts_lastlogin, u.isAdmin, u.canAddGame, u.isApproved, u.claimedPlayerId, p.id AS playerid, p.games_total, p.games_won, p.games_lost, p.games_win_lost
    FROM users u
    LEFT JOIN players p
    ON u.id = p.user_id  WHERE u.email = email_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetClaimedPlayerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `SetClaimedPlayerId`(IN claim_p INT(11), IN user_p INT(11))
BEGIN
    UPDATE users SET claimedPlayerId = claim_p WHERE id = user_p;
    SELECT u.id, u.name, u.claimedPlayerId FROM users u WHERE id = user_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetLastLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `SetLastLogin`(IN email_p VARCHAR(255))
BEGIN
	UPDATE users u SET u.ts_lastlogin = NOW() WHERE u.email = email_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetPlayerIdToClaimedPlayerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `SetPlayerIdToClaimedPlayerId`(IN userid_p INT(11))
BEGIN
    UPDATE players SET user_id = (SELECT id FROM users WHERE id = userid_p)
	WHERE id = (SELECT claimedPlayerId FROM users WHERE id = userid_p);
    UPDATE players SET name = (SELECT name FROM users WHERE id = userid_p)
	WHERE id = (SELECT claimedPlayerId FROM users WHERE id = userid_p);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SwitchCanAddGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `SwitchCanAddGame`(IN user_p INT(11))
BEGIN
	SELECT canAddGame INTO @state FROM users WHERE id = user_p;
    
    IF @state = 0 THEN
		UPDATE users SET canAddGame = 1 WHERE id = user_p;
    END IF;
    IF @state = 1 THEN
		UPDATE users SET canAddGame = 0 WHERE id = user_p;
    END IF;
    SELECT * FROM users u WHERE id = user_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`r21`@`localhost` PROCEDURE `UpdateGame`(IN gameId_p INT(11), IN playerA_p VARCHAR(50), IN playerB_p VARCHAR(50), IN scoreplayerA_p INT(1), IN scoreplayerB_p INT(1))
BEGIN
	SET @playerA_id = '0';
	SET @playerB_id = '0';
	SELECT id INTO @playerA_id FROM players p WHERE p.`name` = playerA_p;
	SELECT id INTO @playerB_id FROM players p WHERE p.`name` = playerB_p;
	IF @playerA_id = '0' THEN
    	INSERT INTO players (name) VALUES (playerA_p);
    	SET @playerA_id := LAST_INSERT_ID();
    END IF;

    IF @playerB_id = '0' THEN
    	INSERT INTO players (name) VALUES (playerB_p);
    	SET @playerB_id := LAST_INSERT_ID();
    END IF;



	/* then get encouters id, when not exist add */
	SET @encounter_id = '0';
	SELECT id INTO @encounter_id FROM encounters WHERE playerA_id = @playerA_id AND playerB_id = @playerB_id;
	IF @encounter_id = '0' THEN
    	INSERT INTO encounters (`playerA_id`, `playerB_id`) VALUES (@playerA_id, @playerB_id);
    	SET @encounter_id := LAST_INSERT_ID();
    END IF;


	/* add the game with the corespoding id's */
	IF @encounter_id <> '0' THEN
	  UPDATE games g SET g.`encounter_id` = @encounter_id, g.`scoreplayerA` = scoreplayerA_p, g.`scoreplayerB` = scoreplayerB_p WHERE g.`id` = gameId_p;
    END IF;


    SELECT g.`id`, a.`name` AS 'playerA', b.`name` AS 'playerB', g.`scoreplayerA`, g.`scoreplayerB`,g.`isApproved`,g.`encounter_id`, g.`ts_insert`, g.`ts_update`
	FROM games g
	LEFT JOIN encounters as e
		ON g.encounter_id = e.id
	LEFT JOIN players AS a
		ON e.playerA_id = a.id
	LEFT JOIN players AS b
		ON e.playerB_id = b.id
	WHERE g.id = gameId_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-17 20:42:12
