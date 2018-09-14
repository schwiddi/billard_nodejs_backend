CREATE DATABASE  IF NOT EXISTS `r21` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `r21`;
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: r21
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `encounters`
--

DROP TABLE IF EXISTS `encounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `playerA_id` int(11) NOT NULL,
  `playerB_id` int(11) NOT NULL,
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scoreplayerA` int(2) NOT NULL DEFAULT '99',
  `scoreplayerB` int(2) NOT NULL DEFAULT '99',
  `encounter_id` int(11) NOT NULL,
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `games_total` int(11) NOT NULL DEFAULT '0',
  `games_won` int(11) NOT NULL DEFAULT '0',
  `games_lost` int(11) NOT NULL DEFAULT '0',
  `games_win_lost` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'r21'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`schwitterdo`@`localhost` PROCEDURE `AddGame`(IN playerA_p VARCHAR(50), IN playerB_p VARCHAR(50), IN scoreplayerA_p VARCHAR(1), IN scoreplayerB_p VARCHAR(1))
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
      INSERT INTO games (`scoreplayerA`,`scoreplayerB`,`encounter_id`) VALUES (scoreplayerA_p, scoreplayerB_p, @encounter_id);
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
/*!50003 DROP PROCEDURE IF EXISTS `DeleteAllGames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteAllGames`()
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`schwitterdo`@`localhost` PROCEDURE `DeleteGame`(IN gameId_p INT(11))
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEncounters`()
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEncountersFromPlayer`(IN playerId_p INT(11))
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllGames`()
BEGIN
SELECT g.`id`, a.`name` AS 'playerA', b.`name` AS 'playerB', g.`scoreplayerA`, g.`scoreplayerB`,g.`isApproved`, g.`ts_insert`, g.`ts_update`
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPlayers`()
BEGIN
	SELECT * FROM players p ORDER BY p.games_win_lost DESC;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGameById`(IN id_p INT(11))
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
/*!50003 DROP PROCEDURE IF EXISTS `GetPlayerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pi`@`localhost` PROCEDURE `GetPlayerId`(IN playerA CHAR(20))
BEGIN
  SELECT id FROM players
  WHERE name = playerA;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGame`(IN gameId_p INT(11), IN playerA_p VARCHAR(50), IN playerB_p VARCHAR(50), IN scoreplayerA_p INT(1), IN scoreplayerB_p INT(1))
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

-- Dump completed on 2018-09-14 13:55:07
