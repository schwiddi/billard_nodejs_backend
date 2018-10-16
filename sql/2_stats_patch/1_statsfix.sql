-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: r21statsfix
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

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'stats_last_calc_game',0,'2018-01-01 15:58:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'r21statsfix'
--

/*!50003 DROP PROCEDURE IF EXISTS `CalcStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
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
        SELECT p.id INTO @playerida FROM games g JOIN encounters e ON g.encounter_id = e.id AND g.id = @cursor JOIN players p ON e.playerA_id = p.id;
        SELECT p.id INTO @playeridb FROM games g JOIN encounters e ON g.encounter_id = e.id AND g.id = @cursor JOIN players p ON e.playerB_id = p.id;
        
        
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-16 18:10:35
