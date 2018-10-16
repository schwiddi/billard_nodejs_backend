/*!50003 DROP PROCEDURE IF EXISTS `encounterfix_correct_games` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `encounterfix_correct_games`()
BEGIN
    SET @last_calc_game = 0;
	SET @games_count = 0;
    
    SELECT COUNT(*) INTO @games_count FROM games;
    
    SET @cursor = @last_calc_game;
    
    WHILE @cursor < @games_count DO
		SET @cursor = @cursor + 1;
        /* als erstes switched du die resultate der betroffenen encounter */
        IF EXISTS(SELECT * FROM games WHERE encounter_id IN (6,7,8,11,12,13,15,19,21,24,26,29,38,40,41,43,46,49) AND id = @cursor) THEN
			SELECT scoreplayerA INTO @scoreplayerA FROM games WHERE id = @cursor;
            SELECT scoreplayerB INTO @scoreplayerB FROM games WHERE id = @cursor;
            
            UPDATE games SET scoreplayerA = @scoreplayerB WHERE id = @cursor;
            UPDATE games SET scoreplayerB = @scoreplayerA WHERE id = @cursor;
		END IF;
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
