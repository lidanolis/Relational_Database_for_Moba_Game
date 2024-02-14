USE	BBLMG
/*
	SQL-DATA MNANIPULATION LANGUAGE(DML) - [STUDENT 4]

	GROUP 14
	
	EAMON CHIN SAN HUI - TP059667
*/


-- QUESTION 1:List the names and battle points of all players with the highest battle points. Arrange the list alphabetically according to the names.

			 SELECT playerID,username AS Player_Name, Total_BP AS BattlePoints FROM Player 
			 ORDER BY Player_Name ASC, playerID ASC;

--QUESTION 2: Find the total number of games played by each player in "classic mode" on ‘15/3/2021’. List player names, and total number of played games. Sort your answer in descending order of total number of played games.
			/*EXECUTE FIRST-----------------------------------------------------------------------------------------------------------------------------------*/
			CREATE TABLE #classic (
				gamesID VARCHAR(4) NOT NULL,
				gamemodesID VARCHAR(5) NOT NULL,
				ltheroesID VARCHAR(5),
				CONSTRAINT classic_pk PRIMARY KEY (gamesID,ltheroesID),
			);

			CREATE TABLE #Lthr
			(
     				ltid varchar(5) primary key NOT NULL,
					tmid varchar(5) NOT NULL,
			);

			CREATE TABLE #numbertimes
			(
     				pid varchar(5) primary key NOT NULL,
					times varchar(5) NOT NULL,
			);
			/*---------------------------------------------------------------------------------------------------------------------------------------------*/

			INSERT INTO #classic (gamesID,gamemodesID,ltheroesID)
			SELECT gameID,gameModeID,listOfHr1
			FROM Game
			WHERE Game.gmStrDT BETWEEN '2021-03-15 00:00:00' and '2021-03-15 23:59:59' 
			AND (Game.gameModeID = 'GM001' OR Game.gameModeID = 'GM002' OR Game.gameModeID = 'GM003' OR Game.gameModeID = 'GM006' OR Game.gameModeID = 'GM010');

			INSERT INTO #classic (gamesID,gamemodesID,ltheroesID)
			SELECT gameID,gameModeID,listOfHr2
			FROM Game
			WHERE (Game.gmStrDT BETWEEN '2021-03-15 00:00:00' and '2021-03-15 23:59:59') 
			AND (Game.gameModeID = 'GM001' OR Game.gameModeID = 'GM002' OR Game.gameModeID = 'GM003' OR Game.gameModeID = 'GM006' OR Game.gameModeID = 'GM010');

			INSERT INTO #Lthr (ltid,tmid)
			SELECT listID,teamID
			FROM ListOfHeroes;

			INSERT INTO #numbertimes (pid,times)
			SELECT playerID,COUNT(playerID) AS number_of_times 
			FROM(
			SELECT * FROM #classic
			inner join #Lthr
			ON #classic.ltheroesID = #Lthr.ltid
			inner join Team
			ON #Lthr.tmid = Team.TeamID
			) findnum
			GROUP BY playerID;

			SELECT pid AS player_ID, username as plyer_Username,times AS number_Of_Times
			FROM(
			SELECT * FROM #numbertimes
			inner join Player
			ON #numbertimes.pid = Player.playerID
			) times
			ORDER BY times DESC;

--QUESTION 3: List the id and name of the most used hero in all games. 
				/*EXECUTE FIRST-----------------------------------------------------------------------------------------------------------------------------------*/
				CREATE TABLE #topused
				(
     					hrid varchar(5) primary key NOT NULL,
						total_Time_Used INT NOT NULL,
				);
				/*---------------------------------------------------------------------------------------------------------------------------------------------*/

				INSERT INTO #topused
				SELECT heroID, COUNT(heroID) AS total_Time_Used FROM Team
				GROUP BY heroID;

				DECLARE @Counterfrnum INT;
				SET @Counterfrnum= (SELECT MAX(total_Time_Used) FROM  #topused);
				SELECT heroID AS Hero_ID, heroName AS Hero_NAME, total_Time_Used AS total_Time_Used_By_Players
				FROM (
				SELECT * FROM #topused
				inner join Hero
				ON #topused.hrid = Hero.heroID
				) tableformostused
				WHERE total_Time_Used = @Counterfrnum;