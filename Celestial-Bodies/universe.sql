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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    distance integer,
    visible_to_naked_eye boolean,
    discoverer text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    distance integer,
    visible_to_naked_eye boolean,
    discoverer text,
    orbits text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    visible_to_naked_eye boolean,
    discoverer text,
    density numeric(3,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30),
    composition character varying(30) NOT NULL,
    exoplanet boolean NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    distance integer,
    visible_to_naked_eye boolean,
    discoverer text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1610, NULL, NULL, 'Galileo Galilei');
INSERT INTO public.galaxy VALUES (2, 'Black Eye', 1779, NULL, NULL, 'Edward Pigott');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 965, NULL, NULL, 'al-Sufi');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 1781, NULL, NULL, 'Pierre Mechain');
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 1774, NULL, NULL, 'Johann Elert Bode');
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 1774, NULL, NULL, 'Johann Elert Bode');
INSERT INTO public.galaxy VALUES (7, 'Triangulum', 1654, NULL, NULL, 'Giovanni Battista Hodierna');
INSERT INTO public.galaxy VALUES (8, 'Whale', 1787, NULL, NULL, 'William Herschel');
INSERT INTO public.galaxy VALUES (9, 'Whirlpool', 1773, NULL, NULL, 'Charles Messier');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Dactyl', 1994, NULL, NULL, 'Ann Harch', 'Ida', NULL);
INSERT INTO public.moon VALUES (2, 'Charon', 1978, NULL, NULL, 'James Christy', 'Pluto', 8);
INSERT INTO public.moon VALUES (3, 'Atlas', 1980, NULL, NULL, 'Richard Terrile', 'Saturn', 9);
INSERT INTO public.moon VALUES (4, 'Hyperion', 1848, NULL, NULL, 'William Lassell', 'Saturn', 9);
INSERT INTO public.moon VALUES (5, 'Mimas', 1789, NULL, NULL, 'Herschel', 'Saturn', 9);
INSERT INTO public.moon VALUES (6, 'Iapetus', 1671, NULL, NULL, 'Giovanni Cassini', 'Saturn', 9);
INSERT INTO public.moon VALUES (7, 'Pan', 1990, NULL, NULL, 'Mark Showalter', 'Saturn', 9);
INSERT INTO public.moon VALUES (8, 'Nereid', 1949, NULL, NULL, 'Gerard Kuiper', 'Neptune', 7);
INSERT INTO public.moon VALUES (9, 'Callisto', 1610, NULL, NULL, 'Galileo Galilei', 'Jupiter', 5);
INSERT INTO public.moon VALUES (10, 'Phobos', 1877, NULL, NULL, 'Asaph Hall', 'Mars', 4);
INSERT INTO public.moon VALUES (11, 'Ganymede', 1610, NULL, NULL, 'Galileo Galilei', 'Jupiter', 5);
INSERT INTO public.moon VALUES (12, 'Miranda', 1948, NULL, NULL, 'Gerard Kuiper', 'Uranus', 6);
INSERT INTO public.moon VALUES (13, 'Epimetheus', 1966, NULL, NULL, 'Richard Walker', 'Saturn', 9);
INSERT INTO public.moon VALUES (14, 'Triton', 1846, NULL, NULL, 'William Lassell', 'Neptune', 7);
INSERT INTO public.moon VALUES (15, 'Titan', 1655, NULL, NULL, 'Christiaan Huygens', 'Saturn', 9);
INSERT INTO public.moon VALUES (16, 'Io', 1610, NULL, NULL, 'Galileo Galilei', 'Jupiter', 5);
INSERT INTO public.moon VALUES (17, 'Rhea', 1672, NULL, NULL, 'Giovanni Cassini', 'Saturn', 9);
INSERT INTO public.moon VALUES (18, 'Europa', 1610, NULL, NULL, 'Galileo Galilei', 'Jupiter', 5);
INSERT INTO public.moon VALUES (19, 'Moon', 1609, NULL, NULL, 'Galileo Galilei', 'Earth', 3);
INSERT INTO public.moon VALUES (20, 'Enceladus', 1789, NULL, NULL, 'William Herschel', 'Saturn', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, NULL, 5.51);
INSERT INTO public.planet VALUES (8, 'Pluto', NULL, NULL, NULL, 1.88);
INSERT INTO public.planet VALUES (9, 'Saturn', 1610, true, 'Galileo Galilei', NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 1610, true, 'Galileo Galilei', 5.24);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1610, true, 'Galileo Galilei', 1.33);
INSERT INTO public.planet VALUES (1, 'Mercury', 1631, true, 'Thomas Harriott', 5.43);
INSERT INTO public.planet VALUES (7, 'Neptune', 1846, true, 'John Adams', 1.64);
INSERT INTO public.planet VALUES (4, 'Mars', 1610, true, 'Galileo Galilei', 3.93);
INSERT INTO public.planet VALUES (6, 'Uranus', 1781, false, 'William Herschel', 1.27);
INSERT INTO public.planet VALUES (10, 'HAT-P-1b', 2006, false, 'HATNet Project', NULL);
INSERT INTO public.planet VALUES (11, '51 Pegasi b', 1995, false, 'Michael Mayor', NULL);
INSERT INTO public.planet VALUES (12, '14 Andromedae b', 2008, false, 'Sato', NULL);
INSERT INTO public.planet VALUES (13, '55 Cancri e', 2004, false, 'Michael Endl', NULL);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Earth', 'Terrestrial', true);
INSERT INTO public.planet_type VALUES (2, 'Mars', 'Terrestrial', true);
INSERT INTO public.planet_type VALUES (3, 'Jupiter', 'Gas Giant', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 1836, 643, true, 'John Herschel', 1);
INSERT INTO public.star VALUES (2, 'Bellatrix', 800, 245, true, 'Abu Mashar', 2);
INSERT INTO public.star VALUES (3, 'Fomalhaut', 2008, 25, true, 'Kalas', 3);
INSERT INTO public.star VALUES (4, 'Aldebaran', 1782, 65, false, 'William Herschel', 4);
INSERT INTO public.star VALUES (5, 'Eta Ursae Majoris', 1869, 104, true, 'Ptomley', 5);
INSERT INTO public.star VALUES (6, 'Arcturus', 1635, 37, true, 'Jean-Baptiste Morin', 6);
INSERT INTO public.star VALUES (7, 'Deneb', 1910, 2616, true, 'O.J. Lee', 7);
INSERT INTO public.star VALUES (8, 'Antares', 1819, 555, true, 'Johann Tobias Bürg', 8);
INSERT INTO public.star VALUES (9, 'Alnilam', 1786, 1344, true, 'William Herschel', 9);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 9, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 33, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 9, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 9, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_distance_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_distance_key UNIQUE (distance);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_density_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_density_key UNIQUE (density);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_distance_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_key UNIQUE (distance);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
