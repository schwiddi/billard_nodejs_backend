# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Datenbank: r21
# Erstellt am: 2018-09-08 05:31:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle encounters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `encounters`;

CREATE TABLE `encounters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `playerA_id` int(11) NOT NULL,
  `playerB_id` int(11) NOT NULL,
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle games
# ------------------------------------------------------------

DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scoreplayerA` int(2) NOT NULL DEFAULT '99',
  `scoreplayerB` int(2) NOT NULL DEFAULT '99',
  `encounter_id` int(11) NOT NULL,
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle players
# ------------------------------------------------------------

DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




--
-- Dumping routines (PROCEDURE) for database 'r21'
--
DELIMITER ;;

# Dump of PROCEDURE AddGame
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `AddGame` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `AddGame`(IN playerA_p VARCHAR(50), IN playerB_p VARCHAR(50), IN scoreplayerA_p VARCHAR(1), IN scoreplayerB_p VARCHAR(1))
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
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE DeleteAllGames
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `DeleteAllGames` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `DeleteAllGames`()
BEGIN
	DELETE FROM games;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE DeleteGame
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `DeleteGame` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `DeleteGame`(IN gameId_p INT(11))
BEGIN
	DELETE FROM games WHERE id = gameId_p;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE GetAllEncounters
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetAllEncounters` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GetAllEncounters`()
BEGIN
	SELECT e.id,a.id AS 'playerA_id', a.name AS 'playerA_name', b.id AS 'playerB_id', b.name AS 'playerB_name'
	FROM encounters AS e
	INNER JOIN (SELECT * FROM players) AS a
		ON e.playerA_id=a.id
	INNER JOIN (SELECT * FROM players) AS b
		ON e.playerB_id=b.id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE GetAllEncountersFromPlayer
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetAllEncountersFromPlayer` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GetAllEncountersFromPlayer`(IN playerId_p INT(11))
BEGIN
	SELECT e.id,a.id AS 'playerA_id', a.name AS 'playerA_name', b.id AS 'playerB_id', b.name AS 'playerB_name'
	FROM encounters AS e
	INNER JOIN (SELECT * FROM players) AS a
		ON e.playerA_id=a.id
	INNER JOIN (SELECT * FROM players) AS b
		ON e.playerB_id=b.id
	WHERE a.id = playerId_p OR b.id = playerId_p;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE GetAllGames
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetAllGames` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GetAllGames`()
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
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE GetAllPlayers
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetAllPlayers` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GetAllPlayers`()
BEGIN
	SELECT *
	FROM players
  ORDER BY name ASC;
END */;;


/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE GetGameById
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetGameById` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GetGameById`(IN id_p INT(11))
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
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE GetPlayerId
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetPlayerId` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`pi`@`localhost`*/ /*!50003 PROCEDURE `GetPlayerId`(IN playerA CHAR(20))
BEGIN
  SELECT id FROM players
  WHERE name = playerA;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE UpdateGame
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `UpdateGame` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `UpdateGame`(IN gameId_p INT(11), IN playerA_p VARCHAR(50), IN playerB_p VARCHAR(50), IN scoreplayerA_p INT(1), IN scoreplayerB_p INT(1))
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
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
