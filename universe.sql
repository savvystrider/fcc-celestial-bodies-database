--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    orbital_period_in_years numeric,
    diameter_in_km integer NOT NULL,
    is_ice_and_dust boolean,
    has_tail boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    constellation text,
    mass numeric,
    num_of_stars numeric,
    age_in_millions integer,
    size integer,
    is_clustered boolean,
    has_life boolean
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
    name character varying(255) NOT NULL,
    planet_id integer,
    diameter_in_miles integer,
    orbital_period_in_days integer,
    mass_in_kg numeric,
    has_atmosphere boolean,
    has_life boolean
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
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    num_of_moons integer,
    mass numeric,
    diameter_in_miles integer,
    has_rings boolean,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    constellation text,
    galaxy_id integer,
    distance_from_earth numeric,
    mass numeric,
    diameter numeric,
    temperature integer NOT NULL,
    is_main_sequence boolean,
    is_binary boolean,
    is_variable boolean,
    luminosity integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 76, 15, true, true);
INSERT INTO public.comet VALUES (2, 'Hale–Bopp', 2533, 60, true, true);
INSERT INTO public.comet VALUES (3, 'Shoemaker-Levy 9', NULL, 2, true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 'Sagittarius', 1500000000000, 400000000000, 13600, 100000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 'Andromeda', 1000000000000, 1000000000000, 10000, 260000, true, false);
INSERT INTO public.galaxy VALUES (3, 'Sculptor', 'intermediate spiral', 'Sculptor', 5000000000000, NULL, 11000, 90000, false, false);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'spiral', 'Triangulum', 50000000000, 40000000000, 10000, 50000, true, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'elliptical', 'Virgo', 6400000000000, 1000000000000, 10000, 120000, true, false);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 'grand-design spiral', 'Canes Venatici', 16000000000000, 50000000000, 40000, 60000, false, false);
INSERT INTO public.galaxy VALUES (8, 'Sombrero', 'peculiar', 'Virgo', 80000000000000, 80000000000000, 90000, 50000, false, false);
INSERT INTO public.galaxy VALUES (9, 'Large Magellanic Cloud', 'spiral', 'Dorado', 1000000000000, 1000000000000, 130000, 14000, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 2159, 27, 73500000000000000000000, false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 14, 0, 10659000000000000, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 8, 1, 1476200000000000, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 2262, 2, 89319000000000000000000, true, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1940, 3, 47998000000000000000000, true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 3270, 7, 148190000000000000000000, true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2997, 16, 107590000000000000000000, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 3200, 15, 134520000000000000000000, true, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 949, 4, 2306000000000000000000, NULL, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 912, 79, 1805000000000000000000, NULL, false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 698, 2, 1095600000000000000000, true, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 660, 2, 617450000000000000000, NULL, false);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 313, 1, 108020000000000000000, true, false);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 246, 1, 37493000000000000000, false, true);
INSERT INTO public.moon VALUES (15, 'Nereid', 8, 220, 360, 30000000000000000000, NULL, true);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 1680, -6, 21400000000000000000000, true, false);
INSERT INTO public.moon VALUES (17, 'Proteus', 8, 260, 1, 44000000000000000000, NULL, true);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 293, 1, 65900000000000000000, NULL, true);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 719, 2, 1352000000000000000000, NULL, true);
INSERT INTO public.moon VALUES (20, 'Leda', 5, 12, 242, NULL, NULL, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 328500000000000000000000, 3032, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, 4867000000000000000000000, 7520, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 5972000000000000000000000, 7926, false, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, 639000000000000000000000, 4222, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 95, 1898000000000000000000000000, 86881, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 146, 568300000000000000000000000, 72367, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 27, 86810000000000000000000000, 31518, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 16, 102400000000000000000000000, 30599, true, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 6, NULL, 1.17, 12500, NULL, false);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1d', 7, NULL, 0.41, 7200, NULL, false);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 7, NULL, 0.62, 4222, NULL, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', 7, NULL, 0.68, 4222, NULL, false);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1g', 7, NULL, 1.34, 4222, NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, 0, 1989000000000000000000000000000, 1391400, 5778, true, false, false, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Canis Major', 1, 8.6, 2020000000000000000000000000000, 1711000, 9940, true, true, true, 25);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Orion', 1, 643, 10000000000000000000000000000000, 1186000000, 3600, false, false, true, 100000);
INSERT INTO public.star VALUES (4, 'Polaris', 'Ursa Minor', 1, 323, 622000000000000000000000000000, 42800000, 6050, true, false, false, 4000);
INSERT INTO public.star VALUES (5, 'Vega', 'Lyra', 1, 25.05, 2135000000000000000000000000000, 2362000, 9602, true, false, false, 40);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 'Centaurus', 1, 4.37, 2186000000000000000000000000000, 1224000, 5790, true, true, false, 1);
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', 'Aquarius', 1, 39, NULL, NULL, 2500, true, false, true, 0);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key1 UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

