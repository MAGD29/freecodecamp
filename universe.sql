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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character varying(10) NOT NULL,
    meaning text,
    visible_season text,
    visible_months text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size numeric,
    age integer NOT NULL,
    description text,
    has_spiral_structure boolean NOT NULL
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
    name character varying(100) NOT NULL,
    radius integer,
    mass numeric,
    composition text,
    is_inhabited boolean NOT NULL,
    planet_id integer
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
    name character varying(100) NOT NULL,
    diameter integer,
    gravity numeric,
    atmosphere text,
    is_habitable boolean NOT NULL,
    star_id integer
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
    name character varying(100) NOT NULL,
    mass integer,
    luminosity numeric,
    spectral_class character varying(10),
    has_planets boolean NOT NULL,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'Orion is named after a hunter in Greek mythology. It is one of the most recognizable constellations in the night sky.', 'Winter', 'December to March');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 'Ursa Major is Latin for "Greater Bear". It is commonly known as the Big Dipper or the Plough.', 'Spring', 'April to July');
INSERT INTO public.constellation VALUES (3, 'Leo', 'Leo', 'Leo is Latin for "lion". It represents the Nemean Lion slain by Hercules in Greek mythology.', 'Spring', 'April to June');
INSERT INTO public.constellation VALUES (4, 'Pegasus', 'Peg', 'Pegasus is named after the mythical winged horse in Greek mythology. It is easily recognizable by its prominent asterism, the Great Square of Pegasus.', 'Autumn', 'September to December');
INSERT INTO public.constellation VALUES (5, 'Cassiopeia', 'Cas', 'Cassiopeia is named after the queen Cassiopeia in Greek mythology. It is known for its distinctive "W" shape.', 'Autumn', 'September to December');
INSERT INTO public.constellation VALUES (6, 'Cygnus', 'Cyg', 'Cygnus is Latin for "swan". It is also known as the Northern Cross due to its shape.', 'Summer', 'July to October');
INSERT INTO public.constellation VALUES (7, 'Scorpius', 'Sco', 'Scorpius is Latin for "scorpion". It is one of the zodiac constellations and represents the scorpion that killed Orion in Greek mythology.', 'Summer', 'July to September');
INSERT INTO public.constellation VALUES (8, 'Sagittarius', 'Sgr', 'Sagittarius is Latin for "archer". It is commonly depicted as a centaur drawing a bow and arrow.', 'Summer', 'July to October');
INSERT INTO public.constellation VALUES (9, 'Taurus', 'Tau', 'Taurus is Latin for "bull". It represents the bull form taken by Zeus in Greek mythology when he abducted Europa.', 'Winter', 'December to March');
INSERT INTO public.constellation VALUES (10, 'Gemini', 'Gem', 'Gemini is Latin for "twins". It represents the twins Castor and Pollux in Greek mythology.', 'Winter', 'December to February');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000.00, 13000, 'The Milky Way is the galaxy that contains our Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1500000.00, 12000, 'The Andromeda Galaxy, also known as Messier 31, M31, or NGC 224, is a barred spiral galaxy approximately 2.5 million light-years from Earth.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 500000.00, 11000, 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years from Earth in the constellation Triangulum.', false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 2000000.00, 15000, 'Messier 87 is a supergiant elliptical galaxy in the constellation Virgo.', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 300000.00, 14000, 'The Whirlpool Galaxy, also known as Messier 51a, M51a, or NGC 5194, is an interacting grand-design spiral galaxy with a Seyfert 2 active galactic nucleus.', true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 400000.00, 12500, 'The Pinwheel Galaxy is a face-on spiral galaxy distantly related to the Andromeda Galaxy.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1737, 0.0123, 'Silicate rock', false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 0.0000015, 'Carbonaceous', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 0.0000002, 'Carbonaceous', false, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2631, 0.025, 'Rock, Ice', false, 4);
INSERT INTO public.moon VALUES (5, 'Titan', 2576, 0.0225, 'Water ice, Rock', false, 5);
INSERT INTO public.moon VALUES (6, 'Triton', 1353, 0.0036, 'Water ice, Rock', false, 7);
INSERT INTO public.moon VALUES (7, 'Europa', 1560, 0.008, 'Water ice', false, 4);
INSERT INTO public.moon VALUES (8, 'Enceladus', 252, 0.0000001, 'Ice', false, 5);
INSERT INTO public.moon VALUES (9, 'Miranda', 235, 0.0000007, 'Ice, Rock', false, 8);
INSERT INTO public.moon VALUES (10, 'Charon', 606, 0.000032, 'Water ice, Rock', false, 9);
INSERT INTO public.moon VALUES (11, 'Phoebe', 107, 0.0000005, 'Carbonaceous', false, 5);
INSERT INTO public.moon VALUES (12, 'Callisto', 2410, 0.018, 'Water ice, Rock', false, 4);
INSERT INTO public.moon VALUES (13, 'Io', 1821, 0.015, 'Rock, Sulphur', false, 4);
INSERT INTO public.moon VALUES (14, 'Dione', 560, 0.0000011, 'Ice, Rock', false, 5);
INSERT INTO public.moon VALUES (15, 'Lapetus', 735, 0.00867, 'Water ice, Rock', false, 6);
INSERT INTO public.moon VALUES (16, 'Rhea', 764, 0.00231, 'Water ice, Rock', false, 6);
INSERT INTO public.moon VALUES (17, 'Ariel', 579, 0.00006, 'Water ice, Rock', false, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 585, 0.00006, 'Water ice, Rock', false, 7);
INSERT INTO public.moon VALUES (19, 'Tethys', 533, 0.00062, 'Water ice, Rock', false, 6);
INSERT INTO public.moon VALUES (20, 'Oberon', 761, 0.00081, 'Water ice, Rock', false, 7);
INSERT INTO public.moon VALUES (21, 'Titania', 789, 0.00035, 'Water ice, Rock', false, 7);
INSERT INTO public.moon VALUES (22, 'Lysithea', 18, 0.00001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (23, 'Elara', 43, 0.00004, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (24, 'Himalia', 85, 0.00004, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (25, 'Leda', 10, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (26, 'Sinope', 19, 0.000002, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (27, 'Metis', 22, 0.000003, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (28, 'Halimede', 31, 0.000005, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (29, 'Euporie', 9, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (30, 'Thyone', 15, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (31, 'Sponde', 12, 0.000002, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (32, 'Harpalyke', 2, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (33, 'Hegemone', 4, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (34, 'Kale', 5, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (35, 'Kallichore', 2, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (36, 'Orthosie', 2, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (37, 'Autonoe', 2, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (38, 'Philophrosyne', 2, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (39, 'Cyllene', 2, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (40, 'Kore', 2, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (41, 'Herse', 2, 0.000001, 'Carbonaceous', false, 10);
INSERT INTO public.moon VALUES (42, 'Kalyke', 2, 0.000001, 'Carbonaceous', false, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, 9.81, 'Nitrogen, Oxygen', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 6779, 3.71, 'Carbon dioxide, Nitrogen', false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 12104, 8.87, 'Carbon dioxide, Nitrogen', false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 139822, 24.79, 'Hydrogen, Helium', false, 2);
INSERT INTO public.planet VALUES (5, 'Saturn', 116464, 10.44, 'Hydrogen, Helium', false, 2);
INSERT INTO public.planet VALUES (6, 'Neptune', 49244, 11.15, 'Hydrogen, Helium, Methane', false, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 8.69, 'Hydrogen, Helium, Methane', false, 3);
INSERT INTO public.planet VALUES (8, 'Mercury', 4879, 3.70, 'Minimal atmosphere', false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2370, 0.62, 'Nitrogen, Methane', false, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 18640, 1.11, 'Unknown', true, 6);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 22790, 2.34, 'Unknown', true, 6);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 71492, 1.61, 'Unknown', false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1989000, 1.00, 'G2V', true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 2345000, 1.50, 'G2V', true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 3456000, 2.00, 'A1V', true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 4000000, 3.00, 'M1-2Ia-Iab', false, 2);
INSERT INTO public.star VALUES (5, 'Antares', 5000000, 4.00, 'M1.5Iab-b', false, 2);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 2000000, 0.50, 'M5.5Ve', true, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_abbreviation_key UNIQUE (abbreviation);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

