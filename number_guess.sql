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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    user_id integer NOT NULL,
    total_guesses integer NOT NULL,
    secret_number integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 11, 385);
INSERT INTO public.games VALUES (2, 1, 11, 385);
INSERT INTO public.games VALUES (3, 1, 14, 947);
INSERT INTO public.games VALUES (4, 1, 8, 128);
INSERT INTO public.games VALUES (5, 2, 12, 673);
INSERT INTO public.games VALUES (6, 3, 807, 806);
INSERT INTO public.games VALUES (7, 3, 370, 369);
INSERT INTO public.games VALUES (8, 4, 594, 593);
INSERT INTO public.games VALUES (9, 4, 423, 422);
INSERT INTO public.games VALUES (10, 3, 234, 231);
INSERT INTO public.games VALUES (11, 3, 143, 141);
INSERT INTO public.games VALUES (12, 3, 939, 938);
INSERT INTO public.games VALUES (13, 5, 344, 343);
INSERT INTO public.games VALUES (14, 5, 458, 457);
INSERT INTO public.games VALUES (15, 6, 772, 771);
INSERT INTO public.games VALUES (16, 6, 472, 471);
INSERT INTO public.games VALUES (17, 5, 595, 592);
INSERT INTO public.games VALUES (18, 5, 931, 929);
INSERT INTO public.games VALUES (19, 5, 703, 702);
INSERT INTO public.games VALUES (20, 7, 730, 729);
INSERT INTO public.games VALUES (21, 7, 544, 543);
INSERT INTO public.games VALUES (22, 8, 560, 559);
INSERT INTO public.games VALUES (23, 8, 790, 789);
INSERT INTO public.games VALUES (24, 7, 48, 45);
INSERT INTO public.games VALUES (25, 7, 841, 839);
INSERT INTO public.games VALUES (26, 7, 665, 664);
INSERT INTO public.games VALUES (27, 9, 700, 699);
INSERT INTO public.games VALUES (28, 9, 940, 939);
INSERT INTO public.games VALUES (29, 10, 930, 929);
INSERT INTO public.games VALUES (30, 10, 523, 522);
INSERT INTO public.games VALUES (31, 9, 822, 819);
INSERT INTO public.games VALUES (32, 9, 477, 475);
INSERT INTO public.games VALUES (33, 9, 537, 536);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'padma');
INSERT INTO public.users VALUES (2, 'padmaja');
INSERT INTO public.users VALUES (3, 'user_1676410991457');
INSERT INTO public.users VALUES (4, 'user_1676410991456');
INSERT INTO public.users VALUES (5, 'user_1676411250814');
INSERT INTO public.users VALUES (6, 'user_1676411250813');
INSERT INTO public.users VALUES (7, 'user_1676411284211');
INSERT INTO public.users VALUES (8, 'user_1676411284210');
INSERT INTO public.users VALUES (9, 'user_1676411302721');
INSERT INTO public.users VALUES (10, 'user_1676411302720');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 33, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

