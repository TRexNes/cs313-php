--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
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
-- Name: conference; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE conference (
    id integer NOT NULL,
    year smallint NOT NULL,
    is_spring boolean NOT NULL
);


ALTER TABLE conference OWNER TO zjtpcekghekvtr;

--
-- Name: conference_id_seq; Type: SEQUENCE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE SEQUENCE conference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conference_id_seq OWNER TO zjtpcekghekvtr;

--
-- Name: conference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zjtpcekghekvtr
--

ALTER SEQUENCE conference_id_seq OWNED BY conference.id;


--
-- Name: note; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE note (
    id integer NOT NULL,
    user_id integer NOT NULL,
    speaker_id integer NOT NULL,
    conference_id integer NOT NULL,
    note_text text NOT NULL
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
-- Name: speaker; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE speaker (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE speaker OWNER TO zjtpcekghekvtr;

--
-- Name: speaker_id_seq; Type: SEQUENCE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE SEQUENCE speaker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE speaker_id_seq OWNER TO zjtpcekghekvtr;

--
-- Name: speaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zjtpcekghekvtr
--

ALTER SEQUENCE speaker_id_seq OWNED BY speaker.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    display_name character varying(100) NOT NULL
);


ALTER TABLE "user" OWNER TO zjtpcekghekvtr;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: zjtpcekghekvtr
--

CREATE SEQUENCE user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO zjtpcekghekvtr;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zjtpcekghekvtr
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: conference id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY conference ALTER COLUMN id SET DEFAULT nextval('conference_id_seq'::regclass);


--
-- Name: note id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note ALTER COLUMN id SET DEFAULT nextval('note_id_seq'::regclass);


--
-- Name: speaker id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY speaker ALTER COLUMN id SET DEFAULT nextval('speaker_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Data for Name: conference; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY conference (id, year, is_spring) FROM stdin;
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY note (id, user_id, speaker_id, conference_id, note_text) FROM stdin;
\.


--
-- Data for Name: speaker; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY speaker (id, name) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: zjtpcekghekvtr
--

COPY "user" (id, username, password, display_name) FROM stdin;
\.


--
-- Name: conference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('conference_id_seq', 1, false);


--
-- Name: note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('note_id_seq', 1, false);


--
-- Name: speaker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('speaker_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zjtpcekghekvtr
--

SELECT pg_catalog.setval('user_id_seq', 1, false);


--
-- Name: conference conference_pkey; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY conference
    ADD CONSTRAINT conference_pkey PRIMARY KEY (id);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: speaker speaker_pkey; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY speaker
    ADD CONSTRAINT speaker_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: note note_conference_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_conference_id_fkey FOREIGN KEY (conference_id) REFERENCES conference(id);


--
-- Name: note note_speaker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_speaker_id_fkey FOREIGN KEY (speaker_id) REFERENCES speaker(id);


--
-- Name: note note_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zjtpcekghekvtr
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


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

