/*

     SQL- Data Manipulation Language (DML) - [STUDENT 2]

	 GROUP 14

	 VISALI A/P KUMARAVAL - TP063645

*/

-- 1. List the game ids, and game times, game dates, for all games played between ‘01/03/2021’ and ‘31/03/2021’ in descending order of game dates.

      USE BBLMG;
      SELECT gameID, gmStrDT, gmEndDT FROM Game
      WHERE gmStrDT BETWEEN '2021-03-01' AND '2021-03-31'
      ORDER BY gmStrDT DESC

-- 2. List the details of players who own any heroes whose levels are more than 3. 

      USE BBLMG;
      SELECT Player.playerID, Player.email, Player.username, Player.onlineStat, Player.Total_BP, Player.Total_Dmd, Player.Global_Rk, Player_Hero.heroLvl
      FROM Player
      INNER JOIN Player_Hero ON
      Player.playerID = Player_hero.playerID
      WHERE heroLvl > 3;

-- 3. List the ids and names of all heroes who has any skin priced higher than the average price of all skins, and show by how much. 
      
	  USE BBLMG;
	  SELECT Hero.heroID, Hero.heroName, Skin.skPriceBP, Skin.skPriceD, Skin.skPriceBP - (SELECT AVG (skPriceBP)FROM Skin) AS 'Avg Dif BP'
      FROM Skin
      INNER JOIN Hero ON
      Skin.heroID = Hero.heroID
      WHERE Skin.skPriceBP > (SELECT AVG(skPriceBP)FROM Skin);
      SELECT Hero.heroID, Hero.heroName, Skin.skPriceBP, Skin.skPriceD,Skin.skPriceD - (SELECT AVG (skPriceD)FROM Skin) AS 'Avg Dif D'
      FROM Skin
      INNER JOIN Hero ON
      Skin.heroID = Hero.heroID
      WHERE Skin.skPriceD > (SELECT AVG(skPriceD)FROM Skin);
     