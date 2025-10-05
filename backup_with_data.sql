--
-- PostgreSQL database dump
--

\restrict ZOwET6CgaruLJ4jXATt32MbYT9nAI8EUyyou9p3n7bJh7aqNYqI41IIKXj6SXZw

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
2	Space Invaders	Arcade
3	Tetris	Puzzle
4	Frogger	Arcade
5	Donkey Kong	Platform
6	Asteroids	Arcade
7	Centipede	Arcade
8	Galaga	Arcade
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.players (id, name, join_date) FROM stdin;
1	Axel Andersson	2023-01-15
2	Anna Anka	2023-02-20
3	Lars Johansson	2023-03-10
4	Maria Svensson	2023-04-05
5	Nils Qvist	2023-05-12
6	Pelle Potatis	2023-12-01
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scores (id, player_id, game_id, score, date_played) FROM stdin;
1	1	1	234560	2023-02-01
2	1	2	15400	2023-02-15
3	1	3	89750	2023-03-01
4	1	6	47800	2023-03-15
5	2	1	198320	2023-03-05
6	2	4	12650	2023-03-20
7	2	5	78900	2023-04-01
8	2	7	23470	2023-04-15
9	3	2	18950	2023-04-01
10	3	3	156230	2023-04-10
11	3	6	52100	2023-05-01
12	3	8	34780	2023-05-15
13	4	1	287450	2023-05-01
14	4	4	18750	2023-05-15
15	4	5	95600	2023-06-01
16	4	7	28930	2023-06-15
17	5	2	22340	2023-06-01
18	5	3	134890	2023-06-15
19	5	6	41200	2023-07-01
20	5	8	41560	2023-07-15
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

\unrestrict ZOwET6CgaruLJ4jXATt32MbYT9nAI8EUyyou9p3n7bJh7aqNYqI41IIKXj6SXZw

