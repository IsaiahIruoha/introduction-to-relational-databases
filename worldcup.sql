--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (261, 2018, 'Final', 537, 536, 4, 2);
INSERT INTO public.games VALUES (262, 2018, 'Third Place', 539, 538, 2, 0);
INSERT INTO public.games VALUES (263, 2018, 'Semi-Final', 536, 538, 2, 1);
INSERT INTO public.games VALUES (264, 2018, 'Semi-Final', 537, 539, 1, 0);
INSERT INTO public.games VALUES (265, 2018, 'Quarter-Final', 536, 540, 3, 2);
INSERT INTO public.games VALUES (266, 2018, 'Quarter-Final', 538, 541, 2, 0);
INSERT INTO public.games VALUES (267, 2018, 'Quarter-Final', 539, 542, 2, 1);
INSERT INTO public.games VALUES (268, 2018, 'Quarter-Final', 537, 543, 2, 0);
INSERT INTO public.games VALUES (269, 2018, 'Eighth-Final', 538, 544, 2, 1);
INSERT INTO public.games VALUES (270, 2018, 'Eighth-Final', 541, 545, 1, 0);
INSERT INTO public.games VALUES (271, 2018, 'Eighth-Final', 539, 546, 3, 2);
INSERT INTO public.games VALUES (272, 2018, 'Eighth-Final', 542, 547, 2, 0);
INSERT INTO public.games VALUES (273, 2018, 'Eighth-Final', 536, 548, 2, 1);
INSERT INTO public.games VALUES (274, 2018, 'Eighth-Final', 540, 549, 2, 1);
INSERT INTO public.games VALUES (275, 2018, 'Eighth-Final', 543, 550, 2, 1);
INSERT INTO public.games VALUES (276, 2018, 'Eighth-Final', 537, 551, 4, 3);
INSERT INTO public.games VALUES (277, 2014, 'Final', 552, 551, 1, 0);
INSERT INTO public.games VALUES (278, 2014, 'Third Place', 553, 542, 3, 0);
INSERT INTO public.games VALUES (279, 2014, 'Semi-Final', 551, 553, 1, 0);
INSERT INTO public.games VALUES (280, 2014, 'Semi-Final', 552, 542, 7, 1);
INSERT INTO public.games VALUES (281, 2014, 'Quarter-Final', 553, 554, 1, 0);
INSERT INTO public.games VALUES (282, 2014, 'Quarter-Final', 551, 539, 1, 0);
INSERT INTO public.games VALUES (283, 2014, 'Quarter-Final', 542, 544, 2, 1);
INSERT INTO public.games VALUES (284, 2014, 'Quarter-Final', 552, 537, 1, 0);
INSERT INTO public.games VALUES (285, 2014, 'Eighth-Final', 542, 555, 2, 1);
INSERT INTO public.games VALUES (286, 2014, 'Eighth-Final', 544, 543, 2, 0);
INSERT INTO public.games VALUES (287, 2014, 'Eighth-Final', 537, 556, 2, 0);
INSERT INTO public.games VALUES (288, 2014, 'Eighth-Final', 552, 557, 2, 1);
INSERT INTO public.games VALUES (289, 2014, 'Eighth-Final', 553, 547, 2, 1);
INSERT INTO public.games VALUES (290, 2014, 'Eighth-Final', 554, 558, 2, 1);
INSERT INTO public.games VALUES (291, 2014, 'Eighth-Final', 551, 545, 1, 0);
INSERT INTO public.games VALUES (292, 2014, 'Eighth-Final', 539, 559, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (536, 'Croatia');
INSERT INTO public.teams VALUES (537, 'France');
INSERT INTO public.teams VALUES (538, 'England');
INSERT INTO public.teams VALUES (539, 'Belgium');
INSERT INTO public.teams VALUES (540, 'Russia');
INSERT INTO public.teams VALUES (541, 'Sweden');
INSERT INTO public.teams VALUES (542, 'Brazil');
INSERT INTO public.teams VALUES (543, 'Uruguay');
INSERT INTO public.teams VALUES (544, 'Colombia');
INSERT INTO public.teams VALUES (545, 'Switzerland');
INSERT INTO public.teams VALUES (546, 'Japan');
INSERT INTO public.teams VALUES (547, 'Mexico');
INSERT INTO public.teams VALUES (548, 'Denmark');
INSERT INTO public.teams VALUES (549, 'Spain');
INSERT INTO public.teams VALUES (550, 'Portugal');
INSERT INTO public.teams VALUES (551, 'Argentina');
INSERT INTO public.teams VALUES (552, 'Germany');
INSERT INTO public.teams VALUES (553, 'Netherlands');
INSERT INTO public.teams VALUES (554, 'Costa Rica');
INSERT INTO public.teams VALUES (555, 'Chile');
INSERT INTO public.teams VALUES (556, 'Nigeria');
INSERT INTO public.teams VALUES (557, 'Algeria');
INSERT INTO public.teams VALUES (558, 'Greece');
INSERT INTO public.teams VALUES (559, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 293, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 568, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

