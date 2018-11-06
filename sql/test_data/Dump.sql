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
-- Dumping data for table `encounters`
--

LOCK TABLES `encounters` WRITE;
/*!40000 ALTER TABLE `encounters` DISABLE KEYS */;
INSERT INTO `encounters` VALUES (1,1,2,'2018-10-16 19:18:45',NULL),(2,2,3,'2018-10-16 19:19:19',NULL),(3,1,3,'2018-10-16 19:19:54',NULL),(4,4,1,'2018-10-16 19:19:54',NULL),(5,4,2,'2018-10-16 19:20:45',NULL),(6,5,2,'2018-10-16 19:21:29',NULL),(7,6,2,'2018-10-16 19:21:29',NULL),(8,7,3,'2018-10-16 19:21:29',NULL),(9,8,3,'2018-10-16 19:21:29',NULL),(10,5,1,'2018-10-16 19:21:29',NULL),(11,6,1,'2018-10-16 19:21:29',NULL),(12,7,2,'2018-10-16 19:21:30',NULL),(13,8,2,'2018-10-16 19:21:30',NULL),(14,2,2,'2018-10-16 19:21:30',NULL),(15,3,3,'2018-10-16 19:21:30',NULL),(16,4,3,'2018-10-16 19:21:30',NULL),(17,9,2,'2018-10-16 19:21:30',NULL),(18,10,1,'2018-10-16 19:21:30',NULL),(19,10,2,'2018-10-16 19:23:39',NULL),(20,10,3,'2018-10-16 19:23:39',NULL),(21,8,6,'2018-10-16 19:23:39',NULL),(22,3,5,'2018-10-16 19:23:40',NULL),(23,4,6,'2018-10-16 19:23:40',NULL),(24,7,1,'2018-10-16 19:25:09',NULL),(25,11,10,'2018-10-17 21:37:32',NULL),(26,11,1,'2018-11-05 21:38:15',NULL),(27,6,10,'2018-11-05 22:54:57',NULL),(28,11,12,'2018-11-05 22:55:26',NULL),(29,9,11,'2018-11-05 23:00:00',NULL),(30,13,14,'2018-11-05 23:15:37',NULL),(31,14,10,'2018-11-05 23:39:37',NULL);
/*!40000 ALTER TABLE `encounters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,1,0,1,0,'2018-10-16 19:18:45',NULL,NULL,NULL,NULL),(2,1,0,1,0,'2018-10-16 19:19:01',NULL,NULL,NULL,NULL),(3,0,1,1,0,'2018-10-16 19:19:01',NULL,NULL,NULL,NULL),(4,1,0,1,0,'2018-10-16 19:19:19',NULL,NULL,NULL,NULL),(5,0,1,1,0,'2018-10-16 19:19:19',NULL,NULL,NULL,NULL),(6,1,0,2,0,'2018-10-16 19:19:19',NULL,NULL,NULL,NULL),(7,1,0,2,0,'2018-10-16 19:19:19',NULL,NULL,NULL,NULL),(8,1,0,1,0,'2018-10-16 19:19:54',NULL,NULL,NULL,NULL),(9,0,1,1,0,'2018-10-16 19:19:54',NULL,NULL,NULL,NULL),(10,1,0,2,0,'2018-10-16 19:19:54',NULL,NULL,NULL,NULL),(11,0,1,3,0,'2018-10-16 19:19:54',NULL,NULL,NULL,NULL),(12,1,0,4,0,'2018-10-16 19:19:54',NULL,NULL,NULL,NULL),(13,1,0,3,0,'2018-10-16 19:19:54',NULL,NULL,NULL,NULL),(14,0,1,2,0,'2018-10-16 19:19:54',NULL,NULL,NULL,NULL),(15,0,1,1,0,'2018-10-16 19:19:54',NULL,NULL,NULL,NULL),(16,1,0,1,0,'2018-10-16 19:20:06',NULL,NULL,NULL,NULL),(17,0,1,1,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(18,1,0,2,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(19,0,1,3,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(20,1,0,4,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(21,1,0,3,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(22,0,1,2,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(23,0,1,1,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(24,1,0,1,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(25,0,1,1,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(26,1,0,2,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(27,0,1,3,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(28,1,0,4,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(29,1,0,3,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(30,0,1,2,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(31,0,1,1,0,'2018-10-16 19:20:07',NULL,NULL,NULL,NULL),(32,1,0,1,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(33,0,1,1,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(34,1,0,2,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(35,0,1,3,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(36,1,0,4,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(37,1,0,3,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(38,0,1,2,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(39,0,1,1,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(40,1,0,1,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(41,0,1,1,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(42,1,0,2,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(43,0,1,3,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(44,1,0,4,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(45,1,0,3,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(46,0,1,2,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(47,0,1,1,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(48,0,1,5,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(49,0,1,4,0,'2018-10-16 19:20:45',NULL,NULL,NULL,NULL),(50,1,0,1,0,'2018-10-16 19:21:28',NULL,NULL,NULL,NULL),(51,0,1,1,0,'2018-10-16 19:21:28',NULL,NULL,NULL,NULL),(52,1,0,2,0,'2018-10-16 19:21:28',NULL,NULL,NULL,NULL),(53,0,1,3,0,'2018-10-16 19:21:28',NULL,NULL,NULL,NULL),(54,1,0,4,0,'2018-10-16 19:21:28',NULL,NULL,NULL,NULL),(55,1,0,3,0,'2018-10-16 19:21:28',NULL,NULL,NULL,NULL),(56,0,1,2,0,'2018-10-16 19:21:28',NULL,NULL,NULL,NULL),(57,0,1,1,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(58,1,0,1,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(59,0,1,1,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(60,1,0,2,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(61,0,1,3,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(62,1,0,4,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(63,1,0,3,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(64,0,1,2,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(65,0,1,1,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(66,0,1,5,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(67,0,1,4,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(68,1,0,6,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(69,0,1,7,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(70,1,0,8,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(71,0,1,9,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(72,1,0,10,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(73,0,1,11,0,'2018-10-16 19:21:29',NULL,NULL,NULL,NULL),(74,1,0,12,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(75,0,1,13,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(76,1,0,1,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(77,0,1,14,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(78,1,0,15,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(79,0,1,16,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(80,1,0,10,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(81,0,1,11,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(82,1,0,12,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(83,0,1,13,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(84,0,1,17,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(85,0,1,18,0,'2018-10-16 19:21:30',NULL,NULL,NULL,NULL),(86,1,0,1,0,'2018-10-16 19:23:37',NULL,NULL,NULL,NULL),(87,0,1,1,0,'2018-10-16 19:23:37',NULL,NULL,NULL,NULL),(88,1,0,2,0,'2018-10-16 19:23:37',NULL,NULL,NULL,NULL),(89,0,1,3,0,'2018-10-16 19:23:37',NULL,NULL,NULL,NULL),(90,1,0,4,0,'2018-10-16 19:23:37',NULL,NULL,NULL,NULL),(91,1,0,3,0,'2018-10-16 19:23:37',NULL,NULL,NULL,NULL),(92,0,1,2,0,'2018-10-16 19:23:37',NULL,NULL,NULL,NULL),(93,0,1,1,0,'2018-10-16 19:23:37',NULL,NULL,NULL,NULL),(94,1,0,1,0,'2018-10-16 19:23:37',NULL,NULL,NULL,NULL),(95,0,1,1,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(96,1,0,2,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(97,0,1,3,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(98,1,0,4,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(99,1,0,3,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(100,0,1,2,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(101,0,1,1,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(102,0,1,5,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(103,0,1,4,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(104,1,0,6,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(105,0,1,7,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(106,1,0,8,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(107,0,1,9,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(108,1,0,10,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(109,0,1,11,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(110,1,0,12,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(111,0,1,13,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(112,1,0,1,0,'2018-10-16 19:23:38',NULL,NULL,NULL,NULL),(113,1,0,1,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(114,0,1,2,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(115,0,1,16,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(116,1,0,10,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(117,0,1,11,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(118,1,0,12,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(119,0,1,13,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(120,0,1,17,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(121,0,1,18,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(122,1,0,19,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(123,0,1,7,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(124,1,0,20,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(125,0,1,9,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(126,1,0,18,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(127,0,1,11,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(128,1,0,7,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(129,0,1,21,0,'2018-10-16 19:23:39',NULL,NULL,NULL,NULL),(130,1,0,13,0,'2018-10-16 19:23:40',NULL,NULL,NULL,NULL),(131,1,0,13,0,'2018-10-16 19:23:40',NULL,NULL,NULL,NULL),(132,1,0,22,0,'2018-10-16 19:23:40',NULL,NULL,NULL,NULL),(133,0,1,23,0,'2018-10-16 19:23:40',NULL,NULL,NULL,NULL),(134,1,0,10,0,'2018-10-16 19:23:40',NULL,NULL,NULL,NULL),(135,0,1,11,0,'2018-10-16 19:23:40',NULL,NULL,NULL,NULL),(136,1,0,12,0,'2018-10-16 19:23:40',NULL,NULL,NULL,NULL),(137,0,1,13,0,'2018-10-16 19:23:50',NULL,NULL,NULL,NULL),(138,0,1,17,0,'2018-10-16 19:23:50',NULL,NULL,NULL,NULL),(139,0,1,18,0,'2018-10-16 19:23:50',NULL,NULL,NULL,NULL),(140,1,0,1,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(141,0,1,1,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(142,1,0,2,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(143,0,1,3,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(144,1,0,4,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(145,1,0,3,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(146,0,1,2,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(147,0,1,1,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(148,1,0,1,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(149,0,1,1,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(150,1,0,2,0,'2018-10-16 19:23:53',NULL,NULL,NULL,NULL),(151,0,1,3,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(152,1,0,4,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(153,1,0,3,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(154,0,1,2,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(155,0,1,1,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(156,0,1,5,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(157,0,1,4,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(158,1,0,6,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(159,0,1,7,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(160,1,0,8,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(161,0,1,9,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(162,1,0,10,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(163,0,1,11,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(164,1,0,12,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(165,0,1,13,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(166,1,0,1,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(167,1,0,1,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(168,0,1,2,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(169,0,1,16,0,'2018-10-16 19:23:54',NULL,NULL,NULL,NULL),(170,1,0,10,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(171,0,1,11,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(172,1,0,12,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(173,0,1,13,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(174,0,1,17,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(175,0,1,18,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(176,1,0,19,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(177,0,1,7,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(178,1,0,20,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(179,0,1,9,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(180,1,0,18,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(181,0,1,11,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(182,1,0,7,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(183,0,1,21,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(184,1,0,13,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(185,1,0,13,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(186,1,0,22,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(187,0,1,23,0,'2018-10-16 19:23:55',NULL,NULL,NULL,NULL),(188,1,0,10,0,'2018-10-16 19:23:56',NULL,NULL,NULL,NULL),(189,0,1,11,0,'2018-10-16 19:23:56',NULL,NULL,NULL,NULL),(190,1,0,12,0,'2018-10-16 19:23:56',NULL,NULL,NULL,NULL),(191,0,1,13,0,'2018-10-16 19:23:57',NULL,NULL,NULL,NULL),(192,0,1,17,0,'2018-10-16 19:23:58',NULL,NULL,NULL,NULL),(193,0,1,18,0,'2018-10-16 19:23:58',NULL,NULL,NULL,NULL),(194,1,0,1,0,'2018-10-16 19:24:00',NULL,NULL,NULL,NULL),(195,0,1,1,0,'2018-10-16 19:24:00',NULL,NULL,NULL,NULL),(196,1,0,2,0,'2018-10-16 19:24:00',NULL,NULL,NULL,NULL),(197,0,1,3,0,'2018-10-16 19:24:00',NULL,NULL,NULL,NULL),(198,1,0,4,0,'2018-10-16 19:24:00',NULL,NULL,NULL,NULL),(199,1,0,3,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(200,0,1,2,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(201,0,1,1,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(202,1,0,1,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(203,0,1,1,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(204,1,0,2,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(205,0,1,3,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(206,1,0,4,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(207,1,0,3,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(208,0,1,2,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(209,0,1,1,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(210,0,1,5,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(211,0,1,4,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(212,1,0,6,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(213,0,1,7,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(214,1,0,8,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(215,0,1,9,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(216,1,0,10,0,'2018-10-16 19:24:01',NULL,NULL,NULL,NULL),(217,0,1,11,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(218,1,0,12,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(219,0,1,13,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(220,1,0,1,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(221,1,0,1,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(222,0,1,2,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(223,0,1,16,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(224,1,0,10,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(225,0,1,11,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(226,1,0,12,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(227,0,1,13,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(228,0,1,17,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(229,0,1,18,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(230,1,0,19,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(231,0,1,7,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(232,1,0,20,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(233,0,1,9,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(234,1,0,18,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(235,0,1,11,0,'2018-10-16 19:24:02',NULL,NULL,NULL,NULL),(236,1,0,7,0,'2018-10-16 19:24:03',NULL,NULL,NULL,NULL),(237,0,1,21,0,'2018-10-16 19:24:03',NULL,NULL,NULL,NULL),(238,1,0,13,0,'2018-10-16 19:24:03',NULL,NULL,NULL,NULL),(239,1,0,13,0,'2018-10-16 19:24:03',NULL,NULL,NULL,NULL),(240,1,0,22,0,'2018-10-16 19:24:03',NULL,NULL,NULL,NULL),(241,0,1,23,0,'2018-10-16 19:24:03',NULL,NULL,NULL,NULL),(242,1,0,10,0,'2018-10-16 19:24:03',NULL,NULL,NULL,NULL),(243,0,1,11,0,'2018-10-16 19:24:03',NULL,NULL,NULL,NULL),(244,1,0,12,0,'2018-10-16 19:24:03',NULL,NULL,NULL,NULL),(245,0,1,13,0,'2018-10-16 19:24:05',NULL,NULL,NULL,NULL),(246,0,1,17,0,'2018-10-16 19:24:05',NULL,NULL,NULL,NULL),(247,0,1,18,0,'2018-10-16 19:24:05',NULL,NULL,NULL,NULL),(248,1,0,1,0,'2018-10-16 19:24:33',NULL,NULL,NULL,NULL),(249,0,1,1,0,'2018-10-16 19:24:33',NULL,NULL,NULL,NULL),(250,1,0,2,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(251,0,1,3,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(252,1,0,4,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(253,1,0,3,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(254,0,1,2,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(255,0,1,1,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(256,1,0,1,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(257,0,1,1,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(258,1,0,2,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(259,0,1,3,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(260,1,0,4,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(261,1,0,3,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(262,0,1,2,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(263,0,1,1,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(264,0,1,5,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(265,0,1,4,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(266,1,0,6,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(267,0,1,7,0,'2018-10-16 19:24:34',NULL,NULL,NULL,NULL),(268,1,0,8,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(269,0,1,9,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(270,1,0,10,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(271,0,1,11,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(272,1,0,12,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(273,0,1,13,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(274,1,0,1,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(275,1,0,1,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(276,0,1,2,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(277,0,1,16,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(278,1,0,10,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(279,0,1,11,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(280,1,0,12,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(281,0,1,13,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(282,0,1,17,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(283,0,1,18,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(284,1,0,19,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(285,0,1,7,0,'2018-10-16 19:24:35',NULL,NULL,NULL,NULL),(286,1,0,20,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(287,0,1,9,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(288,1,0,18,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(289,0,1,11,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(290,1,0,7,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(291,0,1,21,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(292,1,0,13,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(293,1,0,13,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(294,1,0,22,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(295,0,1,23,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(296,1,0,10,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(297,0,1,11,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(298,1,0,12,0,'2018-10-16 19:24:36',NULL,NULL,NULL,NULL),(299,0,1,13,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(300,0,1,17,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(301,0,1,18,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(302,1,0,1,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(303,0,1,1,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(304,1,0,2,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(305,0,1,3,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(306,1,0,4,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(307,1,0,3,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(308,0,1,2,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(309,0,1,1,0,'2018-10-16 19:24:49',NULL,NULL,NULL,NULL),(310,1,0,1,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(311,0,1,1,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(312,1,0,2,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(313,0,1,3,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(314,1,0,4,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(315,1,0,3,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(316,0,1,2,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(317,0,1,1,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(318,0,1,5,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(319,0,1,4,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(320,1,0,6,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(321,0,1,7,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(322,1,0,8,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(323,0,1,9,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(324,1,0,10,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(325,0,1,11,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(326,1,0,12,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(327,0,1,13,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(328,1,0,1,0,'2018-10-16 19:24:50',NULL,NULL,NULL,NULL),(329,1,0,1,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(330,0,1,2,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(331,0,1,16,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(332,1,0,10,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(333,0,1,11,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(334,1,0,12,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(335,0,1,13,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(336,0,1,17,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(337,0,1,18,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(338,1,0,19,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(339,0,1,7,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(340,1,0,20,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(341,0,1,9,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(342,1,0,18,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(343,0,1,11,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(344,1,0,7,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(345,0,1,21,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(346,1,0,13,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(347,1,0,13,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(348,1,0,22,0,'2018-10-16 19:24:51',NULL,NULL,NULL,NULL),(349,0,1,23,0,'2018-10-16 19:24:52',NULL,NULL,NULL,NULL),(350,1,0,10,0,'2018-10-16 19:24:52',NULL,NULL,NULL,NULL),(351,0,1,11,0,'2018-10-16 19:24:52',NULL,NULL,NULL,NULL),(352,1,0,12,0,'2018-10-16 19:24:52',NULL,NULL,NULL,NULL),(353,0,1,13,0,'2018-10-16 19:24:52',NULL,NULL,NULL,NULL),(354,0,1,17,0,'2018-10-16 19:24:52',NULL,NULL,NULL,NULL),(355,0,1,18,0,'2018-10-16 19:24:52',NULL,NULL,NULL,NULL),(356,0,1,24,0,'2018-10-16 19:25:09',NULL,NULL,NULL,NULL),(357,0,1,12,0,'2018-10-16 19:25:09',NULL,NULL,NULL,NULL),(358,0,1,24,0,'2018-10-16 19:25:10',NULL,NULL,NULL,NULL),(359,0,1,12,0,'2018-10-16 19:25:10',NULL,NULL,NULL,NULL),(360,0,1,24,0,'2018-10-16 19:25:11',NULL,NULL,NULL,NULL),(361,0,1,12,0,'2018-10-16 19:25:11',NULL,NULL,NULL,NULL),(362,1,0,18,0,'2018-10-17 21:34:18',NULL,NULL,NULL,NULL),(363,1,0,25,0,'2018-10-17 21:37:32',NULL,NULL,NULL,NULL),(364,1,0,25,0,'2018-11-05 21:36:21',NULL,NULL,NULL,NULL),(365,1,0,3,0,'2018-11-05 21:37:05',NULL,NULL,NULL,NULL),(366,1,0,26,0,'2018-11-05 21:38:15',NULL,NULL,NULL,NULL),(367,1,0,27,0,'2018-11-05 22:54:57',NULL,NULL,NULL,NULL),(368,0,1,28,0,'2018-11-05 22:55:26',NULL,NULL,NULL,NULL),(369,0,1,29,0,'2018-11-05 23:00:00',NULL,NULL,NULL,NULL),(370,1,0,25,0,'2018-11-05 23:02:20',NULL,NULL,NULL,NULL),(371,1,0,30,0,'2018-11-05 23:15:37',NULL,NULL,NULL,NULL),(372,1,0,28,0,'2018-11-05 23:37:41',NULL,11,12,11),(373,1,0,31,0,'2018-11-05 23:39:37',NULL,14,14,14);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'test1',186,92,94,49.4624,'2018-10-16 19:18:44','2018-11-05 21:38:15',0),(2,'Test2',202,105,97,51.9802,'2018-10-16 19:18:45','2018-10-16 19:25:11',0),(3,'Test3',111,62,49,55.8559,'2018-10-16 19:19:19','2018-11-05 21:37:05',0),(4,'Test4',42,17,25,40.4762,'2018-10-16 19:19:54','2018-10-16 19:24:52',0),(5,'Test5',28,23,5,82.1429,'2018-10-16 19:21:29','2018-10-16 19:24:52',0),(6,'Test6',49,16,33,32.6531,'2018-10-16 19:21:29','2018-11-05 22:54:57',0),(7,'Test7',29,23,6,79.3103,'2018-10-16 19:21:29','2018-10-16 19:25:11',0),(8,'Test8',43,10,33,23.2558,'2018-10-16 19:21:29','2018-10-16 19:24:52',0),(9,'Test9',12,0,12,0,'2018-10-16 19:21:30','2018-11-05 23:00:00',0),(10,'schwiddi',32,16,16,50,'2018-10-16 19:21:30','2018-11-05 23:39:37',0),(11,'Hans',7,6,1,85.7143,'2018-10-17 21:37:31','2018-11-05 23:37:41',0),(12,'Mirta',2,1,1,50,'2018-11-05 22:55:26','2018-11-05 23:37:41',0),(13,'Johannes',1,1,0,100,'2018-11-05 23:15:37','2018-11-05 23:15:37',0),(14,'Bertrand',2,1,1,50,'2018-11-05 23:15:37','2018-11-05 23:39:37',0);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'stats_last_calc_game',373,'2018-11-05 23:39:37');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,1,186,94,92,49.4624),(2,2,202,97,105,51.9802),(3,3,111,49,62,55.8559),(4,4,42,25,17,40.4762),(5,5,28,5,23,82.1429),(6,6,49,33,16,32.6531),(7,7,29,6,23,79.3103),(8,8,43,33,10,23.2558),(9,9,12,12,0,0),(10,10,32,16,16,50),(11,11,7,1,6,85.7143),(12,12,2,1,1,50),(13,13,1,0,1,100),(14,14,2,1,1,50);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'schwiddi','schwiddi@me.com','$2b$10$klROO8em03BCzowbc8pUDu07jNSqnmvICcJ1BUMoT5HmysXb6YzAa','2018-10-16 16:46:14','2018-11-05 21:34:12','2018-11-05 21:34:12',1,1,1,10),(5,'test1','test1@me.com','$2b$10$.qa.RjJPXArY5.OtuWqxpODvDgqf8l40DsHwNkpiggudpPH9D.A4e','2018-10-16 22:24:41','2018-11-02 18:53:21','2018-10-17 18:06:33',0,0,0,0),(6,'test2','test2@me.com','$2b$10$J7ThkP0/5FoL1qv6tr86aerdZ2e9G45L1oRrH64417VOyrYNkjuh2','2018-10-17 18:02:47','2018-11-02 18:53:20','2018-10-17 18:03:18',0,0,0,0);
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

-- Dump completed on 2018-11-06  1:07:11
