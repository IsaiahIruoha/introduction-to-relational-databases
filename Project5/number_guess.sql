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

DROP DATABASE numberguess;
--
-- Name: numberguess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE numberguess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE numberguess OWNER TO freecodecamp;

\connect numberguess

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
-- Name: playerbase; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.playerbase (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    number_of_guesses integer
);


ALTER TABLE public.playerbase OWNER TO freecodecamp;

--
-- Name: playerbase_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.playerbase_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playerbase_user_id_seq OWNER TO freecodecamp;

--
-- Name: playerbase_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.playerbase_user_id_seq OWNED BY public.playerbase.user_id;


--
-- Name: playerbase user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.playerbase ALTER COLUMN user_id SET DEFAULT nextval('public.playerbase_user_id_seq'::regclass);


--
-- Data for Name: playerbase; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.playerbase VALUES (60, 'user_1690810450696', 2, 46);
INSERT INTO public.playerbase VALUES (59, 'user_1690810450697', 5, 109);
INSERT INTO public.playerbase VALUES (62, 'user_1690810464198', 2, 204);
INSERT INTO public.playerbase VALUES (61, 'user_1690810464199', 5, 122);
INSERT INTO public.playerbase VALUES (64, 'user_1690810705456', 2, 711);
INSERT INTO public.playerbase VALUES (63, 'user_1690810705457', 5, 67);
INSERT INTO public.playerbase VALUES (66, 'user_1690810731365', 2, 430);
INSERT INTO public.playerbase VALUES (65, 'user_1690810731366', 5, 79);


--
-- Name: playerbase_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.playerbase_user_id_seq', 66, true);


--
-- Name: playerbase playerbase_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.playerbase
    ADD CONSTRAINT playerbase_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

