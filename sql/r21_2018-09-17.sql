# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Datenbank: r21
# Erstellt am: 2018-09-17 21:52:50 +0000
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
  `ts_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ts_lastlogin` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle players
# ------------------------------------------------------------

DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `games_total` int(11) NOT NULL DEFAULT '0',
  `games_won` int(11) NOT NULL DEFAULT '0',
  `games_lost` int(11) NOT NULL DEFAULT '0',
  `games_win_lost` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stats`;

CREATE TABLE `stats` (
  `idstats` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT '0',
  `p_tot_g` int(11) DEFAULT '0',
  `p_loss_g` int(11) DEFAULT '0',
  `p_won_g` int(11) DEFAULT '0',
  `p_win_percent` int(11) DEFAULT '0',
  PRIMARY KEY (`idstats`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Export von Tabelle users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `usermail` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `ts_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NULL DEFAULT NULL,
  `ts_lastlogin` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idusers_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




--
-- Dumping routines (PROCEDURE) for database 'r21'
--
DELIMITER ;;

# Dump of PROCEDURE AddGame
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `AddGame` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`r21`@`localhost`*/ /*!50003 PROCEDURE `AddGame`(IN playerA_p VARCHAR(50), IN playerB_p VARCHAR(50), IN scoreplayerA_p VARCHAR(1), IN scoreplayerB_p VARCHAR(1))
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
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE AddGameWithDate
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `AddGameWithDate` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `AddGameWithDate`(IN playerA_p VARCHAR(50), IN playerB_p VARCHAR(50), IN scoreplayerA_p VARCHAR(1), IN scoreplayerB_p VARCHAR(1), IN date_p VARCHAR(20))
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
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE CalcStats
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `CalcStats` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`r21`@`localhost`*/ /*!50003 PROCEDURE `CalcStats`()
BEGIN
	/* clear stats tabel */
    TRUNCATE stats;
    
    /* first write down all player ids */
	INSERT INTO stats (playerid) SELECT id FROM players;
    
    /* get all games from every player an write it to total */
    
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
/*!50003 CREATE*/ /*!50020 DEFINER=`schwitterdo`@`localhost`*/ /*!50003 PROCEDURE `DeleteGame`(IN gameId_p INT(11))
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
SELECT g.`id`, a.`id` AS 'playerAid', a.`name` AS 'playerA', b.`id` AS 'playerBid', b.`name` AS 'playerB', g.`scoreplayerA`, g.`scoreplayerB`,g.`isApproved`, g.`ts_insert`, g.`ts_update`
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
	SELECT * FROM players p ORDER BY p.games_win_lost DESC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE GetAllRankedPlayers
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetAllRankedPlayers` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`r21`@`localhost`*/ /*!50003 PROCEDURE `GetAllRankedPlayers`()
BEGIN
	SELECT 
		*
	FROM
		players p
	WHERE
		p.games_total >= 20
	ORDER BY p.games_win_lost DESC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE GetAllUnrankedPlayers
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetAllUnrankedPlayers` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`r21`@`localhost`*/ /*!50003 PROCEDURE `GetAllUnrankedPlayers`()
BEGIN
	SELECT 
		*
	FROM
		players p
	WHERE
		p.games_total < 20
	ORDER BY p.name ASC;
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
