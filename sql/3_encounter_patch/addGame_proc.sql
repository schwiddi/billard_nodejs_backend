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
END