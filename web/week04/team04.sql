# First Create the database
CREATE DATABASE conference;


CREATE TABLE public.user
(
	id SERIAL NOT NULL PRIMARY KEY,
	username VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR(100) NOT NULL,
	display_name VARCHAR(100) NOT NULL
);


CREATE TABLE public.speaker
(
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE public.conference
(
	id SERIAL NOT NULL PRIMARY KEY,
	year SMALLINT NOT NULL,
	is_spring BOOLEAN NOT NULL
);



CREATE TABLE public.note
(
	id SERIAL NOT NULL PRIMARY KEY,
	user_id INT NOT NULL REFERENCES public.user(id),
	speaker_id INT NOT NULL REFERENCES public.speaker(id),
	conference_id INT NOT NULL REFERENCES public.conference(id),
	note_text TEXT NOT NULL
);


