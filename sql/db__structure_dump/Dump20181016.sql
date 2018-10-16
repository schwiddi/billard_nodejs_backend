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
INSERT INTO `settings` VALUES (1,'stats_last_calc_game',0,'2018-10-16 19:25:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'schwiddi','schwiddi@me.com','$2b$10$klROO8em03BCzowbc8pUDu07jNSqnmvICcJ1BUMoT5HmysXb6YzAa','2018-10-16 16:46:14','2018-10-16 16:47:43','2018-10-16 16:47:43',1,1,1,0);
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
    UPDATE users SET isApproved = 1 WHERE id = user_p;
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
	SELECT * FROM players p ORDER BY p.games_win_lost DESC;
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
	SELECT * FROM users u WHERE u.email = email_p;
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

-- Dump completed on 2018-10-16 21:36:08
