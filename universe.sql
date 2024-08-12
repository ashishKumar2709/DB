--
-- PostgreSQL database dump
--

-- Dumped from database version 12.19 (Ubuntu 12.19-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.19 (Ubuntu 12.19-0ubuntu0.20.04.1)

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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    description text NOT NULL,
    name character varying(40) NOT NULL,
    age_in_million_of_years integer,
    distance_from_earth integer,
    size_in_km integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    age_in_million_of_years integer NOT NULL,
    galaxy_types character varying(30),
    distance_from_earth integer
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
    description text NOT NULL,
    is_spherical boolean,
    age_in_million_of_years integer,
    distance_from_earth integer,
    size_in_km numeric(10,4),
    planet_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    age_in_million_of_years integer,
    planet_types character varying(30),
    distance_from_earth integer,
    size_in_km numeric(10,4),
    star_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    age_in_million_of_years integer NOT NULL,
    distance_from_earth integer,
    size_in_km numeric(10,4),
    galaxy_id integer NOT NULL
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'A supermassive black hole at the center of the Milky Way.', 'Sagittarius A*', 13500, 26000, 23750000, 1);
INSERT INTO public.blackhole VALUES (2, 'The supermassive black hole in the Andromeda Galaxy.', 'Andromeda A', 10000, 2537000, 31750000, 2);
INSERT INTO public.blackhole VALUES (3, 'A black hole in the Triangulum Galaxy.', 'Triangulum Black Hole', 12000, 3000000, 18750000, 3);
INSERT INTO public.blackhole VALUES (4, 'The supermassive black hole at the center of Messier 87.', 'M87*', 14000, 53000000, 38750000, 4);
INSERT INTO public.blackhole VALUES (5, 'A black hole in the Whirlpool Galaxy.', 'Whirlpool Black Hole', 460, 23000000, 20750000, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing the Solar System.', 13600, 'Barred Spiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest spiral galaxy to the Milky Way.', 10000, 'Spiral', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group of galaxies.', 12000, 'Spiral', 3000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A giant elliptical galaxy with a supermassive black hole.', 14000, 'Elliptical', 53000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A spiral galaxy with a bright nucleus and large central bulge.', 10000, 'Spiral', 31000000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'A classic spiral galaxy interacting with a companion galaxy.', 460, 'Spiral', 23000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite of Earth.', true, 4500, 384400, 3474.2000, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of the two moons of Mars.', true, 4500, 9376, 22.4000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and farther of the two moons of Mars.', true, 4500, 23460, 12.4000, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 'A moon of Jupiter with a possible subsurface ocean.', true, 4500, 628730, 3121.6000, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'The largest moon in the Solar System, orbiting Jupiter.', true, 4500, 628730, 5262.4000, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'The most volcanically active body in the Solar System, orbiting Jupiter.', true, 4500, 628730, 3643.2000, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter.', true, 4500, 628730, 4820.6000, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn and the second-largest in the Solar System.', true, 4500, 1275000, 5151.8000, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A moon of Saturn known for its geysers.', true, 4500, 1275000, 504.2000, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'The smallest and innermost of Saturn’s major moons.', true, 4500, 1275000, 396.4000, 6);
INSERT INTO public.moon VALUES (11, 'Titania', 'The largest moon of Uranus.', true, 4500, 2723950, 1577.8000, 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 'The second-largest moon of Uranus.', true, 4500, 2723950, 1522.8000, 7);
INSERT INTO public.moon VALUES (13, 'Triton', 'The largest moon of Neptune and the only large moon with a retrograde orbit.', true, 4500, 4347400, 2706.8000, 8);
INSERT INTO public.moon VALUES (14, 'Proxima Centauri b I', 'A hypothetical moon orbiting Proxima Centauri b.', false, 4500, 42400, 100.0000, 9);
INSERT INTO public.moon VALUES (15, 'Alpha Centauri Bb I', 'A hypothetical moon orbiting Alpha Centauri Bb.', false, 4500, 43000, 100.0000, 10);
INSERT INTO public.moon VALUES (16, 'Betelgeuse b I', 'A hypothetical moon orbiting Betelgeuse b.', false, 10000, 642500, 1000.0000, 11);
INSERT INTO public.moon VALUES (17, 'Rigel b I', 'A hypothetical moon orbiting Rigel b.', false, 8000, 860000, 900.0000, 12);
INSERT INTO public.moon VALUES (18, 'Sirius b I', 'A hypothetical moon orbiting Sirius b.', false, 240, 8500, 50.0000, 13);
INSERT INTO public.moon VALUES (19, 'Vega b I', 'A hypothetical moon orbiting Vega b.', false, 455, 25700, 100.0000, 14);
INSERT INTO public.moon VALUES (20, 'Messier 87 b I', 'A hypothetical moon in the Messier 87 galaxy.', false, 10000, 5300000, 1000.0000, 15);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known planet with life.', true, 4500, 'Terrestrial', 0, 12742.0000, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun, known as the Red Planet.', false, 4500, 'Terrestrial', 78000, 6779.0000, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'The second planet from the Sun with a thick, toxic atmosphere.', false, 4500, 'Terrestrial', 41000, 12104.0000, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 'The smallest and innermost planet in the Solar System.', false, 4500, 'Terrestrial', 92000, 4879.0000, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, a gas giant.', false, 4500, 'Gas Giant', 628730, 139820.0000, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The second-largest planet known for its extensive ring system.', false, 4500, 'Gas Giant', 1275000, 116460.0000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a blue-green hue due to methane in its atmosphere.', false, 4500, 'Ice Giant', 2723950, 50724.0000, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest known planet in the Solar System, another ice giant.', false, 4500, 'Ice Giant', 4347400, 49244.0000, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'An exoplanet orbiting Proxima Centauri, potentially habitable.', false, 4500, 'Terrestrial', 42400, 12000.0000, 2);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 'An exoplanet orbiting Alpha Centauri B.', false, 4500, 'Terrestrial', 43000, 12000.0000, 8);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 'A hypothetical planet orbiting the red supergiant Betelgeuse.', false, 10000, 'Gas Giant', 642500, 120000.0000, 3);
INSERT INTO public.planet VALUES (12, 'Rigel b', 'A hypothetical planet orbiting the blue supergiant Rigel.', false, 8000, 'Gas Giant', 860000, 110000.0000, 4);
INSERT INTO public.planet VALUES (13, 'Sirius b', 'A white dwarf companion to Sirius.', false, 240, 'Dwarf Planet', 8500, 4879.0000, 5);
INSERT INTO public.planet VALUES (14, 'Vega b', 'A hypothetical planet orbiting Vega.', false, 455, 'Terrestrial', 25700, 12000.0000, 6);
INSERT INTO public.planet VALUES (15, 'Messier 87 b', 'A hypothetical planet in the Messier 87 galaxy.', false, 10000, 'Gas Giant', 5300000, 130000.0000, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 4600, 0, 1392.0000, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun.', 4500, 42400, 200.0000, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star in the constellation Orion.', 10000, 642500, 118000.0000, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'A blue supergiant star in the constellation Orion.', 8000, 860000, 117300.0000, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 'The brightest star in the night sky.', 242, 8500, 2400.0000, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the constellation Lyra.', 455, 25700, 2700.0000, 1);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 'The primary star of the closest star system to the Solar System.', 4500, 43000, 1800.0000, 2);
INSERT INTO public.star VALUES (8, 'Alpha Centauri B', 'The secondary star of the closest star system to the Solar System.', 4500, 43000, 1600.0000, 2);
INSERT INTO public.star VALUES (9, 'Messier 87 Star', 'A star located in the Messier 87 galaxy.', 10000, 53000000, 1000.0000, 4);
INSERT INTO public.star VALUES (10, 'Whirlpool Star', 'A star located in the Whirlpool Galaxy.', 460, 23000000, 1500.0000, 6);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: blackhole blackhole_blackhole_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_blackhole_id_key UNIQUE (blackhole_id);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: blackhole blackhole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

