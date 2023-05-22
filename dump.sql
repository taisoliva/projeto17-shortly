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
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    url text NOT NULL,
    "shortId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: shorten; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shorten (
    id integer NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: shorten_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shorten_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shorten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shorten_id_seq OWNED BY public.shorten.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: shorten id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorten ALTER COLUMN id SET DEFAULT nextval('public.shorten_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: autorization; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.autorization VALUES (1, 'e8fe6b03-f3b3-4967-ac9e-283195d34409', 1, '2023-05-19 18:38:05.163654');
INSERT INTO public.autorization VALUES (3, '0a6dcc68-4bc0-4980-ace6-c632960387c7', 2, '2023-05-19 19:03:59.458895');
INSERT INTO public.autorization VALUES (4, 'c8e060fa-f224-4906-a149-45d1805a53db', 3, '2023-05-22 10:05:42.132526');


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (2, 'https://www.driven.com.br/', 4, '2023-05-21 16:27:40.214908');
INSERT INTO public.links VALUES (3, 'https://www.youtube.com/channel/UCUN9lhwfMJRxMVuet7Shg0w', 5, '2023-05-22 10:06:51.310274');
INSERT INTO public.links VALUES (4, 'https://www.youtube.com/channel/UCUN9lhwfMJRxMVuet7Shg0w', 6, '2023-05-22 10:07:26.687968');
INSERT INTO public.links VALUES (5, 'https://www.youtube.com/channel/UCUN9lhwfMJRxMVuet7Shg0w', 7, '2023-05-22 10:07:27.798943');
INSERT INTO public.links VALUES (6, 'https://www.youtube.com/channel/UCUN9lhwfMJRxMVuet7Shg0w', 8, '2023-05-22 10:07:28.777834');
INSERT INTO public.links VALUES (7, 'https://www.instagram.com/', 9, '2023-05-22 10:08:29.256468');


--
-- Data for Name: shorten; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shorten VALUES (4, 'rYSHiIHTfpHVrS4LO5tk8', 2, 3, '2023-05-21 16:27:40.105797');
INSERT INTO public.shorten VALUES (5, 'bmMzEECUX1BNW9tt9peTZ', 2, 7, '2023-05-22 10:06:50.642449');
INSERT INTO public.shorten VALUES (9, 'e9AVA80DYi0uOxsIgKdVh', 1, 5, '2023-05-22 10:08:29.156901');
INSERT INTO public.shorten VALUES (8, 'CyabUBdI7pgrHXJxP6yZ5', 3, 1, '2023-05-22 10:07:28.755432');
INSERT INTO public.shorten VALUES (7, 'NtMobqcUnBu1hYRYtRocE', 3, 2, '2023-05-22 10:07:27.749033');
INSERT INTO public.shorten VALUES (6, 'hH6UXK7Q4uet2cfhCE2OZ', 3, 4, '2023-05-22 10:07:26.577966');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@driven.com.br', '$2b$10$ErrgKFfsbReCdCNGDT.fhuH63qXYPdG.ZiFe5A9ZFIM.7500NAuQy', '2023-05-19 18:37:58.898759');
INSERT INTO public.users VALUES (2, 'maria', 'maria@driven.com.br', '$2b$10$SPwfY2IfOhOvVBdaaRXVRO7MofYpFG9btleGJBzXvBVZncBSwMK/S', '2023-05-19 19:03:48.118561');
INSERT INTO public.users VALUES (3, 'tais', 'tais@driven.com.br', '$2b$10$msiz4wHr2rjwh0MfnLsFsu9lhk95LMcBOMa1H7qsE.BYBdYERudQm', '2023-05-22 10:05:15.591917');


--
-- Name: autorization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.autorization_id_seq', 4, true);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 7, true);


--
-- Name: shorten_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shorten_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: autorization autorization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorization
    ADD CONSTRAINT autorization_pkey PRIMARY KEY (id);


--
-- Name: autorization autorization_userId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorization
    ADD CONSTRAINT "autorization_userId_key" UNIQUE ("userId");


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: shorten shorten_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorten
    ADD CONSTRAINT shorten_pkey PRIMARY KEY (id);


--
-- Name: shorten shorten_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorten
    ADD CONSTRAINT "shorten_shortUrl_key" UNIQUE ("shortUrl");


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
-- Name: links links_shortId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_shortId_fkey" FOREIGN KEY ("shortId") REFERENCES public.shorten(id);


--
-- Name: shorten shorten_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorten
    ADD CONSTRAINT "shorten_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

