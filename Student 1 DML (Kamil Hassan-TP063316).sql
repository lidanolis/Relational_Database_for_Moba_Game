
-- QUERY 1
SELECT heroName from Hero
WHERE heroName LIKE '%a%' or heroName LIKE '%t%'
ORDER BY heroName;

--QUERY 2

SELECT * FROM Player
WHERE playerID in 
	(SELECT playerID FROM Player_Hero WHERE heroID in 
		(SELECT heroID from hero WHERE heroSp = 'charge')) 

--query 3

SELECT ph.heroID, h.heroName, ph.heroLvl FROM Player_Hero ph inner join Hero h on h.heroID = ph.heroID
WHERE ph.playerID in (SELECT playerID FROM player WHERE username = 'John Alex')