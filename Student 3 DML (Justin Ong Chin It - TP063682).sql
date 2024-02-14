/*
	SQL-Data Manipulation Language (DML) - [STUDENT 3]

	GROUP 14

	JUSTIN ONG CHIN IT - TP063682
*/
	
-- 1.	List the names and email addresses of all players who have played at least 10 games. Arrange the list alphabetically according to the names.

		SELECT * FROM Player_Hero;
		SELECT * FROM Team;
	

		SELECT p.username, p.email, COUNT (t.gameID) AS [Number Of Games Played]
		FROM Player p INNER JOIN Player_Hero ph
		ON p.playerID = ph.playerID
		INNER JOIN Team t
		ON ph.playerID = t.playerID AND ph.heroID = t.heroID
		GROUP BY p.username, p.email
		HAVING COUNT (t.gameID) >= 10
		ORDER BY username;

-- 2.	List the hero id, hero name and total number of skins belonging to each hero. 

		SELECT * FROM Skin;

		SELECT h.heroID, h.heroName, COUNT (s.skinID) AS [Total Number Of Skins]
		FROM Hero h INNER JOIN Skin s
		ON h.heroID = s.heroID
		GROUP BY h.heroID, h.heroName
		ORDER BY h.heroID;

-- 3.	List the details of all players who didn’t play any game.

		SELECT * FROM Player;
		SELECT * FROM Team;

		SELECT p.playerID, p.email, p.username, p.onlineStat, p.Total_BP, p.Total_Dmd, p.Global_Rk, COUNT (t.gameID) AS [Number Of Games Played]
		FROM Player p LEFT JOIN Player_Hero ph
		ON p.playerID = ph.playerID
		LEFT JOIN Team t
		ON ph.playerID = t.playerID AND ph.heroID = t.heroID
		GROUP BY p.playerID, p.email, p.username, p.onlineStat, p.Total_BP, p.Total_Dmd, p.Global_Rk
		HAVING COUNT (t.playerID) = 0
		ORDER BY p.playerID;

