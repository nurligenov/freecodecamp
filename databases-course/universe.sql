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
-- Name: astronomical_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomical_event (
    astronomical_event_id integer NOT NULL,
    name character varying(255) NOT NULL,
    event_type character varying(100) NOT NULL,
    event_date date,
    is_visible_from_earth boolean,
    galaxy_id integer,
    description text
);


ALTER TABLE public.astronomical_event OWNER TO freecodecamp;

--
-- Name: astronomical_event_astronomical_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomical_event_astronomical_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomical_event_astronomical_event_id_seq OWNER TO freecodecamp;

--
-- Name: astronomical_event_astronomical_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomical_event_astronomical_event_id_seq OWNED BY public.astronomical_event.astronomical_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_visible boolean NOT NULL,
    size numeric,
    distance_from_earth integer,
    unit_of_measurement_id integer
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
    is_inhabited boolean,
    diameter integer,
    distance_from_planet integer,
    unit_of_measurement_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: COLUMN moon.diameter; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.diameter IS 'Diameter of the moon in kilometers';


--
-- Name: COLUMN moon.distance_from_planet; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.distance_from_planet IS 'Distance from the moon to its planet, using scale from unit_id';


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
    has_life boolean,
    mass numeric,
    orbit_period integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: COLUMN planet.mass; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.mass IS 'Mass of the planet in Earth masses (M⊕)';


--
-- Name: COLUMN planet.orbit_period; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.orbit_period IS 'Length of the planet''s orbit period in days';


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
    galaxy_id integer,
    is_visible boolean NOT NULL,
    age bigint,
    temperature integer,
    unit_of_measurement_id integer
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
-- Name: unit_of_measurement; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.unit_of_measurement (
    unit_of_measurement_id integer NOT NULL,
    name character varying(50) NOT NULL,
    unit_description text
);


ALTER TABLE public.unit_of_measurement OWNER TO freecodecamp;

--
-- Name: unit_of_measurement_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.unit_of_measurement_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_of_measurement_unit_id_seq OWNER TO freecodecamp;

--
-- Name: unit_of_measurement_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.unit_of_measurement_unit_id_seq OWNED BY public.unit_of_measurement.unit_of_measurement_id;


--
-- Name: astronomical_event astronomical_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event ALTER COLUMN astronomical_event_id SET DEFAULT nextval('public.astronomical_event_astronomical_event_id_seq'::regclass);


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
-- Name: unit_of_measurement unit_of_measurement_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.unit_of_measurement ALTER COLUMN unit_of_measurement_id SET DEFAULT nextval('public.unit_of_measurement_unit_id_seq'::regclass);


--
-- Data for Name: astronomical_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomical_event VALUES (1, 'Perseid Meteor Shower', 'Meteor Shower', '2024-08-12', true, 1, 'One of the brightest meteor showers, visible from Earth every year.');
INSERT INTO public.astronomical_event VALUES (2, 'Total Solar Eclipse', 'Solar Eclipse', '2024-04-08', true, 1, 'A total solar eclipse visible in some parts of the world.');
INSERT INTO public.astronomical_event VALUES (3, 'Lunar Eclipse', 'Lunar Eclipse', '2024-09-18', true, 1, 'A total lunar eclipse visible from several continents.');
INSERT INTO public.astronomical_event VALUES (4, 'Halley''s Comet', 'Comet', '2061-07-28', true, 1, 'Halley''s Comet returns to the inner solar system, visible from Earth.');
INSERT INTO public.astronomical_event VALUES (5, 'Supernova Event', 'Supernova', '2024-11-15', false, 2, 'A supernova explosion observed in a distant galaxy.');
INSERT INTO public.astronomical_event VALUES (6, 'Great Red Spot', 'Storm', NULL, true, 1, 'A gigantic, persistent storm on Jupiter, observable through telescopes.');
INSERT INTO public.astronomical_event VALUES (7, 'Andromeda Collision', 'Galactic Collision', NULL, false, 2, 'The predicted future collision between the Milky Way and Andromeda galaxies.');
INSERT INTO public.astronomical_event VALUES (8, 'Martian Dust Storm', 'Planetary Event', '2025-06-17', false, 1, 'A large dust storm on Mars, observable by space telescopes.');
INSERT INTO public.astronomical_event VALUES (9, 'Venus Transit', 'Planetary Transit', '2117-12-11', true, 1, 'The transit of Venus across the face of the Sun, a rare event.');
INSERT INTO public.astronomical_event VALUES (10, 'Leonid Meteor Shower', 'Meteor Shower', '2024-11-17', true, 1, 'An annual meteor shower known for its spectacular meteor storms.');
INSERT INTO public.astronomical_event VALUES (11, 'Jupiter-Saturn Conjunction', 'Planetary Alignment', '2024-12-21', true, 1, 'A rare conjunction of Jupiter and Saturn in the night sky.');
INSERT INTO public.astronomical_event VALUES (12, 'Discovery of Exoplanet', 'Exoplanet', '2024-03-30', false, 3, 'The discovery of a new exoplanet in a distant solar system.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 1000.5, 0, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 1100.7, 2537000, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, 500.2, 3000000, 1);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', true, 800.3, 29000000, 1);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', true, 600.4, 23000000, 1);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', false, 700.1, 21000000, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, false, 3474, 384400, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 22, 9400, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 13, 23460, 3);
INSERT INTO public.moon VALUES (4, 'Io', 5, false, 3643, 421700, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, 3121, 671100, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, false, 5262, 1070400, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, false, 4820, 1882700, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 6, false, 5150, 1221850, 3);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, false, 1527, 527070, 3);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, false, 1471, 3561300, 3);
INSERT INTO public.moon VALUES (11, 'Oberon', 7, false, 1523, 583500, 3);
INSERT INTO public.moon VALUES (12, 'Titania', 7, false, 1577, 436300, 3);
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, false, 1190, 265970, 3);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, false, 1158, 191020, 3);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, false, 471, 129780, 3);
INSERT INTO public.moon VALUES (16, 'Triton', 8, false, 2706, 354760, 3);
INSERT INTO public.moon VALUES (17, 'Nereid', 8, false, 340, 5513800, 3);
INSERT INTO public.moon VALUES (18, 'Proteus', 8, false, 420, 117646, 3);
INSERT INTO public.moon VALUES (19, 'Charon', 9, false, 1212, 19591, 3);
INSERT INTO public.moon VALUES (20, 'Nix', 9, false, 44, 48694, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 0.33, 88);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 4.87, 225);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 5.97, 365);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 0.642, 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 1898, 4333);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 568, 10759);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 86.8, 30687);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 102, 60190);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, 0.0146, 90560);
INSERT INTO public.planet VALUES (10, 'Exoplanet1', 2, false, 5.5, 100);
INSERT INTO public.planet VALUES (11, 'Exoplanet2', 2, false, 7.1, 150);
INSERT INTO public.planet VALUES (12, 'Exoplanet3', 2, false, 4.8, 200);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 4600000000, 5778, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, true, 242000000, 9940, NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, true, 5400000000, 5790, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, false, 8000000, 3500, NULL);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, true, 4800000000, 3042, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 1, true, 455000000, 9602, NULL);
INSERT INTO public.star VALUES (7, 'Rigel', 1, true, 8000000, 11000, NULL);
INSERT INTO public.star VALUES (8, 'Arcturus', 1, true, 7300000000, 4286, NULL);
INSERT INTO public.star VALUES (9, 'Capella', 1, true, 4900000000, 5700, NULL);
INSERT INTO public.star VALUES (10, 'Aldebaran', 1, true, 6300000000, 3910, NULL);


--
-- Data for Name: unit_of_measurement; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.unit_of_measurement VALUES (1, 'light-year', 'The distance that light travels in a vacuum in one year.');
INSERT INTO public.unit_of_measurement VALUES (2, 'parsec', 'A unit of length used to measure large distances to astronomical objects outside the Solar System.');
INSERT INTO public.unit_of_measurement VALUES (3, 'kilometer', 'A unit of length in the metric system, equal to one thousand meters.');


--
-- Name: astronomical_event_astronomical_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomical_event_astronomical_event_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: unit_of_measurement_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.unit_of_measurement_unit_id_seq', 3, true);


--
-- Name: astronomical_event astronomical_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_name_key UNIQUE (name);


--
-- Name: astronomical_event astronomical_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_pkey PRIMARY KEY (astronomical_event_id);


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
-- Name: unit_of_measurement unit_of_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.unit_of_measurement
    ADD CONSTRAINT unit_of_measurement_pkey PRIMARY KEY (unit_of_measurement_id);


--
-- Name: unit_of_measurement unit_of_measurement_unit_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.unit_of_measurement
    ADD CONSTRAINT unit_of_measurement_unit_name_key UNIQUE (name);


--
-- Name: astronomical_event astronomical_event_related_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_related_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy galaxy_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unit_id_fkey FOREIGN KEY (unit_of_measurement_id) REFERENCES public.unit_of_measurement(unit_of_measurement_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unit_id_fkey FOREIGN KEY (unit_of_measurement_id) REFERENCES public.unit_of_measurement(unit_of_measurement_id);


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
-- Name: star star_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unit_id_fkey FOREIGN KEY (unit_of_measurement_id) REFERENCES public.unit_of_measurement(unit_of_measurement_id);


--
-- PostgreSQL database dump complete
--

