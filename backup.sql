--
-- PostgreSQL database dump
--

\restrict b3QeDHVZZXcecoNo8HAxyUw51SWL42pRwy6CMPiEDe7jCwanCKHWASIrLD6vRT4

-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.games (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    genre character varying(100) NOT NULL
);


ALTER TABLE public.games OWNER TO root;

--
-- Name: players; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    join_date date
);


ALTER TABLE public.players OWNER TO root;

--
-- Name: scores; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scores (
    id integer NOT NULL,
    player_id integer NOT NULL,
    game_id integer NOT NULL,
    score integer,
    date_played date
);


ALTER TABLE public.scores OWNER TO root;

--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.games (id, title, genre) FROM stdin;
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.players (id, name, join_date) FROM stdin;
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scores (id, player_id, game_id, score, date_played) FROM stdin;
\.


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


--
-- Name: scores scores_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: scores scores_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--

\unrestrict b3QeDHVZZXcecoNo8HAxyUw51SWL42pRwy6CMPiEDe7jCwanCKHWASIrLD6vRT4

