/*
	SQL-Data Definition Language (DDL)

	GROUP 14

	EAMON CHIN SAN HUI		TP059667	Responsible for Tables:		Hero,	Skin,			PersonalStatistics
	JUSTIN ONG CHIN IT		TP063682	Responsible for Tables:		Player, Player_Hero,	Battle_Points,		Diamonds,	OnlineStatus,	GlobalRanking,		PersonalStatistics 
	KAMIL HASSAN			TP063316	Responsible for Tables:		Game,	Game_Mode 
	VISALI A/P KUMARAVAL	TP063645	Responsible for Tables:		Team,	ListOfHeroes,	

*/

-- Creating and Utilizing Database for Bing Bing Legend Mobile Game (BBLMG)
CREATE DATABASE BBLMG;
GO
USE BBLMG;
GO

-- CREATE Player Table
CREATE TABLE Player
(
	playerID VARCHAR(5),
	email VARCHAR (50) NOT NULL,
	username VARCHAR (20) NOT NULL,
	onlineStat BIT DEFAULT (1),
	Total_BP INT DEFAULT (3000),
	Total_Dmd  INT DEFAULT (500),
	Global_Rk INT DEFAULT (1000),
	CONSTRAINT Player_PK PRIMARY KEY (playerID),
	CONSTRAINT Uniq_Em UNIQUE (email),
	CONSTRAINT Uniq_Usernm UNIQUE (username),
	CONSTRAINT Chk_BP CHECK (Total_BP >= 0),
	CONSTRAINT Chk_Dmd CHECK (Total_Dmd >= 0),
	CONSTRAINT Chk_GbRank CHECK (Global_Rk > 0 AND Global_Rk <= 1000)	-- FUNCTION for Global_Rk also validate his
);
GO

SELECT * FROM Player;

-- INSERT VALUES INTO Player Table
INSERT INTO Player VALUES ('BB001', 'johndoe1@gmail.com', 'johndoe1', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB002', 'janedoe2@hotmail.com', 'janedoe2', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB003', 'aaron3@yahoo.com', 'aaron3', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB004', 'bob4@gmail.com', 'bob4', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB005', 'carl5@gmail.com', 'carl5', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO Player VALUES ('BB006', 'mary6@yahoo.com', 'mary6', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB007', 'ryan7@outlook.com', 'ryan7', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB008', 'sam8@hotmail.com', 'sam8', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB009', 'finn9@gmail.com', 'finn9', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB010', 'leah10@outlook.com', 'leah10', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO Player VALUES ('BB011', 'mike11@yahoo.com', 'mike11', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB012', 'harry12@hotmail.com', 'harry12', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB013', 'rachel13@gmail.com', 'rachel13', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB014', 'nick14@outlook.com', 'nick14', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Player VALUES ('BB015', 'johnAlex15@gmail.com', 'John Alex', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

-- UPDATE Player Table for Derived Attributes (onlineStat, Total_BP, Total_Dmd, Global_Rk)
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB001')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB001')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB001')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB001')) WHERE playerID = 'BB001';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB002')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB002')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB002')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB002')) WHERE playerID = 'BB002';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB003')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB003')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB003')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB003')) WHERE playerID = 'BB003';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB004')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB004')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB004')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB004')) WHERE playerID = 'BB004';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB005')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB005')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB005')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB005')) WHERE playerID = 'BB005';

UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB006')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB006')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB006')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB006')) WHERE playerID = 'BB006';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB007')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB007')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB007')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB007')) WHERE playerID = 'BB007';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB008')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB008')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB008')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB008')) WHERE playerID = 'BB008';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB009')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB009')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB009')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB009')) WHERE playerID = 'BB009';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB010')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB010')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB010')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB010')) WHERE playerID = 'BB010';

UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB011')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB011')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB011')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB011')) WHERE playerID = 'BB011';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB012')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB012')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB012')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB012')) WHERE playerID = 'BB012';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB013')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB013')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB013')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB013')) WHERE playerID = 'BB013';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB014')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB014')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB014')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB014')) WHERE playerID = 'BB014';
UPDATE Player SET onlineStat = (SELECT [dbo].[GetOnlineStat] ('BB015')), Total_BP = (SELECT [dbo].[GetTotalBatPt] ('BB015')), Total_Dmd = (SELECT [dbo].[GetTotalDmd] ('BB015')), Global_Rk = (SELECT [dbo].[GetGlobalRk] ('BB015')) WHERE playerID = 'BB015';

--!!!!!
DROP TABLE Player;
GO

SELECT * FROM Player;


-- CREATE Battle_Points Table
CREATE TABLE Battle_Points
(
	BP_ID VARCHAR(5),
	playerID VARCHAR(5),
	BP_Trans INT,
	BP_Balance INT DEFAULT (3000) NOT NULL,
	CONSTRAINT BatPt_PK PRIMARY KEY (BP_ID),
	CONSTRAINT BatPt_FK FOREIGN KEY (playerID) REFERENCES Player (playerID),
	CONSTRAINT Chk_BP_Bal CHECK (BP_Balance >= 0)
);
GO

SELECT * FROM Battle_Points;

-- INSERT VALUES INTO Battle_Points Table
INSERT INTO Battle_Points VALUES ('BP001','BB001', -300, 2700);
INSERT INTO Battle_Points VALUES ('BP002','BB002', -500, 2500);
INSERT INTO Battle_Points VALUES ('BP003','BB003', -700, 2300);
INSERT INTO Battle_Points VALUES ('BP004','BB004', -300, 2700);
INSERT INTO Battle_Points VALUES ('BP005','BB005', -400, 2600);
INSERT INTO Battle_Points VALUES ('BP006','BB006', -300, 2700);
INSERT INTO Battle_Points VALUES ('BP007','BB007', -500, 2500);
INSERT INTO Battle_Points VALUES ('BP008','BB008', -300, 2700)
INSERT INTO Battle_Points VALUES ('BP009','BB009', -300, 2700);
INSERT INTO Battle_Points VALUES ('BP010','BB010', -700, 2300);

INSERT INTO Battle_Points VALUES ('BP011','BB011', -700, 2300);
INSERT INTO Battle_Points VALUES ('BP012','BB011', -100, 2200);
INSERT INTO Battle_Points VALUES ('BP013','BB012', -700, 2300);
INSERT INTO Battle_Points VALUES ('BP014','BB013', -300, 2700);
INSERT INTO Battle_Points VALUES ('BP015','BB014', -700, 2300);
INSERT INTO Battle_Points VALUES ('BP016','BB015', -300, 2700);
INSERT INTO Battle_Points VALUES ('BP017','BB001', -1400, 1300);
INSERT INTO Battle_Points VALUES ('BP018','BB002', -1500, 1000)
INSERT INTO Battle_Points VALUES ('BP019','BB003', -1300, 1000);
INSERT INTO Battle_Points VALUES ('BP020','BB004', -1500, 1200);

INSERT INTO Battle_Points VALUES ('BP021','BB005', -1100, 1500);
INSERT INTO Battle_Points VALUES ('BP022','BB005', -1100, 400);
INSERT INTO Battle_Points VALUES ('BP023','BB006', -1400, 1300);
INSERT INTO Battle_Points VALUES ('BP024','BB007', -1500, 1000);
INSERT INTO Battle_Points VALUES ('BP025','BB008', -1000, 1700);
INSERT INTO Battle_Points VALUES ('BP026','BB009', -1400, 1300);
INSERT INTO Battle_Points VALUES ('BP027','BB010', -1000, 1300);
INSERT INTO Battle_Points VALUES ('BP028','BB011', -1000, 1200)
INSERT INTO Battle_Points VALUES ('BP029','BB011', -1200, 0);
INSERT INTO Battle_Points VALUES ('BP030','BB012', -1200, 1100);

INSERT INTO Battle_Points VALUES ('BP031','BB013', -1000, 1700);
INSERT INTO Battle_Points VALUES ('BP032','BB014', -1300, 1000);
INSERT INTO Battle_Points VALUES ('BP033','BB015', -1400, 1300);
INSERT INTO Battle_Points VALUES ('BP034','BB001', 200, 1500);
INSERT INTO Battle_Points VALUES ('BP035','BB002', 200, 1200);
INSERT INTO Battle_Points VALUES ('BP036','BB003', 200, 1200);
INSERT INTO Battle_Points VALUES ('BP037','BB004', 200, 1400);
INSERT INTO Battle_Points VALUES ('BP038','BB005', 200, 600);
INSERT INTO Battle_Points VALUES ('BP039','BB006', 50, 1350);
INSERT INTO Battle_Points VALUES ('BP040','BB007', 50, 1050);

INSERT INTO Battle_Points VALUES ('BP041','BB008', 50, 1750)
INSERT INTO Battle_Points VALUES ('BP042','BB009', 50, 1350);
INSERT INTO Battle_Points VALUES ('BP043','BB010', 50, 1350);

--FUNCTION for Total_BP attribute (Player Table)
GO
CREATE FUNCTION GetTotalBatPt
(
	@playerID VARCHAR (5)
)
RETURNS INT
AS
BEGIN
	-- Declare RETURN variable here
	DECLARE @Total_BP AS INT;

	--Add the SQL Statement
	SELECT @Total_BP = BP_Balance
	FROM Battle_Points
	WHERE BP_ID =	(SELECT MAX(BP_ID)
					 FROM Battle_Points
					 WHERE playerID = @playerID);
	-- RETURN result
	RETURN @Total_BP;
END
GO

SELECT * FROM Battle_Points;
SELECT [dbo].[GetTotalBatPt] ('BB001');
SELECT [dbo].[GetTotalBatPt] ('BB005');
SELECT [dbo].[GetTotalBatPt] ('BB008');
SELECT [dbo].[GetTotalBatPt] ('BB015');

--!!!!!
DROP TABLE Battle_Points;
GO


-- CREATE Diamonds Table
CREATE TABLE Diamonds
(
	Dmd_ID VARCHAR(5),
	playerID VARCHAR(5),
	Dmd_Trans INT,
	Dmd_Balance INT DEFAULT (500) NOT NULL,
	CONSTRAINT Dmd_PK PRIMARY KEY (Dmd_ID),
	CONSTRAINT Dmd_FK FOREIGN KEY (playerID) REFERENCES Player (playerID),
	CONSTRAINT Chk_DmdBal CHECK (Dmd_Balance >= 0)
);
GO

SELECT * FROM Diamonds;

-- INSERT VALUES INTO Diamonds Table
INSERT INTO Diamonds VALUES ('DM001','BB001', -20, 480);
INSERT INTO Diamonds VALUES ('DM002','BB002', -20, 480);
INSERT INTO Diamonds VALUES ('DM003','BB004', -20, 480);
INSERT INTO Diamonds VALUES ('DM004','BB006', -20, 480);
INSERT INTO Diamonds VALUES ('DM005','BB007', -10, 490);
INSERT INTO Diamonds VALUES ('DM006','BB009', -20, 480);
INSERT INTO Diamonds VALUES ('DM007','BB011', -20, 480);
INSERT INTO Diamonds VALUES ('DM008','BB012', -20, 480)
INSERT INTO Diamonds VALUES ('DM009','BB014', -10, 490);
INSERT INTO Diamonds VALUES ('DM010','BB001', -300, 180);

INSERT INTO Diamonds VALUES ('DM011','BB002', -100, 380);
INSERT INTO Diamonds VALUES ('DM012','BB002', -300, 80);
INSERT INTO Diamonds VALUES ('DM013','BB004', -300, 180);
INSERT INTO Diamonds VALUES ('DM014','BB006', -300, 180);
INSERT INTO Diamonds VALUES ('DM015','BB007', -30, 460);
INSERT INTO Diamonds VALUES ('DM016','BB009', -300, 180);
INSERT INTO Diamonds VALUES ('DM017','BB011', -50, 430);
INSERT INTO Diamonds VALUES ('DM018','BB011', -300, 130)
INSERT INTO Diamonds VALUES ('DM019','BB012', -300, 180);
INSERT INTO Diamonds VALUES ('DM020','BB014', -30, 460);

INSERT INTO Diamonds VALUES ('DM021','BB001', 200, 380);
INSERT INTO Diamonds VALUES ('DM022','BB002', 300, 380);
INSERT INTO Diamonds VALUES ('DM023','BB003', 1000, 1500);
INSERT INTO Diamonds VALUES ('DM024','BB004', 50, 230);
INSERT INTO Diamonds VALUES ('DM025','BB005', 100, 600);
INSERT INTO Diamonds VALUES ('DM026','BB006', 1500, 1680);
INSERT INTO Diamonds VALUES ('DM027','BB007', 200, 660);
INSERT INTO Diamonds VALUES ('DM028','BB008', 300, 800)
INSERT INTO Diamonds VALUES ('DM029','BB009', 100, 280);
INSERT INTO Diamonds VALUES ('DM030','BB010', 50, 5050);

INSERT INTO Diamonds VALUES ('DM031','BB011', 700, 830);
INSERT INTO Diamonds VALUES ('DM032','BB012', 800, 980);
INSERT INTO Diamonds VALUES ('DM033','BB013', 900, 5900);
INSERT INTO Diamonds VALUES ('DM034','BB014', 200, 660);
INSERT INTO Diamonds VALUES ('DM035','BB015', 100, 600);

--FUNCTION for Total_Dmd attribute (Player Table)
GO
CREATE FUNCTION GetTotalDmd
(
	@playerID VARCHAR (5)
)
RETURNS INT
AS
BEGIN
	-- Declare RETURN variable here
	DECLARE @Dmd_Balance AS INT;

	--Add the SQL Statement
	SELECT @Dmd_Balance = Dmd_Balance
	FROM Diamonds
	WHERE Dmd_ID =	(SELECT MAX(Dmd_ID)
					 FROM Diamonds
					 WHERE playerID = @playerID);
	-- RETURN result
	RETURN @Dmd_Balance;
END
GO

SELECT * FROM Diamonds;
SELECT [dbo].[GetTotalDmd] ('BB001');
SELECT [dbo].[GetTotalDmd] ('BB002');
SELECT [dbo].[GetTotalDmd] ('BB003');
SELECT [dbo].[GetTotalDmd] ('BB004');

--!!!!!
DROP TABLE Diamonds;
GO


-- CREATE OnlineStatus Table
CREATE TABLE OnlineStatus
(
	OS_ID VARCHAR(5),
	playerID VARCHAR(5),
	onlStatus BIT DEFAULT (1) NOT NULL,
	CONSTRAINT OnlStat_PK PRIMARY KEY (OS_ID),
	CONSTRAINT OnlStat_FK FOREIGN KEY (playerID) REFERENCES Player (playerID)
);
GO

SELECT * FROM OnlineStatus;

-- INSERT VALUES INTO OnlineStatus Table
INSERT INTO OnlineStatus VALUES ('OS001','BB001', 1);
INSERT INTO OnlineStatus VALUES ('OS002','BB002', 1);
INSERT INTO OnlineStatus VALUES ('OS003','BB003', 1);
INSERT INTO OnlineStatus VALUES ('OS004','BB004', 1);
INSERT INTO OnlineStatus VALUES ('OS005','BB005', 1);
INSERT INTO OnlineStatus VALUES ('OS006','BB006', 1);
INSERT INTO OnlineStatus VALUES ('OS007','BB007', 1);
INSERT INTO OnlineStatus VALUES ('OS008','BB008', 1);
INSERT INTO OnlineStatus VALUES ('OS009','BB009', 1);
INSERT INTO OnlineStatus VALUES ('OS010','BB010', 1);

INSERT INTO OnlineStatus VALUES ('OS011','BB011', 1);
INSERT INTO OnlineStatus VALUES ('OS012','BB012', 1);
INSERT INTO OnlineStatus VALUES ('OS013','BB013', 1);
INSERT INTO OnlineStatus VALUES ('OS014','BB014', 1);
INSERT INTO OnlineStatus VALUES ('OS015','BB015', 1);
INSERT INTO OnlineStatus VALUES ('OS016','BB011', 0);
INSERT INTO OnlineStatus VALUES ('OS017','BB012', 0);
INSERT INTO OnlineStatus VALUES ('OS018','BB013', 0);
INSERT INTO OnlineStatus VALUES ('OS019','BB014', 0);
INSERT INTO OnlineStatus VALUES ('OS020','BB015', 0);

--FUNCTION for onlineStat attribute (Player Table)
GO
CREATE FUNCTION GetOnlineStat
(
	@playerID VARCHAR (5)
)
RETURNS BIT
AS
BEGIN
	-- Declare RETURN variable here
	DECLARE @onlineStat AS BIT;

	--Add the SQL Statement
	SELECT @onlineStat = onlStatus
	FROM OnlineStatus
	WHERE OS_ID =	(SELECT MAX(OS_ID)
					 FROM OnlineStatus
					 WHERE playerID = @playerID);
	-- RETURN result
	RETURN @onlineStat;
END
GO

SELECT * FROM OnlineStatus;
SELECT [dbo].[GetOnlineStat] ('BB001');
SELECT [dbo].[GetOnlineStat] ('BB011');

--!!!!!
DROP TABLE OnlineStatus;
GO


-- CREATE GlobalRanking Table
CREATE TABLE GlobalRanking
(
	GR_ID VARCHAR(5),
	playerID VARCHAR(5),
	gameID VARCHAR (4),
	ranking INT DEFAULT(1000) NOT NULL,
	CONSTRAINT GbRk_PK PRIMARY KEY (GR_ID),
	CONSTRAINT GbRk_PlyID_FK FOREIGN KEY (playerID) REFERENCES Player (playerID),
	CONSTRAINT GbRk_GameID_FK FOREIGN KEY (gameID) REFERENCES Game (gameID),
	CONSTRAINT Chk_ranking CHECK (ranking > 0 AND ranking <= 1000)
);
GO

SELECT * FROM GlobalRanking;

-- INSERT VALUES INTO GlobalRanking Table
INSERT INTO GlobalRanking VALUES ('GR001','BB001','G001', 770);
INSERT INTO GlobalRanking VALUES ('GR002','BB002','G001', 546);
INSERT INTO GlobalRanking VALUES ('GR003','BB003','G001', 16);
INSERT INTO GlobalRanking VALUES ('GR004','BB004','G001', 90);
INSERT INTO GlobalRanking VALUES ('GR005','BB005','G001', 52);
INSERT INTO GlobalRanking VALUES ('GR006','BB006','G001', 660);
INSERT INTO GlobalRanking VALUES ('GR007','BB007','G001', 38);
INSERT INTO GlobalRanking VALUES ('GR008','BB008','G001', 70);
INSERT INTO GlobalRanking VALUES ('GR009','BB009','G001', 45);
INSERT INTO GlobalRanking VALUES ('GR010','BB010','G001', 866);

INSERT INTO GlobalRanking VALUES ('GR011','BB011','G002', 332);
INSERT INTO GlobalRanking VALUES ('GR012','BB012','G002', 453);
INSERT INTO GlobalRanking VALUES ('GR013','BB013','G002', 123);
INSERT INTO GlobalRanking VALUES ('GR014','BB014','G002', 76);
INSERT INTO GlobalRanking VALUES ('GR015','BB015','G002', 34);
INSERT INTO GlobalRanking VALUES ('GR016','BB001','G002', 700);
INSERT INTO GlobalRanking VALUES ('GR017','BB002','G002', 523);
INSERT INTO GlobalRanking VALUES ('GR018','BB003','G002', 47);
INSERT INTO GlobalRanking VALUES ('GR019','BB004','G002', 108);
INSERT INTO GlobalRanking VALUES ('GR020','BB005','G002', 59);

INSERT INTO GlobalRanking VALUES ('GR021','BB006','G003', 480);
INSERT INTO GlobalRanking VALUES ('GR022','BB007','G003', 33);
INSERT INTO GlobalRanking VALUES ('GR023','BB008','G003', 72);
INSERT INTO GlobalRanking VALUES ('GR024','BB009','G003', 89);
INSERT INTO GlobalRanking VALUES ('GR025','BB010','G003', 823);
INSERT INTO GlobalRanking VALUES ('GR026','BB011','G003', 331);
INSERT INTO GlobalRanking VALUES ('GR027','BB012','G003', 512);
INSERT INTO GlobalRanking VALUES ('GR028','BB013','G003', 321);
INSERT INTO GlobalRanking VALUES ('GR029','BB014','G003', 99);
INSERT INTO GlobalRanking VALUES ('GR030','BB015','G003', 4);

SELECT * FROM GlobalRanking;

--FUNCTION for Global_Rk attribute (Player Table)
GO
CREATE FUNCTION GetGlobalRk 
(
	@playerID VARCHAR (5)
)
RETURNS INT
AS
BEGIN
	-- Declare RETURN variable here
	DECLARE @Global_Rk AS INT;

	--Add the SQL Statement
	SELECT @Global_Rk = ranking
	FROM GlobalRanking
	WHERE GR_ID =	(SELECT MAX(GR_ID)
					 FROM GlobalRanking
					 WHERE playerID = @playerID);
	-- RETURN result
	RETURN @Global_Rk;
END
GO

SELECT * FROM GlobalRanking;
SELECT [dbo].[GetGlobalRk] ('BB014');
SELECT [dbo].[GetGlobalRk] ('BB015');

--!!!!!
DROP TABLE GlobalRanking;
GO


-- CREATE Hero Table
CREATE TABLE Hero
(
	heroID VARCHAR(5) NOT NULL,
	heroName VARCHAR(50) NOT NULL,
	hrPriceBP INT NOT NULL,
	hrPriceD INT NOT NULL,
	heroRole VARCHAR(50) NOT NULL,
	heroSp VARCHAR(50) NOT NULL
	CONSTRAINT Hero_PK PRIMARY KEY (heroID),
	CONSTRAINT Uniq_heroID UNIQUE (heroID),
	CONSTRAINT Uniq_heroName UNIQUE (heroName),
	CONSTRAINT Chk_hrBP CHECK (hrPriceBP > 0),
	CONSTRAINT Chk_hrD CHECK (hrPriceD > 0)
);
GO

SELECT * FROM Hero;

-- INSERT VALUES INTO Hero Table
INSERT INTO Hero VALUES 
('HR001','Dark Rose',300,20,'Tank','Charge'),
('HR002','Rafaela',500,10,'Support','Burst'),
('HR003','Tigreal',700,30,'Fighter','Charge'),
('HR004','Fanny',300,20,'Tank','Push'),
('HR005','Estes',400,20,'Marksman','Charge'),
('HR006','Aamon',300,10,'Fighter','Guard'),
('HR007','Akai',150,20,'Fighter','Charge'),
('HR008','Aldous',100,30,'Mage','Push'),
('HR009','Alice',500,20,'Mage','Chase '),
('HR010','Nora',700,20,'Assassin ','Charge'),
('HR011','Cyclops',100,30,'Mage','Push'),
('HR012','Lolita',500,20,'Fighter','Charge'),
('HR013','Clint',700,20,'Assassin','Push');

SELECT * FROM Hero;

--!!!!!
DROP TABLE Hero;
GO


-- CREATE Player_Hero Table
CREATE TABLE Player_Hero
(
	playerID VARCHAR(5),
	heroID VARCHAR (5),
	heroLvl INT DEFAULT (1) NOT NULL,
	CONSTRAINT PlayerHr_PK PRIMARY KEY (playerID, heroID),
	CONSTRAINT PlayerHr_FK1 FOREIGN KEY (playerID) REFERENCES Player (playerID),
	CONSTRAINT PlayerHr_FK2 FOREIGN KEY (heroID) REFERENCES Hero (heroID),
	CONSTRAINT Chk_hrLvl CHECK (heroLvl >= 1 AND heroLvl <= 10)
);
GO

SELECT * FROM Player_Hero;

-- INSERT VALUES INTO Player_Hero Table
INSERT INTO Player_Hero VALUES ('BB001', 'HR001', 1);
INSERT INTO Player_Hero VALUES ('BB001', 'HR007', 4);
INSERT INTO Player_Hero VALUES ('BB002', 'HR002', 2);
INSERT INTO Player_Hero VALUES ('BB002', 'HR005', 5);
INSERT INTO Player_Hero VALUES ('BB003', 'HR003', 3);
INSERT INTO Player_Hero VALUES ('BB004', 'HR004', 4);
INSERT INTO Player_Hero VALUES ('BB004', 'HR009', 8);
INSERT INTO Player_Hero VALUES ('BB005', 'HR005', 9);

INSERT INTO Player_Hero VALUES ('BB006', 'HR006', 6);
INSERT INTO Player_Hero VALUES ('BB006', 'HR007', 3);
INSERT INTO Player_Hero VALUES ('BB007', 'HR002', 7);
INSERT INTO Player_Hero VALUES ('BB007', 'HR006', 2);
INSERT INTO Player_Hero VALUES ('BB008', 'HR001', 8);
INSERT INTO Player_Hero VALUES ('BB009', 'HR006', 9);
INSERT INTO Player_Hero VALUES ('BB009', 'HR010', 2);
INSERT INTO Player_Hero VALUES ('BB010', 'HR010', 10);

INSERT INTO Player_Hero VALUES ('BB011', 'HR010', 5);
INSERT INTO Player_Hero VALUES ('BB011', 'HR004', 7);
INSERT INTO Player_Hero VALUES ('BB011', 'HR008', 8);
INSERT INTO Player_Hero VALUES ('BB012', 'HR003', 2);
INSERT INTO Player_Hero VALUES ('BB012', 'HR007', 4);
INSERT INTO Player_Hero VALUES ('BB013', 'HR001', 8);
INSERT INTO Player_Hero VALUES ('BB014', 'HR003', 1);
INSERT INTO Player_Hero VALUES ('BB014', 'HR006', 9);
INSERT INTO Player_Hero VALUES ('BB015', 'HR001', 5);

SELECT * FROM Player_Hero;

--!!!!!
DROP TABLE Player_Hero;
GO


-- CREATE Skin Table
CREATE TABLE Skin
(
	skinID VARCHAR(5) NOT NULL,
	skinName VARCHAR(50) NOT NULL,
	skPriceBP INT NOT NULL,
	skPriceD INT NOT NULL,
	heroName VARCHAR(50) NOT NULL,
	heroID VARCHAR(5) NOT NULL,
	CONSTRAINT Skin_PK PRIMARY KEY (skinID),
	CONSTRAINT Uniq_skinID UNIQUE (skinID),
	CONSTRAINT Chk_skBP CHECK (skPriceBP > 0),
	CONSTRAINT Chk_skD CHECK (skPriceD > 0),
	CONSTRAINT SkinhrN_FK FOREIGN KEY (heroName) REFERENCES Hero(heroName),
	CONSTRAINT SkinhrID_FK FOREIGN KEY (heroID) REFERENCES Hero(heroID)
);
GO

SELECT * FROM Skin;

-- INSERT VALUES INTO Skin Table
INSERT INTO Skin VALUES 
('SK001','Graveyard Party',300,300,'Dark Rose','HR001'),
('SK002','Punk Princess', 500,500,'Rafaela','HR002'),
('SK003','Flower of the Wastes', 300,300,'Tigreal','HR003'),
('SK004','Yasha', 500,500,'Fanny','HR004'),
('SK005','Locomotive',500,500,'Estes','HR005'),
('SK006','Warlord', 300,300,'Aamon','HR006'),
('SK007','Jungle Watcher', 300,300,'Akai','HR007'),
('SK008','Witch Hunter', 300,300,'Aldous','HR008'),
('SK009','Fiery Inferno', 500,500,'Alice','HR009'),
('SK010','CrowMagician', 300,300,'Nora','HR010'),
('SK011','Zombie Bambino', 500,500,'Cyclops','HR011'),
('SK012','Street Enforcer', 300,300,'Lolita','HR012'),
('SK013','New Baron', 300,300,'Clint','HR013'),
('SK014','Purple Thread', 500,500,'Alice','HR009'),
('SK015','Dimension Breaker',300,300,'Alice','HR009'),
('SK016','Moonfall',300,300,'Tigreal','HR003'),
('SK017','Thunor and Fulgora',300,300,'Fanny','HR004'),
('SK018','Black Swordsman',500,500,'Dark Rose','HR001'),
('SK019','Seven',300,300,'Estes','HR005'),
('SK020','Technoblade',500,500,'Lolita','HR012'),
('SK021','Mecha Templar',300,300,'Clint','HR013');

SELECT * FROM Skin;

--!!!!!
DROP TABLE Skin;
GO


-- CREATE GameMode Table
CREATE TABLE GameMode
(
     gameModeID VARCHAR(5) PRIMARY KEY,
	 gameModeName VARCHAR(20) NOT NULL,
	 gameModeType VARCHAR(20) NOT NULL
);
GO

SELECT * FROM GameMode;

--INSERT VALUES INTO GAMEMODE TABLE
INSERT INTO GameMode VALUES ('GM001','Storm','Classic');
INSERT INTO GameMode VALUES ('GM002','Hellish','Classic');
INSERT INTO GameMode VALUES ('GM003','Oasis','Classic');
INSERT INTO GameMode VALUES ('GM004','Storm','Human vs AI');
INSERT INTO GameMode VALUES ('GM005','Storm','Brawl');
INSERT INTO GameMode VALUES ('GM006','Barren','Classic');
INSERT INTO GameMode VALUES ('GM007','Hellish','Human vs AI');
INSERT INTO GameMode VALUES ('GM008','Barren','Brawl');
INSERT INTO GameMode VALUES ('GM009','Dune','Brawl');
INSERT INTO GameMode VALUES ('GM010','Dune','Classic');

SELECT * FROM GameMode;


-- CREATE Game Table
CREATE TABLE Game 
(
     gameID VARCHAR(4) PRIMARY KEY,
	 gameModeID VARCHAR(5) FOREIGN KEY REFERENCES GameMode(gameModeID),
	 listOfHr1 VARCHAR(5),
	 listOfHr2 VARCHAR(5),
	 gmStrDT SMALLDATETIME NOT NULL,
	 gmEndDT SMALLDATETIME NOT NULL,
	 gmRes VARCHAR(5) NOT NULL,
	 CONSTRAINT game_loh1_FK FOREIGN KEY (listOfHr1) REFERENCES ListOfHeroes (listID),
	 CONSTRAINT game_loh2_FK FOREIGN KEY (listOfHr2) REFERENCES ListOfHeroes (listID)
);
GO

SELECT * FROM Game;

-- INSERT VALUES INTO Game Table
Insert into Game values ('G001',(select gameModeID from GameMode where gameModeID ='GM001'),(select listID from ListOfHeroes where listID ='LS001'),(select listID from ListOfHeroes where listID ='LS002'),'2021-03-15 17:06:15', '2021-03-15 23:28:10','LS001');
Insert into Game values ('G002',(select gameModeID from GameMode where gameModeID ='GM002'),(select listID from ListOfHeroes where listID ='LS003'),(select listID from ListOfHeroes where listID ='LS004'),'2021-03-15 12:36:09', '2021-03-15 19:07:01','LS003');
Insert into Game values ('G003',(select gameModeID from GameMode where gameModeID ='GM003'),(select listID from ListOfHeroes where listID ='LS005'),(select listID from ListOfHeroes where listID ='LS006'),'2021-03-15 17:06:15', '2021-03-15 17:06:15','LS006');
Insert into Game values ('G004',(select gameModeID from GameMode where gameModeID ='GM004'),(select listID from ListOfHeroes where listID ='LS007'),(select listID from ListOfHeroes where listID ='LS008'),'2021-03-17 12:36:09', '2021-03-17 19:07:01','LS007');
Insert into Game values ('G005',(select gameModeID from GameMode where gameModeID ='GM005'),(select listID from ListOfHeroes where listID ='LS009'),(select listID from ListOfHeroes where listID ='LS010'),'2021-03-29 06:27:17', '2021-03-29 13:46:00','LS009');

Insert into Game values ('G006',(select gameModeID from GameMode where gameModeID ='GM006'),(select listID from ListOfHeroes where listID ='LS011'),(select listID from ListOfHeroes where listID ='LS012'),'2021-03-30 15:00:17', '2021-03-30 19:28:07','LS012');
Insert into Game values ('G007',(select gameModeID from GameMode where gameModeID ='GM007'),(select listID from ListOfHeroes where listID ='LS013'),(select listID from ListOfHeroes where listID ='LS014'),'2021-03-06 10:28:56', '2021-03-06 13:09:48','LS014');
Insert into Game values ('G008',(select gameModeID from GameMode where gameModeID ='GM008'),(select listID from ListOfHeroes where listID ='LS015'),(select listID from ListOfHeroes where listID ='LS016'),'2021-03-08 12:03:17', '2021-03-08 15:15:15','LS015');
Insert into Game values ('G009',(select gameModeID from GameMode where gameModeID ='GM009'),(select listID from ListOfHeroes where listID ='LS017'),(select listID from ListOfHeroes where listID ='LS018'),'2021-03-18 18:14:36', '2021-03-18 19:46:19','LS018');
Insert into Game values ('G010',(select gameModeID from GameMode where gameModeID ='GM010'),(select listID from ListOfHeroes where listID ='LS019'),(select listID from ListOfHeroes where listID ='LS020'),'2021-03-15 14:19:50', '2021-03-15 16:44:07','LS019');

Insert into Game values ('G011',(select gameModeID from GameMode where gameModeID ='GM001'),(select listID from ListOfHeroes where listID ='LS021'),(select listID from ListOfHeroes where listID ='LS022'),'2021-03-15 23:13:40', '2021-03-15 23:55:16','LS022');
Insert into Game values ('G012',(select gameModeID from GameMode where gameModeID ='GM002'),(select listID from ListOfHeroes where listID ='LS023'),(select listID from ListOfHeroes where listID ='LS024'),'2021-03-07 11:00:36', '2021-03-07 13:23:58','LS024');
Insert into Game values ('G013',(select gameModeID from GameMode where gameModeID ='GM003'),(select listID from ListOfHeroes where listID ='LS025'),(select listID from ListOfHeroes where listID ='LS026'),'2021-03-22 17:28:33', '2021-03-22 22:37:02','LS025');
Insert into Game values ('G014',(select gameModeID from GameMode where gameModeID ='GM004'),(select listID from ListOfHeroes where listID ='LS027'),(select listID from ListOfHeroes where listID ='LS028'),'2021-05-28 20:08:48', '2021-05-28 21:48:03','LS028');
Insert into Game values ('G015',(select gameModeID from GameMode where gameModeID ='GM005'),(select listID from ListOfHeroes where listID ='LS029'),(select listID from ListOfHeroes where listID ='LS030'),'2021-03-02 15:17:03', '2021-03-02 17:23:14','LS030');

Insert into Game values ('G016',(select gameModeID from GameMode where gameModeID ='GM006'),(select listID from ListOfHeroes where listID ='LS031'),(select listID from ListOfHeroes where listID ='LS032'),'2021-03-15 12:38:40', '2021-03-15 13:52:16','LS031');
Insert into Game values ('G017',(select gameModeID from GameMode where gameModeID ='GM007'),(select listID from ListOfHeroes where listID ='LS033'),(select listID from ListOfHeroes where listID ='LS034'),'2021-06-17 03:16:19', '2021-06-17 05:14:59','LS033');
Insert into Game values ('G018',(select gameModeID from GameMode where gameModeID ='GM008'),(select listID from ListOfHeroes where listID ='LS035'),(select listID from ListOfHeroes where listID ='LS036'),'2021-06-26 18:41:43', '2021-06-26 20:24:04','LS035');
Insert into Game values ('G019',(select gameModeID from GameMode where gameModeID ='GM009'),(select listID from ListOfHeroes where listID ='LS037'),(select listID from ListOfHeroes where listID ='LS038'),'2021-06-27 21:19:39', '2021-06-27 22:00:38','LS038');
Insert into Game values ('G020',(select gameModeID from GameMode where gameModeID ='GM010'),(select listID from ListOfHeroes where listID ='LS039'),(select listID from ListOfHeroes where listID ='LS040'),'2021-06-29 17:45:56', '2021-06-29 19:31:07','LS040');


SELECT * FROM Game;

--!!!!!
DROP TABLE Game;
GO


-- CREATE listOfHeroes Table
CREATE TABLE ListOfHeroes
(
	listID VARCHAR(5) PRIMARY KEY NOT NULL,
	teamID VARCHAR(5) NOT NULL,
	CONSTRAINT  Uniq_teamID UNIQUE (teamID),
);
GO

SELECT * FROM ListOfHeroes;

-- INSERT VALUES INTO listOfHeroes Table
INSERT INTO ListOfHeroes VALUES ('LS001','TM001');
INSERT INTO ListOfHeroes VALUES ('LS002','TM002');
INSERT INTO ListOfHeroes VALUES ('LS003','TM003');
INSERT INTO ListOfHeroes VALUES ('LS004','TM004');
INSERT INTO ListOfHeroes VALUES ('LS005','TM005');
INSERT INTO ListOfHeroes VALUES ('LS006','TM006');
INSERT INTO ListOfHeroes VALUES ('LS007','TM007');
INSERT INTO ListOfHeroes VALUES ('LS008','TM008');
INSERT INTO ListOfHeroes VALUES ('LS009','TM009');
INSERT INTO ListOfHeroes VALUES ('LS010','TM010');

INSERT INTO ListOfHeroes VALUES ('LS011','TM011'); 
INSERT INTO ListOfHeroes VALUES ('LS012','TM012');
INSERT INTO ListOfHeroes VALUES ('LS013','TM013');
INSERT INTO ListOfHeroes VALUES ('LS014','TM014');
INSERT INTO ListOfHeroes VALUES ('LS015','TM015');
INSERT INTO ListOfHeroes VALUES ('LS016','TM016');
INSERT INTO ListOfHeroes VALUES ('LS017','TM017');
INSERT INTO ListOfHeroes VALUES ('LS018','TM018');
INSERT INTO ListOfHeroes VALUES ('LS019','TM019');
INSERT INTO ListOfHeroes VALUES ('LS020','TM020');

INSERT INTO ListOfHeroes VALUES ('LS021','TM021'); 
INSERT INTO ListOfHeroes VALUES ('LS022','TM022');
INSERT INTO ListOfHeroes VALUES ('LS023','TM023');
INSERT INTO ListOfHeroes VALUES ('LS024','TM024');
INSERT INTO ListOfHeroes VALUES ('LS025','TM025');
INSERT INTO ListOfHeroes VALUES ('LS026','TM026');
INSERT INTO ListOfHeroes VALUES ('LS027','TM027');
INSERT INTO ListOfHeroes VALUES ('LS028','TM028');
INSERT INTO ListOfHeroes VALUES ('LS029','TM029');
INSERT INTO ListOfHeroes VALUES ('LS030','TM030');

INSERT INTO ListOfHeroes VALUES ('LS031','TM031'); 
INSERT INTO ListOfHeroes VALUES ('LS032','TM032');
INSERT INTO ListOfHeroes VALUES ('LS033','TM033');
INSERT INTO ListOfHeroes VALUES ('LS034','TM034');
INSERT INTO ListOfHeroes VALUES ('LS035','TM035');
INSERT INTO ListOfHeroes VALUES ('LS036','TM036');
INSERT INTO ListOfHeroes VALUES ('LS037','TM037');
INSERT INTO ListOfHeroes VALUES ('LS038','TM038');
INSERT INTO ListOfHeroes VALUES ('LS039','TM039');
INSERT INTO ListOfHeroes VALUES ('LS040','TM040');

SELECT * FROM ListOfHeroes;


-- CREATE Team table
CREATE TABLE Team
(  
teamID VARCHAR(5) NOT NULL,  
playerID VARCHAR(5) NOT NULL,  
heroID VARCHAR(5) NOT NULL,  
skinID VARCHAR(5) NOT NULL,  
gameID VARCHAR(4) NOT NULL,  
CONSTRAINT Team_PK PRIMARY KEY (teamID, playerID), 
CONSTRAINT Team_teamID_FK FOREIGN KEY (teamID) REFERENCES ListOfHeroes (teamID), 
CONSTRAINT Team_PlyID_HrID_FK FOREIGN KEY (playerID, heroID) REFERENCES Player_Hero (playerID, heroID), 
CONSTRAINT Team_skID_FK FOREIGN KEY (skinID) REFERENCES Skin (skinID),
CONSTRAINT Team_gameID_FK FOREIGN KEY (gameID) REFERENCES Game (gameID),
CONSTRAINT  Uniq_TmID_HrID UNIQUE (teamID, heroID),  
CONSTRAINT  Uniq_PlyID_GmID UNIQUE (playerID, gameID)
);
GO

SELECT * FROM Team;

-- INSERT VALUES INTO Team Table

-- !!! ASSUME 'BB013, BB014, BB015' NEVERY PLAYED Before, for Student 3 Query part (c)

INSERT INTO Team VALUES ('TM001','BB001','HR001', 'SK001', 'G001'); --BB011, BB012 (Didn't Play)
INSERT INTO Team VALUES ('TM001','BB002','HR002', 'SK002', 'G001');
INSERT INTO Team VALUES ('TM001','BB003','HR003', 'SK003', 'G001');
INSERT INTO Team VALUES ('TM001','BB004','HR004', 'SK004', 'G001');
INSERT INTO Team VALUES ('TM001','BB005','HR005', 'SK005', 'G001');
INSERT INTO Team VALUES ('TM002','BB006','HR007', 'SK006', 'G001');
INSERT INTO Team VALUES ('TM002','BB007','HR002', 'SK007', 'G001');
INSERT INTO Team VALUES ('TM002','BB008','HR001', 'SK008', 'G001');
INSERT INTO Team VALUES ('TM002','BB009','HR006', 'SK009', 'G001');
INSERT INTO Team VALUES ('TM002','BB010','HR010', 'SK010', 'G001');

INSERT INTO Team VALUES ('TM003','BB001','HR001', 'SK001', 'G002'); --BB011, BB012 (Didn't Play)
INSERT INTO Team VALUES ('TM003','BB002','HR002', 'SK002', 'G002');
INSERT INTO Team VALUES ('TM003','BB003','HR003', 'SK003', 'G002');
INSERT INTO Team VALUES ('TM003','BB004','HR004', 'SK004', 'G002');
INSERT INTO Team VALUES ('TM003','BB005','HR005', 'SK005', 'G002');
INSERT INTO Team VALUES ('TM004','BB006','HR007', 'SK006', 'G002');
INSERT INTO Team VALUES ('TM004','BB007','HR002', 'SK007', 'G002');
INSERT INTO Team VALUES ('TM004','BB008','HR001', 'SK008', 'G002');
INSERT INTO Team VALUES ('TM004','BB009','HR006', 'SK009', 'G002');
INSERT INTO Team VALUES ('TM004','BB010','HR010', 'SK010', 'G002');

INSERT INTO Team VALUES ('TM005','BB011','HR008', 'SK007', 'G003'); --BB001, BB002 (Didn't Play)
INSERT INTO Team VALUES ('TM005','BB012','HR007', 'SK008', 'G003');
INSERT INTO Team VALUES ('TM005','BB003','HR003', 'SK003', 'G003');
INSERT INTO Team VALUES ('TM005','BB004','HR004', 'SK004', 'G003');
INSERT INTO Team VALUES ('TM005','BB005','HR005', 'SK005', 'G003');
INSERT INTO Team VALUES ('TM006','BB006','HR007', 'SK006', 'G003');
INSERT INTO Team VALUES ('TM006','BB007','HR002', 'SK007', 'G003');
INSERT INTO Team VALUES ('TM006','BB008','HR001', 'SK008', 'G003');
INSERT INTO Team VALUES ('TM006','BB009','HR006', 'SK009', 'G003');
INSERT INTO Team VALUES ('TM006','BB010','HR010', 'SK010', 'G003');

INSERT INTO Team VALUES ('TM007','BB011','HR008', 'SK007', 'G004'); --BB006, BB007 (Didn't Play)
INSERT INTO Team VALUES ('TM007','BB012','HR007', 'SK008', 'G004');
INSERT INTO Team VALUES ('TM007','BB003','HR003', 'SK003', 'G004');
INSERT INTO Team VALUES ('TM007','BB004','HR004', 'SK004', 'G004');
INSERT INTO Team VALUES ('TM007','BB005','HR005', 'SK005', 'G004');
INSERT INTO Team VALUES ('TM008','BB001','HR007', 'SK007', 'G004');
INSERT INTO Team VALUES ('TM008','BB002','HR005', 'SK019', 'G004');
INSERT INTO Team VALUES ('TM008','BB008','HR001', 'SK008', 'G004');
INSERT INTO Team VALUES ('TM008','BB009','HR006', 'SK009', 'G004');
INSERT INTO Team VALUES ('TM008','BB010','HR010', 'SK010', 'G004');

INSERT INTO Team VALUES ('TM009','BB001','HR001', 'SK001', 'G005'); --BB011, BB012 (Didn't Play)
INSERT INTO Team VALUES ('TM009','BB002','HR002', 'SK002', 'G005');
INSERT INTO Team VALUES ('TM009','BB003','HR003', 'SK003', 'G005');
INSERT INTO Team VALUES ('TM009','BB004','HR004', 'SK004', 'G005');
INSERT INTO Team VALUES ('TM009','BB005','HR005', 'SK005', 'G005');
INSERT INTO Team VALUES ('TM010','BB006','HR007', 'SK006', 'G005');
INSERT INTO Team VALUES ('TM010','BB007','HR002', 'SK007', 'G005');
INSERT INTO Team VALUES ('TM010','BB008','HR001', 'SK008', 'G005');
INSERT INTO Team VALUES ('TM010','BB009','HR006', 'SK009', 'G005');
INSERT INTO Team VALUES ('TM010','BB010','HR010', 'SK010', 'G005');


INSERT INTO Team VALUES ('TM011','BB011','HR008', 'SK007', 'G006'); --BB001, BB002 (Didn't Play)
INSERT INTO Team VALUES ('TM011','BB012','HR007', 'SK008', 'G006');
INSERT INTO Team VALUES ('TM011','BB003','HR003', 'SK003', 'G006');
INSERT INTO Team VALUES ('TM011','BB004','HR004', 'SK004', 'G006');
INSERT INTO Team VALUES ('TM011','BB005','HR005', 'SK005', 'G006');
INSERT INTO Team VALUES ('TM012','BB006','HR007', 'SK006', 'G006');
INSERT INTO Team VALUES ('TM012','BB007','HR002', 'SK007', 'G006');
INSERT INTO Team VALUES ('TM012','BB008','HR001', 'SK008', 'G006');
INSERT INTO Team VALUES ('TM012','BB009','HR006', 'SK009', 'G006');
INSERT INTO Team VALUES ('TM012','BB010','HR010', 'SK010', 'G006');

INSERT INTO Team VALUES ('TM013','BB011','HR008', 'SK007', 'G007'); --BB006, BB007 (Didn't Play)
INSERT INTO Team VALUES ('TM013','BB012','HR007', 'SK008', 'G007');
INSERT INTO Team VALUES ('TM013','BB003','HR003', 'SK003', 'G007');
INSERT INTO Team VALUES ('TM013','BB004','HR004', 'SK004', 'G007');
INSERT INTO Team VALUES ('TM013','BB005','HR005', 'SK005', 'G007');
INSERT INTO Team VALUES ('TM014','BB001','HR007', 'SK007', 'G007');
INSERT INTO Team VALUES ('TM014','BB002','HR005', 'SK019', 'G007');
INSERT INTO Team VALUES ('TM014','BB008','HR001', 'SK008', 'G007');
INSERT INTO Team VALUES ('TM014','BB009','HR006', 'SK009', 'G007');
INSERT INTO Team VALUES ('TM014','BB010','HR010', 'SK010', 'G007');

INSERT INTO Team VALUES ('TM015','BB001','HR001', 'SK001', 'G008'); --BB011, BB012 (Didn't Play)
INSERT INTO Team VALUES ('TM015','BB002','HR002', 'SK002', 'G008');
INSERT INTO Team VALUES ('TM015','BB003','HR003', 'SK003', 'G008');
INSERT INTO Team VALUES ('TM015','BB004','HR004', 'SK004', 'G008');
INSERT INTO Team VALUES ('TM015','BB005','HR005', 'SK005', 'G008');
INSERT INTO Team VALUES ('TM016','BB006','HR007', 'SK006', 'G008');
INSERT INTO Team VALUES ('TM016','BB007','HR002', 'SK007', 'G008');
INSERT INTO Team VALUES ('TM016','BB008','HR001', 'SK008', 'G008');
INSERT INTO Team VALUES ('TM016','BB009','HR006', 'SK009', 'G008');
INSERT INTO Team VALUES ('TM016','BB010','HR010', 'SK010', 'G008');

INSERT INTO Team VALUES ('TM017','BB011','HR008', 'SK007', 'G009'); --BB001, BB002 (Didn't Play)
INSERT INTO Team VALUES ('TM017','BB012','HR007', 'SK008', 'G009');
INSERT INTO Team VALUES ('TM017','BB003','HR003', 'SK003', 'G009');
INSERT INTO Team VALUES ('TM017','BB004','HR004', 'SK004', 'G009');
INSERT INTO Team VALUES ('TM017','BB005','HR005', 'SK005', 'G009');
INSERT INTO Team VALUES ('TM018','BB006','HR007', 'SK006', 'G009');
INSERT INTO Team VALUES ('TM018','BB007','HR002', 'SK007', 'G009');
INSERT INTO Team VALUES ('TM018','BB008','HR001', 'SK008', 'G009');
INSERT INTO Team VALUES ('TM018','BB009','HR006', 'SK009', 'G009');
INSERT INTO Team VALUES ('TM018','BB010','HR010', 'SK010', 'G009');

INSERT INTO Team VALUES ('TM019','BB011','HR008', 'SK007', 'G010'); --BB006, BB007 (Didn't Play)
INSERT INTO Team VALUES ('TM019','BB012','HR007', 'SK008', 'G010');
INSERT INTO Team VALUES ('TM019','BB003','HR003', 'SK003', 'G010');
INSERT INTO Team VALUES ('TM019','BB004','HR004', 'SK004', 'G010');
INSERT INTO Team VALUES ('TM019','BB005','HR005', 'SK005', 'G010');
INSERT INTO Team VALUES ('TM020','BB001','HR007', 'SK007', 'G010');
INSERT INTO Team VALUES ('TM020','BB002','HR005', 'SK019', 'G010');
INSERT INTO Team VALUES ('TM020','BB008','HR001', 'SK008', 'G010');
INSERT INTO Team VALUES ('TM020','BB009','HR006', 'SK009', 'G010');
INSERT INTO Team VALUES ('TM020','BB010','HR010', 'SK010', 'G010');

INSERT INTO Team VALUES ('TM021','BB001','HR001', 'SK001', 'G011'); --BB009, BB010 (Didn't Play)
INSERT INTO Team VALUES ('TM021','BB002','HR002', 'SK002', 'G011');
INSERT INTO Team VALUES ('TM021','BB003','HR003', 'SK003', 'G011');
INSERT INTO Team VALUES ('TM021','BB004','HR004', 'SK004', 'G011');
INSERT INTO Team VALUES ('TM021','BB005','HR005', 'SK005', 'G011');
INSERT INTO Team VALUES ('TM022','BB006','HR007', 'SK006', 'G011');
INSERT INTO Team VALUES ('TM022','BB007','HR002', 'SK007', 'G011');
INSERT INTO Team VALUES ('TM022','BB008','HR001', 'SK008', 'G011');
INSERT INTO Team VALUES ('TM022','BB011','HR008', 'SK007', 'G011');
INSERT INTO Team VALUES ('TM022','BB012','HR003', 'SK003', 'G011');

INSERT INTO Team VALUES ('TM023','BB001','HR001', 'SK001', 'G012'); --BB009, BB010 (Didn't Play)
INSERT INTO Team VALUES ('TM023','BB002','HR002', 'SK002', 'G012');
INSERT INTO Team VALUES ('TM023','BB003','HR003', 'SK003', 'G012');
INSERT INTO Team VALUES ('TM023','BB004','HR004', 'SK004', 'G012');
INSERT INTO Team VALUES ('TM023','BB005','HR005', 'SK005', 'G012');
INSERT INTO Team VALUES ('TM024','BB006','HR007', 'SK006', 'G012');
INSERT INTO Team VALUES ('TM024','BB007','HR002', 'SK007', 'G012');
INSERT INTO Team VALUES ('TM024','BB008','HR001', 'SK008', 'G012');
INSERT INTO Team VALUES ('TM024','BB011','HR008', 'SK007', 'G012');
INSERT INTO Team VALUES ('TM024','BB012','HR003', 'SK003', 'G012');

--!!!!
DROP TABLE Team;
GO

SELECT * FROM Team;


-- CREATE Personal_Statistics Table
CREATE TABLE Personal_Statistics
(
	playerID VARCHAR (5),
	gameID VARCHAR (4),
	gameStartDt SMALLDATETIME,
	gameEndDt SMALLDATETIME,
	gameModeName VARCHAR(20),
	gameModeType VARCHAR(20),
	gameResult VARCHAR (1),
	mostUsedHeroID VARCHAR (5),
	mostUsedHeroName VARCHAR (50),
	CONSTRAINT PsSt_PK PRIMARY KEY (playerID, gameID),
	CONSTRAINT PsSt_PlyID_FK FOREIGN KEY (playerID) REFERENCES Player (playerID),
	CONSTRAINT PsSt_GmID_FK FOREIGN KEY (gameID) REFERENCES Game (gameID),
	CONSTRAINT PsSt_MstUsdHr_FK FOREIGN KEY (mostUsedHeroID) REFERENCES Hero (heroID)
);
GO

SELECT * FROM Personal_Statistics;

SELECT * FROM Game;
SELECT * FROM GameMode;
SELECT * FROM ListOfHeroes;
SELECT * FROM Team;


--FUNCTION for gameResult attribute (Personal_Statistics Table)
GO
CREATE FUNCTION GetGameResult
(
	@playerID VARCHAR (5),
	@gameID VARCHAR (4)
)
RETURNS VARCHAR (1)
AS
BEGIN
	-- Declare RETURN variable here
	DECLARE @GameRes AS VARCHAR (1);
	DECLARE @playerwinnerID AS VARCHAR (1);

	--Add the SQL Statement
	SELECT @playerwinnerID = winners 
	FROM	(SELECT playerID AS winners
				FROM Team
				WHERE teamID IN	(SELECT teamID	-- TM001
									FROM ListOfHeroes
									WHERE listID = (SELECT gmRes
													FROM Game
													WHERE gameID = @gameID))) sub
	WHERE winners = @playerID;

	IF @playerwinnerID IS NOT NULL
		SET @GameRes = 'W'
	ELSE
		SET @GameRes = 'L'
		
	RETURN @GameRes;
END
GO

SELECT [dbo].[GetGameResult] ('BB001', 'G001') AS gameRes;
SELECT [dbo].[GetGameResult] ('BB006', 'G001') AS gameRes;

-- INSERT VALUES INTO Personal_Statistics Table
INSERT INTO Personal_Statistics VALUES 
('BB001','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB001', 'G001')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB002','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB002', 'G001')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB003','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB003', 'G001')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB004','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB004', 'G001')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB005','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB005', 'G001')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB006','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB006', 'G001')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB007','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB007', 'G001')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB008','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB008', 'G001')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB009','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB009', 'G001')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB010','G001', (SELECT gmStrDT FROM Game WHERE gameID = 'G001'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G001'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G001')),
(SELECT [dbo].[GetGameResult] ('BB010', 'G001')),
NULL, NULL);

------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Personal_Statistics VALUES 
('BB001','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB001', 'G002')),
NULL, NULL);
 
 INSERT INTO Personal_Statistics VALUES 
('BB002','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB002', 'G002')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB003','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB003', 'G002')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB004','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB004', 'G002')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB005','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB005', 'G002')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB006','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB006', 'G002')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB007','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB007', 'G002')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB008','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB008', 'G002')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB009','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB009', 'G002')),
NULL, NULL);

INSERT INTO Personal_Statistics VALUES 
('BB010','G002', (SELECT gmStrDT FROM Game WHERE gameID = 'G002'), 
(SELECT gmEndDT FROM Game WHERE gameID = 'G002'), 
(SELECT gameModeName FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT gameModeType FROM GameMode WHERE gameModeID = (SELECT gameModeID FROM Game WHERE gameID = 'G002')),
(SELECT [dbo].[GetGameResult] ('BB010', 'G002')),
NULL, NULL);

/*Create Temp Table for processing mostUsedHeroID-----------------------------------------------*/
CREATE TABLE #mostUsed (
	playersID VARCHAR(5) NOT NULL,
	heroesID VARCHAR(5),
	times INT ,
	CONSTRAINT mostUsed_pk PRIMARY KEY (playersID)
);
/*--------------------------------------------------------------------------------*/

/*UPDATE mostUsedHeroID-----------------------------------------------*/
DECLARE @Counter INT
SET @Counter= (SELECT COUNT(DISTINCT playerID) FROM Team)
WHILE ( @Counter > 0)
BEGIN
INSERT INTO #mostUsed (playersID,heroesID,times)
SELECT 
    sub.playerID, sub.heroID, sub.usage
FROM 
(
SELECT t.playerID,t.heroID,COUNT(t.heroID) as usage
FROM Team t
WHERE t.playerID LIKE
  CASE 
  WHEN @Counter <= 99 and @Counter > 9 THEN ('BB0' + CONVERT(varchar(5),@Counter))
  WHEN @Counter <= 9 and @Counter > 0 THEN ('BB00' + CONVERT(varchar(5),@Counter))
END
GROUP BY t.playerID,t.heroID
--ORDER BY COUNT(t.heroID)
) sub
WHERE sub.usage = (SELECT MAX(usage)
FROM 
(
SELECT t.playerID,t.heroID,COUNT(t.heroID) as usage
FROM Team t
WHERE t.playerID LIKE
  CASE 
  WHEN @Counter <= 99 and @Counter > 9 THEN ('BB0' + CONVERT(varchar(5),@Counter))
  WHEN @Counter <= 9 and @Counter > 0 THEN ('BB00' + CONVERT(varchar(5),@Counter))
END
GROUP BY t.playerID,t.heroID
--ORDER BY COUNT(t.heroID)
) sub2
)
SET @Counter  = @Counter  - 1
END

UPDATE Personal_Statistics
SET 
mostUsedHeroID = M.heroesID
--TIMESUSED = M.times
FROM #mostused M
WHERE
    Personal_Statistics.playerID = M.playersID;
/*--------------------------------------------------------------------------------*/

/*UPDATE mostUsedHeroName-----------------------------------------------*/
UPDATE Personal_Statistics SET mostUsedHeroName = (SELECT heroName FROM Hero WHERE heroID = mostUsedHeroID );

--!!!!!
DROP TABLE Personal_Statistics;
GO

SELECT * FROM Personal_Statistics;


/*
SELECT playerID, heroID, times_used
FROM   (SELECT ROW_NUMBER () OVER (PARTITION BY playerID ORDER BY playerID) AS TempUniqRow, *
		FROM	(SELECT playerID, heroID, COUNT(heroID) AS times_used
				 FROM Team
				 GROUP BY playerID, heroID) sub
		) sub
WHERE TempUniqRow = 1
ORDER BY playerID, times_used DESC


SELECT heroName AS mostUsedHeroName
FROM Hero
WHERE heroID = (SELECT heroID
				FROM   (SELECT ROW_NUMBER () OVER (PARTITION BY playerID ORDER BY playerID) AS TempUniqRow, *
						FROM	(SELECT p.playerID, heroID, COUNT(heroID) AS times_used
								 FROM Team t RIGHT JOIN Player p
								 ON t.playerID = p.playerID
								 GROUP BY p.playerID, heroID) sub
						ORDER BY playerID, times_used DESC OFFSET 0 ROWS
						) sub
				WHERE TempUniqRow = 1 AND playerID = 'BB001'
				);
*/








