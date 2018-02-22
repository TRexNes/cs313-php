 DROP TABLE IF EXISTS players CASCADE;

CREATE TABLE players(
	  player_id SERIAL NOT NULL PRIMARY KEY,
	  first_name varchar(20),
	  last_name varchar(20),
	  position varchar(10),
	  birth_year INT NOT NULL,
	  birth_country varchar(20)
	);

DROP TABLE IF EXISTS stats CASCADE;

CREATE TABLE stats(
	  id INT REFERENCES players(player_id), 
	  games_played INT NOT NULL DEFAULT 0,
	  goals INT NOT NULL DEFAULT 0,
	  assists INT NOT NULL DEFAULT 0,
	  points INT NOT NULL DEFAULT 0,
	  penalty_mins INT DEFAULT 0
	);

DROP TABLE IF EXISTS goalies CASCADE;

CREATE TABLE goalies(
	  id INT REFERENCES players(player_id),
	  games_played INT NOT NULL DEFAULT 0,
	  wins INT NOT NULL DEFAULT 0,
	  losses INT NOT NULL DEFAULT 0,
      shutouts INT NOT NULL DEFAULT 0,
	  goals_against INT NOT NULL DEFAULT 0,
	  shots_faced INT NOT NULL DEFAULT 0
	);
	


INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Jonathan', 'Bernier', 'G', '1988', 'Canada');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Semyon', 'Varlamov', 'G', '1988', 'Russia');
    
INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Nathan', 'MacKinnon', 'C', '1995', 'Canada');
 
INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Mikko', 'Rantanen', 'RW', '1996', 'Finland');
    
INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Gabriel', 'Landeskog', 'LW', '1992', 'Sweden');
    
INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Tyson', 'Barrie', 'D', '1991', 'Canada');
    
INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Alexander', 'Kerfoot', 'C', '1994', 'Canada');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Carl', 'Soderberg', 'C', '1985', 'Sweden');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Blake', 'Comeau', 'LW', '1986', 'Canada');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Erik', 'Johnson', 'D', '1988', 'USA');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('JT', 'Compher', 'LW', '1995', 'USA');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Matt', 'Nieto', 'LW', '1992', 'USA');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Sven', 'Andrighetto', 'RW', '1993', 'Switzerland');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Nail', 'Yakupov', 'RW', '1993', 'Russia');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Tyson', 'Jost', 'C', '1998', 'Canada');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Colin', 'Wilson', 'C', '1989', 'USA');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Nikita', 'Zadorov', 'D', '1995', 'Russia');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Mark', 'Barberio', 'D', '1990', 'Canada');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Patrik', 'Nemeth', 'D', '1992', 'Sweden');                                       

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Samuel', 'Girard', 'D', '1998', 'Canada');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Gabriel', 'Bourque', 'LW', '1990', 'Canada');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Andrei', 'Mironov', 'D', '1994', 'Russia');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Rocco', 'Grimaldi', 'C', '1993', 'USA');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Anton', 'Lindholm', 'D', '1994', 'Sweden');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Dominic', 'Toninato', 'C', '1994', 'USA');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('David', 'Warsofsky', 'D', '1990', 'USA');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Duncan', 'Siemens', 'D', '1993', 'Canada');

INSERT INTO players (first_name, last_name, position, birth_year, birth_country)
    VALUES ('Vladislav', 'Kamenev', 'C', '1996', 'Russia');                                





INSERT INTO goalies (id, games_played, wins, losses, shutouts, goals_against, shots_faced)
    VALUES (1, 30, 17, 11, 2, 79, 914);

INSERT INTO goalies (id, games_played, wins, losses, shutouts, goals_against, shots_faced)
    VALUES (2, 33, 15, 12, 2, 89, 921);




INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (3, 51, 25, 40, 65, 40);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (4, 58, 19, 37, 56, 30);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (5, 55, 20, 24, 44, 25);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (6, 45, 6, 30, 36, 18); 
    
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (7, 56, 15, 20, 35, 26);               

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (8, 56, 11, 13, 24, 26);
    
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (9, 56, 10, 12, 22, 30);
    
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (10, 56, 7, 15, 22, 56);
        
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (11, 46, 11, 9, 20, 16);    
    
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (12, 51, 10, 8, 18, 14);    
    
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (13, 37, 6, 12, 18, 6);
    
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (14, 51, 9, 7, 16, 26);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (15, 42, 7, 8, 15, 10);
    
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (16, 46, 5, 20, 15, 6);    

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (17, 54, 4, 11, 15, 54);    
    
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (18, 44, 3, 10, 13, 27);        
    
INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (19, 45, 3, 9, 12, 31);    

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (20, 45, 1, 11, 12, 4);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (21, 35, 5, 3, 8, 8);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (22, 10, 1, 2, 3, 12);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (23, 6, 1, 2, 3, 0);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (24, 43, 0, 3, 3, 14);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (25, 23, 0, 1, 1, 10);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (26, 2, 0, 0, 0, 0);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (27, 2, 0, 0, 0, 0);

INSERT INTO stats (id, games_played, goals, assists, points, penalty_mins)
    VALUES (28, 1, 0, 0, 0, 0);





SELECT players.last_name, stats.games_played, stats.goals, stats.assists, stats.points, stats.penalty_mins
FROM stats
JOIN players ON players.player_id=stats.id;


