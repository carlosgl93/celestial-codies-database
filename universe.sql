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
-- Name: exoplanet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exoplanet (
    exoplanet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass integer
);


ALTER TABLE public.exoplanet OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exoplanet_exoplanet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exoplanet_exoplanet_id_seq OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exoplanet_exoplanet_id_seq OWNED BY public.exoplanet.exoplanet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diameter_in_kiloparsecs numeric(5,2),
    distance_from_earth_in_light_years numeric(5,2),
    expected_collide boolean DEFAULT false,
    visible boolean DEFAULT false,
    discovered_year integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    mass numeric,
    radius numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    mass numeric(6,5),
    diameter integer,
    gravity numeric(3,1),
    length_of_day_in_hours numeric(5,1),
    planet_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    magnitude integer,
    galaxy_id integer,
    designation text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: exoplanet exoplanet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet ALTER COLUMN exoplanet_id SET DEFAULT nextval('public.exoplanet_exoplanet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: exoplanet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exoplanet VALUES (1, 'Candidate 1', NULL);
INSERT INTO public.exoplanet VALUES (2, 'AF Lep b', NULL);
INSERT INTO public.exoplanet VALUES (3, 'Beta Pictoris b', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 46.56, 2.50, true, true, 964);
INSERT INTO public.galaxy VALUES (2, 'Butterfly Galaxies', 0.00, 60.00, false, false, 1784);
INSERT INTO public.galaxy VALUES (4, 'Fireworks Galaxy', 0.00, 25.20, false, false, 1798);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 0.00, 31.10, false, false, 1781);
INSERT INTO public.galaxy VALUES (6, 'Milky Way Galaxy', 0.00, 87.40, true, true, 1620);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 25.00, 160.00, true, true, 1519);
INSERT INTO public.galaxy VALUES (9, 'Aries', NULL, 130.00, false, false, NULL);
INSERT INTO public.galaxy VALUES (10, 'Aquarius', NULL, 15.00, false, false, NULL);
INSERT INTO public.galaxy VALUES (12, 'Cancer', NULL, 24.00, false, false, NULL);
INSERT INTO public.galaxy VALUES (13, 'Capricornus', NULL, 38.00, false, false, NULL);
INSERT INTO public.galaxy VALUES (14, 'Gemini', NULL, 33.00, false, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Mimas', 6, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Tethys', 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Dione', 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Miranda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Ariel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Titania', 7, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Naiad', 8, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Thalassa', 8, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Despina', 8, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Galatea', 8, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Larissa', 8, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', NULL, NULL, NULL, NULL, 1, 6);
INSERT INTO public.planet VALUES ('Venus', NULL, NULL, NULL, NULL, 2, 6);
INSERT INTO public.planet VALUES ('Earth', NULL, NULL, NULL, NULL, 3, 6);
INSERT INTO public.planet VALUES ('Mars', NULL, NULL, NULL, NULL, 4, 6);
INSERT INTO public.planet VALUES ('Jupiter', NULL, NULL, NULL, NULL, 5, 6);
INSERT INTO public.planet VALUES ('Saturn', NULL, NULL, NULL, NULL, 6, 6);
INSERT INTO public.planet VALUES ('Uranus', NULL, NULL, NULL, NULL, 7, 6);
INSERT INTO public.planet VALUES ('Neptune', NULL, NULL, NULL, NULL, 8, 6);
INSERT INTO public.planet VALUES ('Pluto', NULL, NULL, NULL, NULL, 9, 6);
INSERT INTO public.planet VALUES ('Proxima Centauri', NULL, NULL, NULL, NULL, 10, 1);
INSERT INTO public.planet VALUES ('Ross', NULL, NULL, NULL, NULL, 11, 3);
INSERT INTO public.planet VALUES ('Lalande', NULL, NULL, NULL, NULL, 12, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha', 2, 1, NULL);
INSERT INTO public.star VALUES (3, 'Sadalsuud', 3, 10, NULL);
INSERT INTO public.star VALUES (4, 'Hamal', 66, 9, NULL);
INSERT INTO public.star VALUES (5, 'Tarf', 290, 12, 'Beta Cancri');
INSERT INTO public.star VALUES (7, 'Alzir', 57, 14, 'Xi Geminorum');
INSERT INTO public.star VALUES (6, 'Deneb Algedi', 39, 13, 'Delta Capricorni');
INSERT INTO public.star VALUES (8, 'Sun', NULL, 6, NULL);


--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exoplanet_exoplanet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 14, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 2, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: exoplanet exoplanet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_id_unique UNIQUE (exoplanet_id);


--
-- Name: exoplanet exoplanet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_pkey PRIMARY KEY (exoplanet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_rule; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_rule UNIQUE (moon_id);


--
-- Name: planet unique_planet_rule; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_rule UNIQUE (planet_id);


--
-- Name: galaxy unique_rule; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_rule UNIQUE (galaxy_id);


--
-- Name: star unique_star_rule; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_rule UNIQUE (star_id);


--
-- Name: moon moon_fk_planet_moons_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fk_planet_moons_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_belongs_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_belongs_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

