 DROP TABLE IF EXISTS players CASCADE;

CREATE TABLE public.players(
	  playerid SERIAL NOT NULL PRIMARY KEY,
	  firstname varchar(20),
	  lastname varchar(20),
	  position varchar(10),
	  birthyear INT NOT NULL,
	  birthcountry varchar(20)
	);

CREATE TABLE public.stats(
	  playerid INT NOT NULL REFERENCES public.players(playerid), 
	  position varchar(20) NOT NULL,
	  gamesplayed INT NOT NULL DEFAULT 0,
	  goals INT NOT NULL DEFAULT 0,
	  assists INT NOT NULL DEFAULT 0,
	  points INT NOT NULL DEFAULT 0,
	  penaltymins INT NOT NULL DEFAULT 0
	);


CREATE TABLE public.goalies(
	  playerid INT NOT NULL REFERENCES public.players(playerid),
	  gamesplayed INT NOT NULL DEFAULT 0,
	  wins INT NOT NULL DEFAULT 0,
	  losses INT NOT NULL DEFAULT 0,
      shutouts INT NOT NULL DEFAULT 0,
	  goalsagainst INT NOT NULL DEFAULT 0,
	  shotsfaced INT NOT NULL DEFAULT 0
	);
	

