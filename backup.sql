--
-- PostgreSQL database dump
--

\restrict iCMYFu6be2IMslUaQA64ZWzGa6g8qmBx3sFxE01LyL58U933VOfTUNmmHiyxgn6

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
1	Pac-Man	Arcade
2	Space Invaders	Shooter
3	Tetris	Puzzle
4	Pong	Sports
5	Donkey Kong	Platform
6	Asteroids	Shooter
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.players (id, name, join_date) FROM stdin;
1	Erik Andersson	2024-01-15
2	Anna Lindqvist	2024-02-20
3	Lars Johansson	2024-03-10
4	Ingrid Bergman	2024-04-05
5	Gustav Svensson	2024-05-12
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scores (id, player_id, game_id, score, date_played) FROM stdin;
1	1	1	12500	2024-06-01
2	1	2	8750	2024-06-02
3	1	3	45000	2024-06-03
4	2	2	15600	2024-06-01
5	2	4	21	2024-06-04
6	2	5	89200	2024-06-05
7	3	1	9800	2024-06-02
8	3	3	67500	2024-06-06
9	4	6	34500	2024-06-03
10	4	1	11200	2024-06-07
11	4	4	18	2024-06-08
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

\unrestrict iCMYFu6be2IMslUaQA64ZWzGa6g8qmBx3sFxE01LyL58U933VOfTUNmmHiyxgn6

