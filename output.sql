--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2 (Ubuntu 10.2-1.pgdg14.04+1)
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: cs313; Type: SCHEMA; Schema: -; Owner: zjtpcekghekvtr
--

CREATE SCHEMA cs313;


ALTER SCHEMA cs313 OWNER TO zjtpcekghekvtr;

--
-- Name: mys; Type: SCHEMA; Schema: -; Owner: zjtpcekghekvtr
--

CREATE SCHEMA mys;


ALTER SCHEMA mys OWNER TO zjtpcekghekvtr;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: goalies; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE goalies (
    id integer,
    games_played integer DEFAULT 0 NOT NULL,
    wins integer DEFAULT 0 NOT NULL,
    losses integer DEFAULT 0 NOT NULL,
    shutouts integer DEFAULT 0 NOT NULL,
    goals_against integer DEFAULT 0 NOT NULL,
    shots_faced integer DEFAULT 0 NOT NULL
);


ALTER TABLE goalies OWNER TO zjtpcekghekvtr;

--
-- Name: note; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE note (
    id integer NOT NULL,
    userid integer NOT NULL,
    content text
);


ALTER TABLE note OWNER TO zjtpcekghekvtr;

--
-- Name: note_id_seq; Type: SEQUENCE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE SEQUENCE note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE note_id_seq OWNER TO zjtpcekghekvtr;

--
-- Name: note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zjtpcekghekvtr
--

ALTER SEQUENCE note_id_seq OWNED BY note.id;


--
-- Name: note_user; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE note_user (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255)
);


ALTER TABLE note_user OWNER TO zjtpcekghekvtr;

--
-- Name: note_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE SEQUENCE note_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE note_user_id_seq OWNER TO zjtpcekghekvtr;

--
-- Name: note_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zjtpcekghekvtr
--

ALTER SEQUENCE note_user_id_seq OWNED BY note_user.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE players (
    player_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(20),
    "position" character varying(10),
    birth_year integer NOT NULL,
    birth_country character varying(20)
);


ALTER TABLE players OWNER TO zjtpcekghekvtr;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE SEQUENCE players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_player_id_seq OWNER TO zjtpcekghekvtr;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zjtpcekghekvtr
--

ALTER SEQUENCE players_player_id_seq OWNED BY players.player_id;


--
-- Name: scripture; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE scripture (
    id integer NOT NULL,
    book character varying(80) NOT NULL,
    chapter integer NOT NULL,
    verse integer NOT NULL,
    content character varying(4000) NOT NULL
);


ALTER TABLE scripture OWNER TO zjtpcekghekvtr;

--
-- Name: scripture_id_seq; Type: SEQUENCE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE SEQUENCE scripture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scripture_id_seq OWNER TO zjtpcekghekvtr;

--
-- Name: scripture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zjtpcekghekvtr
--

ALTER SEQUENCE scripture_id_seq OWNED BY scripture.id;


--
-- Name: scripture_topic; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE scripture_topic (
    scriptureid integer NOT NULL,
    topicid integer NOT NULL
);


ALTER TABLE scripture_topic OWNER TO zjtpcekghekvtr;

--
-- Name: stats; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE stats (
    id integer NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    goals integer DEFAULT 0 NOT NULL,
    assists integer DEFAULT 0 NOT NULL,
    points integer DEFAULT 0 NOT NULL,
    penalty_mins integer DEFAULT 0 NOT NULL
);


ALTER TABLE stats OWNER TO zjtpcekghekvtr;

--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE SEQUENCE stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stats_id_seq OWNER TO zjtpcekghekvtr;

--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zjtpcekghekvtr
--

ALTER SEQUENCE stats_id_seq OWNED BY stats.id;


--
-- Name: topic; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE topic (
    id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE topic OWNER TO zjtpcekghekvtr;

--
-- Name: topic_id_seq; Type: SEQUENCE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE SEQUENCE topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_id_seq OWNER TO zjtpcekghekvtr;

--
-- Name: topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zjtpcekghekvtr
--

ALTER SEQUENCE topic_id_seq OWNED BY topic.id;


--
-- Name: note id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note ALTER COLUMN id SET DEFAULT nextval('note_id_seq'::regclass);


--
-- Name: note_user id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note_user ALTER COLUMN id SET DEFAULT nextval('note_user_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY players ALTER COLUMN player_id SET DEFAULT nextval('players_player_id_seq'::regclass);


--
-- Name: scripture id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY scripture ALTER COLUMN id SET DEFAULT nextval('scripture_id_seq'::regclass);


--
-- Name: stats id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY stats ALTER COLUMN id SET DEFAULT nextval('stats_id_seq'::regclass);


--
-- Name: topic id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY topic ALTER COLUMN id SET DEFAULT nextval('topic_id_seq'::regclass);


--
-- Data for Name: goalies; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY goalies (id, games_played, wins, losses, shutouts, goals_against, shots_faced) FROM stdin;
1	30	17	11	2	79	914
2	33	15	12	2	89	921
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY note (id, userid, content) FROM stdin;
1	1	A note for John
2	1	Another note for John
3	2	And this is a note for Jane
\.


--
-- Data for Name: note_user; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY note_user (id, username, password) FROM stdin;
1	john	pass
2	jane	byui
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY players (player_id, first_name, last_name, "position", birth_year, birth_country) FROM stdin;
1	Jonathan	Bernier	G	1988	Canada
2	Semyon	Varlamov	G	1988	Russia
3	Nathan	MacKinnon	C	1995	Canada
4	Mikko	Rantanen	RW	1996	Finland
5	Gabriel	Landeskog	LW	1992	Sweden
6	Tyson	Barrie	D	1991	Canada
7	Alexander	Kerfoot	C	1994	Canada
8	Carl	Soderberg	C	1985	Sweden
9	Blake	Comeau	LW	1986	Canada
10	Erik	Johnson	D	1988	USA
11	JT	Compher	LW	1995	USA
12	Matt	Nieto	LW	1992	USA
13	Sven	Andrighetto	RW	1993	Switzerland
14	Nail	Yakupov	RW	1993	Russia
15	Tyson	Jost	C	1998	Canada
16	Colin	Wilson	C	1989	USA
17	Nikita	Zadorov	D	1995	Russia
18	Mark	Barberio	D	1990	Canada
19	Patrik	Nemeth	D	1992	Sweden
20	Samuel	Girard	D	1998	Canada
21	Gabriel	Bourque	LW	1990	Canada
22	Andrei	Mironov	D	1994	Russia
23	Rocco	Grimaldi	C	1993	USA
24	Anton	Lindholm	D	1994	Sweden
25	Dominic	Toninato	C	1994	USA
26	David	Warsofsky	D	1990	USA
27	Duncan	Siemens	D	1993	Canada
28	Vladislav	Kamenev	C	1996	Russia
32	Casey	Nesbit	C	1984	USA
\.


--
-- Data for Name: scripture; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY scripture (id, book, chapter, verse, content) FROM stdin;
1	John	1	5	And the light shineth in darkness; and the darkness comprehended it not.
2	Doctrine and Covenants	88	49	The light shineth in darkness, and the darkness comprehendeth it not; nevertheless, the day shall come when you shall comprehend even God, being quickened in him and by him.
3	Doctrine and Covenants	93	28	He that keepeth his commandments receiveth truth and light, until he is glorified in truth and knoweth all things.
4	Mosiah	16	9	He is the light and the life of the world; yea, a light that is endless, that can never be darkened; yea, and also a life which is endless, that there can be no more death.
5	Rex	2	1	This is a test.
8	Taylor 	5	13	test tstsgdhfncfckflmfkvlvlmgvmg gvgvgvgvg. 
\.


--
-- Data for Name: scripture_topic; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY scripture_topic (scriptureid, topicid) FROM stdin;
5	3
8	2
\.


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY stats (id, games_played, goals, assists, points, penalty_mins) FROM stdin;
3	51	25	40	65	40
4	58	19	37	56	30
5	55	20	24	44	25
6	45	6	30	36	18
7	56	15	20	35	26
8	56	11	13	24	26
9	56	10	12	22	30
10	56	7	15	22	56
11	46	11	9	20	16
12	51	10	8	18	14
13	37	6	12	18	6
14	51	9	7	16	26
15	42	7	8	15	10
16	46	5	20	15	6
17	54	4	11	15	54
18	44	3	10	13	27
19	45	3	9	12	31
20	45	1	11	12	4
21	35	5	3	8	8
22	10	1	2	3	12
23	6	1	2	3	0
24	43	0	3	3	14
25	23	0	1	1	10
26	2	0	0	0	0
27	2	0	0	0	0
28	1	0	0	0	0
4	0	0	0	0	0
\.


--
-- Data for Name: topic; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY topic (id, name) FROM stdin;
1	Faith
2	Sacrifice
3	Charity
\.


--
-- Name: note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('note_id_seq', 3, true);


--
-- Name: note_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('note_user_id_seq', 2, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('players_player_id_seq', 32, true);


--
-- Name: scripture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('scripture_id_seq', 9, true);


--
-- Name: stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('stats_id_seq', 4, true);


--
-- Name: topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('topic_id_seq', 3, true);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: note_user note_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note_user
    ADD CONSTRAINT note_user_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: scripture scripture_pkey; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY scripture
    ADD CONSTRAINT scripture_pkey PRIMARY KEY (id);


--
-- Name: topic topic_pkey; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);


--
-- Name: goalies goalies_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY goalies
    ADD CONSTRAINT goalies_id_fkey FOREIGN KEY (id) REFERENCES players(player_id);


--
-- Name: note note_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_userid_fkey FOREIGN KEY (userid) REFERENCES note_user(id);


--
-- Name: scripture_topic scripture_topic_scriptureid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY scripture_topic
    ADD CONSTRAINT scripture_topic_scriptureid_fkey FOREIGN KEY (scriptureid) REFERENCES scripture(id);


--
-- Name: scripture_topic scripture_topic_topicid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY scripture_topic
    ADD CONSTRAINT scripture_topic_topicid_fkey FOREIGN KEY (topicid) REFERENCES topic(id);


--
-- Name: stats stats_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY stats
    ADD CONSTRAINT stats_id_fkey FOREIGN KEY (id) REFERENCES players(player_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: zjtpcekghekvtr
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO zjtpcekghekvtr;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO zjtpcekghekvtr;


--
-- PostgreSQL database dump complete
--

