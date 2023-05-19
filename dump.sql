--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
-- Name: autorization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.autorization (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    createat timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: autorization_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.autorization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: autorization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.autorization_id_seq OWNED BY public.autorization.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    createat timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: autorization id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorization ALTER COLUMN id SET DEFAULT nextval('public.autorization_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: autorization; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.autorization VALUES (1, 'dasdsadas', 1, '2023-05-19 14:51:07.348521');
INSERT INTO public.autorization VALUES (2, '4c176a12-b8dd-450d-9fb6-a1cae66b3967', 2, '2023-05-19 14:53:08.969229');
INSERT INTO public.autorization VALUES (3, 'ee0b56f4-f48d-4652-ae91-78e839be7779', 2, '2023-05-19 14:53:10.267385');
INSERT INTO public.autorization VALUES (4, 'ac6f8d90-6f39-4f5a-985b-52d432808cec', 2, '2023-05-19 14:53:11.05454');
INSERT INTO public.autorization VALUES (5, 'd5253d3b-8422-45ce-8745-cd74b26476af', 2, '2023-05-19 14:54:24.870271');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'tais', 'tais@gmail.com', '123', '2023-05-19 14:42:16.940095');
INSERT INTO public.users VALUES (2, 'João', 'joao@driven.com.br', '$2b$10$LspI3o4wrUZEzlnc3jIelePeS0.Csd.NnNg4zEx9xeQWnnochq39u', '2023-05-19 14:43:23.696141');


--
-- Name: autorization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.autorization_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: autorization autorization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorization
    ADD CONSTRAINT autorization_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: autorization autorization_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorization
    ADD CONSTRAINT "autorization_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

