--
-- SensorWeb Hub - Data Model
--

—- Requirements --
—- DBMS : PostgreSQL 9.2 or later
—- PostGIS : 2.0 or later


— HOWTO install SWH Database
—
- 1) Install PostgreSQL and PostGIS
— 2) Create Database named “urban”
- 3) Create Users named “mapadmin”


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;


--
-- TOC entry 7 (class 2615 OID 20122)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA topology;


--
-- TOC entry 1 (class 3079 OID 12595)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 1306 (class 0 OID 0)
-- Name: box2d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d;


--
-- TOC entry 255 (class 1255 OID 19377)
-- Name: box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_in(cstring) RETURNS box2d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX2D_in';


--
-- TOC entry 256 (class 1255 OID 19378)
-- Name: box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_out(box2d) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX2D_out';


--
-- TOC entry 1305 (class 1247 OID 19376)
-- Name: box2d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d (
  INTERNALLENGTH = 65,
  INPUT = box2d_in,
  OUTPUT = box2d_out,
  ALIGNMENT = int4,
  STORAGE = plain
);


--
-- TOC entry 1310 (class 0 OID 0)
-- Name: box2df; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box2df;


--
-- TOC entry 257 (class 1255 OID 19381)
-- Name: box2df_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2df_in(cstring) RETURNS box2df
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'box2df_in';


--
-- TOC entry 258 (class 1255 OID 19382)
-- Name: box2df_out(box2df); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2df_out(box2df) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'box2df_out';


--
-- TOC entry 1309 (class 1247 OID 19380)
-- Name: box2df; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box2df (
  INTERNALLENGTH = 16,
  INPUT = box2df_in,
  OUTPUT = box2df_out,
  ALIGNMENT = double,
  STORAGE = plain
);


--
-- TOC entry 1302 (class 0 OID 0)
-- Name: box3d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d;


--
-- TOC entry 253 (class 1255 OID 19373)
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_in';


--
-- TOC entry 254 (class 1255 OID 19374)
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_out';


--
-- TOC entry 1301 (class 1247 OID 19372)
-- Name: box3d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d (
  INTERNALLENGTH = 52,
  INPUT = box3d_in,
  OUTPUT = box3d_out,
  ALIGNMENT = double,
  STORAGE = plain
);


--
-- TOC entry 1365 (class 1247 OID 20976)
-- Name: box3d_extent; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent;


--
-- TOC entry 1366 (class 1247 OID 20979)
-- Name: chip; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE chip;


--
-- TOC entry 1332 (class 0 OID 0)
-- Name: geography; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE geography;


--
-- TOC entry 651 (class 1255 OID 19882)
-- Name: geography_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_analyze(internal) RETURNS boolean
LANGUAGE c STRICT
AS '$libdir/postgis-2.0', 'geography_analyze';


--
-- TOC entry 647 (class 1255 OID 19878)
-- Name: geography_in(cstring, oid, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_in(cstring, oid, integer) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_in';


--
-- TOC entry 648 (class 1255 OID 19879)
-- Name: geography_out(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_out(geography) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_out';


--
-- TOC entry 649 (class 1255 OID 19880)
-- Name: geography_recv(internal, oid, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_recv(internal, oid, integer) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_recv';


--
-- TOC entry 650 (class 1255 OID 19881)
-- Name: geography_send(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_send(geography) RETURNS bytea
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_send';


--
-- TOC entry 645 (class 1255 OID 19875)
-- Name: geography_typmod_in(cstring[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_typmod_in(cstring[]) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_typmod_in';


--
-- TOC entry 646 (class 1255 OID 19876)
-- Name: geography_typmod_out(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_typmod_out(integer) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'postgis_typmod_out';


--
-- TOC entry 1331 (class 1247 OID 19877)
-- Name: geography; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geography (
  INTERNALLENGTH = variable,
  INPUT = geography_in,
  OUTPUT = geography_out,
  RECEIVE = geography_recv,
  SEND = geography_send,
  TYPMOD_IN = geography_typmod_in,
  TYPMOD_OUT = geography_typmod_out,
  ANALYZE = geography_analyze,
  DELIMITER = ':',
  ALIGNMENT = double,
  STORAGE = main
);


--
-- TOC entry 1298 (class 0 OID 0)
-- Name: geometry; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry;


--
-- TOC entry 245 (class 1255 OID 19362)
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
LANGUAGE c STRICT
AS '$libdir/postgis-2.0', 'geometry_analyze_2d';


--
-- TOC entry 684 (class 1255 OID 19358)
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_in';


--
-- TOC entry 685 (class 1255 OID 19359)
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_out';


--
-- TOC entry 246 (class 1255 OID 19363)
-- Name: geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_recv(internal) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_recv';


--
-- TOC entry 247 (class 1255 OID 19364)
-- Name: geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_send(geometry) RETURNS bytea
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_send';


--
-- TOC entry 243 (class 1255 OID 19360)
-- Name: geometry_typmod_in(cstring[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_typmod_in(cstring[]) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geometry_typmod_in';


--
-- TOC entry 244 (class 1255 OID 19361)
-- Name: geometry_typmod_out(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_typmod_out(integer) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'postgis_typmod_out';


--
-- TOC entry 1297 (class 1247 OID 19357)
-- Name: geometry; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry (
  INTERNALLENGTH = variable,
  INPUT = geometry_in,
  OUTPUT = geometry_out,
  RECEIVE = geometry_recv,
  SEND = geometry_send,
  TYPMOD_IN = geometry_typmod_in,
  TYPMOD_OUT = geometry_typmod_out,
  ANALYZE = geometry_analyze,
  DELIMITER = ':',
  ALIGNMENT = double,
  STORAGE = main
);


--
-- TOC entry 1317 (class 1247 OID 19587)
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry_dump AS (
  path integer[],
  geom geometry
);


--
-- TOC entry 1314 (class 0 OID 0)
-- Name: gidx; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gidx;


--
-- TOC entry 259 (class 1255 OID 19385)
-- Name: gidx_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gidx_in(cstring) RETURNS gidx
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gidx_in';


--
-- TOC entry 260 (class 1255 OID 19386)
-- Name: gidx_out(gidx); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gidx_out(gidx) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gidx_out';


--
-- TOC entry 1313 (class 1247 OID 19384)
-- Name: gidx; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gidx (
  INTERNALLENGTH = variable,
  INPUT = gidx_in,
  OUTPUT = gidx_out,
  ALIGNMENT = double,
  STORAGE = plain
);


--
-- TOC entry 1328 (class 0 OID 0)
-- Name: pgis_abs; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs;


--
-- TOC entry 485 (class 1255 OID 19711)
-- Name: pgis_abs_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_in(cstring) RETURNS pgis_abs
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'pgis_abs_in';


--
-- TOC entry 486 (class 1255 OID 19712)
-- Name: pgis_abs_out(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_out(pgis_abs) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'pgis_abs_out';


--
-- TOC entry 1327 (class 1247 OID 19710)
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs (
  INTERNALLENGTH = 8,
  INPUT = pgis_abs_in,
  OUTPUT = pgis_abs_out,
  ALIGNMENT = double,
  STORAGE = plain
);


--
-- TOC entry 1294 (class 0 OID 0)
-- Name: spheroid; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid;


--
-- TOC entry 682 (class 1255 OID 19354)
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ellipsoid_in';


--
-- TOC entry 683 (class 1255 OID 19355)
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ellipsoid_out';


--
-- TOC entry 1293 (class 1247 OID 19353)
-- Name: spheroid; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid (
  INTERNALLENGTH = 65,
  INPUT = spheroid_in,
  OUTPUT = spheroid_out,
  ALIGNMENT = double,
  STORAGE = plain
);


--
-- TOC entry 1324 (class 1247 OID 19682)
-- Name: valid_detail; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE valid_detail AS (
  valid boolean,
  reason character varying,
  location geometry
);


SET search_path = topology, pg_catalog;

--
-- TOC entry 1362 (class 1247 OID 20231)
-- Name: getfaceedges_returntype; Type: TYPE; Schema: topology; Owner: -
--

CREATE TYPE getfaceedges_returntype AS (
  sequence integer,
  edge integer
);


--
-- TOC entry 1356 (class 1247 OID 20161)
-- Name: topoelement; Type: DOMAIN; Schema: topology; Owner: -
--

CREATE DOMAIN topoelement AS integer[]
CONSTRAINT dimensions CHECK (((array_upper(VALUE, 2) IS NULL) AND (array_upper(VALUE, 1) = 2)))
CONSTRAINT lower_dimension CHECK ((array_lower(VALUE, 1) = 1))
CONSTRAINT type_range CHECK (((VALUE)[2] > 0));


--
-- TOC entry 1360 (class 1247 OID 20165)
-- Name: topoelementarray; Type: DOMAIN; Schema: topology; Owner: -
--

CREATE DOMAIN topoelementarray AS integer[]
CONSTRAINT dimensions CHECK ((((array_upper(VALUE, 2) IS NOT NULL) AND (array_upper(VALUE, 2) = 2)) AND (array_upper(VALUE, 3) IS NULL)));


--
-- TOC entry 1353 (class 1247 OID 20160)
-- Name: topogeometry; Type: TYPE; Schema: topology; Owner: -
--

CREATE TYPE topogeometry AS (
  topology_id integer,
  layer_id integer,
  id integer,
  type integer
);


--
-- TOC entry 1350 (class 1247 OID 20157)
-- Name: validatetopology_returntype; Type: TYPE; Schema: topology; Owner: -
--

CREATE TYPE validatetopology_returntype AS (
  error character varying,
  id1 integer,
  id2 integer
);


SET search_path = public, pg_catalog;

--
-- TOC entry 757 (class 1255 OID 20017)
-- Name: _st_3ddfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_dfullywithin3d';


--
-- TOC entry 755 (class 1255 OID 20015)
-- Name: _st_3ddwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_3ddwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_dwithin3d';


--
-- TOC entry 700 (class 1255 OID 19957)
-- Name: _st_asgeojson(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgeojson(integer, geography, integer, integer) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_as_geojson';


--
-- TOC entry 543 (class 1255 OID 19774)
-- Name: _st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgeojson(integer, geometry, integer, integer) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asGeoJson';


--
-- TOC entry 691 (class 1255 OID 19949)
-- Name: _st_asgml(integer, geography, integer, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geography, integer, integer, text) RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'geography_as_gml';


--
-- TOC entry 537 (class 1255 OID 19768)
-- Name: _st_asgml(integer, geometry, integer, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geometry, integer, integer, text) RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'LWGEOM_asGML';


--
-- TOC entry 695 (class 1255 OID 19953)
-- Name: _st_askml(integer, geography, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_askml(integer, geography, integer, text) RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'geography_as_kml';


--
-- TOC entry 540 (class 1255 OID 19771)
-- Name: _st_askml(integer, geometry, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_askml(integer, geometry, integer, text) RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'LWGEOM_asKML';


--
-- TOC entry 782 (class 1255 OID 20039)
-- Name: _st_asx3d(integer, geometry, integer, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asx3d(integer, geometry, integer, integer, text) RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'LWGEOM_asX3D';


--
-- TOC entry 732 (class 1255 OID 19986)
-- Name: _st_bestsrid(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_bestsrid(geography) RETURNS integer
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_BestSRID($1,$1)$_$;


--
-- TOC entry 731 (class 1255 OID 19985)
-- Name: _st_bestsrid(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_bestsrid(geography, geography) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_bestsrid';


--
-- TOC entry 453 (class 1255 OID 19671)
-- Name: _st_buffer(geometry, double precision, cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_buffer(geometry, double precision, cstring) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'buffer';


--
-- TOC entry 780 (class 1255 OID 20036)
-- Name: _st_concavehull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_concavehull(param_inputgeom geometry) RETURNS geometry
LANGUAGE plpgsql IMMUTABLE STRICT
AS $$
DECLARE
  vexhull GEOMETRY;
  var_resultgeom geometry;
  var_inputgeom geometry;
  vexring GEOMETRY;
  cavering GEOMETRY;
  cavept geometry[];
  seglength double precision;
  var_tempgeom geometry;
  scale_factor integer := 1;
  i integer;

BEGIN

  -- First compute the ConvexHull of the geometry
  vexhull := ST_ConvexHull(param_inputgeom);
  var_inputgeom := param_inputgeom;
  --A point really has no concave hull
  IF ST_GeometryType(vexhull) = 'ST_Point' OR ST_GeometryType(vexHull) = 'ST_LineString' THEN
    RETURN vexhull;
  END IF;

  -- convert the hull perimeter to a linestring so we can manipulate individual points
  vexring := CASE WHEN ST_GeometryType(vexhull) = 'ST_LineString' THEN vexhull ELSE ST_ExteriorRing(vexhull) END;
  IF abs(ST_X(ST_PointN(vexring,1))) < 1 THEN --scale the geometry to prevent stupid precision errors - not sure it works so make low for now
    scale_factor := 100;
    vexring := ST_Scale(vexring, scale_factor,scale_factor);
    var_inputgeom := ST_Scale(var_inputgeom, scale_factor, scale_factor);
    --RAISE NOTICE 'Scaling';
  END IF;
  seglength := ST_Length(vexring)/least(ST_NPoints(vexring)*2,1000) ;

  vexring := ST_Segmentize(vexring, seglength);
  -- find the point on the original geom that is closest to each point of the convex hull and make a new linestring out of it.
  cavering := ST_Collect(
      ARRAY(

          SELECT
            ST_ClosestPoint(var_inputgeom, pt ) As the_geom
          FROM (
                 SELECT  ST_PointN(vexring, n ) As pt, n
                 FROM
                   generate_series(1, ST_NPoints(vexring) ) As n
               ) As pt

      )
  )
  ;


  var_resultgeom := ST_MakeLine(geom)
  FROM ST_Dump(cavering) As foo;

  IF ST_IsSimple(var_resultgeom) THEN
    var_resultgeom := ST_MakePolygon(var_resultgeom);
    --RAISE NOTICE 'is Simple: %', var_resultgeom;
  ELSE
    --RAISE NOTICE 'is not Simple: %', var_resultgeom;
    var_resultgeom := ST_ConvexHull(var_resultgeom);
  END IF;

  IF scale_factor > 1 THEN -- scale the result back
    var_resultgeom := ST_Scale(var_resultgeom, 1/scale_factor, 1/scale_factor);
  END IF;
  RETURN var_resultgeom;

END;
$$;


--
-- TOC entry 506 (class 1255 OID 19738)
-- Name: _st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_contains(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'contains';


--
-- TOC entry 512 (class 1255 OID 19744)
-- Name: _st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_containsproperly(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'containsproperly';


--
-- TOC entry 508 (class 1255 OID 19740)
-- Name: _st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_coveredby(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'coveredby';


--
-- TOC entry 723 (class 1255 OID 19978)
-- Name: _st_covers(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_covers(geography, geography) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'geography_covers';


--
-- TOC entry 510 (class 1255 OID 19742)
-- Name: _st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_covers(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'covers';


--
-- TOC entry 504 (class 1255 OID 19736)
-- Name: _st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_crosses(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'crosses';


--
-- TOC entry 625 (class 1255 OID 19857)
-- Name: _st_dfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_dfullywithin';


--
-- TOC entry 705 (class 1255 OID 19961)
-- Name: _st_distance(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_distance(geography, geography, double precision, boolean) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'geography_distance';


--
-- TOC entry 395 (class 1255 OID 19590)
-- Name: _st_dumppoints(geometry, integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dumppoints(the_geom geometry, cur_path integer[]) RETURNS SETOF geometry_dump
LANGUAGE plpgsql
AS $$
DECLARE
  tmp geometry_dump;
  tmp2 geometry_dump;
  nb_points integer;
  nb_geom integer;
  i integer;
  j integer;
  g geometry;

BEGIN

  -- RAISE DEBUG '%,%', cur_path, ST_GeometryType(the_geom);

  -- Special case collections : iterate and return the DumpPoints of the geometries

  IF (ST_IsCollection(the_geom)) THEN

    i = 1;
    FOR tmp2 IN SELECT (ST_Dump(the_geom)).* LOOP

      FOR tmp IN SELECT * FROM _ST_DumpPoints(tmp2.geom, cur_path || tmp2.path) LOOP
        RETURN NEXT tmp;
      END LOOP;
      i = i + 1;

    END LOOP;

    RETURN;
  END IF;


  -- Special case (POLYGON) : return the points of the rings of a polygon
  IF (ST_GeometryType(the_geom) = 'ST_Polygon') THEN

    FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_ExteriorRing(the_geom), cur_path || ARRAY[1]) LOOP
      RETURN NEXT tmp;
    END LOOP;

    j := ST_NumInteriorRings(the_geom);
    FOR i IN 1..j LOOP
      FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_InteriorRingN(the_geom, i), cur_path || ARRAY[i+1]) LOOP
        RETURN NEXT tmp;
      END LOOP;
    END LOOP;

    RETURN;
  END IF;

  -- Special case (TRIANGLE) : return the points of the external rings of a TRIANGLE
  IF (ST_GeometryType(the_geom) = 'ST_Triangle') THEN

    FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_ExteriorRing(the_geom), cur_path || ARRAY[1]) LOOP
      RETURN NEXT tmp;
    END LOOP;

    RETURN;
  END IF;


  -- Special case (POINT) : return the point
  IF (ST_GeometryType(the_geom) = 'ST_Point') THEN

    tmp.path = cur_path || ARRAY[1];
    tmp.geom = the_geom;

    RETURN NEXT tmp;
    RETURN;

  END IF;


  -- Use ST_NumPoints rather than ST_NPoints to have a NULL value if the_geom isn't
  -- a LINESTRING, CIRCULARSTRING.
  SELECT ST_NumPoints(the_geom) INTO nb_points;

  -- This should never happen
  IF (nb_points IS NULL) THEN
    RAISE EXCEPTION 'Unexpected error while dumping geometry %', ST_AsText(the_geom);
  END IF;

  FOR i IN 1..nb_points LOOP
    tmp.path = cur_path || ARRAY[i];
    tmp.geom := ST_PointN(the_geom, i);
    RETURN NEXT tmp;
  END LOOP;

END
$$;


--
-- TOC entry 500 (class 1255 OID 19732)
-- Name: _st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_dwithin';


--
-- TOC entry 706 (class 1255 OID 19962)
-- Name: _st_dwithin(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dwithin(geography, geography, double precision, boolean) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'geography_dwithin';


--
-- TOC entry 524 (class 1255 OID 19756)
-- Name: _st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_equals(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_Equals';


--
-- TOC entry 710 (class 1255 OID 19966)
-- Name: _st_expand(geography, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_expand(geography, double precision) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_expand';


--
-- TOC entry 527 (class 1255 OID 19759)
-- Name: _st_geomfromgml(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_geomfromgml(text, integer) RETURNS geometry
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'geom_from_gml';


--
-- TOC entry 502 (class 1255 OID 19734)
-- Name: _st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_intersects(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'intersects';


--
-- TOC entry 458 (class 1255 OID 19676)
-- Name: _st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_linecrossingdirection(geom1 geometry, geom2 geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_LineCrossingDirection';


--
-- TOC entry 623 (class 1255 OID 19855)
-- Name: _st_longestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_longestline(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_longestline2d';


--
-- TOC entry 619 (class 1255 OID 19851)
-- Name: _st_maxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_maxdistance(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_maxdistance2d_linestring';


--
-- TOC entry 765 (class 1255 OID 20025)
-- Name: _st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_orderingequals(geometrya geometry, geometryb geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_same';


--
-- TOC entry 514 (class 1255 OID 19746)
-- Name: _st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_overlaps(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'overlaps';


--
-- TOC entry 722 (class 1255 OID 19977)
-- Name: _st_pointoutside(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_pointoutside(geography) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_point_outside';


--
-- TOC entry 498 (class 1255 OID 19730)
-- Name: _st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_touches(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'touches';


--
-- TOC entry 515 (class 1255 OID 19747)
-- Name: _st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_within(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT _ST_Contains($2,$1)$_$;


--
-- TOC entry 635 (class 1255 OID 19867)
-- Name: addauth(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addauth(text) RETURNS boolean
LANGUAGE plpgsql
AS $_$
DECLARE
  lockid alias for $1;
  okay boolean;
  myrec record;
BEGIN
  -- check to see if table exists
  --  if not, CREATE TEMP TABLE mylock (transid xid, lockcode text)
  okay := 'f';
  FOR myrec IN SELECT * FROM pg_class WHERE relname = 'temp_lock_have_table' LOOP
    okay := 't';
  END LOOP;
  IF (okay <> 't') THEN
    CREATE TEMP TABLE temp_lock_have_table (transid xid, lockcode text);
    -- this will only work from pgsql7.4 up
    -- ON COMMIT DELETE ROWS;
  END IF;

  --  INSERT INTO mylock VALUES ( $1)
  --	EXECUTE 'INSERT INTO temp_lock_have_table VALUES ( '||
  --		quote_literal(getTransactionID()) || ',' ||
  --		quote_literal(lockid) ||')';

  INSERT INTO temp_lock_have_table VALUES (getTransactionID(), lockid);

  RETURN true::boolean;
END;
$_$;


--
-- TOC entry 786 (class 1255 OID 20999)
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer) RETURNS text
LANGUAGE plpgsql STRICT
AS $_$
DECLARE
  ret  text;
BEGIN
  SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5) into ret;
  RETURN ret;
END;
$_$;


--
-- TOC entry 401 (class 1255 OID 19607)
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true) RETURNS text
LANGUAGE plpgsql STRICT
AS $_$
DECLARE
  ret  text;
BEGIN
  SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5, $6) into ret;
  RETURN ret;
END;
$_$;


--
-- TOC entry 702 (class 1255 OID 20998)
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) RETURNS text
LANGUAGE plpgsql STABLE STRICT
AS $_$
DECLARE
  ret  text;
BEGIN
  SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6) into ret;
  RETURN ret;
END;
$_$;


--
-- TOC entry 400 (class 1255 OID 19606)
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true) RETURNS text
LANGUAGE plpgsql STABLE STRICT
AS $_$
DECLARE
  ret  text;
BEGIN
  SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6,$7) into ret;
  RETURN ret;
END;
$_$;


--
-- TOC entry 785 (class 1255 OID 20997)
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) RETURNS text
LANGUAGE plpgsql STRICT
AS $_$
DECLARE
  catalog_name alias for $1;
  schema_name alias for $2;
  table_name alias for $3;
  column_name alias for $4;
  new_srid alias for $5;
  new_type alias for $6;
  new_dim alias for $7;
  rec RECORD;
  sr varchar;
  real_schema name;
  sql text;

BEGIN

  -- Verify geometry type
  IF ( NOT ( (new_type = 'GEOMETRY') OR
             (new_type = 'GEOMETRYCOLLECTION') OR
             (new_type = 'POINT') OR
             (new_type = 'MULTIPOINT') OR
             (new_type = 'POLYGON') OR
             (new_type = 'MULTIPOLYGON') OR
             (new_type = 'LINESTRING') OR
             (new_type = 'MULTILINESTRING') OR
             (new_type = 'GEOMETRYCOLLECTIONM') OR
             (new_type = 'POINTM') OR
             (new_type = 'MULTIPOINTM') OR
             (new_type = 'POLYGONM') OR
             (new_type = 'MULTIPOLYGONM') OR
             (new_type = 'LINESTRINGM') OR
             (new_type = 'MULTILINESTRINGM') OR
             (new_type = 'CIRCULARSTRING') OR
             (new_type = 'CIRCULARSTRINGM') OR
             (new_type = 'COMPOUNDCURVE') OR
             (new_type = 'COMPOUNDCURVEM') OR
             (new_type = 'CURVEPOLYGON') OR
             (new_type = 'CURVEPOLYGONM') OR
             (new_type = 'MULTICURVE') OR
             (new_type = 'MULTICURVEM') OR
             (new_type = 'MULTISURFACE') OR
             (new_type = 'MULTISURFACEM')) )
  THEN
    RAISE EXCEPTION 'Invalid type name - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM,
	or GEOMETRYCOLLECTIONM';
    RETURN 'fail';
  END IF;


  -- Verify dimension
  IF ( (new_dim >4) OR (new_dim <0) ) THEN
    RAISE EXCEPTION 'invalid dimension';
    RETURN 'fail';
  END IF;

  IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
    RAISE EXCEPTION 'TypeM needs 3 dimensions';
    RETURN 'fail';
  END IF;


  -- Verify SRID
  IF ( new_srid != -1 ) THEN
    SELECT SRID INTO sr FROM spatial_ref_sys WHERE SRID = new_srid;
    IF NOT FOUND THEN
      RAISE EXCEPTION 'AddGeometryColumns() - invalid SRID';
      RETURN 'fail';
    END IF;
  END IF;


  -- Verify schema
  IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
    sql := 'SELECT nspname FROM pg_namespace ' ||
           'WHERE text(nspname) = ' || quote_literal(schema_name) ||
           'LIMIT 1';
    RAISE DEBUG '%', sql;
    EXECUTE sql INTO real_schema;

    IF ( real_schema IS NULL ) THEN
      RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
      RETURN 'fail';
    END IF;
  END IF;

  IF ( real_schema IS NULL ) THEN
    RAISE DEBUG 'Detecting schema';
    sql := 'SELECT n.nspname AS schemaname ' ||
           'FROM pg_catalog.pg_class c ' ||
           'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
           'WHERE c.relkind = ' || quote_literal('r') ||
           ' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
           ' AND pg_catalog.pg_table_is_visible(c.oid)' ||
           ' AND c.relname = ' || quote_literal(table_name);
    RAISE DEBUG '%', sql;
    EXECUTE sql INTO real_schema;

    IF ( real_schema IS NULL ) THEN
      RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
      RETURN 'fail';
    END IF;
  END IF;


  -- Add geometry column to table
  sql := 'ALTER TABLE ' ||
         quote_ident(real_schema) || '.' || quote_ident(table_name)
         || ' ADD COLUMN ' || quote_ident(column_name) ||
         ' geometry ';
  RAISE DEBUG '%', sql;
  EXECUTE sql;


  -- Delete stale record in geometry_columns (if any)
  sql := 'DELETE FROM geometry_columns WHERE
		f_table_catalog = ' || quote_literal('') ||
         ' AND f_table_schema = ' ||
         quote_literal(real_schema) ||
         ' AND f_table_name = ' || quote_literal(table_name) ||
         ' AND f_geometry_column = ' || quote_literal(column_name);
  RAISE DEBUG '%', sql;
  EXECUTE sql;


  -- Add record in geometry_columns
  sql := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema,f_table_name,' ||
         'f_geometry_column,coord_dimension,srid,type)' ||
         ' VALUES (' ||
         quote_literal('') || ',' ||
         quote_literal(real_schema) || ',' ||
         quote_literal(table_name) || ',' ||
         quote_literal(column_name) || ',' ||
         new_dim::text || ',' ||
         new_srid::text || ',' ||
         quote_literal(new_type) || ')';
  RAISE DEBUG '%', sql;
  EXECUTE sql;


  -- Add table CHECKs
  sql := 'ALTER TABLE ' ||
         quote_ident(real_schema) || '.' || quote_ident(table_name)
         || ' ADD CONSTRAINT '
         || quote_ident('enforce_srid_' || column_name)
         || ' CHECK (ST_SRID(' || quote_ident(column_name) ||
         ') = ' || new_srid::text || ')' ;
  RAISE DEBUG '%', sql;
  EXECUTE sql;

  sql := 'ALTER TABLE ' ||
         quote_ident(real_schema) || '.' || quote_ident(table_name)
         || ' ADD CONSTRAINT '
         || quote_ident('enforce_dims_' || column_name)
         || ' CHECK (ST_NDims(' || quote_ident(column_name) ||
         ') = ' || new_dim::text || ')' ;
  RAISE DEBUG '%', sql;
  EXECUTE sql;

  IF ( NOT (new_type = 'GEOMETRY')) THEN
    sql := 'ALTER TABLE ' ||
           quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
           quote_ident('enforce_geotype_' || column_name) ||
           ' CHECK (GeometryType(' ||
           quote_ident(column_name) || ')=' ||
           quote_literal(new_type) || ' OR (' ||
           quote_ident(column_name) || ') is null)';
    RAISE DEBUG '%', sql;
    EXECUTE sql;
  END IF;

  RETURN
  real_schema || '.' ||
  table_name || '.' || column_name ||
  ' SRID:' || new_srid::text ||
  ' TYPE:' || new_type ||
  ' DIMS:' || new_dim::text || ' ';
END;
$_$;


--
-- TOC entry 399 (class 1255 OID 20051)
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true) RETURNS text
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  rec RECORD;
  sr varchar;
  real_schema name;
  sql text;
  new_srid integer;

BEGIN

  -- Verify geometry type
  IF (postgis_type_name(new_type,new_dim) IS NULL )
  THEN
    RAISE EXCEPTION 'Invalid type name "%(%)" - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM, TRIANGLE, TRIANGLEM,
	POLYHEDRALSURFACE, POLYHEDRALSURFACEM, TIN, TINM
	or GEOMETRYCOLLECTIONM', new_type, new_dim;
    RETURN 'fail';
  END IF;


  -- Verify dimension
  IF ( (new_dim >4) OR (new_dim <2) ) THEN
    RAISE EXCEPTION 'invalid dimension';
    RETURN 'fail';
  END IF;

  IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
    RAISE EXCEPTION 'TypeM needs 3 dimensions';
    RETURN 'fail';
  END IF;


  -- Verify SRID
  IF ( new_srid_in > 0 ) THEN
    IF new_srid_in > 998999 THEN
      RAISE EXCEPTION 'AddGeometryColumn() - SRID must be <= %', 998999;
    END IF;
    new_srid := new_srid_in;
    SELECT SRID INTO sr FROM spatial_ref_sys WHERE SRID = new_srid;
    IF NOT FOUND THEN
      RAISE EXCEPTION 'AddGeometryColumn() - invalid SRID';
      RETURN 'fail';
    END IF;
  ELSE
    new_srid := ST_SRID('POINT EMPTY'::geometry);
    IF ( new_srid_in != new_srid ) THEN
      RAISE NOTICE 'SRID value % converted to the officially unknown SRID value %', new_srid_in, new_srid;
    END IF;
  END IF;


  -- Verify schema
  IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
    sql := 'SELECT nspname FROM pg_namespace ' ||
           'WHERE text(nspname) = ' || quote_literal(schema_name) ||
           'LIMIT 1';
    RAISE DEBUG '%', sql;
    EXECUTE sql INTO real_schema;

    IF ( real_schema IS NULL ) THEN
      RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
      RETURN 'fail';
    END IF;
  END IF;

  IF ( real_schema IS NULL ) THEN
    RAISE DEBUG 'Detecting schema';
    sql := 'SELECT n.nspname AS schemaname ' ||
           'FROM pg_catalog.pg_class c ' ||
           'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
           'WHERE c.relkind = ' || quote_literal('r') ||
           ' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
           ' AND pg_catalog.pg_table_is_visible(c.oid)' ||
           ' AND c.relname = ' || quote_literal(table_name);
    RAISE DEBUG '%', sql;
    EXECUTE sql INTO real_schema;

    IF ( real_schema IS NULL ) THEN
      RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
      RETURN 'fail';
    END IF;
  END IF;


  -- Add geometry column to table
  IF use_typmod THEN
    sql := 'ALTER TABLE ' ||
           quote_ident(real_schema) || '.' || quote_ident(table_name)
           || ' ADD COLUMN ' || quote_ident(column_name) ||
           ' geometry(' || postgis_type_name(new_type, new_dim) || ', ' || new_srid::text || ')';
    RAISE DEBUG '%', sql;
  ELSE
    sql := 'ALTER TABLE ' ||
           quote_ident(real_schema) || '.' || quote_ident(table_name)
           || ' ADD COLUMN ' || quote_ident(column_name) ||
           ' geometry ';
    RAISE DEBUG '%', sql;
  END IF;
  EXECUTE sql;

  IF NOT use_typmod THEN
    -- Add table CHECKs
    sql := 'ALTER TABLE ' ||
           quote_ident(real_schema) || '.' || quote_ident(table_name)
           || ' ADD CONSTRAINT '
           || quote_ident('enforce_srid_' || column_name)
           || ' CHECK (st_srid(' || quote_ident(column_name) ||
           ') = ' || new_srid::text || ')' ;
    RAISE DEBUG '%', sql;
    EXECUTE sql;

    sql := 'ALTER TABLE ' ||
           quote_ident(real_schema) || '.' || quote_ident(table_name)
           || ' ADD CONSTRAINT '
           || quote_ident('enforce_dims_' || column_name)
           || ' CHECK (st_ndims(' || quote_ident(column_name) ||
           ') = ' || new_dim::text || ')' ;
    RAISE DEBUG '%', sql;
    EXECUTE sql;

    IF ( NOT (new_type = 'GEOMETRY')) THEN
      sql := 'ALTER TABLE ' ||
             quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
             quote_ident('enforce_geotype_' || column_name) ||
             ' CHECK (GeometryType(' ||
             quote_ident(column_name) || ')=' ||
             quote_literal(new_type) || ' OR (' ||
             quote_ident(column_name) || ') is null)';
      RAISE DEBUG '%', sql;
      EXECUTE sql;
    END IF;
  END IF;

  RETURN
  real_schema || '.' ||
  table_name || '.' || column_name ||
  ' SRID:' || new_srid::text ||
  ' TYPE:' || new_type ||
  ' DIMS:' || new_dim::text || ' ';
END;
$$;


--
-- TOC entry 787 (class 1255 OID 21003)
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


--
-- TOC entry 743 (class 1255 OID 21012)
-- Name: asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- TOC entry 788 (class 1255 OID 21011)
-- Name: asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- TOC entry 792 (class 1255 OID 21016)
-- Name: askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML(2, transform($1,4326), 15)$_$;


--
-- TOC entry 789 (class 1255 OID 21015)
-- Name: askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML(2, transform($1,4326), $2)$_$;


--
-- TOC entry 793 (class 1255 OID 21017)
-- Name: askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(integer, geometry, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML($1, transform($2,4326), $3)$_$;


--
-- TOC entry 794 (class 1255 OID 21023)
-- Name: bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdmpolyfromtext(text, integer) RETURNS geometry
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
DECLARE
  geomtext alias for $1;
  srid alias for $2;
  mline geometry;
  geom geometry;
BEGIN
  mline := MultiLineStringFromText(geomtext, srid);

  IF mline IS NULL
  THEN
    RAISE EXCEPTION 'Input is not a MultiLinestring';
  END IF;

  geom := multi(BuildArea(mline));

  RETURN geom;
END;
$_$;


--
-- TOC entry 795 (class 1255 OID 21024)
-- Name: bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdpolyfromtext(text, integer) RETURNS geometry
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
DECLARE
  geomtext alias for $1;
  srid alias for $2;
  mline geometry;
  geom geometry;
BEGIN
  mline := MultiLineStringFromText(geomtext, srid);

  IF mline IS NULL
  THEN
    RAISE EXCEPTION 'Input is not a MultiLinestring';
  END IF;

  geom := BuildArea(mline);

  IF GeometryType(geom) != 'POLYGON'
  THEN
    RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
  END IF;

  RETURN geom;
END;
$_$;


--
-- TOC entry 433 (class 1255 OID 19637)
-- Name: box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(box3d) RETURNS box
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_to_BOX';


--
-- TOC entry 430 (class 1255 OID 19634)
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(geometry) RETURNS box
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_to_BOX';


--
-- TOC entry 431 (class 1255 OID 19635)
-- Name: box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(box3d) RETURNS box2d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_to_BOX2D';


--
-- TOC entry 428 (class 1255 OID 19632)
-- Name: box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(geometry) RETURNS box2d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_to_BOX2D';


--
-- TOC entry 432 (class 1255 OID 19636)
-- Name: box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(box2d) RETURNS box3d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX2D_to_BOX3D';


--
-- TOC entry 429 (class 1255 OID 19633)
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_to_BOX3D';


--
-- TOC entry 435 (class 1255 OID 19639)
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT box($1)$_$;


--
-- TOC entry 796 (class 1255 OID 21029)
-- Name: buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Buffer($1, $2, $3)$_$;


--
-- TOC entry 654 (class 1255 OID 19887)
-- Name: bytea(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bytea(geography) RETURNS bytea
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_to_bytea';


--
-- TOC entry 440 (class 1255 OID 19644)
-- Name: bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bytea(geometry) RETURNS bytea
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_to_bytea';


--
-- TOC entry 639 (class 1255 OID 19869)
-- Name: checkauth(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text) RETURNS integer
LANGUAGE sql
AS $_$ SELECT CheckAuth('', $1, $2) $_$;


--
-- TOC entry 638 (class 1255 OID 19868)
-- Name: checkauth(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text, text) RETURNS integer
LANGUAGE plpgsql
AS $_$
DECLARE
  schema text;
BEGIN
  IF NOT LongTransactionsEnabled() THEN
    RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
  END IF;

  if ( $1 != '' ) THEN
    schema = $1;
  ELSE
    SELECT current_schema() into schema;
  END IF;

  -- TODO: check for an already existing trigger ?

  EXECUTE 'CREATE TRIGGER check_auth BEFORE UPDATE OR DELETE ON '
          || quote_ident(schema) || '.' || quote_ident($2)
          ||' FOR EACH ROW EXECUTE PROCEDURE CheckAuthTrigger('
          || quote_literal($3) || ')';

  RETURN 0;
END;
$_$;


--
-- TOC entry 640 (class 1255 OID 19870)
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauthtrigger() RETURNS trigger
LANGUAGE c
AS '$libdir/postgis-2.0', 'check_authorization';


--
-- TOC entry 644 (class 1255 OID 19874)
-- Name: disablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disablelongtransactions() RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;

BEGIN

  --
  -- Drop all triggers applied by CheckAuth()
  --
  FOR rec IN
  SELECT c.relname, t.tgname, t.tgargs FROM pg_trigger t, pg_class c, pg_proc p
  WHERE p.proname = 'checkauthtrigger' and t.tgfoid = p.oid and t.tgrelid = c.oid
  LOOP
    EXECUTE 'DROP TRIGGER ' || quote_ident(rec.tgname) ||
            ' ON ' || quote_ident(rec.relname);
  END LOOP;

  --
  -- Drop the authorization_table table
  --
  FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table' LOOP
    DROP TABLE authorization_table;
  END LOOP;

  --
  -- Drop the authorized_tables view
  --
  FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables' LOOP
    DROP VIEW authorized_tables;
  END LOOP;

  RETURN 'Long transactions support disabled';
END;
$$;


--
-- TOC entry 404 (class 1255 OID 19610)
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(table_name character varying, column_name character varying) RETURNS text
LANGUAGE plpgsql STRICT
AS $_$
DECLARE
  ret text;
BEGIN
  SELECT DropGeometryColumn('','',$1,$2) into ret;
  RETURN ret;
END;
$_$;


--
-- TOC entry 403 (class 1255 OID 19609)
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying) RETURNS text
LANGUAGE plpgsql STRICT
AS $_$
DECLARE
  ret text;
BEGIN
  SELECT DropGeometryColumn('',$1,$2,$3) into ret;
  RETURN ret;
END;
$_$;


--
-- TOC entry 402 (class 1255 OID 19608)
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying) RETURNS text
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  myrec RECORD;
  okay boolean;
  real_schema name;

BEGIN


  -- Find, check or fix schema_name
  IF ( schema_name != '' ) THEN
    okay = false;

    FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
      okay := true;
    END LOOP;

    IF ( okay <>  true ) THEN
      RAISE NOTICE 'Invalid schema name - using current_schema()';
      SELECT current_schema() into real_schema;
    ELSE
      real_schema = schema_name;
    END IF;
  ELSE
    SELECT current_schema() into real_schema;
  END IF;

  -- Find out if the column is in the geometry_columns table
  okay = false;
  FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
    okay := true;
  END LOOP;
  IF (okay <> true) THEN
    RAISE EXCEPTION 'column not found in geometry_columns table';
    RETURN false;
  END IF;

  -- Remove table column
  EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
          quote_ident(table_name) || ' DROP COLUMN ' ||
          quote_ident(column_name);

  RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';

END;
$$;


--
-- TOC entry 407 (class 1255 OID 19613)
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(table_name character varying) RETURNS text
LANGUAGE sql STRICT
AS $_$ SELECT DropGeometryTable('','',$1) $_$;


--
-- TOC entry 406 (class 1255 OID 19612)
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(schema_name character varying, table_name character varying) RETURNS text
LANGUAGE sql STRICT
AS $_$ SELECT DropGeometryTable('',$1,$2) $_$;


--
-- TOC entry 405 (class 1255 OID 19611)
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying) RETURNS text
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  real_schema name;

BEGIN

  IF ( schema_name = '' ) THEN
    SELECT current_schema() into real_schema;
  ELSE
    real_schema = schema_name;
  END IF;

  -- TODO: Should we warn if table doesn't exist probably instead just saying dropped
  -- Remove table
  EXECUTE 'DROP TABLE IF EXISTS '
          || quote_ident(real_schema) || '.' ||
          quote_ident(table_name) || ' RESTRICT';

  RETURN
  real_schema || '.' ||
  table_name ||' dropped.';

END;
$$;


--
-- TOC entry 642 (class 1255 OID 19872)
-- Name: enablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION enablelongtransactions() RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  "query" text;
  exists bool;
  rec RECORD;

BEGIN

  exists = 'f';
  FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table'
  LOOP
    exists = 't';
  END LOOP;

  IF NOT exists
  THEN
    "query" = 'CREATE TABLE authorization_table (
			toid oid, -- table oid
			rid text, -- row id
			expires timestamp,
			authid text
		)';
    EXECUTE "query";
  END IF;

  exists = 'f';
  FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables'
  LOOP
    exists = 't';
  END LOOP;

  IF NOT exists THEN
    "query" = 'CREATE VIEW authorized_tables AS ' ||
              'SELECT ' ||
              'n.nspname as schema, ' ||
              'c.relname as table, trim(' ||
              quote_literal(chr(92) || '000') ||
              ' from t.tgargs) as id_column ' ||
              'FROM pg_trigger t, pg_class c, pg_proc p ' ||
              ', pg_namespace n ' ||
              'WHERE p.proname = ' || quote_literal('checkauthtrigger') ||
              ' AND c.relnamespace = n.oid' ||
              ' AND t.tgfoid = p.oid and t.tgrelid = c.oid';
    EXECUTE "query";
  END IF;

  RETURN 'Long transactions support enabled';
END;
$$;


--
-- TOC entry 526 (class 1255 OID 19758)
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION equals(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_Equals';


--
-- TOC entry 686 (class 1255 OID 21933)
-- Name: extract_distances(integer, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION extract_distances(_id_mobile_station integer, from_date timestamp without time zone, to_date timestamp without time zone) RETURNS double precision[]
LANGUAGE plpgsql
AS $$

DECLARE

  --Input and paramter images
  record_out RECORD;

  distances_array double precision ARRAY;
  the_geom_array GEOMETRY ARRAY;

  icount integer;
  max_count integer;
BEGIN


  -- Estraggo tutti i the_geome  li metto in un array


  the_geom_array :=  array(
      select the_geom
      from dati
      where id_mobile_station = _id_mobile_station
            and data between from_date and to_date
      order by data
  );


  RAISE NOTICE 'Grandezza vettore: %', array_length(the_geom_array,1);

  max_count := array_length(the_geom_array,1);
  icount := 1;

  --ciclo su array per calcolo delle distanze
  WHILE icount  <  max_count LOOP


    --  RAISE NOTICE 'Processo: %, %', icount, max_count;
    --   RAISE NOTICE 'distanza: %',ST_Distance_Sphere(the_geom_array[icount]::GEOMETRY,the_geom_array[(icount+1)]::GEOMETRY );




    distances_array := array_append(distances_array, ( ST_Distance_Sphere(the_geom_array[icount]::GEOMETRY,the_geom_array[(icount+1)]::GEOMETRY ) ) );
    icount := icount + 1;


  END LOOP;

  RAISE NOTICE 'Ecco ho finito';

  RETURN distances_array;
END;
$$;


--
-- TOC entry 801 (class 1255 OID 21061)
-- Name: find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text) RETURNS box2d
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
DECLARE
  tablename alias for $1;
  columnname alias for $2;
  myrec RECORD;

BEGIN
  FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
    return myrec.extent;
  END LOOP;
END;
$_$;


--
-- TOC entry 800 (class 1255 OID 21060)
-- Name: find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text, text) RETURNS box2d
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
DECLARE
  schemaname alias for $1;
  tablename alias for $2;
  columnname alias for $3;
  myrec RECORD;

BEGIN
  FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
    return myrec.extent;
  END LOOP;
END;
$_$;


--
-- TOC entry 413 (class 1255 OID 19617)
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_srid(character varying, character varying, character varying) RETURNS integer
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
DECLARE
  schem text;
  tabl text;
  sr int4;
BEGIN
  IF $1 IS NULL THEN
    RAISE EXCEPTION 'find_srid() - schema is NULL!';
  END IF;
  IF $2 IS NULL THEN
    RAISE EXCEPTION 'find_srid() - table name is NULL!';
  END IF;
  IF $3 IS NULL THEN
    RAISE EXCEPTION 'find_srid() - column name is NULL!';
  END IF;
  schem = $1;
  tabl = $2;
  -- if the table contains a . and the schema is empty
  -- split the table into a schema and a table
  -- otherwise drop through to default behavior
  IF ( schem = '' and tabl LIKE '%.%' ) THEN
    schem = substr(tabl,1,strpos(tabl,'.')-1);
    tabl = substr(tabl,length(schem)+2);
  ELSE
    schem = schem || '%';
  END IF;

  select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
  END IF;
  return sr;
END;
$_$;


--
-- TOC entry 802 (class 1255 OID 21062)
-- Name: fix_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fix_geometry_columns() RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  mislinked record;
  result text;
  linked integer;
  deleted integer;
  foundschema integer;
BEGIN

  -- Since 7.3 schema support has been added.
  -- Previous postgis versions used to put the database name in
  -- the schema column. This needs to be fixed, so we try to
  -- set the correct schema for each geometry_colums record
  -- looking at table, column, type and srid.
  UPDATE geometry_columns SET f_table_schema = n.nspname
  FROM pg_namespace n, pg_class c, pg_attribute a,
    pg_constraint sridcheck, pg_constraint typecheck
  WHERE ( f_table_schema is NULL
          OR f_table_schema = ''
          OR f_table_schema NOT IN (
    SELECT nspname::varchar
    FROM pg_namespace nn, pg_class cc, pg_attribute aa
    WHERE cc.relnamespace = nn.oid
          AND cc.relname = f_table_name::name
          AND aa.attrelid = cc.oid
          AND aa.attname = f_geometry_column::name))
        AND f_table_name::name = c.relname
        AND c.oid = a.attrelid
        AND c.relnamespace = n.oid
        AND f_geometry_column::name = a.attname

        AND sridcheck.conrelid = c.oid
        AND sridcheck.consrc LIKE '(srid(% = %)'
        AND sridcheck.consrc ~ textcat(' = ', srid::text)

        AND typecheck.conrelid = c.oid
        AND typecheck.consrc LIKE
            '((geometrytype(%) = ''%''::text) OR (% IS NULL))'
        AND typecheck.consrc ~ textcat(' = ''', type::text)

        AND NOT EXISTS (
      SELECT oid FROM geometry_columns gc
      WHERE c.relname::varchar = gc.f_table_name
            AND n.nspname::varchar = gc.f_table_schema
            AND a.attname::varchar = gc.f_geometry_column
  );

  GET DIAGNOSTICS foundschema = ROW_COUNT;

  -- no linkage to system table needed
  return 'fixed:'||foundschema::text;

END;
$$;


--
-- TOC entry 653 (class 1255 OID 19886)
-- Name: geography(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography(bytea) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_from_bytea';


--
-- TOC entry 664 (class 1255 OID 19903)
-- Name: geography(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography(geometry) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_from_geometry';


--
-- TOC entry 652 (class 1255 OID 19884)
-- Name: geography(geography, integer, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography(geography, integer, boolean) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_enforce_typmod';


--
-- TOC entry 681 (class 1255 OID 19933)
-- Name: geography_cmp(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_cmp(geography, geography) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_cmp';


--
-- TOC entry 680 (class 1255 OID 19932)
-- Name: geography_eq(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_eq(geography, geography) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_eq';


--
-- TOC entry 679 (class 1255 OID 19931)
-- Name: geography_ge(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_ge(geography, geography) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_ge';


--
-- TOC entry 667 (class 1255 OID 19908)
-- Name: geography_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_compress(internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_compress';


--
-- TOC entry 666 (class 1255 OID 19907)
-- Name: geography_gist_consistent(internal, geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_consistent(internal, geography, integer) RETURNS boolean
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_consistent';


--
-- TOC entry 672 (class 1255 OID 19913)
-- Name: geography_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_decompress(internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_decompress';


--
-- TOC entry 674 (class 1255 OID 19915)
-- Name: geography_gist_join_selectivity(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_join_selectivity(internal, oid, internal, smallint) RETURNS double precision
LANGUAGE c
AS '$libdir/postgis-2.0', 'geography_gist_selectivity';


--
-- TOC entry 668 (class 1255 OID 19909)
-- Name: geography_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_penalty(internal, internal, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_penalty';


--
-- TOC entry 669 (class 1255 OID 19910)
-- Name: geography_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_picksplit(internal, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_picksplit';


--
-- TOC entry 671 (class 1255 OID 19912)
-- Name: geography_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_same(box2d, box2d, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_same';


--
-- TOC entry 673 (class 1255 OID 19914)
-- Name: geography_gist_selectivity(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_selectivity(internal, oid, internal, integer) RETURNS double precision
LANGUAGE c
AS '$libdir/postgis-2.0', 'geography_gist_selectivity';


--
-- TOC entry 670 (class 1255 OID 19911)
-- Name: geography_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_union(bytea, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_union';


--
-- TOC entry 678 (class 1255 OID 19930)
-- Name: geography_gt(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gt(geography, geography) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_gt';


--
-- TOC entry 677 (class 1255 OID 19929)
-- Name: geography_le(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_le(geography, geography) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_le';


--
-- TOC entry 676 (class 1255 OID 19928)
-- Name: geography_lt(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_lt(geography, geography) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_lt';


--
-- TOC entry 675 (class 1255 OID 19916)
-- Name: geography_overlaps(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_overlaps(geography, geography) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_overlaps';


--
-- TOC entry 905 (class 1255 OID 21075)
-- Name: geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
         THEN GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 784 (class 1255 OID 21074)
-- Name: geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
         THEN GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 907 (class 1255 OID 21077)
-- Name: geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
         THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 906 (class 1255 OID 21076)
-- Name: geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
         THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 439 (class 1255 OID 19643)
-- Name: geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(bytea) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_from_bytea';


--
-- TOC entry 438 (class 1255 OID 19642)
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(text) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'parse_WKT_lwgeom';


--
-- TOC entry 436 (class 1255 OID 19640)
-- Name: geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box2d) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX2D_to_LWGEOM';


--
-- TOC entry 437 (class 1255 OID 19641)
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_to_LWGEOM';


--
-- TOC entry 665 (class 1255 OID 19905)
-- Name: geometry(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(geography) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geometry_from_geography';


--
-- TOC entry 248 (class 1255 OID 19366)
-- Name: geometry(geometry, integer, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(geometry, integer, boolean) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geometry_enforce_typmod';


--
-- TOC entry 287 (class 1255 OID 19444)
-- Name: geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_above(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_above_2d';


--
-- TOC entry 282 (class 1255 OID 19435)
-- Name: geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_below(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_below_2d';


--
-- TOC entry 266 (class 1255 OID 19393)
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_cmp(geom1 geometry, geom2 geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'lwgeom_cmp';


--
-- TOC entry 278 (class 1255 OID 19425)
-- Name: geometry_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contains(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_contains_2d';


--
-- TOC entry 277 (class 1255 OID 19422)
-- Name: geometry_distance_box(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_distance_box(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_distance_box_2d';


--
-- TOC entry 276 (class 1255 OID 19421)
-- Name: geometry_distance_centroid(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_distance_centroid(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_distance_centroid_2d';


--
-- TOC entry 265 (class 1255 OID 19392)
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_eq(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'lwgeom_eq';


--
-- TOC entry 264 (class 1255 OID 19391)
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_ge(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'lwgeom_ge';


--
-- TOC entry 269 (class 1255 OID 19409)
-- Name: geometry_gist_compress_2d(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_compress_2d(internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_compress_2d';


--
-- TOC entry 289 (class 1255 OID 19470)
-- Name: geometry_gist_compress_nd(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_compress_nd(internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_compress';


--
-- TOC entry 268 (class 1255 OID 19408)
-- Name: geometry_gist_consistent_2d(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_consistent_2d(internal, geometry, integer) RETURNS boolean
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_consistent_2d';


--
-- TOC entry 288 (class 1255 OID 19469)
-- Name: geometry_gist_consistent_nd(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_consistent_nd(internal, geometry, integer) RETURNS boolean
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_consistent';


--
-- TOC entry 271 (class 1255 OID 19414)
-- Name: geometry_gist_decompress_2d(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_decompress_2d(internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_decompress_2d';


--
-- TOC entry 294 (class 1255 OID 19475)
-- Name: geometry_gist_decompress_nd(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_decompress_nd(internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_decompress';


--
-- TOC entry 267 (class 1255 OID 19407)
-- Name: geometry_gist_distance_2d(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_distance_2d(internal, geometry, integer) RETURNS double precision
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_distance_2d';


--
-- TOC entry 273 (class 1255 OID 19416)
-- Name: geometry_gist_joinsel_2d(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_joinsel_2d(internal, oid, internal, smallint) RETURNS double precision
LANGUAGE c
AS '$libdir/postgis-2.0', 'geometry_gist_joinsel_2d';


--
-- TOC entry 270 (class 1255 OID 19410)
-- Name: geometry_gist_penalty_2d(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_penalty_2d(internal, internal, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_penalty_2d';


--
-- TOC entry 290 (class 1255 OID 19471)
-- Name: geometry_gist_penalty_nd(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_penalty_nd(internal, internal, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_penalty';


--
-- TOC entry 636 (class 1255 OID 19411)
-- Name: geometry_gist_picksplit_2d(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_picksplit_2d(internal, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_picksplit_2d';


--
-- TOC entry 291 (class 1255 OID 19472)
-- Name: geometry_gist_picksplit_nd(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_picksplit_nd(internal, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_picksplit';


--
-- TOC entry 655 (class 1255 OID 19413)
-- Name: geometry_gist_same_2d(geometry, geometry, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_same_2d(geom1 geometry, geom2 geometry, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_same_2d';


--
-- TOC entry 293 (class 1255 OID 19474)
-- Name: geometry_gist_same_nd(geometry, geometry, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_same_nd(geometry, geometry, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_same';


--
-- TOC entry 272 (class 1255 OID 19415)
-- Name: geometry_gist_sel_2d(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_sel_2d(internal, oid, internal, integer) RETURNS double precision
LANGUAGE c
AS '$libdir/postgis-2.0', 'geometry_gist_sel_2d';


--
-- TOC entry 637 (class 1255 OID 19412)
-- Name: geometry_gist_union_2d(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_union_2d(bytea, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_union_2d';


--
-- TOC entry 292 (class 1255 OID 19473)
-- Name: geometry_gist_union_nd(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_union_nd(bytea, internal) RETURNS internal
LANGUAGE c
AS '$libdir/postgis-2.0', 'gserialized_gist_union';


--
-- TOC entry 263 (class 1255 OID 19390)
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gt(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'lwgeom_gt';


--
-- TOC entry 262 (class 1255 OID 19389)
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_le(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'lwgeom_le';


--
-- TOC entry 280 (class 1255 OID 19429)
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_left(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_left_2d';


--
-- TOC entry 261 (class 1255 OID 19388)
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_lt(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'lwgeom_lt';


--
-- TOC entry 286 (class 1255 OID 19443)
-- Name: geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overabove(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_overabove_2d';


--
-- TOC entry 283 (class 1255 OID 19438)
-- Name: geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overbelow(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_overbelow_2d';


--
-- TOC entry 274 (class 1255 OID 19417)
-- Name: geometry_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overlaps(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_overlaps_2d';


--
-- TOC entry 295 (class 1255 OID 19476)
-- Name: geometry_overlaps_nd(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overlaps_nd(geometry, geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_overlaps';


--
-- TOC entry 281 (class 1255 OID 19432)
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overleft(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_overleft_2d';


--
-- TOC entry 284 (class 1255 OID 19441)
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overright(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_overright_2d';


--
-- TOC entry 285 (class 1255 OID 19442)
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_right(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_right_2d';


--
-- TOC entry 275 (class 1255 OID 19419)
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_same(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_same_2d';


--
-- TOC entry 279 (class 1255 OID 19426)
-- Name: geometry_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_within(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'gserialized_within_2d';


--
-- TOC entry 740 (class 1255 OID 19995)
-- Name: geometrytype(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometrytype(geography) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_getTYPE';


--
-- TOC entry 555 (class 1255 OID 19786)
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_getTYPE';


--
-- TOC entry 370 (class 1255 OID 19562)
-- Name: geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkb(bytea) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOMFromWKB';


--
-- TOC entry 372 (class 1255 OID 19564)
-- Name: geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkt(text) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'parse_WKT_lwgeom';


--
-- TOC entry 908 (class 1255 OID 21089)
-- Name: geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT geometryfromtext($1)$_$;


--
-- TOC entry 909 (class 1255 OID 21090)
-- Name: geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT geometryfromtext($1, $2)$_$;


--
-- TOC entry 910 (class 1255 OID 21092)
-- Name: geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT setSRID(GeomFromWKB($1), $2)$_$;


--
-- TOC entry 414 (class 1255 OID 19618)
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_proj4_from_srid(integer) RETURNS text
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
BEGIN
  RETURN proj4text::text FROM spatial_ref_sys WHERE srid= $1;
END;
$_$;


--
-- TOC entry 641 (class 1255 OID 19871)
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gettransactionid() RETURNS xid
LANGUAGE c
AS '$libdir/postgis-2.0', 'getTransactionID';


--
-- TOC entry 911 (class 1255 OID 21116)
-- Name: linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
  THEN GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 912 (class 1255 OID 21117)
-- Name: linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
  THEN GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 914 (class 1255 OID 21119)
-- Name: linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 913 (class 1255 OID 21118)
-- Name: linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 915 (class 1255 OID 21121)
-- Name: linestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT LineFromText($1)$_$;


--
-- TOC entry 916 (class 1255 OID 21122)
-- Name: linestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT LineFromText($1, $2)$_$;


--
-- TOC entry 918 (class 1255 OID 21124)
-- Name: linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 917 (class 1255 OID 21123)
-- Name: linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 919 (class 1255 OID 21125)
-- Name: locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_along_measure(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- TOC entry 633 (class 1255 OID 19865)
-- Name: lockrow(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text) RETURNS integer
LANGUAGE sql STRICT
AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00'); $_$;


--
-- TOC entry 632 (class 1255 OID 19864)
-- Name: lockrow(text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text) RETURNS integer
LANGUAGE sql STRICT
AS $_$ SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00'); $_$;


--
-- TOC entry 634 (class 1255 OID 19866)
-- Name: lockrow(text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, timestamp without time zone) RETURNS integer
LANGUAGE sql STRICT
AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, $4); $_$;


--
-- TOC entry 631 (class 1255 OID 19863)
-- Name: lockrow(text, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text, timestamp without time zone) RETURNS integer
LANGUAGE plpgsql STRICT
AS $_$
DECLARE
  myschema alias for $1;
  mytable alias for $2;
  myrid   alias for $3;
  authid alias for $4;
  expires alias for $5;
  ret int;
  mytoid oid;
  myrec RECORD;

BEGIN

  IF NOT LongTransactionsEnabled() THEN
    RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
  END IF;

  EXECUTE 'DELETE FROM authorization_table WHERE expires < now()';

  SELECT c.oid INTO mytoid FROM pg_class c, pg_namespace n
  WHERE c.relname = mytable
        AND c.relnamespace = n.oid
        AND n.nspname = myschema;

  -- RAISE NOTICE 'toid: %', mytoid;

  FOR myrec IN SELECT * FROM authorization_table WHERE
    toid = mytoid AND rid = myrid
  LOOP
    IF myrec.authid != authid THEN
      RETURN 0;
    ELSE
      RETURN 1;
    END IF;
  END LOOP;

  EXECUTE 'INSERT INTO authorization_table VALUES ('||
          quote_literal(mytoid::text)||','||quote_literal(myrid)||
          ','||quote_literal(expires::text)||
          ','||quote_literal(authid) ||')';

  GET DIAGNOSTICS ret = ROW_COUNT;

  RETURN ret;
END;
$_$;


--
-- TOC entry 643 (class 1255 OID 19873)
-- Name: longtransactionsenabled(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION longtransactionsenabled() RETURNS boolean
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
BEGIN
  FOR rec IN SELECT oid FROM pg_class WHERE relname = 'authorized_tables'
  LOOP
    return 't';
  END LOOP;
  return 'f';
END;
$$;


--
-- TOC entry 921 (class 1255 OID 21148)
-- Name: mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
  THEN GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 920 (class 1255 OID 21147)
-- Name: mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
         THEN GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 923 (class 1255 OID 21150)
-- Name: mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 922 (class 1255 OID 21149)
-- Name: mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 804 (class 1255 OID 21152)
-- Name: mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
  THEN GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 803 (class 1255 OID 21151)
-- Name: mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
  THEN GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 924 (class 1255 OID 21154)
-- Name: mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 805 (class 1255 OID 21153)
-- Name: mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 807 (class 1255 OID 21156)
-- Name: mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
  THEN GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 806 (class 1255 OID 21155)
-- Name: mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
  THEN GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 809 (class 1255 OID 21158)
-- Name: mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 808 (class 1255 OID 21157)
-- Name: mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 811 (class 1255 OID 21161)
-- Name: multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 810 (class 1255 OID 21160)
-- Name: multilinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 812 (class 1255 OID 21162)
-- Name: multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_MLineFromText($1)$_$;


--
-- TOC entry 813 (class 1255 OID 21163)
-- Name: multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT MLineFromText($1, $2)$_$;


--
-- TOC entry 815 (class 1255 OID 21165)
-- Name: multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT MPointFromText($1)$_$;


--
-- TOC entry 814 (class 1255 OID 21164)
-- Name: multipointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT MPointFromText($1, $2)$_$;


--
-- TOC entry 817 (class 1255 OID 21167)
-- Name: multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 816 (class 1255 OID 21166)
-- Name: multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 819 (class 1255 OID 21169)
-- Name: multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 818 (class 1255 OID 21168)
-- Name: multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 821 (class 1255 OID 21171)
-- Name: multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT MPolyFromText($1)$_$;


--
-- TOC entry 820 (class 1255 OID 21170)
-- Name: multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT MPolyFromText($1, $2)$_$;


--
-- TOC entry 488 (class 1255 OID 19715)
-- Name: pgis_geometry_accum_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_finalfn(pgis_abs) RETURNS geometry[]
LANGUAGE c
AS '$libdir/postgis-2.0', 'pgis_geometry_accum_finalfn';


--
-- TOC entry 487 (class 1255 OID 19714)
-- Name: pgis_geometry_accum_transfn(pgis_abs, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_transfn(pgis_abs, geometry) RETURNS pgis_abs
LANGUAGE c
AS '$libdir/postgis-2.0', 'pgis_geometry_accum_transfn';


--
-- TOC entry 490 (class 1255 OID 19717)
-- Name: pgis_geometry_collect_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_collect_finalfn(pgis_abs) RETURNS geometry
LANGUAGE c
AS '$libdir/postgis-2.0', 'pgis_geometry_collect_finalfn';


--
-- TOC entry 492 (class 1255 OID 19719)
-- Name: pgis_geometry_makeline_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_makeline_finalfn(pgis_abs) RETURNS geometry
LANGUAGE c
AS '$libdir/postgis-2.0', 'pgis_geometry_makeline_finalfn';


--
-- TOC entry 491 (class 1255 OID 19718)
-- Name: pgis_geometry_polygonize_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_polygonize_finalfn(pgis_abs) RETURNS geometry
LANGUAGE c
AS '$libdir/postgis-2.0', 'pgis_geometry_polygonize_finalfn';


--
-- TOC entry 489 (class 1255 OID 19716)
-- Name: pgis_geometry_union_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_union_finalfn(pgis_abs) RETURNS geometry
LANGUAGE c
AS '$libdir/postgis-2.0', 'pgis_geometry_union_finalfn';


--
-- TOC entry 925 (class 1255 OID 21185)
-- Name: pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
  THEN GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 926 (class 1255 OID 21186)
-- Name: pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
  THEN GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 928 (class 1255 OID 21188)
-- Name: pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 927 (class 1255 OID 21187)
-- Name: pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POINT'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 929 (class 1255 OID 21191)
-- Name: polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
  THEN GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 930 (class 1255 OID 21192)
-- Name: polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
  THEN GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 932 (class 1255 OID 21194)
-- Name: polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 931 (class 1255 OID 21193)
-- Name: polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 823 (class 1255 OID 21196)
-- Name: polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT PolyFromText($1)$_$;


--
-- TOC entry 822 (class 1255 OID 21195)
-- Name: polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT PolyFromText($1, $2)$_$;


--
-- TOC entry 825 (class 1255 OID 21198)
-- Name: polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
  THEN GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 824 (class 1255 OID 21197)
-- Name: polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
  THEN GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 826 (class 1255 OID 21200)
-- Name: populate_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns() RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  inserted    integer;
  oldcount    integer;
  probed      integer;
  stale       integer;
  gcs         RECORD;
  gc          RECORD;
  gsrid       integer;
  gndims      integer;
  gtype       text;
  query       text;
  gc_is_valid boolean;

BEGIN
  SELECT count(*) INTO oldcount FROM geometry_columns;
  inserted := 0;

  EXECUTE 'TRUNCATE geometry_columns';

  -- Count the number of geometry columns in all tables and views
  SELECT count(DISTINCT c.oid) INTO probed
  FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE (c.relkind = 'r' OR c.relkind = 'v')
        AND t.typname = 'geometry'
        AND a.attisdropped = false
        AND a.atttypid = t.oid
        AND a.attrelid = c.oid
        AND c.relnamespace = n.oid
        AND n.nspname NOT ILIKE 'pg_temp%';

  -- Iterate through all non-dropped geometry columns
  RAISE DEBUG 'Processing Tables.....';

  FOR gcs IN
  SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
  FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE c.relkind = 'r'
        AND t.typname = 'geometry'
        AND a.attisdropped = false
        AND a.atttypid = t.oid
        AND a.attrelid = c.oid
        AND c.relnamespace = n.oid
        AND n.nspname NOT ILIKE 'pg_temp%'
  LOOP

    inserted := inserted + populate_geometry_columns(gcs.oid);
  END LOOP;

  -- Add views to geometry columns table
  RAISE DEBUG 'Processing Views.....';
  FOR gcs IN
  SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
  FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE c.relkind = 'v'
        AND t.typname = 'geometry'
        AND a.attisdropped = false
        AND a.atttypid = t.oid
        AND a.attrelid = c.oid
        AND c.relnamespace = n.oid
  LOOP

    inserted := inserted + populate_geometry_columns(gcs.oid);
  END LOOP;

  IF oldcount > inserted THEN
    stale = oldcount-inserted;
  ELSE
    stale = 0;
  END IF;

  RETURN 'probed:' ||probed|| ' inserted:'||inserted|| ' conflicts:'||probed-inserted|| ' deleted:'||stale;
END

$$;


--
-- TOC entry 397 (class 1255 OID 19601)
-- Name: populate_geometry_columns(boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns(use_typmod boolean DEFAULT true) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  inserted    integer;
  oldcount    integer;
  probed      integer;
  stale       integer;
  gcs         RECORD;
  gc          RECORD;
  gsrid       integer;
  gndims      integer;
  gtype       text;
  query       text;
  gc_is_valid boolean;

BEGIN
  SELECT count(*) INTO oldcount FROM geometry_columns;
  inserted := 0;

  -- Count the number of geometry columns in all tables and views
  SELECT count(DISTINCT c.oid) INTO probed
  FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE (c.relkind = 'r' OR c.relkind = 'v')
        AND t.typname = 'geometry'
        AND a.attisdropped = false
        AND a.atttypid = t.oid
        AND a.attrelid = c.oid
        AND c.relnamespace = n.oid
        AND n.nspname NOT ILIKE 'pg_temp%' AND c.relname != 'raster_columns' ;

  -- Iterate through all non-dropped geometry columns
  RAISE DEBUG 'Processing Tables.....';

  FOR gcs IN
  SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
  FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE c.relkind = 'r'
        AND t.typname = 'geometry'
        AND a.attisdropped = false
        AND a.atttypid = t.oid
        AND a.attrelid = c.oid
        AND c.relnamespace = n.oid
        AND n.nspname NOT ILIKE 'pg_temp%' AND c.relname != 'raster_columns'
  LOOP

    inserted := inserted + populate_geometry_columns(gcs.oid, use_typmod);
  END LOOP;

  IF oldcount > inserted THEN
    stale = oldcount-inserted;
  ELSE
    stale = 0;
  END IF;

  RETURN 'probed:' ||probed|| ' inserted:'||inserted;
END

$$;


--
-- TOC entry 827 (class 1255 OID 21201)
-- Name: populate_geometry_columns(oid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns(tbl_oid oid) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  gcs         RECORD;
  gc          RECORD;
  gsrid       integer;
  gndims      integer;
  gtype       text;
  query       text;
  gc_is_valid boolean;
  inserted    integer;

BEGIN
  inserted := 0;

  -- Iterate through all geometry columns in this table
  FOR gcs IN
  SELECT n.nspname, c.relname, a.attname
  FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE c.relkind = 'r'
        AND t.typname = 'geometry'
        AND a.attisdropped = false
        AND a.atttypid = t.oid
        AND a.attrelid = c.oid
        AND c.relnamespace = n.oid
        AND n.nspname NOT ILIKE 'pg_temp%'
        AND c.oid = tbl_oid
  LOOP

    RAISE DEBUG 'Processing table %.%.%', gcs.nspname, gcs.relname, gcs.attname;

    DELETE FROM geometry_columns
    WHERE f_table_schema = quote_ident(gcs.nspname)
          AND f_table_name = quote_ident(gcs.relname)
          AND f_geometry_column = quote_ident(gcs.attname);

    gc_is_valid := true;

    -- Try to find srid check from system tables (pg_constraint)
    gsrid :=
    (SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')
     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
     WHERE n.nspname = gcs.nspname
           AND c.relname = gcs.relname
           AND a.attname = gcs.attname
           AND a.attrelid = c.oid
           AND s.connamespace = n.oid
           AND s.conrelid = c.oid
           AND a.attnum = ANY (s.conkey)
           AND s.consrc LIKE '%srid(% = %');
    IF (gsrid IS NULL) THEN
      -- Try to find srid from the geometry itself
      EXECUTE 'SELECT srid(' || quote_ident(gcs.attname) || ')
				 FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
      INTO gc;
      gsrid := gc.srid;

      -- Try to apply srid check to column
      IF (gsrid IS NOT NULL) THEN
        BEGIN
          EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
						 ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) || '
						 CHECK (srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
          EXCEPTION
          WHEN check_violation THEN
            RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
            gc_is_valid := false;
        END;
      END IF;
    END IF;

    -- Try to find ndims check from system tables (pg_constraint)
    gndims :=
    (SELECT replace(split_part(s.consrc, ' = ', 2), ')', '')
     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
     WHERE n.nspname = gcs.nspname
           AND c.relname = gcs.relname
           AND a.attname = gcs.attname
           AND a.attrelid = c.oid
           AND s.connamespace = n.oid
           AND s.conrelid = c.oid
           AND a.attnum = ANY (s.conkey)
           AND s.consrc LIKE '%ndims(% = %');
    IF (gndims IS NULL) THEN
      -- Try to find ndims from the geometry itself
      EXECUTE 'SELECT ndims(' || quote_ident(gcs.attname) || ')
				 FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
      INTO gc;
      gndims := gc.ndims;

      -- Try to apply ndims check to column
      IF (gndims IS NOT NULL) THEN
        BEGIN
          EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
						 ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || '
						 CHECK (ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
          EXCEPTION
          WHEN check_violation THEN
            RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
            gc_is_valid := false;
        END;
      END IF;
    END IF;

    -- Try to find geotype check from system tables (pg_constraint)
    gtype :=
    (SELECT replace(split_part(s.consrc, '''', 2), ')', '')
     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
     WHERE n.nspname = gcs.nspname
           AND c.relname = gcs.relname
           AND a.attname = gcs.attname
           AND a.attrelid = c.oid
           AND s.connamespace = n.oid
           AND s.conrelid = c.oid
           AND a.attnum = ANY (s.conkey)
           AND s.consrc LIKE '%geometrytype(% = %');
    IF (gtype IS NULL) THEN
      -- Try to find geotype from the geometry itself
      EXECUTE 'SELECT geometrytype(' || quote_ident(gcs.attname) || ')
				 FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
      INTO gc;
      gtype := gc.geometrytype;
      --IF (gtype IS NULL) THEN
      --    gtype := 'GEOMETRY';
      --END IF;

      -- Try to apply geometrytype check to column
      IF (gtype IS NOT NULL) THEN
        BEGIN
          EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || '
				CHECK ((geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ') OR (' || quote_ident(gcs.attname) || ' IS NULL))';
          EXCEPTION
          WHEN check_violation THEN
            -- No geometry check can be applied. This column contains a number of geometry types.
            RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
        END;
      END IF;
    END IF;

    IF (gsrid IS NULL) THEN
      RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
    ELSIF (gndims IS NULL) THEN
      RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the number of dimensions', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
    ELSIF (gtype IS NULL) THEN
      RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the geometry type', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
    ELSE
      -- Only insert into geometry_columns if table constraints could be applied.
      IF (gc_is_valid) THEN
        INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type)
        VALUES ('', gcs.nspname, gcs.relname, gcs.attname, gndims, gsrid, gtype);
        inserted := inserted + 1;
      END IF;
    END IF;
  END LOOP;

  -- Add views to geometry columns table
  FOR gcs IN
  SELECT n.nspname, c.relname, a.attname
  FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE c.relkind = 'v'
        AND t.typname = 'geometry'
        AND a.attisdropped = false
        AND a.atttypid = t.oid
        AND a.attrelid = c.oid
        AND c.relnamespace = n.oid
        AND n.nspname NOT ILIKE 'pg_temp%'
        AND c.oid = tbl_oid
  LOOP
    RAISE DEBUG 'Processing view %.%.%', gcs.nspname, gcs.relname, gcs.attname;

    EXECUTE 'SELECT ndims(' || quote_ident(gcs.attname) || ')
				 FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
    INTO gc;
    gndims := gc.ndims;

    EXECUTE 'SELECT srid(' || quote_ident(gcs.attname) || ')
				 FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
    INTO gc;
    gsrid := gc.srid;

    EXECUTE 'SELECT geometrytype(' || quote_ident(gcs.attname) || ')
				 FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
    INTO gc;
    gtype := gc.geometrytype;

    IF (gndims IS NULL) THEN
      RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine ndims', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
    ELSIF (gsrid IS NULL) THEN
      RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
    ELSIF (gtype IS NULL) THEN
      RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine gtype', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
    ELSE
      query := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) ' ||
               'VALUES ('''', ' || quote_literal(gcs.nspname) || ',' || quote_literal(gcs.relname) || ',' || quote_literal(gcs.attname) || ',' || gndims || ',' || gsrid || ',' || quote_literal(gtype) || ')';
      EXECUTE query;
      inserted := inserted + 1;
    END IF;
  END LOOP;

  RETURN inserted;
END

$$;


--
-- TOC entry 398 (class 1255 OID 19602)
-- Name: populate_geometry_columns(oid, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns(tbl_oid oid, use_typmod boolean DEFAULT true) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  gcs         RECORD;
  gc          RECORD;
  gc_old      RECORD;
  gsrid       integer;
  gndims      integer;
  gtype       text;
  query       text;
  gc_is_valid boolean;
  inserted    integer;
  constraint_successful boolean := false;

BEGIN
  inserted := 0;

  -- Iterate through all geometry columns in this table
  FOR gcs IN
  SELECT n.nspname, c.relname, a.attname
  FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE c.relkind = 'r'
        AND t.typname = 'geometry'
        AND a.attisdropped = false
        AND a.atttypid = t.oid
        AND a.attrelid = c.oid
        AND c.relnamespace = n.oid
        AND n.nspname NOT ILIKE 'pg_temp%'
        AND c.oid = tbl_oid
  LOOP

    RAISE DEBUG 'Processing table %.%.%', gcs.nspname, gcs.relname, gcs.attname;

    gc_is_valid := true;
    -- Find the srid, coord_dimension, and type of current geometry
    -- in geometry_columns -- which is now a view

    SELECT type, srid, coord_dimension INTO gc_old
    FROM geometry_columns
    WHERE f_table_schema = gcs.nspname AND f_table_name = gcs.relname AND f_geometry_column = gcs.attname;

    IF upper(gc_old.type) = 'GEOMETRY' THEN
      -- This is an unconstrained geometry we need to do something
      -- We need to figure out what to set the type by inspecting the data
      EXECUTE 'SELECT st_srid(' || quote_ident(gcs.attname) || ') As srid, GeometryType(' || quote_ident(gcs.attname) || ') As type, ST_NDims(' || quote_ident(gcs.attname) || ') As dims ' ||
              ' FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) ||
              ' WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1;'
      INTO gc;
      IF gc IS NULL THEN -- there is no data so we can not determine geometry type
        RAISE WARNING 'No data in table %.%, so no information to determine geometry type and srid', gcs.nspname, gcs.relname;
        RETURN 0;
      END IF;
      gsrid := gc.srid; gtype := gc.type; gndims := gc.dims;

      IF use_typmod THEN
        BEGIN
          EXECUTE 'ALTER TABLE ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' ALTER COLUMN ' || quote_ident(gcs.attname) ||
                  ' TYPE geometry(' || postgis_type_name(gtype, gndims, true) || ', ' || gsrid::text  || ') ';
          inserted := inserted + 1;
          EXCEPTION
          WHEN invalid_parameter_value THEN
            RAISE WARNING 'Could not convert ''%'' in ''%.%'' to use typmod with srid %, type: % ', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), gsrid, postgis_type_name(gtype, gndims, true);
            gc_is_valid := false;
        END;

      ELSE
        -- Try to apply srid check to column
        constraint_successful = false;
        IF (gsrid > 0 AND postgis_constraint_srid(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
          BEGIN
            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) ||
                    ' ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) ||
                    ' CHECK (st_srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
            constraint_successful := true;
            EXCEPTION
            WHEN check_violation THEN
              RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (st_srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
              gc_is_valid := false;
          END;
        END IF;

        -- Try to apply ndims check to column
        IF (gndims IS NOT NULL AND postgis_constraint_dims(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
          BEGIN
            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
                                 ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || '
                                 CHECK (st_ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
            constraint_successful := true;
            EXCEPTION
            WHEN check_violation THEN
              RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (st_ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
              gc_is_valid := false;
          END;
        END IF;

        -- Try to apply geometrytype check to column
        IF (gtype IS NOT NULL AND postgis_constraint_type(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
          BEGIN
            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
                        ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || '
                        CHECK ((geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ') OR (' || quote_ident(gcs.attname) || ' IS NULL))';
            constraint_successful := true;
            EXCEPTION
            WHEN check_violation THEN
              -- No geometry check can be applied. This column contains a number of geometry types.
              RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
          END;
        END IF;
        --only count if we were successful in applying at least one constraint
        IF constraint_successful THEN
          inserted := inserted + 1;
        END IF;
      END IF;
    END IF;

  END LOOP;

  RETURN inserted;
END

$$;


--
-- TOC entry 325 (class 1255 OID 19516)
-- Name: postgis_addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_addbbox(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_addBBOX';


--
-- TOC entry 374 (class 1255 OID 19566)
-- Name: postgis_cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_cache_bbox() RETURNS trigger
LANGUAGE c
AS '$libdir/postgis-2.0', 'cache_bbox';


--
-- TOC entry 746 (class 1255 OID 20000)
-- Name: postgis_constraint_dims(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text) RETURNS integer
LANGUAGE sql STABLE STRICT
AS $_$
SELECT  replace(split_part(s.consrc, ' = ', 2), ')', '')::integer
FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
WHERE n.nspname = $1
      AND c.relname = $2
      AND a.attname = $3
      AND a.attrelid = c.oid
      AND s.connamespace = n.oid
      AND s.conrelid = c.oid
      AND a.attnum = ANY (s.conkey)
      AND s.consrc LIKE '%ndims(% = %';
$_$;


--
-- TOC entry 745 (class 1255 OID 19999)
-- Name: postgis_constraint_srid(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text) RETURNS integer
LANGUAGE sql STABLE STRICT
AS $_$
SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')::integer
FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
WHERE n.nspname = $1
      AND c.relname = $2
      AND a.attname = $3
      AND a.attrelid = c.oid
      AND s.connamespace = n.oid
      AND s.conrelid = c.oid
      AND a.attnum = ANY (s.conkey)
      AND s.consrc LIKE '%srid(% = %';
$_$;


--
-- TOC entry 747 (class 1255 OID 20001)
-- Name: postgis_constraint_type(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_constraint_type(geomschema text, geomtable text, geomcolumn text) RETURNS character varying
LANGUAGE sql STABLE STRICT
AS $_$
SELECT  replace(split_part(s.consrc, '''', 2), ')', '')::varchar
FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
WHERE n.nspname = $1
      AND c.relname = $2
      AND a.attname = $3
      AND a.attrelid = c.oid
      AND s.connamespace = n.oid
      AND s.conrelid = c.oid
      AND a.attnum = ANY (s.conkey)
      AND s.consrc LIKE '%geometrytype(% = %';
$_$;


--
-- TOC entry 326 (class 1255 OID 19517)
-- Name: postgis_dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_dropbbox(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_dropBBOX';


--
-- TOC entry 427 (class 1255 OID 19631)
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_full_version() RETURNS text
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
  libver text;
  svnver text;
  projver text;
  geosver text;
  gdalver text;
  libxmlver text;
  dbproc text;
  relproc text;
  fullver text;
  rast_lib_ver text;
  rast_scr_ver text;
  topo_scr_ver text;
  json_lib_ver text;
BEGIN
  SELECT postgis_lib_version() INTO libver;
  SELECT postgis_proj_version() INTO projver;
  SELECT postgis_geos_version() INTO geosver;
  SELECT postgis_libjson_version() INTO json_lib_ver;
  BEGIN
    SELECT postgis_gdal_version() INTO gdalver;
    EXCEPTION
    WHEN undefined_function THEN
      gdalver := NULL;
      RAISE NOTICE 'Function postgis_gdal_version() not found.  Is raster support enabled and rtpostgis.sql installed?';
  END;
  SELECT postgis_libxml_version() INTO libxmlver;
  SELECT postgis_scripts_installed() INTO dbproc;
  SELECT postgis_scripts_released() INTO relproc;
  select postgis_svn_version() INTO svnver;
  BEGIN
    SELECT postgis_topology_scripts_installed() INTO topo_scr_ver;
    EXCEPTION
    WHEN undefined_function THEN
      topo_scr_ver := NULL;
      RAISE NOTICE 'Function postgis_topology_scripts_installed() not found. Is topology support enabled and topology.sql installed?';
  END;

  BEGIN
    SELECT postgis_raster_scripts_installed() INTO rast_scr_ver;
    EXCEPTION
    WHEN undefined_function THEN
      rast_scr_ver := NULL;
      RAISE NOTICE 'Function postgis_raster_scripts_installed() not found. Is raster support enabled and rtpostgis.sql installed?';
  END;

  BEGIN
    SELECT postgis_raster_lib_version() INTO rast_lib_ver;
    EXCEPTION
    WHEN undefined_function THEN
      rast_lib_ver := NULL;
      RAISE NOTICE 'Function postgis_raster_lib_version() not found. Is raster support enabled and rtpostgis.sql installed?';
  END;

  fullver = 'POSTGIS="' || libver;

  IF  svnver IS NOT NULL THEN
    fullver = fullver || ' r' || svnver;
  END IF;

  fullver = fullver || '"';

  IF  geosver IS NOT NULL THEN
    fullver = fullver || ' GEOS="' || geosver || '"';
  END IF;

  IF  projver IS NOT NULL THEN
    fullver = fullver || ' PROJ="' || projver || '"';
  END IF;

  IF  gdalver IS NOT NULL THEN
    fullver = fullver || ' GDAL="' || gdalver || '"';
  END IF;

  IF  libxmlver IS NOT NULL THEN
    fullver = fullver || ' LIBXML="' || libxmlver || '"';
  END IF;

  IF json_lib_ver IS NOT NULL THEN
    fullver = fullver || ' LIBJSON="' || json_lib_ver || '"';
  END IF;

  -- fullver = fullver || ' DBPROC="' || dbproc || '"';
  -- fullver = fullver || ' RELPROC="' || relproc || '"';

  IF dbproc != relproc THEN
    fullver = fullver || ' (core procs from "' || dbproc || '" need upgrade)';
  END IF;

  IF topo_scr_ver IS NOT NULL THEN
    fullver = fullver || ' TOPOLOGY';
    IF topo_scr_ver != relproc THEN
      fullver = fullver || ' (topology procs from "' || topo_scr_ver || '" need upgrade)';
    END IF;
  END IF;

  IF rast_lib_ver IS NOT NULL THEN
    fullver = fullver || ' RASTER';
    IF rast_lib_ver != relproc THEN
      fullver = fullver || ' (raster lib from "' || rast_lib_ver || '" need upgrade)';
    END IF;
  END IF;

  IF rast_scr_ver IS NOT NULL AND rast_scr_ver != relproc THEN
    fullver = fullver || ' (raster procs from "' || rast_scr_ver || '" need upgrade)';
  END IF;

  RETURN fullver;
END
$$;


--
-- TOC entry 422 (class 1255 OID 19626)
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_geos_version() RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'postgis_geos_version';


--
-- TOC entry 317 (class 1255 OID 19509)
-- Name: postgis_getbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_getbbox(geometry) RETURNS box2d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_to_BOX2D';


--
-- TOC entry 327 (class 1255 OID 19518)
-- Name: postgis_hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_hasbbox(geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_hasBBOX';


--
-- TOC entry 426 (class 1255 OID 19630)
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_build_date() RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'postgis_lib_build_date';


--
-- TOC entry 420 (class 1255 OID 19624)
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_version() RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'postgis_lib_version';


--
-- TOC entry 534 (class 1255 OID 19766)
-- Name: postgis_libjson_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_libjson_version() RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'postgis_libjson_version';


--
-- TOC entry 424 (class 1255 OID 19628)
-- Name: postgis_libxml_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_libxml_version() RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'postgis_libxml_version';


--
-- TOC entry 318 (class 1255 OID 19552)
-- Name: postgis_noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_noop(geometry) RETURNS geometry
LANGUAGE c STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_noop';


--
-- TOC entry 418 (class 1255 OID 19622)
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_proj_version() RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'postgis_proj_version';


--
-- TOC entry 425 (class 1255 OID 19629)
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_build_date() RETURNS text
LANGUAGE sql IMMUTABLE
AS $$SELECT '2013-04-11 11:28:29'::text AS version$$;


--
-- TOC entry 419 (class 1255 OID 19623)
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
LANGUAGE sql IMMUTABLE
AS $$ SELECT '2.0.3'::text || ' r' || 11128::text AS version $$;


--
-- TOC entry 421 (class 1255 OID 19625)
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'postgis_scripts_released';


--
-- TOC entry 423 (class 1255 OID 19627)
-- Name: postgis_svn_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_svn_version() RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'postgis_svn_version';


--
-- TOC entry 835 (class 1255 OID 20265)
-- Name: postgis_topology_scripts_installed(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_topology_scripts_installed() RETURNS text
LANGUAGE sql IMMUTABLE
AS $$ SELECT '2.0.3'::text || ' r' || 11128::text AS version $$;


--
-- TOC entry 415 (class 1255 OID 19619)
-- Name: postgis_transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_transform_geometry(geometry, text, text, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'transform_geom';


--
-- TOC entry 744 (class 1255 OID 19998)
-- Name: postgis_type_name(character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean DEFAULT true) RETURNS character varying
LANGUAGE sql IMMUTABLE STRICT COST 200
AS $_$
SELECT CASE WHEN $3 THEN new_name ELSE old_name END As geomname
FROM
  ( VALUES
    ('GEOMETRY', 'Geometry', 2) ,
    ('GEOMETRY', 'GeometryZ', 3) ,
    ('GEOMETRY', 'GeometryZM', 4) ,
    ('GEOMETRYCOLLECTION', 'GeometryCollection', 2) ,
    ('GEOMETRYCOLLECTION', 'GeometryCollectionZ', 3) ,
    ('GEOMETRYCOLLECTIONM', 'GeometryCollectionM', 3) ,
    ('GEOMETRYCOLLECTION', 'GeometryCollectionZM', 4) ,

    ('POINT', 'Point',2) ,
    ('POINTM','PointM',3) ,
    ('POINT', 'PointZ',3) ,
    ('POINT', 'PointZM',4) ,

    ('MULTIPOINT','MultiPoint',2) ,
    ('MULTIPOINT','MultiPointZ',3) ,
    ('MULTIPOINTM','MultiPointM',3) ,
    ('MULTIPOINT','MultiPointZM',4) ,

    ('POLYGON', 'Polygon',2) ,
    ('POLYGON', 'PolygonZ',3) ,
    ('POLYGONM', 'PolygonM',3) ,
    ('POLYGON', 'PolygonZM',4) ,

    ('MULTIPOLYGON', 'MultiPolygon',2) ,
    ('MULTIPOLYGON', 'MultiPolygonZ',3) ,
    ('MULTIPOLYGONM', 'MultiPolygonM',3) ,
    ('MULTIPOLYGON', 'MultiPolygonZM',4) ,

    ('MULTILINESTRING', 'MultiLineString',2) ,
    ('MULTILINESTRING', 'MultiLineStringZ',3) ,
    ('MULTILINESTRINGM', 'MultiLineStringM',3) ,
    ('MULTILINESTRING', 'MultiLineStringZM',4) ,

    ('LINESTRING', 'LineString',2) ,
    ('LINESTRING', 'LineStringZ',3) ,
    ('LINESTRINGM', 'LineStringM',3) ,
    ('LINESTRING', 'LineStringZM',4) ,

    ('CIRCULARSTRING', 'CircularString',2) ,
    ('CIRCULARSTRING', 'CircularStringZ',3) ,
    ('CIRCULARSTRINGM', 'CircularStringM',3) ,
    ('CIRCULARSTRING', 'CircularStringZM',4) ,

    ('COMPOUNDCURVE', 'CompoundCurve',2) ,
    ('COMPOUNDCURVE', 'CompoundCurveZ',3) ,
    ('COMPOUNDCURVEM', 'CompoundCurveM',3) ,
    ('COMPOUNDCURVE', 'CompoundCurveZM',4) ,

    ('CURVEPOLYGON', 'CurvePolygon',2) ,
    ('CURVEPOLYGON', 'CurvePolygonZ',3) ,
    ('CURVEPOLYGONM', 'CurvePolygonM',3) ,
    ('CURVEPOLYGON', 'CurvePolygonZM',4) ,

    ('MULTICURVE', 'MultiCurve',2 ) ,
    ('MULTICURVE', 'MultiCurveZ',3 ) ,
    ('MULTICURVEM', 'MultiCurveM',3 ) ,
    ('MULTICURVE', 'MultiCurveZM',4 ) ,

    ('MULTISURFACE', 'MultiSurface', 2) ,
    ('MULTISURFACE', 'MultiSurfaceZ', 3) ,
    ('MULTISURFACEM', 'MultiSurfaceM', 3) ,
    ('MULTISURFACE', 'MultiSurfaceZM', 4) ,

    ('POLYHEDRALSURFACE', 'PolyhedralSurface',2) ,
    ('POLYHEDRALSURFACE', 'PolyhedralSurfaceZ',3) ,
    ('POLYHEDRALSURFACEM', 'PolyhedralSurfaceM',3) ,
    ('POLYHEDRALSURFACE', 'PolyhedralSurfaceZM',4) ,

    ('TRIANGLE', 'Triangle',2) ,
    ('TRIANGLE', 'TriangleZ',3) ,
    ('TRIANGLEM', 'TriangleM',3) ,
    ('TRIANGLE', 'TriangleZM',4) ,

    ('TIN', 'Tin', 2),
    ('TIN', 'TinZ', 3),
    ('TIN', 'TinM', 3),
    ('TIN', 'TinZM', 4) )
    As g(old_name, new_name, coord_dimension)
WHERE (upper(old_name) = upper($1) OR upper(new_name) = upper($1))
      AND coord_dimension = $2;
$_$;


--
-- TOC entry 661 (class 1255 OID 19895)
-- Name: postgis_typmod_dims(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_typmod_dims(integer) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'postgis_typmod_dims';


--
-- TOC entry 662 (class 1255 OID 19896)
-- Name: postgis_typmod_srid(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_typmod_srid(integer) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'postgis_typmod_srid';


--
-- TOC entry 663 (class 1255 OID 19897)
-- Name: postgis_typmod_type(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_typmod_type(integer) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'postgis_typmod_type';


--
-- TOC entry 417 (class 1255 OID 19621)
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_version() RETURNS text
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'postgis_version';


--
-- TOC entry 933 (class 1255 OID 21206)
-- Name: probe_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION probe_geometry_columns() RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  inserted integer;
  oldcount integer;
  probed integer;
  stale integer;
BEGIN

  SELECT count(*) INTO oldcount FROM geometry_columns;

  SELECT count(*) INTO probed
  FROM pg_class c, pg_attribute a, pg_type t,
    pg_namespace n,
    pg_constraint sridcheck, pg_constraint typecheck

  WHERE t.typname = 'geometry'
        AND a.atttypid = t.oid
        AND a.attrelid = c.oid
        AND c.relnamespace = n.oid
        AND sridcheck.connamespace = n.oid
        AND typecheck.connamespace = n.oid
        AND sridcheck.conrelid = c.oid
        AND sridcheck.consrc LIKE '(srid('||a.attname||') = %)'
        AND typecheck.conrelid = c.oid
        AND typecheck.consrc LIKE
            '((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'
  ;

  INSERT INTO geometry_columns SELECT
                                 ''::varchar as f_table_catalogue,
                                 n.nspname::varchar as f_table_schema,
                                 c.relname::varchar as f_table_name,
                                 a.attname::varchar as f_geometry_column,
                                 2 as coord_dimension,
                                 trim(both  ' =)' from
                                      replace(replace(split_part(
                                                          sridcheck.consrc, ' = ', 2), ')', ''), '(', ''))::integer AS srid,
                                 trim(both ' =)''' from substr(typecheck.consrc,
                                                               strpos(typecheck.consrc, '='),
                                                               strpos(typecheck.consrc, '::')-
                                                               strpos(typecheck.consrc, '=')
                                 ))::varchar as type
                               FROM pg_class c, pg_attribute a, pg_type t,
                                 pg_namespace n,
                                 pg_constraint sridcheck, pg_constraint typecheck
                               WHERE t.typname = 'geometry'
                                     AND a.atttypid = t.oid
                                     AND a.attrelid = c.oid
                                     AND c.relnamespace = n.oid
                                     AND sridcheck.connamespace = n.oid
                                     AND typecheck.connamespace = n.oid
                                     AND sridcheck.conrelid = c.oid
                                     AND sridcheck.consrc LIKE '(st_srid('||a.attname||') = %)'
                                     AND typecheck.conrelid = c.oid
                                     AND typecheck.consrc LIKE
                                         '((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'

                                     AND NOT EXISTS (
                                   SELECT oid FROM geometry_columns gc
                                   WHERE c.relname::varchar = gc.f_table_name
                                         AND n.nspname::varchar = gc.f_table_schema
                                         AND a.attname::varchar = gc.f_geometry_column
                               );

  GET DIAGNOSTICS inserted = ROW_COUNT;

  IF oldcount > probed THEN
    stale = oldcount-probed;
  ELSE
    stale = 0;
  END IF;

  RETURN 'probed:'||probed::text||
         ' inserted:'||inserted::text||
         ' conflicts:'||(probed-inserted)::text||
         ' stale:'||stale::text;
END

$$;


--
-- TOC entry 934 (class 1255 OID 21210)
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rename_geometry_table_constraints() RETURNS text
LANGUAGE sql IMMUTABLE
AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$;


--
-- TOC entry 935 (class 1255 OID 21212)
-- Name: rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotate(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT rotateZ($1, $2)$_$;


--
-- TOC entry 936 (class 1255 OID 21213)
-- Name: rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatex(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


--
-- TOC entry 937 (class 1255 OID 21214)
-- Name: rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatey(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


--
-- TOC entry 938 (class 1255 OID 21215)
-- Name: rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatez(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


--
-- TOC entry 940 (class 1255 OID 21217)
-- Name: scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT scale($1, $2, $3, 1)$_$;


--
-- TOC entry 939 (class 1255 OID 21216)
-- Name: scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


--
-- TOC entry 941 (class 1255 OID 21218)
-- Name: se_envelopesintersect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_envelopesintersect(geometry, geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT $1 && $2
$_$;


--
-- TOC entry 942 (class 1255 OID 21221)
-- Name: se_locatealong(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatealong(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- TOC entry 944 (class 1255 OID 21234)
-- Name: snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT SnapToGrid($1, 0, 0, $2, $2)$_$;


--
-- TOC entry 943 (class 1255 OID 21233)
-- Name: snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT SnapToGrid($1, 0, 0, $2, $3)$_$;


--
-- TOC entry 752 (class 1255 OID 20012)
-- Name: st_3dclosestpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3dclosestpoint(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_closestpoint3d';


--
-- TOC entry 758 (class 1255 OID 20018)
-- Name: st_3ddfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_3DDFullyWithin($1, $2, $3)$_$;


--
-- TOC entry 748 (class 1255 OID 20010)
-- Name: st_3ddistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3ddistance(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_mindistance3d';


--
-- TOC entry 756 (class 1255 OID 20016)
-- Name: st_3ddwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3ddwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_3DDWithin($1, $2, $3)$_$;


--
-- TOC entry 759 (class 1255 OID 20019)
-- Name: st_3dintersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3dintersects(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_3DDWithin($1, $2, 0.0)$_$;


--
-- TOC entry 332 (class 1255 OID 19523)
-- Name: st_3dlength(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3dlength(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_length_linestring';


--
-- TOC entry 335 (class 1255 OID 19526)
-- Name: st_3dlength_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3dlength_spheroid(geometry, spheroid) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_length_ellipsoid_linestring';


--
-- TOC entry 754 (class 1255 OID 20014)
-- Name: st_3dlongestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3dlongestline(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_longestline3d';


--
-- TOC entry 379 (class 1255 OID 19571)
-- Name: st_3dmakebox(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3dmakebox(geom1 geometry, geom2 geometry) RETURNS box3d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_construct';


--
-- TOC entry 749 (class 1255 OID 20011)
-- Name: st_3dmaxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3dmaxdistance(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_maxdistance3d';


--
-- TOC entry 338 (class 1255 OID 19529)
-- Name: st_3dperimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3dperimeter(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_perimeter_poly';


--
-- TOC entry 753 (class 1255 OID 20013)
-- Name: st_3dshortestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_3dshortestline(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_shortestline3d';


--
-- TOC entry 450 (class 1255 OID 19668)
-- Name: st_addmeasure(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addmeasure(geometry, double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_AddMeasure';


--
-- TOC entry 383 (class 1255 OID 19575)
-- Name: st_addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_addpoint';


--
-- TOC entry 384 (class 1255 OID 19576)
-- Name: st_addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geom1 geometry, geom2 geometry, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_addpoint';


--
-- TOC entry 297 (class 1255 OID 19489)
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


--
-- TOC entry 296 (class 1255 OID 19488)
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_affine';


--
-- TOC entry 716 (class 1255 OID 19971)
-- Name: st_area(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(text) RETURNS double precision
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_Area($1::geometry);  $_$;


--
-- TOC entry 828 (class 1255 OID 21238)
-- Name: st_area(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geography) RETURNS double precision
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Area($1, true)$_$;


--
-- TOC entry 342 (class 1255 OID 19533)
-- Name: st_area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_area_polygon';


--
-- TOC entry 715 (class 1255 OID 19970)
-- Name: st_area(geography, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geog geography, use_spheroid boolean DEFAULT true) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'geography_area';


--
-- TOC entry 341 (class 1255 OID 19532)
-- Name: st_area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area2d(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_area_polygon';


--
-- TOC entry 829 (class 1255 OID 21239)
-- Name: st_asbinary(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(text) RETURNS bytea
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_AsBinary($1::geometry);  $_$;


--
-- TOC entry 737 (class 1255 OID 19991)
-- Name: st_asbinary(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geography) RETURNS bytea
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asBinary';


--
-- TOC entry 566 (class 1255 OID 19798)
-- Name: st_asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry) RETURNS bytea
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asBinary';


--
-- TOC entry 738 (class 1255 OID 19992)
-- Name: st_asbinary(geography, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geography, text) RETURNS bytea
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_AsBinary($1::geometry, $2);  $_$;


--
-- TOC entry 565 (class 1255 OID 19797)
-- Name: st_asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry, text) RETURNS bytea
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asBinary';


--
-- TOC entry 364 (class 1255 OID 19556)
-- Name: st_asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry) RETURNS bytea
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'WKBFromLWGEOM';


--
-- TOC entry 367 (class 1255 OID 19559)
-- Name: st_asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry, text) RETURNS bytea
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'WKBFromLWGEOM';


--
-- TOC entry 687 (class 1255 OID 19994)
-- Name: st_asewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkt(text) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_AsEWKT($1::geometry);  $_$;


--
-- TOC entry 739 (class 1255 OID 19993)
-- Name: st_asewkt(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkt(geography) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asEWKT';


--
-- TOC entry 363 (class 1255 OID 19555)
-- Name: st_asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkt(geometry) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asEWKT';


--
-- TOC entry 701 (class 1255 OID 19958)
-- Name: st_asgeojson(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(text) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_AsGeoJson(1, $1::geometry,15,0);  $_$;


--
-- TOC entry 948 (class 1255 OID 21245)
-- Name: st_asgeojson(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geography) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$;


--
-- TOC entry 831 (class 1255 OID 21241)
-- Name: st_asgeojson(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$;


--
-- TOC entry 949 (class 1255 OID 21246)
-- Name: st_asgeojson(integer, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geography) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$;


--
-- TOC entry 945 (class 1255 OID 21242)
-- Name: st_asgeojson(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$;


--
-- TOC entry 947 (class 1255 OID 21244)
-- Name: st_asgeojson(geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geography, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$;


--
-- TOC entry 830 (class 1255 OID 21240)
-- Name: st_asgeojson(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$;


--
-- TOC entry 950 (class 1255 OID 21247)
-- Name: st_asgeojson(integer, geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geography, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$;


--
-- TOC entry 946 (class 1255 OID 21243)
-- Name: st_asgeojson(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$;


--
-- TOC entry 703 (class 1255 OID 19959)
-- Name: st_asgeojson(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_AsGeoJson(1, $1, $2, $3); $_$;


--
-- TOC entry 544 (class 1255 OID 19775)
-- Name: st_asgeojson(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_AsGeoJson(1, $1, $2, $3); $_$;


--
-- TOC entry 704 (class 1255 OID 19960)
-- Name: st_asgeojson(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(gj_version integer, geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_AsGeoJson($1, $2, $3, $4); $_$;


--
-- TOC entry 545 (class 1255 OID 19776)
-- Name: st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(gj_version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_AsGeoJson($1, $2, $3, $4); $_$;


--
-- TOC entry 692 (class 1255 OID 19950)
-- Name: st_asgml(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(text) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_AsGML(2,$1::geometry,15,0, NULL);  $_$;


--
-- TOC entry 832 (class 1255 OID 21254)
-- Name: st_asgml(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geography) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- TOC entry 952 (class 1255 OID 21249)
-- Name: st_asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- TOC entry 833 (class 1255 OID 21255)
-- Name: st_asgml(integer, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geography) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$;


--
-- TOC entry 953 (class 1255 OID 21250)
-- Name: st_asgml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$;


--
-- TOC entry 956 (class 1255 OID 21253)
-- Name: st_asgml(geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geography, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- TOC entry 951 (class 1255 OID 21248)
-- Name: st_asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- TOC entry 834 (class 1255 OID 21256)
-- Name: st_asgml(integer, geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geography, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$;


--
-- TOC entry 954 (class 1255 OID 21251)
-- Name: st_asgml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$;


--
-- TOC entry 693 (class 1255 OID 19951)
-- Name: st_asgml(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML(2, $1, $2, $3, null)$_$;


--
-- TOC entry 538 (class 1255 OID 19769)
-- Name: st_asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_AsGML(2, $1, $2, $3, null); $_$;


--
-- TOC entry 836 (class 1255 OID 21257)
-- Name: st_asgml(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geography, integer, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$;


--
-- TOC entry 955 (class 1255 OID 21252)
-- Name: st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$;


--
-- TOC entry 694 (class 1255 OID 19952)
-- Name: st_asgml(integer, geography, integer, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(version integer, geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0, nprefix text DEFAULT NULL::text) RETURNS text
LANGUAGE sql IMMUTABLE
AS $_$ SELECT _ST_AsGML($1, $2, $3, $4, $5);$_$;


--
-- TOC entry 539 (class 1255 OID 19770)
-- Name: st_asgml(integer, geometry, integer, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0, nprefix text DEFAULT NULL::text) RETURNS text
LANGUAGE sql IMMUTABLE
AS $_$ SELECT _ST_AsGML($1, $2, $3, $4,$5); $_$;


--
-- TOC entry 365 (class 1255 OID 19557)
-- Name: st_ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asHEXEWKB';


--
-- TOC entry 366 (class 1255 OID 19558)
-- Name: st_ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry, text) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asHEXEWKB';


--
-- TOC entry 697 (class 1255 OID 19955)
-- Name: st_askml(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(text) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_AsKML(2, $1::geometry, 15, null);  $_$;


--
-- TOC entry 843 (class 1255 OID 21261)
-- Name: st_askml(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geography) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML(2, $1, 15)$_$;


--
-- TOC entry 837 (class 1255 OID 21258)
-- Name: st_askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), 15)$_$;


--
-- TOC entry 844 (class 1255 OID 21262)
-- Name: st_askml(integer, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geography) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML($1, $2, 15)$_$;


--
-- TOC entry 841 (class 1255 OID 21259)
-- Name: st_askml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), 15)$_$;


--
-- TOC entry 696 (class 1255 OID 19954)
-- Name: st_askml(geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geog geography, maxdecimaldigits integer DEFAULT 15) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML(2, $1, $2, null)$_$;


--
-- TOC entry 541 (class 1255 OID 19772)
-- Name: st_askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geom geometry, maxdecimaldigits integer DEFAULT 15) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_AsKML(2, ST_Transform($1,4326), $2, null); $_$;


--
-- TOC entry 845 (class 1255 OID 21263)
-- Name: st_askml(integer, geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geography, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML($1, $2, $3)$_$;


--
-- TOC entry 842 (class 1255 OID 21260)
-- Name: st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), $3)$_$;


--
-- TOC entry 699 (class 1255 OID 19956)
-- Name: st_askml(integer, geography, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(version integer, geog geography, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT NULL::text) RETURNS text
LANGUAGE sql IMMUTABLE
AS $_$SELECT _ST_AsKML($1, $2, $3, $4)$_$;


--
-- TOC entry 542 (class 1255 OID 19773)
-- Name: st_askml(integer, geometry, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT NULL::text) RETURNS text
LANGUAGE sql IMMUTABLE
AS $_$ SELECT _ST_AsKML($1, ST_Transform($2,4326), $3, $4); $_$;


--
-- TOC entry 369 (class 1255 OID 19561)
-- Name: st_aslatlontext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_aslatlontext(geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_AsLatLonText($1, '') $_$;


--
-- TOC entry 368 (class 1255 OID 19560)
-- Name: st_aslatlontext(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_aslatlontext(geometry, text) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_to_latlon';


--
-- TOC entry 690 (class 1255 OID 19948)
-- Name: st_assvg(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(text) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_AsSVG($1::geometry,0,15);  $_$;


--
-- TOC entry 688 (class 1255 OID 19947)
-- Name: st_assvg(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geog geography, rel integer DEFAULT 0, maxdecimaldigits integer DEFAULT 15) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_as_svg';


--
-- TOC entry 536 (class 1255 OID 19767)
-- Name: st_assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geom geometry, rel integer DEFAULT 0, maxdecimaldigits integer DEFAULT 15) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asSVG';


--
-- TOC entry 657 (class 1255 OID 19891)
-- Name: st_astext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(text) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_AsText($1::geometry);  $_$;


--
-- TOC entry 656 (class 1255 OID 19890)
-- Name: st_astext(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(geography) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asText';


--
-- TOC entry 567 (class 1255 OID 19799)
-- Name: st_astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(geometry) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_asText';


--
-- TOC entry 783 (class 1255 OID 20084)
-- Name: st_asx3d(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asx3d(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
LANGUAGE sql IMMUTABLE
AS $_$SELECT _ST_AsX3D(3,$1,$2,$3,'');$_$;


--
-- TOC entry 720 (class 1255 OID 19975)
-- Name: st_azimuth(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_azimuth(geog1 geography, geog2 geography) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'geography_azimuth';


--
-- TOC entry 346 (class 1255 OID 19537)
-- Name: st_azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_azimuth(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_azimuth';


--
-- TOC entry 629 (class 1255 OID 19861)
-- Name: st_bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdmpolyfromtext(text, integer) RETURNS geometry
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
DECLARE
  geomtext alias for $1;
  srid alias for $2;
  mline geometry;
  geom geometry;
BEGIN
  mline := ST_MultiLineStringFromText(geomtext, srid);

  IF mline IS NULL
  THEN
    RAISE EXCEPTION 'Input is not a MultiLinestring';
  END IF;

  geom := ST_Multi(ST_BuildArea(mline));

  RETURN geom;
END;
$_$;


--
-- TOC entry 628 (class 1255 OID 19860)
-- Name: st_bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdpolyfromtext(text, integer) RETURNS geometry
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
DECLARE
  geomtext alias for $1;
  srid alias for $2;
  mline geometry;
  geom geometry;
BEGIN
  mline := ST_MultiLineStringFromText(geomtext, srid);

  IF mline IS NULL
  THEN
    RAISE EXCEPTION 'Input is not a MultiLinestring';
  END IF;

  geom := ST_BuildArea(mline);

  IF GeometryType(geom) != 'POLYGON'
  THEN
    RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
  END IF;

  RETURN geom;
END;
$_$;


--
-- TOC entry 469 (class 1255 OID 19690)
-- Name: st_boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_boundary(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'boundary';


--
-- TOC entry 734 (class 1255 OID 19988)
-- Name: st_buffer(text, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(text, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_Buffer($1::geometry, $2);  $_$;


--
-- TOC entry 733 (class 1255 OID 19987)
-- Name: st_buffer(geography, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geography, double precision) RETURNS geography
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT geography(ST_Transform(ST_Buffer(ST_Transform(geometry($1), _ST_BestSRID($1)), $2), 4326))$_$;


--
-- TOC entry 452 (class 1255 OID 19670)
-- Name: st_buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'buffer';


--
-- TOC entry 454 (class 1255 OID 19672)
-- Name: st_buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_Buffer($1, $2,
                         CAST('quad_segs='||CAST($3 AS text) as cstring))
$_$;


--
-- TOC entry 455 (class 1255 OID 19673)
-- Name: st_buffer(geometry, double precision, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision, text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT _ST_Buffer($1, $2,
                         CAST( regexp_replace($3, '^[0123456789]+$',
                                              'quad_segs='||$3) AS cstring)
)
$_$;


--
-- TOC entry 390 (class 1255 OID 19582)
-- Name: st_buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buildarea(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_BuildArea';


--
-- TOC entry 519 (class 1255 OID 19751)
-- Name: st_centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_centroid(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'centroid';


--
-- TOC entry 476 (class 1255 OID 19697)
-- Name: st_cleangeometry(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_cleangeometry(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_CleanGeometry';


--
-- TOC entry 621 (class 1255 OID 19853)
-- Name: st_closestpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_closestpoint(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_closestpoint';


--
-- TOC entry 484 (class 1255 OID 19708)
-- Name: st_collect(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry[]) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_collect_garray';


--
-- TOC entry 483 (class 1255 OID 19706)
-- Name: st_collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'LWGEOM_collect';


--
-- TOC entry 353 (class 1255 OID 19544)
-- Name: st_collectionextract(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collectionextract(geometry, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_CollectionExtract';


--
-- TOC entry 354 (class 1255 OID 19545)
-- Name: st_collectionhomogenize(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collectionhomogenize(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_CollectionHomogenize';


--
-- TOC entry 320 (class 1255 OID 19511)
-- Name: st_combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box2d, geometry) RETURNS box2d
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'BOX2D_combine';


--
-- TOC entry 482 (class 1255 OID 19703)
-- Name: st_combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d, geometry) RETURNS box3d
LANGUAGE c IMMUTABLE
AS '$libdir/postgis-2.0', 'BOX3D_combine';


--
-- TOC entry 781 (class 1255 OID 20037)
-- Name: st_concavehull(geometry, double precision, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_concavehull(param_geom geometry, param_pctconvex double precision, param_allow_holes boolean DEFAULT false) RETURNS geometry
LANGUAGE plpgsql IMMUTABLE STRICT
AS $$
DECLARE
  var_convhull geometry := ST_ConvexHull(param_geom);
  var_param_geom geometry := param_geom;
  var_initarea float := ST_Area(var_convhull);
  var_newarea float := var_initarea;
  var_div integer := 6;
  var_tempgeom geometry;
  var_tempgeom2 geometry;
  var_cent geometry;
  var_geoms geometry[4];
  var_enline geometry;
  var_resultgeom geometry;
  var_atempgeoms geometry[];
  var_buf float := 1;
BEGIN
  -- We start with convex hull as our base
  var_resultgeom := var_convhull;

  IF param_pctconvex = 1 THEN
    return var_resultgeom;
  ELSIF ST_GeometryType(var_param_geom) = 'ST_Polygon' THEN -- it is as concave as it is going to get
    IF param_allow_holes THEN -- leave the holes
      RETURN var_param_geom;
    ELSE -- remove the holes
      var_resultgeom := ST_MakePolygon(ST_ExteriorRing(var_param_geom));
      RETURN var_resultgeom;
    END IF;
  END IF;
  IF ST_Dimension(var_resultgeom) > 1 AND param_pctconvex BETWEEN 0 and 0.98 THEN
    -- get linestring that forms envelope of geometry
    var_enline := ST_Boundary(ST_Envelope(var_param_geom));
    var_buf := ST_Length(var_enline)/1000.0;
    IF ST_GeometryType(var_param_geom) = 'ST_MultiPoint' AND ST_NumGeometries(var_param_geom) BETWEEN 4 and 200 THEN
      -- we make polygons out of points since they are easier to cave in.
      -- Note we limit to between 4 and 200 points because this process is slow and gets quadratically slow
      var_buf := sqrt(ST_Area(var_convhull)*0.8/(ST_NumGeometries(var_param_geom)*ST_NumGeometries(var_param_geom)));
      var_atempgeoms := ARRAY(SELECT geom FROM ST_DumpPoints(var_param_geom));
      -- 5 and 10 and just fudge factors
      var_tempgeom := ST_Union(ARRAY(SELECT geom
                                     FROM (
                                            -- fuse near neighbors together
                                            SELECT DISTINCT ON (i) i,  ST_Distance(var_atempgeoms[i],var_atempgeoms[j]), ST_Buffer(ST_MakeLine(var_atempgeoms[i], var_atempgeoms[j]) , var_buf*5, 'quad_segs=3') As geom
                                            FROM generate_series(1,array_upper(var_atempgeoms, 1)) As i
                                              INNER JOIN generate_series(1,array_upper(var_atempgeoms, 1)) As j
                                                ON (
                                                NOT ST_Intersects(var_atempgeoms[i],var_atempgeoms[j])
                                                AND ST_DWithin(var_atempgeoms[i],var_atempgeoms[j], var_buf*10)
                                                )
                                            UNION ALL
                                            -- catch the ones with no near neighbors
                                            SELECT i, 0, ST_Buffer(var_atempgeoms[i] , var_buf*10, 'quad_segs=3') As geom
                                            FROM generate_series(1,array_upper(var_atempgeoms, 1)) As i
                                              LEFT JOIN generate_series(ceiling(array_upper(var_atempgeoms,1)/2)::integer,array_upper(var_atempgeoms, 1)) As j
                                                ON (
                                                NOT ST_Intersects(var_atempgeoms[i],var_atempgeoms[j])
                                                AND ST_DWithin(var_atempgeoms[i],var_atempgeoms[j], var_buf*10)
                                                )
                                            WHERE j IS NULL
                                            ORDER BY 1, 2
                                          ) As foo	) );
      IF ST_IsValid(var_tempgeom) AND ST_GeometryType(var_tempgeom) = 'ST_Polygon' THEN
        var_tempgeom := ST_Intersection(var_tempgeom, var_convhull);
        IF param_allow_holes THEN
          var_param_geom := var_tempgeom;
        ELSE
          var_param_geom := ST_MakePolygon(ST_ExteriorRing(var_tempgeom));
        END IF;
        return var_param_geom;
      ELSIF ST_IsValid(var_tempgeom) THEN
        var_param_geom := ST_Intersection(var_tempgeom, var_convhull);
      END IF;
    END IF;

    IF ST_GeometryType(var_param_geom) = 'ST_Polygon' THEN
      IF NOT param_allow_holes THEN
        var_param_geom := ST_MakePolygon(ST_ExteriorRing(var_param_geom));
      END IF;
      return var_param_geom;
    END IF;
    var_cent := ST_Centroid(var_param_geom);
    IF (ST_XMax(var_enline) - ST_XMin(var_enline) ) > var_buf AND (ST_YMax(var_enline) - ST_YMin(var_enline) ) > var_buf THEN
      IF ST_Dwithin(ST_Centroid(var_convhull) , ST_Centroid(ST_Envelope(var_param_geom)), var_buf/2) THEN
        -- If the geometric dimension is > 1 and the object is symettric (cutting at centroid will not work -- offset a bit)
        var_cent := ST_Translate(var_cent, (ST_XMax(var_enline) - ST_XMin(var_enline))/1000,  (ST_YMAX(var_enline) - ST_YMin(var_enline))/1000);
      ELSE
        -- uses closest point on geometry to centroid. I can't explain why we are doing this
        var_cent := ST_ClosestPoint(var_param_geom,var_cent);
      END IF;
      IF ST_DWithin(var_cent, var_enline,var_buf) THEN
        var_cent := ST_centroid(ST_Envelope(var_param_geom));
      END IF;
      -- break envelope into 4 triangles about the centroid of the geometry and returned the clipped geometry in each quadrant
      FOR i in 1 .. 4 LOOP
        var_geoms[i] := ST_MakePolygon(ST_MakeLine(ARRAY[ST_PointN(var_enline,i), ST_PointN(var_enline,i+1), var_cent, ST_PointN(var_enline,i)]));
        var_geoms[i] := ST_Intersection(var_param_geom, ST_Buffer(var_geoms[i],var_buf));
        IF ST_IsValid(var_geoms[i]) THEN

        ELSE
          var_geoms[i] := ST_BuildArea(ST_MakeLine(ARRAY[ST_PointN(var_enline,i), ST_PointN(var_enline,i+1), var_cent, ST_PointN(var_enline,i)]));
        END IF;
      END LOOP;
      var_tempgeom := ST_Union(ARRAY[ST_ConvexHull(var_geoms[1]), ST_ConvexHull(var_geoms[2]) , ST_ConvexHull(var_geoms[3]), ST_ConvexHull(var_geoms[4])]);
      --RAISE NOTICE 'Curr vex % ', ST_AsText(var_tempgeom);
      IF ST_Area(var_tempgeom) <= var_newarea AND ST_IsValid(var_tempgeom)  THEN --AND ST_GeometryType(var_tempgeom) ILIKE '%Polygon'

        var_tempgeom := ST_Buffer(ST_ConcaveHull(var_geoms[1],least(param_pctconvex + param_pctconvex/var_div),true),var_buf, 'quad_segs=2');
        FOR i IN 1 .. 4 LOOP
          var_geoms[i] := ST_Buffer(ST_ConcaveHull(var_geoms[i],least(param_pctconvex + param_pctconvex/var_div),true), var_buf, 'quad_segs=2');
          IF ST_IsValid(var_geoms[i]) Then
            var_tempgeom := ST_Union(var_tempgeom, var_geoms[i]);
          ELSE
            RAISE NOTICE 'Not valid % %', i, ST_AsText(var_tempgeom);
            var_tempgeom := ST_Union(var_tempgeom, ST_ConvexHull(var_geoms[i]));
          END IF;
        END LOOP;

        --RAISE NOTICE 'Curr concave % ', ST_AsText(var_tempgeom);
        IF ST_IsValid(var_tempgeom) THEN
          var_resultgeom := var_tempgeom;
        END IF;
        var_newarea := ST_Area(var_resultgeom);
      ELSIF ST_IsValid(var_tempgeom) THEN
        var_resultgeom := var_tempgeom;
      END IF;

      IF ST_NumGeometries(var_resultgeom) > 1  THEN
        var_tempgeom := _ST_ConcaveHull(var_resultgeom);
        IF ST_IsValid(var_tempgeom) AND ST_GeometryType(var_tempgeom) ILIKE 'ST_Polygon' THEN
          var_resultgeom := var_tempgeom;
        ELSE
          var_resultgeom := ST_Buffer(var_tempgeom,var_buf, 'quad_segs=2');
        END IF;
      END IF;
      IF param_allow_holes = false THEN
        -- only keep exterior ring since we do not want holes
        var_resultgeom := ST_MakePolygon(ST_ExteriorRing(var_resultgeom));
      END IF;
    ELSE
      var_resultgeom := ST_Buffer(var_resultgeom,var_buf);
    END IF;
    var_resultgeom := ST_Intersection(var_resultgeom, ST_ConvexHull(var_param_geom));
  ELSE
    -- dimensions are too small to cut
    var_resultgeom := _ST_ConcaveHull(var_param_geom);
  END IF;
  RETURN var_resultgeom;
END;
$$;


--
-- TOC entry 507 (class 1255 OID 19739)
-- Name: st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_contains(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$;


--
-- TOC entry 513 (class 1255 OID 19745)
-- Name: st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_containsproperly(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_ContainsProperly($1,$2)$_$;


--
-- TOC entry 457 (class 1255 OID 19675)
-- Name: st_convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_convexhull(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'convexhull';


--
-- TOC entry 760 (class 1255 OID 20020)
-- Name: st_coorddim(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coorddim(geometry geometry) RETURNS smallint
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_ndims';


--
-- TOC entry 727 (class 1255 OID 19982)
-- Name: st_coveredby(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(text, text) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$ SELECT ST_CoveredBy($1::geometry, $2::geometry);  $_$;


--
-- TOC entry 726 (class 1255 OID 19981)
-- Name: st_coveredby(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(geography, geography) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Covers($2, $1)$_$;


--
-- TOC entry 509 (class 1255 OID 19741)
-- Name: st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$;


--
-- TOC entry 725 (class 1255 OID 19980)
-- Name: st_covers(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(text, text) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$ SELECT ST_Covers($1::geometry, $2::geometry);  $_$;


--
-- TOC entry 724 (class 1255 OID 19979)
-- Name: st_covers(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(geography, geography) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Covers($1, $2)$_$;


--
-- TOC entry 511 (class 1255 OID 19743)
-- Name: st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$;


--
-- TOC entry 505 (class 1255 OID 19737)
-- Name: st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_crosses(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$;


--
-- TOC entry 762 (class 1255 OID 20022)
-- Name: st_curvetoline(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_CurveToLine($1, 32)$_$;


--
-- TOC entry 761 (class 1255 OID 20021)
-- Name: st_curvetoline(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_curve_segmentize';


--
-- TOC entry 626 (class 1255 OID 19858)
-- Name: st_dfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DFullyWithin(ST_ConvexHull($1), ST_ConvexHull($2), $3)$_$;


--
-- TOC entry 468 (class 1255 OID 19689)
-- Name: st_difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_difference(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'difference';


--
-- TOC entry 550 (class 1255 OID 19781)
-- Name: st_dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dimension(geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_dimension';


--
-- TOC entry 497 (class 1255 OID 19729)
-- Name: st_disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_disjoint(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'disjoint';


--
-- TOC entry 709 (class 1255 OID 19965)
-- Name: st_distance(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(text, text) RETURNS double precision
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_Distance($1::geometry, $2::geometry);  $_$;


--
-- TOC entry 708 (class 1255 OID 19964)
-- Name: st_distance(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geography, geography) RETURNS double precision
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_Distance($1, $2, 0.0, true)$_$;


--
-- TOC entry 344 (class 1255 OID 19535)
-- Name: st_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_mindistance2d';


--
-- TOC entry 707 (class 1255 OID 19963)
-- Name: st_distance(geography, geography, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geography, geography, boolean) RETURNS double precision
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_Distance($1, $2, 0.0, $3)$_$;


--
-- TOC entry 742 (class 1255 OID 19997)
-- Name: st_distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_sphere(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE sql IMMUTABLE STRICT COST 300
AS $_$
select st_distance(geography($1),geography($2),false)
$_$;


--
-- TOC entry 343 (class 1255 OID 19534)
-- Name: st_distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_spheroid(geom1 geometry, geom2 geometry, spheroid) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_distance_ellipsoid';


--
-- TOC entry 393 (class 1255 OID 19588)
-- Name: st_dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dump(geometry) RETURNS SETOF geometry_dump
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_dump';


--
-- TOC entry 396 (class 1255 OID 19591)
-- Name: st_dumppoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dumppoints(geometry) RETURNS SETOF geometry_dump
LANGUAGE sql STRICT
AS $_$
SELECT * FROM _ST_DumpPoints($1, NULL);
$_$;


--
-- TOC entry 394 (class 1255 OID 19589)
-- Name: st_dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dumprings(geometry) RETURNS SETOF geometry_dump
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_dump_rings';


--
-- TOC entry 714 (class 1255 OID 19969)
-- Name: st_dwithin(text, text, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(text, text, double precision) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$ SELECT ST_DWithin($1::geometry, $2::geometry, $3);  $_$;


--
-- TOC entry 712 (class 1255 OID 19968)
-- Name: st_dwithin(geography, geography, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geography, geography, double precision) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, true)$_$;


--
-- TOC entry 501 (class 1255 OID 19733)
-- Name: st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3)$_$;


--
-- TOC entry 711 (class 1255 OID 19967)
-- Name: st_dwithin(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geography, geography, double precision, boolean) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, $4)$_$;


--
-- TOC entry 560 (class 1255 OID 19792)
-- Name: st_endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_endpoint(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_endpoint_linestring';


--
-- TOC entry 358 (class 1255 OID 19549)
-- Name: st_envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_envelope(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_envelope';


--
-- TOC entry 525 (class 1255 OID 19757)
-- Name: st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_equals(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 ~= $2 AND _ST_Equals($1,$2)$_$;


--
-- TOC entry 322 (class 1255 OID 19513)
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text) RETURNS box2d
LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
AS '$libdir/postgis-2.0', 'geometry_estimated_extent';


--
-- TOC entry 321 (class 1255 OID 19512)
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text, text) RETURNS box2d
LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
AS '$libdir/postgis-2.0', 'geometry_estimated_extent';


--
-- TOC entry 316 (class 1255 OID 19508)
-- Name: st_expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box2d, double precision) RETURNS box2d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX2D_expand';


--
-- TOC entry 356 (class 1255 OID 19547)
-- Name: st_expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box3d, double precision) RETURNS box3d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_expand';


--
-- TOC entry 357 (class 1255 OID 19548)
-- Name: st_expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(geometry, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_expand';


--
-- TOC entry 551 (class 1255 OID 19782)
-- Name: st_exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_exteriorring(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_exteriorring_polygon';


--
-- TOC entry 324 (class 1255 OID 19515)
-- Name: st_find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text) RETURNS box2d
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
DECLARE
  tablename alias for $1;
  columnname alias for $2;
  myrec RECORD;

BEGIN
  FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") As extent FROM "' || tablename || '"' LOOP
    return myrec.extent;
  END LOOP;
END;
$_$;


--
-- TOC entry 323 (class 1255 OID 19514)
-- Name: st_find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text, text) RETURNS box2d
LANGUAGE plpgsql IMMUTABLE STRICT
AS $_$
DECLARE
  schemaname alias for $1;
  tablename alias for $2;
  columnname alias for $3;
  myrec RECORD;

BEGIN
  FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") As extent FROM "' || schemaname || '"."' || tablename || '"' LOOP
    return myrec.extent;
  END LOOP;
END;
$_$;


--
-- TOC entry 627 (class 1255 OID 19859)
-- Name: st_flipcoordinates(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_flipcoordinates(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_FlipCoordinates';


--
-- TOC entry 347 (class 1255 OID 19538)
-- Name: st_force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_2d(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_force_2d';


--
-- TOC entry 349 (class 1255 OID 19540)
-- Name: st_force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3d(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_force_3dz';


--
-- TOC entry 350 (class 1255 OID 19541)
-- Name: st_force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dm(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_force_3dm';


--
-- TOC entry 348 (class 1255 OID 19539)
-- Name: st_force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dz(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_force_3dz';


--
-- TOC entry 351 (class 1255 OID 19542)
-- Name: st_force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_4d(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_force_4d';


--
-- TOC entry 352 (class 1255 OID 19543)
-- Name: st_force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_collection(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_force_collection';


--
-- TOC entry 360 (class 1255 OID 19551)
-- Name: st_forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_forcerhr(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_force_clockwise_poly';


--
-- TOC entry 659 (class 1255 OID 19893)
-- Name: st_geogfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geogfromtext(text) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_from_text';


--
-- TOC entry 660 (class 1255 OID 19894)
-- Name: st_geogfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geogfromwkb(bytea) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_from_binary';


--
-- TOC entry 658 (class 1255 OID 19892)
-- Name: st_geographyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geographyfromtext(text) RETURNS geography
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geography_from_text';


--
-- TOC entry 957 (class 1255 OID 21281)
-- Name: st_geohash(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_GeoHash($1, 0)$_$;


--
-- TOC entry 546 (class 1255 OID 19777)
-- Name: st_geohash(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geom geometry, maxchars integer DEFAULT 0) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_GeoHash';


--
-- TOC entry 593 (class 1255 OID 19825)
-- Name: st_geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
         THEN ST_GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 592 (class 1255 OID 19824)
-- Name: st_geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
         THEN ST_GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 618 (class 1255 OID 19850)
-- Name: st_geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
         THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 617 (class 1255 OID 19849)
-- Name: st_geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
         THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 568 (class 1255 OID 19800)
-- Name: st_geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


--
-- TOC entry 569 (class 1255 OID 19801)
-- Name: st_geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


--
-- TOC entry 549 (class 1255 OID 19780)
-- Name: st_geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryn(geometry, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_geometryn_collection';


--
-- TOC entry 556 (class 1255 OID 19787)
-- Name: st_geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometrytype(geometry) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geometry_geometrytype';


--
-- TOC entry 371 (class 1255 OID 19563)
-- Name: st_geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkb(bytea) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOMFromWKB';


--
-- TOC entry 373 (class 1255 OID 19565)
-- Name: st_geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkt(text) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'parse_WKT_lwgeom';


--
-- TOC entry 533 (class 1255 OID 19765)
-- Name: st_geomfromgeojson(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromgeojson(text) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geom_from_geojson';


--
-- TOC entry 529 (class 1255 OID 19761)
-- Name: st_geomfromgml(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromgml(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_GeomFromGML($1, 0)$_$;


--
-- TOC entry 528 (class 1255 OID 19760)
-- Name: st_geomfromgml(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromgml(text, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geom_from_gml';


--
-- TOC entry 532 (class 1255 OID 19764)
-- Name: st_geomfromkml(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromkml(text) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geom_from_kml';


--
-- TOC entry 570 (class 1255 OID 19802)
-- Name: st_geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


--
-- TOC entry 571 (class 1255 OID 19803)
-- Name: st_geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


--
-- TOC entry 594 (class 1255 OID 19826)
-- Name: st_geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_from_WKB';


--
-- TOC entry 595 (class 1255 OID 19827)
-- Name: st_geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$;


--
-- TOC entry 530 (class 1255 OID 19762)
-- Name: st_gmltosql(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_gmltosql(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_GeomFromGML($1, 0)$_$;


--
-- TOC entry 531 (class 1255 OID 19763)
-- Name: st_gmltosql(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_gmltosql(text, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geom_from_gml';


--
-- TOC entry 763 (class 1255 OID 20023)
-- Name: st_hasarc(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasarc(geometry geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_has_arc';


--
-- TOC entry 466 (class 1255 OID 19687)
-- Name: st_hausdorffdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hausdorffdistance(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'hausdorffdistance';


--
-- TOC entry 467 (class 1255 OID 19688)
-- Name: st_hausdorffdistance(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hausdorffdistance(geom1 geometry, geom2 geometry, double precision) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'hausdorffdistancedensify';


--
-- TOC entry 554 (class 1255 OID 19785)
-- Name: st_interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_interiorringn(geometry, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_interiorringn_polygon';


--
-- TOC entry 778 (class 1255 OID 20033)
-- Name: st_interpolatepoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_interpolatepoint(line geometry, point geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_InterpolatePoint';


--
-- TOC entry 736 (class 1255 OID 19990)
-- Name: st_intersection(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(text, text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_Intersection($1::geometry, $2::geometry);  $_$;


--
-- TOC entry 735 (class 1255 OID 19989)
-- Name: st_intersection(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(geography, geography) RETURNS geography
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT geography(ST_Transform(ST_Intersection(ST_Transform(geometry($1), _ST_BestSRID($1, $2)), ST_Transform(geometry($2), _ST_BestSRID($1, $2))), 4326))$_$;


--
-- TOC entry 451 (class 1255 OID 19669)
-- Name: st_intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'intersection';


--
-- TOC entry 730 (class 1255 OID 19984)
-- Name: st_intersects(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(text, text) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$ SELECT ST_Intersects($1::geometry, $2::geometry);  $_$;


--
-- TOC entry 728 (class 1255 OID 19983)
-- Name: st_intersects(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(geography, geography) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Distance($1, $2, 0.0, false) < 0.00001$_$;


--
-- TOC entry 503 (class 1255 OID 19735)
-- Name: st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$;


--
-- TOC entry 561 (class 1255 OID 19793)
-- Name: st_isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isclosed(geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_isclosed';


--
-- TOC entry 523 (class 1255 OID 19755)
-- Name: st_iscollection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_iscollection(geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_IsCollection';


--
-- TOC entry 562 (class 1255 OID 19794)
-- Name: st_isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isempty(geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_isempty';


--
-- TOC entry 520 (class 1255 OID 19752)
-- Name: st_isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isring(geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'isring';


--
-- TOC entry 522 (class 1255 OID 19754)
-- Name: st_issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_issimple(geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'issimple';


--
-- TOC entry 518 (class 1255 OID 19750)
-- Name: st_isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalid(geometry) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'isvalid';


--
-- TOC entry 465 (class 1255 OID 19686)
-- Name: st_isvalid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalid(geometry, integer) RETURNS boolean
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT (ST_isValidDetail($1, $2)).valid$_$;


--
-- TOC entry 462 (class 1255 OID 19683)
-- Name: st_isvaliddetail(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvaliddetail(geometry) RETURNS valid_detail
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'isvaliddetail';


--
-- TOC entry 463 (class 1255 OID 19684)
-- Name: st_isvaliddetail(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvaliddetail(geometry, integer) RETURNS valid_detail
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'isvaliddetail';


--
-- TOC entry 461 (class 1255 OID 19679)
-- Name: st_isvalidreason(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalidreason(geometry) RETURNS text
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'isvalidreason';


--
-- TOC entry 464 (class 1255 OID 19685)
-- Name: st_isvalidreason(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalidreason(geometry, integer) RETURNS text
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN valid THEN 'Valid Geometry' ELSE reason END FROM (
                                                                    SELECT (ST_isValidDetail($1, $2)).*
                                                                  ) foo
$_$;


--
-- TOC entry 718 (class 1255 OID 19973)
-- Name: st_length(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(text) RETURNS double precision
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_Length($1::geometry);  $_$;


--
-- TOC entry 958 (class 1255 OID 21307)
-- Name: st_length(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geography) RETURNS double precision
LANGUAGE sql IMMUTABLE
AS $_$SELECT ST_Length($1, true)$_$;


--
-- TOC entry 334 (class 1255 OID 19525)
-- Name: st_length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_length2d_linestring';


--
-- TOC entry 717 (class 1255 OID 19972)
-- Name: st_length(geography, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geog geography, use_spheroid boolean DEFAULT true) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'geography_length';


--
-- TOC entry 333 (class 1255 OID 19524)
-- Name: st_length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_length2d_linestring';


--
-- TOC entry 337 (class 1255 OID 19528)
-- Name: st_length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d_spheroid(geometry, spheroid) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_length2d_ellipsoid';


--
-- TOC entry 336 (class 1255 OID 19527)
-- Name: st_length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length_spheroid(geometry, spheroid) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'LWGEOM_length_ellipsoid_linestring';


--
-- TOC entry 445 (class 1255 OID 19663)
-- Name: st_line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_interpolate_point(geometry, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_line_interpolate_point';


--
-- TOC entry 447 (class 1255 OID 19665)
-- Name: st_line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_locate_point(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_line_locate_point';


--
-- TOC entry 446 (class 1255 OID 19664)
-- Name: st_line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_substring(geometry, double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_line_substring';


--
-- TOC entry 459 (class 1255 OID 19677)
-- Name: st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linecrossingdirection(geom1 geometry, geom2 geometry) RETURNS integer
LANGUAGE sql IMMUTABLE
AS $_$ SELECT CASE WHEN NOT $1 && $2 THEN 0 ELSE _ST_LineCrossingDirection($1,$2) END $_$;


--
-- TOC entry 381 (class 1255 OID 19573)
-- Name: st_linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefrommultipoint(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_line_from_mpoint';


--
-- TOC entry 575 (class 1255 OID 19807)
-- Name: st_linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'LINESTRING'
  THEN ST_GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 576 (class 1255 OID 19808)
-- Name: st_linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'LINESTRING'
  THEN ST_GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 599 (class 1255 OID 19831)
-- Name: st_linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 598 (class 1255 OID 19830)
-- Name: st_linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 392 (class 1255 OID 19584)
-- Name: st_linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linemerge(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'linemerge';


--
-- TOC entry 601 (class 1255 OID 19833)
-- Name: st_linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 600 (class 1255 OID 19832)
-- Name: st_linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 764 (class 1255 OID 20024)
-- Name: st_linetocurve(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linetocurve(geometry geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_line_desegmentize';


--
-- TOC entry 449 (class 1255 OID 19667)
-- Name: st_locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_along_measure(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$ SELECT ST_locate_between_measures($1, $2, $2) $_$;


--
-- TOC entry 448 (class 1255 OID 19666)
-- Name: st_locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_between_measures(geometry, double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_locate_between_m';


--
-- TOC entry 771 (class 1255 OID 20031)
-- Name: st_locatealong(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locatealong(geometry geometry, measure double precision, leftrightoffset double precision DEFAULT 0.0) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_LocateAlong';


--
-- TOC entry 770 (class 1255 OID 20030)
-- Name: st_locatebetween(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locatebetween(geometry geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision DEFAULT 0.0) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_LocateBetween';


--
-- TOC entry 777 (class 1255 OID 20032)
-- Name: st_locatebetweenelevations(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locatebetweenelevations(geometry geometry, fromelevation double precision, toelevation double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_LocateBetweenElevations';


--
-- TOC entry 624 (class 1255 OID 19856)
-- Name: st_longestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_longestline(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_LongestLine(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


--
-- TOC entry 252 (class 1255 OID 19371)
-- Name: st_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_m(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_m_point';


--
-- TOC entry 319 (class 1255 OID 19510)
-- Name: st_makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox2d(geom1 geometry, geom2 geometry) RETURNS box2d
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX2D_construct';


--
-- TOC entry 387 (class 1255 OID 19579)
-- Name: st_makeenvelope(double precision, double precision, double precision, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeenvelope(double precision, double precision, double precision, double precision, integer DEFAULT 0) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_MakeEnvelope';


--
-- TOC entry 380 (class 1255 OID 19572)
-- Name: st_makeline(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry[]) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_makeline_garray';


--
-- TOC entry 382 (class 1255 OID 19574)
-- Name: st_makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_makeline';


--
-- TOC entry 375 (class 1255 OID 19567)
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_makepoint';


--
-- TOC entry 376 (class 1255 OID 19568)
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_makepoint';


--
-- TOC entry 377 (class 1255 OID 19569)
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_makepoint';


--
-- TOC entry 378 (class 1255 OID 19570)
-- Name: st_makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepointm(double precision, double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_makepoint3dm';


--
-- TOC entry 389 (class 1255 OID 19581)
-- Name: st_makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_makepoly';


--
-- TOC entry 388 (class 1255 OID 19580)
-- Name: st_makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry, geometry[]) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_makepoly';


--
-- TOC entry 475 (class 1255 OID 19696)
-- Name: st_makevalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makevalid(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_MakeValid';


--
-- TOC entry 620 (class 1255 OID 19852)
-- Name: st_maxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_maxdistance(geom1 geometry, geom2 geometry) RETURNS double precision
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT _ST_MaxDistance(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


--
-- TOC entry 328 (class 1255 OID 19519)
-- Name: st_mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mem_size(geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_mem_size';


--
-- TOC entry 959 (class 1255 OID 21312)
-- Name: st_minimumboundingcircle(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(geometry) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_MinimumBoundingCircle($1, 48)$_$;


--
-- TOC entry 779 (class 1255 OID 20034)
-- Name: st_minimumboundingcircle(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer DEFAULT 48) RETURNS geometry
LANGUAGE plpgsql IMMUTABLE STRICT
AS $$
DECLARE
  hull GEOMETRY;
  ring GEOMETRY;
  center GEOMETRY;
  radius DOUBLE PRECISION;
  dist DOUBLE PRECISION;
  d DOUBLE PRECISION;
  idx1 integer;
  idx2 integer;
  l1 GEOMETRY;
  l2 GEOMETRY;
  p1 GEOMETRY;
  p2 GEOMETRY;
  a1 DOUBLE PRECISION;
  a2 DOUBLE PRECISION;


BEGIN

  -- First compute the ConvexHull of the geometry
  hull = ST_ConvexHull(inputgeom);
  --A point really has no MBC
  IF ST_GeometryType(hull) = 'ST_Point' THEN
    RETURN hull;
  END IF;
  -- convert the hull perimeter to a linestring so we can manipulate individual points
  --If its already a linestring force it to a closed linestring
  ring = CASE WHEN ST_GeometryType(hull) = 'ST_LineString' THEN ST_AddPoint(hull, ST_StartPoint(hull)) ELSE ST_ExteriorRing(hull) END;

  dist = 0;
  -- Brute Force - check every pair
  FOR i in 1 .. (ST_NumPoints(ring)-2)
  LOOP
    FOR j in i .. (ST_NumPoints(ring)-1)
    LOOP
      d = ST_Distance(ST_PointN(ring,i),ST_PointN(ring,j));
      -- Check the distance and update if larger
      IF (d > dist) THEN
        dist = d;
        idx1 = i;
        idx2 = j;
      END IF;
    END LOOP;
  END LOOP;

  -- We now have the diameter of the convex hull.  The following line returns it if desired.
  -- RETURN ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2));

  -- Now for the Minimum Bounding Circle.  Since we know the two points furthest from each
  -- other, the MBC must go through those two points. Start with those points as a diameter of a circle.

  -- The radius is half the distance between them and the center is midway between them
  radius = ST_Distance(ST_PointN(ring,idx1),ST_PointN(ring,idx2)) / 2.0;
  center = ST_Line_interpolate_point(ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2)),0.5);

  -- Loop through each vertex and check if the distance from the center to the point
  -- is greater than the current radius.
  FOR k in 1 .. (ST_NumPoints(ring)-1)
  LOOP
    IF(k <> idx1 and k <> idx2) THEN
      dist = ST_Distance(center,ST_PointN(ring,k));
      IF (dist > radius) THEN
        -- We have to expand the circle.  The new circle must pass trhough
        -- three points - the two original diameters and this point.

        -- Draw a line from the first diameter to this point
        l1 = ST_Makeline(ST_PointN(ring,idx1),ST_PointN(ring,k));
        -- Compute the midpoint
        p1 = ST_line_interpolate_point(l1,0.5);
        -- Rotate the line 90 degrees around the midpoint (perpendicular bisector)
        l1 = ST_Rotate(l1,pi()/2,p1);
        --  Compute the azimuth of the bisector
        a1 = ST_Azimuth(ST_PointN(l1,1),ST_PointN(l1,2));
        --  Extend the line in each direction the new computed distance to insure they will intersect
        l1 = ST_AddPoint(l1,ST_Makepoint(ST_X(ST_PointN(l1,2))+sin(a1)*dist,ST_Y(ST_PointN(l1,2))+cos(a1)*dist),-1);
        l1 = ST_AddPoint(l1,ST_Makepoint(ST_X(ST_PointN(l1,1))-sin(a1)*dist,ST_Y(ST_PointN(l1,1))-cos(a1)*dist),0);

        -- Repeat for the line from the point to the other diameter point
        l2 = ST_Makeline(ST_PointN(ring,idx2),ST_PointN(ring,k));
        p2 = ST_Line_interpolate_point(l2,0.5);
        l2 = ST_Rotate(l2,pi()/2,p2);
        a2 = ST_Azimuth(ST_PointN(l2,1),ST_PointN(l2,2));
        l2 = ST_AddPoint(l2,ST_Makepoint(ST_X(ST_PointN(l2,2))+sin(a2)*dist,ST_Y(ST_PointN(l2,2))+cos(a2)*dist),-1);
        l2 = ST_AddPoint(l2,ST_Makepoint(ST_X(ST_PointN(l2,1))-sin(a2)*dist,ST_Y(ST_PointN(l2,1))-cos(a2)*dist),0);

        -- The new center is the intersection of the two bisectors
        center = ST_Intersection(l1,l2);
        -- The new radius is the distance to any of the three points
        radius = ST_Distance(center,ST_PointN(ring,idx1));
      END IF;
    END IF;
  END LOOP;
  --DONE!!  Return the MBC via the buffer command
  RETURN ST_Buffer(center,radius,segs_per_quarter);

END;
$$;


--
-- TOC entry 582 (class 1255 OID 19814)
-- Name: st_mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTILINESTRING'
  THEN ST_GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 581 (class 1255 OID 19813)
-- Name: st_mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE
       WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTILINESTRING'
         THEN ST_GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 612 (class 1255 OID 19844)
-- Name: st_mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 611 (class 1255 OID 19843)
-- Name: st_mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 586 (class 1255 OID 19818)
-- Name: st_mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOINT'
  THEN ST_GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 585 (class 1255 OID 19817)
-- Name: st_mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOINT'
  THEN ST_GeomFromText($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 607 (class 1255 OID 19839)
-- Name: st_mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 606 (class 1255 OID 19838)
-- Name: st_mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOINT'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 589 (class 1255 OID 19821)
-- Name: st_mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOLYGON'
  THEN ST_GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 588 (class 1255 OID 19820)
-- Name: st_mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
  THEN ST_GeomFromText($1,$2)
       ELSE NULL END
$_$;


--
-- TOC entry 614 (class 1255 OID 19846)
-- Name: st_mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 613 (class 1255 OID 19845)
-- Name: st_mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 355 (class 1255 OID 19546)
-- Name: st_multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multi(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_force_multi';


--
-- TOC entry 610 (class 1255 OID 19842)
-- Name: st_multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinefromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 583 (class 1255 OID 19815)
-- Name: st_multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_MLineFromText($1)$_$;


--
-- TOC entry 584 (class 1255 OID 19816)
-- Name: st_multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_MLineFromText($1, $2)$_$;


--
-- TOC entry 587 (class 1255 OID 19819)
-- Name: st_multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_MPointFromText($1)$_$;


--
-- TOC entry 609 (class 1255 OID 19841)
-- Name: st_multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 608 (class 1255 OID 19840)
-- Name: st_multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 616 (class 1255 OID 19848)
-- Name: st_multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 615 (class 1255 OID 19847)
-- Name: st_multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 591 (class 1255 OID 19823)
-- Name: st_multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_MPolyFromText($1)$_$;


--
-- TOC entry 590 (class 1255 OID 19822)
-- Name: st_multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_MPolyFromText($1, $2)$_$;


--
-- TOC entry 362 (class 1255 OID 19554)
-- Name: st_ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ndims(geometry) RETURNS smallint
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_ndims';


--
-- TOC entry 481 (class 1255 OID 19702)
-- Name: st_node(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_node(g geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_Node';


--
-- TOC entry 330 (class 1255 OID 19521)
-- Name: st_npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_npoints(geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_npoints';


--
-- TOC entry 331 (class 1255 OID 19522)
-- Name: st_nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_nrings(geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_nrings';


--
-- TOC entry 548 (class 1255 OID 19779)
-- Name: st_numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numgeometries(geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_numgeometries_collection';


--
-- TOC entry 553 (class 1255 OID 19784)
-- Name: st_numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorring(geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_numinteriorrings_polygon';


--
-- TOC entry 552 (class 1255 OID 19783)
-- Name: st_numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorrings(geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_numinteriorrings_polygon';


--
-- TOC entry 558 (class 1255 OID 19789)
-- Name: st_numpatches(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numpatches(geometry) RETURNS integer
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN ST_GeometryType($1) = 'ST_PolyhedralSurface'
  THEN ST_NumGeometries($1)
       ELSE NULL END
$_$;


--
-- TOC entry 547 (class 1255 OID 19778)
-- Name: st_numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numpoints(geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_numpoints_linestring';


--
-- TOC entry 456 (class 1255 OID 19674)
-- Name: st_offsetcurve(geometry, double precision, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_offsetcurve(line geometry, distance double precision, params text DEFAULT ''::text) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_OffsetCurve';


--
-- TOC entry 766 (class 1255 OID 20026)
-- Name: st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_orderingequals(geometrya geometry, geometryb geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT $1 ~= $2 AND _ST_OrderingEquals($1, $2)
$_$;


--
-- TOC entry 517 (class 1255 OID 19749)
-- Name: st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_overlaps(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$;


--
-- TOC entry 535 (class 1255 OID 19790)
-- Name: st_patchn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_patchn(geometry, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN ST_GeometryType($1) = 'ST_PolyhedralSurface'
  THEN ST_GeometryN($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 340 (class 1255 OID 19531)
-- Name: st_perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_perimeter2d_poly';


--
-- TOC entry 721 (class 1255 OID 19976)
-- Name: st_perimeter(geography, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter(geog geography, use_spheroid boolean DEFAULT true) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'geography_perimeter';


--
-- TOC entry 339 (class 1255 OID 19530)
-- Name: st_perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter2d(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_perimeter2d_poly';


--
-- TOC entry 767 (class 1255 OID 20027)
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point(double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_makepoint';


--
-- TOC entry 345 (class 1255 OID 19536)
-- Name: st_point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_inside_circle_point';


--
-- TOC entry 573 (class 1255 OID 19805)
-- Name: st_pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POINT'
  THEN ST_GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 574 (class 1255 OID 19806)
-- Name: st_pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POINT'
  THEN ST_GeomFromText($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 597 (class 1255 OID 19829)
-- Name: st_pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POINT'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 596 (class 1255 OID 19828)
-- Name: st_pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 557 (class 1255 OID 19788)
-- Name: st_pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointn(geometry, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_pointn_linestring';


--
-- TOC entry 521 (class 1255 OID 19753)
-- Name: st_pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointonsurface(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'pointonsurface';


--
-- TOC entry 577 (class 1255 OID 19809)
-- Name: st_polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POLYGON'
  THEN ST_GeomFromText($1)
       ELSE NULL END
$_$;


--
-- TOC entry 578 (class 1255 OID 19810)
-- Name: st_polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POLYGON'
  THEN ST_GeomFromText($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 603 (class 1255 OID 19835)
-- Name: st_polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 602 (class 1255 OID 19834)
-- Name: st_polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POLYGON'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 768 (class 1255 OID 20028)
-- Name: st_polygon(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygon(geometry, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT ST_SetSRID(ST_MakePolygon($1), $2)
$_$;


--
-- TOC entry 580 (class 1255 OID 19812)
-- Name: st_polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_PolyFromText($1)$_$;


--
-- TOC entry 579 (class 1255 OID 19811)
-- Name: st_polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_PolyFromText($1, $2)$_$;


--
-- TOC entry 605 (class 1255 OID 19837)
-- Name: st_polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
  THEN ST_GeomFromWKB($1)
       ELSE NULL END
$_$;


--
-- TOC entry 604 (class 1255 OID 19836)
-- Name: st_polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea, integer) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'POLYGON'
  THEN ST_GeomFromWKB($1, $2)
       ELSE NULL END
$_$;


--
-- TOC entry 391 (class 1255 OID 19583)
-- Name: st_polygonize(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize(geometry[]) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'polygonize_garray';


--
-- TOC entry 719 (class 1255 OID 19974)
-- Name: st_project(geography, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_project(geog geography, distance double precision, azimuth double precision) RETURNS geography
LANGUAGE c IMMUTABLE COST 100
AS '$libdir/postgis-2.0', 'geography_project';


--
-- TOC entry 494 (class 1255 OID 19726)
-- Name: st_relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geom1 geometry, geom2 geometry) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'relate_full';


--
-- TOC entry 495 (class 1255 OID 19727)
-- Name: st_relate(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geom1 geometry, geom2 geometry, integer) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'relate_full';


--
-- TOC entry 496 (class 1255 OID 19728)
-- Name: st_relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geom1 geometry, geom2 geometry, text) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'relate_pattern';


--
-- TOC entry 480 (class 1255 OID 19701)
-- Name: st_relatematch(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relatematch(text, text) RETURNS boolean
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_RelateMatch';


--
-- TOC entry 385 (class 1255 OID 19577)
-- Name: st_removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_removepoint(geometry, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_removepoint';


--
-- TOC entry 474 (class 1255 OID 19695)
-- Name: st_removerepeatedpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_removerepeatedpoints(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_RemoveRepeatedPoints';


--
-- TOC entry 359 (class 1255 OID 19550)
-- Name: st_reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_reverse(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_reverse';


--
-- TOC entry 298 (class 1255 OID 19490)
-- Name: st_rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotate(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


--
-- TOC entry 300 (class 1255 OID 19492)
-- Name: st_rotate(geometry, double precision, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotate(geometry, double precision, geometry) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Affine($1,  cos($2), -sin($2), 0,  sin($2),  cos($2), 0, 0, 0, 1, ST_X($3) - cos($2) * ST_X($3) + sin($2) * ST_Y($3), ST_Y($3) - sin($2) * ST_X($3) - cos($2) * ST_Y($3), 0)$_$;


--
-- TOC entry 299 (class 1255 OID 19491)
-- Name: st_rotate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotate(geometry, double precision, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Affine($1,  cos($2), -sin($2), 0,  sin($2),  cos($2), 0, 0, 0, 1,	$3 - cos($2) * $3 + sin($2) * $4, $4 - sin($2) * $3 - cos($2) * $4, 0)$_$;


--
-- TOC entry 302 (class 1255 OID 19494)
-- Name: st_rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatex(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


--
-- TOC entry 303 (class 1255 OID 19495)
-- Name: st_rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatey(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


--
-- TOC entry 301 (class 1255 OID 19493)
-- Name: st_rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatez(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Rotate($1, $2)$_$;


--
-- TOC entry 307 (class 1255 OID 19499)
-- Name: st_scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Scale($1, $2, $3, 1)$_$;


--
-- TOC entry 306 (class 1255 OID 19498)
-- Name: st_scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


--
-- TOC entry 444 (class 1255 OID 19662)
-- Name: st_segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_segmentize(geometry, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_segmentize2d';


--
-- TOC entry 386 (class 1255 OID 19578)
-- Name: st_setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setpoint(geometry, integer, geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_setpoint_linestring';


--
-- TOC entry 564 (class 1255 OID 19796)
-- Name: st_setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setsrid(geometry, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_set_srid';


--
-- TOC entry 478 (class 1255 OID 19699)
-- Name: st_sharedpaths(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_sharedpaths(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_SharedPaths';


--
-- TOC entry 309 (class 1255 OID 19501)
-- Name: st_shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_shift_longitude(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_longitude_shift';


--
-- TOC entry 622 (class 1255 OID 19854)
-- Name: st_shortestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_shortestline(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_shortestline2d';


--
-- TOC entry 441 (class 1255 OID 19657)
-- Name: st_simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplify(geometry, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_simplify2d';


--
-- TOC entry 460 (class 1255 OID 19678)
-- Name: st_simplifypreservetopology(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplifypreservetopology(geometry, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'topologypreservesimplify';


--
-- TOC entry 479 (class 1255 OID 19700)
-- Name: st_snap(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snap(geom1 geometry, geom2 geometry, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_Snap';


--
-- TOC entry 442 (class 1255 OID 19660)
-- Name: st_snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$;


--
-- TOC entry 412 (class 1255 OID 19659)
-- Name: st_snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$;


--
-- TOC entry 411 (class 1255 OID 19658)
-- Name: st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_snaptogrid';


--
-- TOC entry 443 (class 1255 OID 19661)
-- Name: st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geom1 geometry, geom2 geometry, double precision, double precision, double precision, double precision) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_snaptogrid_pointoff';


--
-- TOC entry 477 (class 1255 OID 19698)
-- Name: st_split(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_split(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT COST 100
AS '$libdir/postgis-2.0', 'ST_Split';


--
-- TOC entry 563 (class 1255 OID 19795)
-- Name: st_srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(geometry) RETURNS integer
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_get_srid';


--
-- TOC entry 559 (class 1255 OID 19791)
-- Name: st_startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_startpoint(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_startpoint_linestring';


--
-- TOC entry 741 (class 1255 OID 19996)
-- Name: st_summary(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_summary(geography) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_summary';


--
-- TOC entry 329 (class 1255 OID 19520)
-- Name: st_summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_summary(geometry) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_summary';


--
-- TOC entry 470 (class 1255 OID 19691)
-- Name: st_symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symdifference(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'symdifference';


--
-- TOC entry 471 (class 1255 OID 19692)
-- Name: st_symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symmetricdifference(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'symdifference';


--
-- TOC entry 499 (class 1255 OID 19731)
-- Name: st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_touches(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$;


--
-- TOC entry 416 (class 1255 OID 19620)
-- Name: st_transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transform(geometry, integer) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'transform';


--
-- TOC entry 305 (class 1255 OID 19497)
-- Name: st_translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Translate($1, $2, $3, 0)$_$;


--
-- TOC entry 304 (class 1255 OID 19496)
-- Name: st_translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


--
-- TOC entry 308 (class 1255 OID 19500)
-- Name: st_transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT ST_Affine($1,  $4, 0, 0,  0, $5, 0,
                       0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


--
-- TOC entry 473 (class 1255 OID 19694)
-- Name: st_unaryunion(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_unaryunion(geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'ST_UnaryUnion';


--
-- TOC entry 493 (class 1255 OID 19721)
-- Name: st_union(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry[]) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'pgis_union_geometry_array';


--
-- TOC entry 472 (class 1255 OID 19693)
-- Name: st_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geom1 geometry, geom2 geometry) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'geomunion';


--
-- TOC entry 516 (class 1255 OID 19748)
-- Name: st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_within(geom1 geometry, geom2 geometry) RETURNS boolean
LANGUAGE sql IMMUTABLE
AS $_$SELECT $1 && $2 AND _ST_Contains($2,$1)$_$;


--
-- TOC entry 769 (class 1255 OID 20029)
-- Name: st_wkbtosql(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkbtosql(wkb bytea) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_from_WKB';


--
-- TOC entry 572 (class 1255 OID 19804)
-- Name: st_wkttosql(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkttosql(text) RETURNS geometry
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


--
-- TOC entry 249 (class 1255 OID 19368)
-- Name: st_x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_x(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_x_point';


--
-- TOC entry 313 (class 1255 OID 19505)
-- Name: st_xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmax(box3d) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_xmax';


--
-- TOC entry 310 (class 1255 OID 19502)
-- Name: st_xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmin(box3d) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_xmin';


--
-- TOC entry 250 (class 1255 OID 19369)
-- Name: st_y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_y(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_y_point';


--
-- TOC entry 314 (class 1255 OID 19506)
-- Name: st_ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymax(box3d) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_ymax';


--
-- TOC entry 311 (class 1255 OID 19503)
-- Name: st_ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymin(box3d) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_ymin';


--
-- TOC entry 251 (class 1255 OID 19370)
-- Name: st_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_z(geometry) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_z_point';


--
-- TOC entry 315 (class 1255 OID 19507)
-- Name: st_zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmax(box3d) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_zmax';


--
-- TOC entry 361 (class 1255 OID 19553)
-- Name: st_zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmflag(geometry) RETURNS smallint
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_zmflag';


--
-- TOC entry 312 (class 1255 OID 19504)
-- Name: st_zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmin(box3d) RETURNS double precision
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'BOX3D_zmin';


--
-- TOC entry 434 (class 1255 OID 19638)
-- Name: text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(geometry) RETURNS text
LANGUAGE c IMMUTABLE STRICT
AS '$libdir/postgis-2.0', 'LWGEOM_to_text';


--
-- TOC entry 961 (class 1255 OID 21329)
-- Name: translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT translate($1, $2, $3, 0)$_$;


--
-- TOC entry 960 (class 1255 OID 21328)
-- Name: translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


--
-- TOC entry 962 (class 1255 OID 21330)
-- Name: transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
LANGUAGE sql IMMUTABLE STRICT
AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0,
                    0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


--
-- TOC entry 630 (class 1255 OID 19862)
-- Name: unlockrows(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unlockrows(text) RETURNS integer
LANGUAGE plpgsql STRICT
AS $_$
DECLARE
  ret int;
BEGIN

  IF NOT LongTransactionsEnabled() THEN
    RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
  END IF;

  EXECUTE 'DELETE FROM authorization_table where authid = ' ||
          quote_literal($1);

  GET DIAGNOSTICS ret = ROW_COUNT;

  RETURN ret;
END;
$_$;


--
-- TOC entry 410 (class 1255 OID 19616)
-- Name: updategeometrysrid(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, integer) RETURNS text
LANGUAGE plpgsql STRICT
AS $_$
DECLARE
  ret  text;
BEGIN
  SELECT UpdateGeometrySRID('','',$1,$2,$3) into ret;
  RETURN ret;
END;
$_$;


--
-- TOC entry 409 (class 1255 OID 19615)
-- Name: updategeometrysrid(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) RETURNS text
LANGUAGE plpgsql STRICT
AS $_$
DECLARE
  ret  text;
BEGIN
  SELECT UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
  RETURN ret;
END;
$_$;


--
-- TOC entry 408 (class 1255 OID 20053)
-- Name: updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer) RETURNS text
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  myrec RECORD;
  okay boolean;
  cname varchar;
  real_schema name;
  unknown_srid integer;
  new_srid integer := new_srid_in;

BEGIN


  -- Find, check or fix schema_name
  IF ( schema_name != '' ) THEN
    okay = false;

    FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
      okay := true;
    END LOOP;

    IF ( okay <> true ) THEN
      RAISE EXCEPTION 'Invalid schema name';
    ELSE
      real_schema = schema_name;
    END IF;
  ELSE
    SELECT INTO real_schema current_schema()::text;
  END IF;

  -- Ensure that column_name is in geometry_columns
  okay = false;
  FOR myrec IN SELECT type, coord_dimension FROM geometry_columns WHERE f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
    okay := true;
  END LOOP;
  IF (NOT okay) THEN
    RAISE EXCEPTION 'column not found in geometry_columns table';
    RETURN false;
  END IF;

  -- Ensure that new_srid is valid
  IF ( new_srid > 0 ) THEN
    IF ( SELECT count(*) = 0 from spatial_ref_sys where srid = new_srid ) THEN
      RAISE EXCEPTION 'invalid SRID: % not found in spatial_ref_sys', new_srid;
      RETURN false;
    END IF;
  ELSE
    unknown_srid := ST_SRID('POINT EMPTY'::geometry);
    IF ( new_srid != unknown_srid ) THEN
      new_srid := unknown_srid;
      RAISE NOTICE 'SRID value % converted to the officially unknown SRID value %', new_srid_in, new_srid;
    END IF;
  END IF;

  IF postgis_constraint_srid(schema_name, table_name, column_name) IS NOT NULL THEN
    -- srid was enforced with constraints before, keep it that way.
    -- Make up constraint name
    cname = 'enforce_srid_'  || column_name;

    -- Drop enforce_srid constraint
    EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
            '.' || quote_ident(table_name) ||
            ' DROP constraint ' || quote_ident(cname);

    -- Update geometries SRID
    EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
            '.' || quote_ident(table_name) ||
            ' SET ' || quote_ident(column_name) ||
            ' = ST_SetSRID(' || quote_ident(column_name) ||
            ', ' || new_srid::text || ')';

    -- Reset enforce_srid constraint
    EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
            '.' || quote_ident(table_name) ||
            ' ADD constraint ' || quote_ident(cname) ||
            ' CHECK (st_srid(' || quote_ident(column_name) ||
            ') = ' || new_srid::text || ')';
  ELSE
    -- We will use typmod to enforce if no srid constraints
    -- We are using postgis_type_name to lookup the new name
    -- (in case Paul changes his mind and flips geometry_columns to return old upper case name)
    EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' || quote_ident(table_name) ||
            ' ALTER COLUMN ' || quote_ident(column_name) || ' TYPE  geometry(' || postgis_type_name(myrec.type, myrec.coord_dimension, true) || ', ' || new_srid::text || ') USING ST_SetSRID(' || quote_ident(column_name) || ',' || new_srid::text || ');' ;
  END IF;

  RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;

END;
$$;


SET search_path = topology, pg_catalog;

--
-- TOC entry 877 (class 1255 OID 20218)
-- Name: _asgmledge(integer, integer, integer, public.geometry, regclass, text, integer, integer, text, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION _asgmledge(edge_id integer, start_node integer, end_node integer, line public.geometry, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  visited bool;
  nsprefix text;
  gml text;
BEGIN

  nsprefix := 'gml:';
  IF nsprefix_in IS NOT NULL THEN
    IF nsprefix_in = '' THEN
      nsprefix = nsprefix_in;
    ELSE
      nsprefix = nsprefix_in || ':';
    END IF;
  END IF;

  gml := '<' || nsprefix || 'Edge ' || nsprefix
         || 'id="' || idprefix || 'E' || edge_id || '">';

  -- Start node
  gml = gml || '<' || nsprefix || 'directedNode orientation="-"';
  -- Do visited bookkeeping if visitedTable was given
  visited = NULL;
  IF visitedTable IS NOT NULL THEN
    EXECUTE 'SELECT true FROM '
            || visitedTable::text
            || ' WHERE element_type = 1 AND element_id = '
            || start_node LIMIT 1 INTO visited;
    IF visited IS NOT NULL THEN
      gml = gml || ' xlink:href="#' || idprefix || 'N' || start_node || '" />';
    ELSE
      -- Mark as visited
      EXECUTE 'INSERT INTO ' || visitedTable::text
              || '(element_type, element_id) VALUES (1, '
              || start_node || ')';
    END IF;
  END IF;
  IF visited IS NULL THEN
    gml = gml || '>';
    gml = gml || topology._AsGMLNode(start_node, NULL, nsprefix_in,
                                     prec, options, idprefix, gmlver);
    gml = gml || '</' || nsprefix || 'directedNode>';
  END IF;

  -- End node
  gml = gml || '<' || nsprefix || 'directedNode';
  -- Do visited bookkeeping if visitedTable was given
  visited = NULL;
  IF visitedTable IS NOT NULL THEN
    EXECUTE 'SELECT true FROM '
            || visitedTable::text
            || ' WHERE element_type = 1 AND element_id = '
            || end_node LIMIT 1 INTO visited;
    IF visited IS NOT NULL THEN
      gml = gml || ' xlink:href="#' || idprefix || 'N' || end_node || '" />';
    ELSE
      -- Mark as visited
      EXECUTE 'INSERT INTO ' || visitedTable::text
              || '(element_type, element_id) VALUES (1, '
              || end_node || ')';
    END IF;
  END IF;
  IF visited IS NULL THEN
    gml = gml || '>';
    gml = gml || topology._AsGMLNode(end_node, NULL, nsprefix_in,
                                     prec, options, idprefix, gmlver);
    gml = gml || '</' || nsprefix || 'directedNode>';
  END IF;

  IF line IS NOT NULL THEN
    gml = gml || '<' || nsprefix || 'curveProperty>'
          || ST_AsGML(gmlver, line, prec, options, nsprefix_in)
          || '</' || nsprefix || 'curveProperty>';
  END IF;

  gml = gml || '</' || nsprefix || 'Edge>';

  RETURN gml;
END
$$;


--
-- TOC entry 878 (class 1255 OID 20219)
-- Name: _asgmlface(text, integer, regclass, text, integer, integer, text, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION _asgmlface(toponame text, face_id integer, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  visited bool;
  nsprefix text;
  gml text;
  rec RECORD;
  rec2 RECORD;
  bounds geometry;
  side int;
BEGIN

  nsprefix := 'gml:';
  IF nsprefix_in IS NOT NULL THEN
    IF nsprefix_in = '' THEN
      nsprefix = nsprefix_in;
    ELSE
      nsprefix = nsprefix_in || ':';
    END IF;
  END IF;

  gml := '<' || nsprefix || 'Face ' || nsprefix
         || 'id="' || idprefix || 'F' || face_id || '">';

  -- Construct the face geometry, then for each polygon:
  FOR rec IN SELECT (ST_DumpRings((ST_Dump(ST_ForceRHR(
                                               topology.ST_GetFaceGeometry(toponame, face_id)))).geom)).geom
  LOOP

    -- Contents of a directed face are the list of edges
    -- that cover the specific ring
    bounds = ST_Boundary(rec.geom);

    FOR rec2 IN EXECUTE
    'SELECT e.*, ST_Line_Locate_Point('
    || quote_literal(bounds::text)
    || ', ST_Line_Interpolate_Point(e.geom, 0.2)) as pos'
    || ', ST_Line_Locate_Point('
    || quote_literal(bounds::text)
    || ', ST_Line_Interpolate_Point(e.geom, 0.8)) as pos2 FROM '
    || quote_ident(toponame)
    || '.edge e WHERE ( e.left_face = ' || face_id
    || ' OR e.right_face = ' || face_id
    || ') AND ST_Covers('
    || quote_literal(bounds::text)
    || ', e.geom) ORDER BY pos'
    LOOP

      gml = gml || '<' || nsprefix || 'directedEdge';

      -- if this edge goes in same direction to the
      --       ring bounds, make it with negative orientation
      IF rec2.pos2 > rec2.pos THEN -- edge goes in same direction
        gml = gml || ' orientation="-"';
      END IF;

      -- Do visited bookkeeping if visitedTable was given
      IF visitedTable IS NOT NULL THEN

        EXECUTE 'SELECT true FROM '
                || visitedTable::text
                || ' WHERE element_type = 2 AND element_id = '
                || rec2.edge_id LIMIT 1 INTO visited;
        IF visited THEN
          -- Use xlink:href if visited
          gml = gml || ' xlink:href="#' || idprefix || 'E'
                || rec2.edge_id || '" />';
          CONTINUE;
        ELSE
          -- Mark as visited otherwise
          EXECUTE 'INSERT INTO ' || visitedTable::text
                  || '(element_type, element_id) VALUES (2, '
                  || rec2.edge_id || ')';
        END IF;

      END IF;

      gml = gml || '>';

      gml = gml || topology._AsGMLEdge(rec2.edge_id, rec2.start_node,
                                       rec2.end_node, rec2.geom,
                                       visitedTable, nsprefix_in,
                                       prec, options, idprefix, gmlver);
      gml = gml || '</' || nsprefix || 'directedEdge>';

    END LOOP;
  END LOOP;

  gml = gml || '</' || nsprefix || 'Face>';

  RETURN gml;
END
$$;


--
-- TOC entry 861 (class 1255 OID 20217)
-- Name: _asgmlnode(integer, public.geometry, text, integer, integer, text, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION _asgmlnode(id integer, point public.geometry, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer) RETURNS text
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
  nsprefix text;
  gml text;
BEGIN

  nsprefix := 'gml:';
  IF NOT nsprefix_in IS NULL THEN
    IF nsprefix_in = '' THEN
      nsprefix = nsprefix_in;
    ELSE
      nsprefix = nsprefix_in || ':';
    END IF;
  END IF;

  gml := '<' || nsprefix || 'Node ' || nsprefix
         || 'id="' || idprefix || 'N' || id || '"';
  IF point IS NOT NULL THEN
    gml = gml || '>'
          || '<' || nsprefix || 'pointProperty>'
          || ST_AsGML(gmlver, point, prec, options, nsprefix_in)
          || '</' || nsprefix || 'pointProperty>'
          || '</' || nsprefix || 'Node>';
  ELSE
    gml = gml || '/>';
  END IF;
  RETURN gml;
END
$$;


--
-- TOC entry 900 (class 1255 OID 20255)
-- Name: _st_addfacesplit(character varying, integer, integer, boolean); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION _st_addfacesplit(atopology character varying, anedge integer, oface integer, mbr_only boolean) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  fan RECORD;
  newface INTEGER;
  sql TEXT;
  isccw BOOLEAN;
  ishole BOOLEAN;

BEGIN

  IF oface = 0 AND mbr_only THEN
    RETURN NULL;
  END IF;

  SELECT null::int[] as newring_edges,
         null::geometry as shell
  INTO fan;

  SELECT array_agg(edge)
  FROM topology.getringedges(atopology, anedge)
  INTO STRICT fan.newring_edges;


  -- You can't get to the other side of an edge forming a ring
  IF fan.newring_edges @> ARRAY[-anedge] THEN
    RETURN 0;
  END IF;


  sql := 'WITH ids as ( select row_number() over () as seq, edge from unnest('
         || quote_literal(fan.newring_edges::text)
         || '::int[] ) u(edge) ), edges AS ( select CASE WHEN i.edge < 0 THEN ST_Reverse(e.geom) ELSE e.geom END as g FROM ids i left join '
         || quote_ident(atopology) || '.edge_data e ON(e.edge_id = abs(i.edge)) ORDER BY seq) SELECT ST_MakePolygon(ST_MakeLine(g.g)) FROM edges g;';
  EXECUTE sql INTO fan.shell;


  isccw := NOT ST_OrderingEquals(fan.shell, ST_ForceRHR(fan.shell));


  IF oface = 0 THEN
    IF NOT isccw THEN
      RETURN NULL;
    END IF;
  END IF;

  IF mbr_only AND oface != 0 THEN
    -- Update old face mbr (nothing to do if we're opening an hole)
    IF isccw THEN -- {
      sql := 'UPDATE '
             || quote_ident(atopology) || '.face SET mbr = '
             || quote_literal(ST_Envelope(fan.shell)::text)
             || '::geometry WHERE face_id = ' || oface;
      EXECUTE sql;
    END IF; -- }
    RETURN NULL;
  END IF;

  IF oface != 0 AND NOT isccw THEN -- {
    -- Face created an hole in an outer face
    sql := 'INSERT INTO '
           || quote_ident(atopology) || '.face(mbr) SELECT mbr FROM '
           || quote_ident(atopology)
           || '.face WHERE face_id = ' || oface
           || ' RETURNING face_id';
  ELSE
    sql := 'INSERT INTO '
           || quote_ident(atopology) || '.face(mbr) VALUES ('
           || quote_literal(ST_Envelope(fan.shell)::text)
           || '::geometry) RETURNING face_id';
  END IF; -- }

  -- Insert new face
  EXECUTE sql INTO STRICT newface;

  -- Update forward edges
  sql := 'UPDATE '
         || quote_ident(atopology) || '.edge_data SET left_face = ' || newface
         || ' WHERE left_face = ' || oface || ' AND edge_id = ANY ('
         || quote_literal(array( select +(x) from unnest(fan.newring_edges) u(x) )::text)
         || ')';
  EXECUTE sql;

  -- Update backward edges
  sql := 'UPDATE '
         || quote_ident(atopology) || '.edge_data SET right_face = ' || newface
         || ' WHERE right_face = ' || oface || ' AND edge_id = ANY ('
         || quote_literal(array( select -(x) from unnest(fan.newring_edges) u(x) )::text)
         || ')';
  EXECUTE sql;

  IF oface != 0 AND NOT isccw THEN -- {
    -- face shrinked, must update all non-contained edges and nodes
    ishole := true;
  ELSE
    ishole := false;
  END IF; -- }

  -- Update edges bounding the old face
  sql := 'UPDATE '
         || quote_ident(atopology)
         || '.edge_data SET left_face = CASE WHEN left_face = '
         || oface || ' THEN ' || newface
         || ' ELSE left_face END, right_face = CASE WHEN right_face = '
         || oface || ' THEN ' || newface
         || ' ELSE right_face END WHERE ( left_face = ' || oface
         || ' OR right_face = ' || oface
         || ') AND NOT edge_id = ANY ('
         || quote_literal( array(
                               select abs(x) from unnest(fan.newring_edges) u(x)
                           )::text )
         || ') AND ';
  IF ishole THEN sql := sql || 'NOT '; END IF;
  sql := sql || 'ST_Contains(' || quote_literal(fan.shell::text)
         -- We only need to check a single point, but must not be an endpoint
         || '::geometry, ST_Line_Interpolate_Point(geom, 0.2))';
  EXECUTE sql;

  -- Update isolated nodes in new new face
  sql := 'UPDATE '
         || quote_ident(atopology) || '.node SET containing_face = ' || newface
         || ' WHERE containing_face = ' || oface
         || ' AND ';
  IF ishole THEN sql := sql || 'NOT '; END IF;
  sql := sql || 'ST_Contains(' || quote_literal(fan.shell::text) || '::geometry, geom)';
  EXECUTE sql;

  RETURN newface;

END
$$;


--
-- TOC entry 898 (class 1255 OID 20252)
-- Name: _st_adjacentedges(character varying, integer, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION _st_adjacentedges(atopology character varying, anode integer, anedge integer) RETURNS integer[]
LANGUAGE plpgsql STABLE
AS $$
DECLARE
  ret integer[];
BEGIN
  WITH edgestar AS (
      SELECT *, count(*) over () AS cnt
      FROM GetNodeEdges(atopology, anode)
  )
  SELECT ARRAY[ (
    SELECT p.edge AS prev FROM edgestar p
    WHERE p.sequence = CASE WHEN m.sequence-1 < 1 THEN cnt
                       ELSE m.sequence-1 END
  ), (
    SELECT p.edge AS prev FROM edgestar p WHERE p.sequence = ((m.sequence)%cnt)+1
  ) ]
  FROM edgestar m
  WHERE edge = anedge
  INTO ret;

  RETURN ret;
END
$$;


--
-- TOC entry 750 (class 1255 OID 20198)
-- Name: _st_mintolerance(public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION _st_mintolerance(ageom public.geometry) RETURNS double precision
LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT 3.6 * power(10,  - ( 15 - log(coalesce(
                                         nullif(
                                             greatest(abs(ST_xmin($1)), abs(ST_ymin($1)),
                                                      abs(ST_xmax($1)), abs(ST_ymax($1))),
                                             0),
                                         1)) ));
$_$;


--
-- TOC entry 864 (class 1255 OID 20199)
-- Name: _st_mintolerance(character varying, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION _st_mintolerance(atopology character varying, ageom public.geometry) RETURNS double precision
LANGUAGE plpgsql STABLE STRICT
AS $_$
DECLARE
  ret FLOAT8;
BEGIN
  SELECT COALESCE(
      NULLIF(precision, 0),
      topology._st_mintolerance($2))
  FROM topology.topology
  WHERE name = $1 INTO ret;
  IF NOT FOUND THEN
    RAISE EXCEPTION
    'No topology with name "%" in topology.topology', atopology;
  END IF;
  return ret;
END;
$_$;


--
-- TOC entry 866 (class 1255 OID 20202)
-- Name: addedge(character varying, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION addedge(atopology character varying, aline public.geometry) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  edgeid int;
  rec RECORD;
  ix geometry;
BEGIN
  --
  -- Atopology and apoint are required
  --
  IF atopology IS NULL OR aline IS NULL THEN
    RAISE EXCEPTION 'Invalid null argument';
  END IF;

  --
  -- Aline must be a linestring
  --
  IF substring(geometrytype(aline), 1, 4) != 'LINE'
  THEN
    RAISE EXCEPTION 'Edge geometry must be a linestring';
  END IF;

  --
  -- Check there's no face registered in the topology
  --
  FOR rec IN EXECUTE 'SELECT count(face_id) FROM '
                     || quote_ident(atopology) || '.face '
                     || ' WHERE face_id != 0 LIMIT 1'
  LOOP
    IF rec.count > 0 THEN
      RAISE EXCEPTION 'AddEdge can only be used against topologies with no faces defined';
    END IF;
  END LOOP;

  --
  -- Check if the edge crosses an existing node
  --
  FOR rec IN EXECUTE 'SELECT node_id FROM '
                     || quote_ident(atopology) || '.node '
                     || 'WHERE ST_Crosses('
                     || quote_literal(aline::text) || '::geometry, geom'
                     || ')'
  LOOP
    RAISE EXCEPTION 'Edge crosses node %', rec.node_id;
  END LOOP;

  --
  -- Check if the edge intersects an existing edge
  -- on anything but endpoints
  --
  -- Following DE-9 Intersection Matrix represent
  -- the only relation we accept.
  --
  --    F F 1
  --    F * *
  --    1 * 2
  --
  -- Example1: linestrings touching at one endpoint
  --    FF1 F00 102
  --    FF1 F** 1*2 <-- our match
  --
  -- Example2: linestrings touching at both endpoints
  --    FF1 F0F 1F2
  --    FF1 F** 1*2 <-- our match
  --
  FOR rec IN EXECUTE 'SELECT edge_id, geom, ST_Relate('
                     || quote_literal(aline::text)
                     || '::geometry, geom, 2) as im'
                     || ' FROM '
                     || quote_ident(atopology) || '.edge '
                     || 'WHERE '
                     || quote_literal(aline::text) || '::geometry && geom'

  LOOP

    IF ST_RelateMatch(rec.im, 'FF1F**1*2') THEN
      CONTINUE; -- no interior intersection
    END IF;

    -- Reuse an EQUAL edge (be it closed or not)
    IF ST_RelateMatch(rec.im, '1FFF*FFF2') THEN
      RETURN rec.edge_id;
    END IF;

    -- WARNING: the constructive operation might throw an exception
    BEGIN
      ix = ST_Intersection(rec.geom, aline);
      EXCEPTION
      WHEN OTHERS THEN
        RAISE NOTICE 'Could not compute intersection between input edge (%) and edge % (%)', aline::text, rec.edge_id, rec.geom::text;
    END;

    RAISE EXCEPTION 'Edge intersects (not on endpoints) with existing edge % at or near point %', rec.edge_id, ST_AsText(ST_PointOnSurface(ix));

  END LOOP;

  --
  -- Get new edge id from sequence
  --
  FOR rec IN EXECUTE 'SELECT nextval(' ||
                     quote_literal(
                         quote_ident(atopology) || '.edge_data_edge_id_seq'
                     ) || ')'
  LOOP
    edgeid = rec.nextval;
  END LOOP;

  --
  -- Insert the new row
  --
  EXECUTE 'INSERT INTO '
          || quote_ident(atopology)
          || '.edge(edge_id, start_node, end_node, '
          || 'next_left_edge, next_right_edge, '
          || 'left_face, right_face, '
          || 'geom) '
          || ' VALUES('

          -- edge_id
          || edgeid ||','

          -- start_node
          || 'topology.addNode('
          || quote_literal(atopology)
          || ', ST_StartPoint('
          || quote_literal(aline::text)
          || ')) ,'

          -- end_node
          || 'topology.addNode('
          || quote_literal(atopology)
          || ', ST_EndPoint('
          || quote_literal(aline::text)
          || ')) ,'

          -- next_left_edge
          || -edgeid ||','

          -- next_right_edge
          || edgeid ||','

          -- left_face
          || '0,'

          -- right_face
          || '0,'

          -- geom
          ||quote_literal(aline::text)
          || ')';

  RETURN edgeid;

END
$$;


--
-- TOC entry 867 (class 1255 OID 20203)
-- Name: addface(character varying, public.geometry, boolean); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION addface(atopology character varying, apoly public.geometry, force_new boolean DEFAULT false) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  bounds geometry;
  symdif geometry;
  faceid int;
  rec RECORD;
  rrec RECORD;
  relate text;
  right_edges int[];
  left_edges int[];
  all_edges geometry;
  old_faceid int;
  old_edgeid int;
  sql text;
  right_side bool;
  edgeseg geometry;
  p1 geometry;
  p2 geometry;
  p3 geometry;
  loc float8;
  segnum int;
  numsegs int;
BEGIN
  --
  -- Atopology and apoly are required
  --
  IF atopology IS NULL OR apoly IS NULL THEN
    RAISE EXCEPTION 'Invalid null argument';
  END IF;

  --
  -- Aline must be a polygon
  --
  IF substring(geometrytype(apoly), 1, 4) != 'POLY'
  THEN
    RAISE EXCEPTION 'Face geometry must be a polygon';
  END IF;

  for rrec IN SELECT (ST_DumpRings(ST_ForceRHR(apoly))).geom
  LOOP -- {
    --
    -- Find all bounds edges, forcing right-hand-rule
    -- to know what's left and what's right...
    --
    bounds = ST_Boundary(rrec.geom);

    sql := 'SELECT e.geom, e.edge_id, '
           || 'e.left_face, e.right_face FROM '
           || quote_ident(atopology) || '.edge e, (SELECT '
           || quote_literal(bounds::text)
           || '::geometry as geom) r WHERE '
           || 'r.geom && e.geom'
  ;
    -- RAISE DEBUG 'SQL: %', sql;
    FOR rec IN EXECUTE sql
    LOOP -- {
      --RAISE DEBUG 'Edge % has bounding box intersection', rec.edge_id;

      -- Find first non-empty segment of the edge
      numsegs = ST_NumPoints(rec.geom);
      segnum = 1;
      WHILE segnum < numsegs LOOP
        p1 = ST_PointN(rec.geom, segnum);
        p2 = ST_PointN(rec.geom, segnum+1);
        IF ST_Distance(p1, p2) > 0 THEN
          EXIT;
        END IF;
        segnum = segnum + 1;
      END LOOP;

      IF segnum = numsegs THEN
        RAISE WARNING 'Edge % is collapsed', rec.edge_id;
        CONTINUE; -- we don't want to spend time on it
      END IF;

      edgeseg = ST_MakeLine(p1, p2);

      -- Skip non-covered edges
      IF NOT ST_Equals(p2, ST_EndPoint(rec.geom)) THEN
        IF NOT ( _ST_Intersects(bounds, p1) AND _ST_Intersects(bounds, p2) )
        THEN
          --RAISE DEBUG 'Edge % has points % and % not intersecting with ring bounds', rec.edge_id, st_astext(p1), st_astext(p2);
          CONTINUE;
        END IF;
      ELSE
        -- must be a 2-points only edge, let's use Covers (more expensive)
        IF NOT _ST_Covers(bounds, edgeseg) THEN
          --RAISE DEBUG 'Edge % is not covered by ring', rec.edge_id;
          CONTINUE;
        END IF;
      END IF;

      p3 = ST_StartPoint(bounds);
      IF ST_DWithin(edgeseg, p3, 0) THEN
        -- Edge segment covers ring endpoint, See bug #874
        loc = ST_Line_Locate_Point(edgeseg, p3);
        -- WARNING: this is as robust as length of edgeseg allows...
        IF loc > 0.9 THEN
          -- shift last point down
          p2 = ST_Line_Interpolate_Point(edgeseg, loc - 0.1);
        ELSIF loc < 0.1 THEN
          -- shift first point up
          p1 = ST_Line_Interpolate_Point(edgeseg, loc + 0.1);
        ELSE
          -- when ring start point is in between, we swap the points
          p3 = p1; p1 = p2; p2 = p3;
        END IF;
      END IF;

      right_side = ST_Line_Locate_Point(bounds, p1) <
                   ST_Line_Locate_Point(bounds, p2);


      IF right_side THEN
        right_edges := array_append(right_edges, rec.edge_id);
        old_faceid = rec.right_face;
      ELSE
        left_edges := array_append(left_edges, rec.edge_id);
        old_faceid = rec.left_face;
      END IF;

      IF faceid IS NULL OR faceid = 0 THEN
        faceid = old_faceid;
        old_edgeid = rec.edge_id;
      ELSIF faceid != old_faceid THEN
        RAISE EXCEPTION 'Edge % has face % registered on the side of this face, while edge % has face % on the same side', rec.edge_id, old_faceid, old_edgeid, faceid;
      END IF;

      -- Collect all edges for final full coverage check
      all_edges = ST_Collect(all_edges, rec.geom);

    END LOOP; -- }
  END LOOP; -- }

  IF all_edges IS NULL THEN
    RAISE EXCEPTION 'Found no edges on the polygon boundary';
  END IF;


  --
  -- Check that all edges found, taken togheter,
  -- fully match the ring boundary and nothing more
  --
  -- If the test fail either we need to add more edges
  -- from the polygon ring or we need to split
  -- some of the existing ones.
  --
  bounds = ST_Boundary(apoly);
  IF NOT ST_isEmpty(ST_SymDifference(bounds, all_edges)) THEN
    IF NOT ST_isEmpty(ST_Difference(bounds, all_edges)) THEN
      RAISE EXCEPTION 'Polygon boundary is not fully defined by existing edges at or near point %', ST_AsText(ST_PointOnSurface(ST_Difference(bounds, all_edges)));
    ELSE
      RAISE EXCEPTION 'Existing edges cover polygon boundary and more at or near point % (invalid topology?)', ST_AsText(ST_PointOnSurface(ST_Difference(all_edges, bounds)));
    END IF;
  END IF;

  IF faceid IS NOT NULL AND faceid != 0 THEN
    IF NOT force_new THEN
      RETURN faceid;
    ELSE
    END IF;
  END IF;

  --
  -- Get new face id from sequence
  --
  FOR rec IN EXECUTE 'SELECT nextval(' ||
                     quote_literal(
                         quote_ident(atopology) || '.face_face_id_seq'
                     ) || ')'
  LOOP
    faceid = rec.nextval;
  END LOOP;

  --
  -- Insert new face
  --
  EXECUTE 'INSERT INTO '
          || quote_ident(atopology)
          || '.face(face_id, mbr) VALUES('
          -- face_id
          || faceid || ','
          -- minimum bounding rectangle
          || quote_literal(ST_Envelope(apoly)::text)
          || ')';

  --
  -- Update all edges having this face on the left
  --
  IF left_edges IS NOT NULL THEN
    EXECUTE 'UPDATE '
            || quote_ident(atopology)
            || '.edge_data SET left_face = '
            || quote_literal(faceid)
            || ' WHERE edge_id = ANY('
            || quote_literal(left_edges)
            || ') ';
  END IF;

  --
  -- Update all edges having this face on the right
  --
  IF right_edges IS NOT NULL THEN
    EXECUTE 'UPDATE '
            || quote_ident(atopology)
            || '.edge_data SET right_face = '
            || quote_literal(faceid)
            || ' WHERE edge_id = ANY('
            || quote_literal(right_edges)
            || ') ';
  END IF;


  --
  -- Set left_face/right_face of any contained edge
  --
  EXECUTE 'UPDATE '
          || quote_ident(atopology)
          || '.edge_data SET right_face = '
          || quote_literal(faceid)
          || ', left_face = '
          || quote_literal(faceid)
          || ' WHERE ST_Contains('
          || quote_literal(apoly::text)
          || ', geom)';

  --
  -- Set containing_face of any contained node
  --
  EXECUTE 'UPDATE '
          || quote_ident(atopology)
          || '.node SET containing_face = '
          || quote_literal(faceid)
          || ' WHERE containing_face IS NOT NULL AND ST_Contains('
          || quote_literal(apoly::text)
          || ', geom)';

  RETURN faceid;

END
$$;


--
-- TOC entry 751 (class 1255 OID 20201)
-- Name: addnode(character varying, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION addnode(atopology character varying, apoint public.geometry) RETURNS integer
LANGUAGE sql
AS $_$
SELECT topology.AddNode($1, $2, false, false);
$_$;


--
-- TOC entry 865 (class 1255 OID 20200)
-- Name: addnode(character varying, public.geometry, boolean, boolean); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION addnode(atopology character varying, apoint public.geometry, allowedgesplitting boolean, setcontainingface boolean DEFAULT false) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  nodeid int;
  rec RECORD;
  containing_face int;
BEGIN
  --
  -- Atopology and apoint are required
  --
  IF atopology IS NULL OR apoint IS NULL THEN
    RAISE EXCEPTION 'Invalid null argument';
  END IF;

  --
  -- Apoint must be a point
  --
  IF substring(geometrytype(apoint), 1, 5) != 'POINT'
  THEN
    RAISE EXCEPTION 'Node geometry must be a point';
  END IF;

  --
  -- Check if a coincident node already exists
  --
  -- We use index AND x/y equality
  --
  FOR rec IN EXECUTE 'SELECT node_id FROM '
                     || quote_ident(atopology) || '.node ' ||
                     'WHERE geom && ' || quote_literal(apoint::text) || '::geometry'
                     ||' AND ST_X(geom) = ST_X('||quote_literal(apoint::text)||'::geometry)'
                     ||' AND ST_Y(geom) = ST_Y('||quote_literal(apoint::text)||'::geometry)'
  LOOP
    RETURN  rec.node_id;
  END LOOP;

  --
  -- Check if any edge crosses this node
  -- (endpoints are fine)
  --
  FOR rec IN EXECUTE 'SELECT edge_id FROM '
                     || quote_ident(atopology) || '.edge '
                     || 'WHERE ST_DWithin('
                     || quote_literal(apoint::text)
                     || ', geom, 0) AND NOT ST_Equals('
                     || quote_literal(apoint::text)
                     || ', ST_StartPoint(geom)) AND NOT ST_Equals('
                     || quote_literal(apoint::text)
                     || ', ST_EndPoint(geom))'
  LOOP
    IF allowEdgeSplitting THEN
      RETURN ST_ModEdgeSplit(atopology, rec.edge_id, apoint);
    ELSE
      RAISE EXCEPTION 'An edge crosses the given node.';
    END IF;
  END LOOP;

  IF setContainingFace THEN
    containing_face := topology.GetFaceByPoint(atopology, apoint, 0);
  ELSE
    containing_face := NULL;
  END IF;

  --
  -- Get new node id from sequence
  --
  FOR rec IN EXECUTE 'SELECT nextval(' ||
                     quote_literal(
                         quote_ident(atopology) || '.node_node_id_seq'
                     ) || ')'
  LOOP
    nodeid = rec.nextval;
  END LOOP;

  --
  -- Insert the new row
  --
  EXECUTE 'INSERT INTO ' || quote_ident(atopology)
          || '.node(node_id, containing_face, geom)
		VALUES(' || nodeid || ',' || coalesce(containing_face::text, 'NULL') || ','
          || quote_literal(apoint::text) || ')';

  RETURN nodeid;

END
$$;


--
-- TOC entry 698 (class 1255 OID 20169)
-- Name: addtopogeometrycolumn(character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION addtopogeometrycolumn(character varying, character varying, character varying, character varying, character varying) RETURNS integer
LANGUAGE sql
AS $_$
SELECT topology.AddTopoGeometryColumn($1, $2, $3, $4, $5, NULL);
$_$;


--
-- TOC entry 840 (class 1255 OID 20168)
-- Name: addtopogeometrycolumn(character varying, character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION addtopogeometrycolumn(toponame character varying, schema character varying, tbl character varying, col character varying, ltype character varying, child integer) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  intltype integer;
  newlevel integer;
  topoid integer;
  rec RECORD;
  newlayer_id integer;
  query text;
BEGIN

  -- Get topology id
  SELECT id FROM topology.topology into topoid
  WHERE name = toponame;

  IF topoid IS NULL THEN
    RAISE EXCEPTION 'Topology % does not exist', toponame;
  END IF;

  IF ltype ILIKE '%POINT%' OR ltype ILIKE 'PUNTAL' THEN
    intltype = 1;
  ELSIF ltype ILIKE '%LINE%' OR ltype ILIKE 'LINEAL' THEN
    intltype = 2;
  ELSIF ltype ILIKE '%POLYGON%' OR ltype ILIKE 'AREAL' THEN
    intltype = 3;
  ELSIF ltype ILIKE '%COLLECTION%' OR ltype ILIKE 'GEOMETRY' THEN
    intltype = 4;
  ELSE
    RAISE EXCEPTION 'Layer type must be one of POINT,LINE,POLYGON,COLLECTION';
  END IF;

  --
  -- Add new TopoGeometry column in schema.table
  --
  EXECUTE 'ALTER TABLE ' || quote_ident(schema)
          || '.' || quote_ident(tbl)
          || ' ADD COLUMN ' || quote_ident(col)
          || ' topology.TopoGeometry;';


  --
  -- See if child id exists and extract its level
  --
  IF child IS NOT NULL THEN
    SELECT level + 1 FROM topology.layer
    WHERE layer_id = child
    INTO newlevel;
    IF newlevel IS NULL THEN
      RAISE EXCEPTION 'Child layer % does not exist in topology "%"', child, toponame;
    END IF;
  END IF;

  --
  -- Get new layer id from sequence
  --
  EXECUTE 'SELECT nextval(' ||
          quote_literal(
              quote_ident(toponame) || '.layer_id_seq'
          ) || ')' INTO STRICT newlayer_id;

  EXECUTE 'INSERT INTO '
          || 'topology.layer(topology_id, '
          || 'layer_id, level, child_id, schema_name, '
          || 'table_name, feature_column, feature_type) '
          || 'VALUES ('
          || topoid || ','
          || newlayer_id || ',' || COALESCE(newlevel, 0) || ','
          || COALESCE(child::text, 'NULL') || ','
          || quote_literal(schema) || ','
          || quote_literal(tbl) || ','
          || quote_literal(col) || ','
          || intltype || ');';


  --
  -- Create a sequence for TopoGeometries in this new layer
  --
  EXECUTE 'CREATE SEQUENCE ' || quote_ident(toponame)
          || '.topogeo_s_' || newlayer_id;

  --
  -- Add constraints on TopoGeom column
  --
  EXECUTE 'ALTER TABLE ' || quote_ident(schema)
          || '.' || quote_ident(tbl)
          || ' ADD CONSTRAINT "check_topogeom_' || col || '" CHECK ('
          || 'topology_id(' || quote_ident(col) || ') = ' || topoid
          || ' AND '
          || 'layer_id(' || quote_ident(col) || ') = ' || newlayer_id
          || ' AND '
          || 'type(' || quote_ident(col) || ') = ' || intltype
          || ');';

  --
  -- Add dependency of the feature column on the topology schema
  --
  query = 'INSERT INTO pg_catalog.pg_depend SELECT '
          || 'fcat.oid, fobj.oid, fsub.attnum, tcat.oid, '
          || 'tobj.oid, 0, ''n'' '
          || 'FROM pg_class fcat, pg_namespace fnsp, '
          || ' pg_class fobj, pg_attribute fsub, '
          || ' pg_class tcat, pg_namespace tobj '
          || ' WHERE fcat.relname = ''pg_class'' '
          || ' AND fnsp.nspname = ' || quote_literal(schema)
          || ' AND fobj.relnamespace = fnsp.oid '
          || ' AND fobj.relname = ' || quote_literal(tbl)
          || ' AND fsub.attrelid = fobj.oid '
          || ' AND fsub.attname = ' || quote_literal(col)
          || ' AND tcat.relname = ''pg_namespace'' '
          || ' AND tobj.nspname = ' || quote_literal(toponame);

  --
  -- The only reason to add this dependency is to avoid
  -- simple drop of a feature column. Still, drop cascade
  -- will remove both the feature column and the sequence
  -- corrupting the topology anyway ...
  --

  RETURN newlayer_id;
END;
$$;


--
-- TOC entry 689 (class 1255 OID 20264)
-- Name: addtosearchpath(character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION addtosearchpath(a_schema_name character varying) RETURNS text
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  var_result text;
  var_cur_search_path text;
BEGIN
  SELECT reset_val INTO var_cur_search_path FROM pg_settings WHERE name = 'search_path';
  IF var_cur_search_path LIKE '%' || quote_ident(a_schema_name) || '%' THEN
    var_result := a_schema_name || ' already in database search_path';
  ELSE
    EXECUTE 'ALTER DATABASE ' || quote_ident(current_database()) || ' SET search_path = ' || var_cur_search_path || ', ' || quote_ident(a_schema_name);
    var_result := a_schema_name || ' has been added to end of database search_path ';
  END IF;

  RETURN var_result;
END
$$;


--
-- TOC entry 791 (class 1255 OID 20228)
-- Name: asgml(topogeometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION asgml(tg topogeometry) RETURNS text
LANGUAGE sql STABLE
AS $_$
SELECT topology.AsGML($1, 'gml');
$_$;


--
-- TOC entry 883 (class 1255 OID 20226)
-- Name: asgml(topogeometry, regclass); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION asgml(tg topogeometry, visitedtable regclass) RETURNS text
LANGUAGE sql
AS $_$
SELECT topology.AsGML($1, 'gml', 15, 1, $2);
$_$;


--
-- TOC entry 882 (class 1255 OID 20225)
-- Name: asgml(topogeometry, text); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION asgml(tg topogeometry, nsprefix text) RETURNS text
LANGUAGE sql STABLE
AS $_$
SELECT topology.AsGML($1, $2, 15, 1, NULL);
$_$;


--
-- TOC entry 884 (class 1255 OID 20227)
-- Name: asgml(topogeometry, regclass, text); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION asgml(tg topogeometry, visitedtable regclass, nsprefix text) RETURNS text
LANGUAGE sql
AS $_$
SELECT topology.AsGML($1, $3, 15, 1, $2);
$_$;


--
-- TOC entry 881 (class 1255 OID 20224)
-- Name: asgml(topogeometry, text, integer, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION asgml(tg topogeometry, nsprefix text, prec integer, opts integer) RETURNS text
LANGUAGE sql STABLE
AS $_$
SELECT topology.AsGML($1, $2, $3, $4, NULL);
$_$;


--
-- TOC entry 880 (class 1255 OID 20223)
-- Name: asgml(topogeometry, text, integer, integer, regclass); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION asgml(tg topogeometry, nsprefix text, prec integer, options integer, vis regclass) RETURNS text
LANGUAGE sql
AS $_$
SELECT topology.AsGML($1, $2, $3, $4, $5, '');
$_$;


--
-- TOC entry 879 (class 1255 OID 20222)
-- Name: asgml(topogeometry, text, integer, integer, regclass, text); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION asgml(tg topogeometry, nsprefix text, prec integer, options integer, visitedtable regclass, idprefix text) RETURNS text
LANGUAGE sql
AS $_$
SELECT topology.AsGML($1, $2, $3, $4, $5, $6, 3);
$_$;


--
-- TOC entry 790 (class 1255 OID 20220)
-- Name: asgml(topogeometry, text, integer, integer, regclass, text, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION asgml(tg topogeometry, nsprefix_in text, precision_in integer, options_in integer, visitedtable regclass, idprefix text, gmlver integer) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  nsprefix text;
  precision int;
  options int;
  visited bool;
  toponame text;
  gml text;
  sql text;
  rec RECORD;
  rec2 RECORD;
  --bounds geometry;
  side int;
BEGIN

  nsprefix := 'gml:';
  IF nsprefix_in IS NOT NULL THEN
    IF nsprefix_in = '' THEN
      nsprefix = nsprefix_in;
    ELSE
      nsprefix = nsprefix_in || ':';
    END IF;
  END IF;

  precision := 15;
  IF precision_in IS NOT NULL THEN
    precision = precision_in;
  END IF;

  options := 1;
  IF options_in IS NOT NULL THEN
    options = options_in;
  END IF;

  -- Get topology name (for subsequent queries)
  SELECT name FROM topology.topology into toponame
  WHERE id = tg.topology_id;

  -- Puntual TopoGeometry
  IF tg.type = 1 THEN
    gml = '<' || nsprefix || 'TopoPoint>';
    -- For each defining node, print a directedNode
    FOR rec IN  EXECUTE 'SELECT r.element_id, n.geom from '
                        || quote_ident(toponame) || '.relation r LEFT JOIN '
                        || quote_ident(toponame) || '.node n ON (r.element_id = n.node_id)'
                        || ' WHERE r.layer_id = ' || tg.layer_id
                        || ' AND r.topogeo_id = ' || tg.id
    LOOP
      gml = gml || '<' || nsprefix || 'directedNode';
      -- Do visited bookkeeping if visitedTable was given
      IF visitedTable IS NOT NULL THEN
        EXECUTE 'SELECT true FROM '
                || visitedTable::text
                || ' WHERE element_type = 1 AND element_id = '
                || rec.element_id LIMIT 1 INTO visited;
        IF visited IS NOT NULL THEN
          gml = gml || ' xlink:href="#' || idprefix || 'N' || rec.element_id || '" />';
          CONTINUE;
        ELSE
          -- Mark as visited
          EXECUTE 'INSERT INTO ' || visitedTable::text
                  || '(element_type, element_id) VALUES (1, '
                  || rec.element_id || ')';
        END IF;
      END IF;
      gml = gml || '>';
      gml = gml || topology._AsGMLNode(rec.element_id, rec.geom, nsprefix_in, precision, options, idprefix, gmlver);
      gml = gml || '</' || nsprefix || 'directedNode>';
    END LOOP;
    gml = gml || '</' || nsprefix || 'TopoPoint>';
    RETURN gml;

  ELSIF tg.type = 2 THEN -- lineal
    gml = '<' || nsprefix || 'TopoCurve>';

    FOR rec IN SELECT (ST_Dump(topology.Geometry(tg))).geom
    LOOP
      FOR rec2 IN EXECUTE
      'SELECT e.*, ST_Line_Locate_Point('
      || quote_literal(rec.geom::text)
      || ', ST_Line_Interpolate_Point(e.geom, 0.2)) as pos'
      || ', ST_Line_Locate_Point('
      || quote_literal(rec.geom::text)
      || ', ST_Line_Interpolate_Point(e.geom, 0.8)) as pos2 FROM '
      || quote_ident(toponame)
      || '.edge e WHERE ST_Covers('
      || quote_literal(rec.geom::text)
      || ', e.geom) ORDER BY pos'
        -- TODO: add relation to the conditional, to reduce load ?
      LOOP

        gml = gml || '<' || nsprefix || 'directedEdge';

        -- if this edge goes in opposite direction to the
        --       line, make it with negative orientation
        IF rec2.pos2 < rec2.pos THEN -- edge goes in opposite direction
          gml = gml || ' orientation="-"';
        END IF;

        -- Do visited bookkeeping if visitedTable was given
        IF visitedTable IS NOT NULL THEN

          EXECUTE 'SELECT true FROM '
                  || visitedTable::text
                  || ' WHERE element_type = 2 AND element_id = '
                  || rec2.edge_id LIMIT 1 INTO visited;
          IF visited THEN
            -- Use xlink:href if visited
            gml = gml || ' xlink:href="#' || idprefix || 'E' || rec2.edge_id || '" />';
            CONTINUE;
          ELSE
            -- Mark as visited otherwise
            EXECUTE 'INSERT INTO ' || visitedTable::text
                    || '(element_type, element_id) VALUES (2, '
                    || rec2.edge_id || ')';
          END IF;

        END IF;


        gml = gml || '>';

        gml = gml || topology._AsGMLEdge(rec2.edge_id,
                                         rec2.start_node,
                                         rec2.end_node, rec2.geom,
                                         visitedTable,
                                         nsprefix_in, precision,
                                         options, idprefix, gmlver);


        gml = gml || '</' || nsprefix || 'directedEdge>';
      END LOOP;
    END LOOP;

    gml = gml || '</' || nsprefix || 'TopoCurve>';
    return gml;

  ELSIF tg.type = 3 THEN -- areal
    gml = '<' || nsprefix || 'TopoSurface>';

    -- For each defining face, print a directedFace
    FOR rec IN  EXECUTE 'SELECT f.face_id from '
                        || quote_ident(toponame) || '.relation r LEFT JOIN '
                        || quote_ident(toponame) || '.face f ON (r.element_id = f.face_id)'
                        || ' WHERE r.layer_id = ' || tg.layer_id
                        || ' AND r.topogeo_id = ' || tg.id
    LOOP
      gml = gml || '<' || nsprefix || 'directedFace';
      -- Do visited bookkeeping if visitedTable was given
      IF visitedTable IS NOT NULL THEN
        EXECUTE 'SELECT true FROM '
                || visitedTable::text
                || ' WHERE element_type = 3 AND element_id = '
                || rec.face_id LIMIT 1 INTO visited;
        IF visited IS NOT NULL THEN
          gml = gml || ' xlink:href="#' || idprefix || 'F' || rec.face_id || '" />';
          CONTINUE;
        ELSE
          -- Mark as visited
          EXECUTE 'INSERT INTO ' || visitedTable::text
                  || '(element_type, element_id) VALUES (3, '
                  || rec.face_id || ')';
        END IF;
      END IF;
      gml = gml || '>';
      gml = gml || topology._AsGMLFace(toponame, rec.face_id, visitedTable,
                                       nsprefix_in, precision,
                                       options, idprefix, gmlver);
      gml = gml || '</' || nsprefix || 'directedFace>';
    END LOOP;
    gml = gml || '</' || nsprefix || 'TopoSurface>';
    RETURN gml;

  ELSIF tg.type = 4 THEN -- collection
    RAISE EXCEPTION 'Collection TopoGeometries are not supported by AsGML';

  END IF;


  RETURN gml;

END
$$;


--
-- TOC entry 858 (class 1255 OID 20191)
-- Name: copytopology(character varying, character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION copytopology(atopology character varying, newtopo character varying) RETURNS integer
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  rec RECORD;
  rec2 RECORD;
  oldtopo_id integer;
  newtopo_id integer;
  n int4;
  ret text;
BEGIN

  SELECT * FROM topology.topology where name = atopology
  INTO strict rec;
  oldtopo_id = rec.id;
  -- TODO: more gracefully handle unexistent topology

  SELECT topology.CreateTopology(newtopo, rec.SRID, rec.precision, rec.hasZ)
  INTO strict newtopo_id;

  -- Copy faces
  EXECUTE 'INSERT INTO ' || quote_ident(newtopo)
          || '.face SELECT * FROM ' || quote_ident(atopology)
          || '.face WHERE face_id != 0';
  -- Update faces sequence
  EXECUTE 'SELECT setval(' || quote_literal(
      quote_ident(newtopo) || '.face_face_id_seq'
  ) || ', (SELECT last_value FROM '
          || quote_ident(atopology) || '.face_face_id_seq))';

  -- Copy nodes
  EXECUTE 'INSERT INTO ' || quote_ident(newtopo)
          || '.node SELECT * FROM ' || quote_ident(atopology)
          || '.node';
  -- Update node sequence
  EXECUTE 'SELECT setval(' || quote_literal(
      quote_ident(newtopo) || '.node_node_id_seq'
  ) || ', (SELECT last_value FROM '
          || quote_ident(atopology) || '.node_node_id_seq))';

  -- Copy edges
  EXECUTE 'INSERT INTO ' || quote_ident(newtopo)
          || '.edge_data SELECT * FROM ' || quote_ident(atopology)
          || '.edge_data';
  -- Update edge sequence
  EXECUTE 'SELECT setval(' || quote_literal(
      quote_ident(newtopo) || '.edge_data_edge_id_seq'
  ) || ', (SELECT last_value FROM '
          || quote_ident(atopology) || '.edge_data_edge_id_seq))';

  -- Copy layers and their TopoGeometry sequences
  FOR rec IN SELECT * FROM topology.layer WHERE topology_id = oldtopo_id
  LOOP
    INSERT INTO topology.layer (topology_id, layer_id, feature_type,
                                level, child_id, schema_name, table_name, feature_column)
    VALUES (newtopo_id, rec.layer_id, rec.feature_type,
            rec.level, rec.child_id, newtopo,
            'LAYER' ||  rec.layer_id, '');
    -- Create layer's TopoGeometry sequences
    EXECUTE 'SELECT last_value FROM '
            || quote_ident(atopology) || '.topogeo_s_' || rec.layer_id
    INTO STRICT n;
    EXECUTE 'CREATE SEQUENCE ' || quote_ident(newtopo)
            || '.topogeo_s_' || rec.layer_id;
    EXECUTE 'SELECT setval(' || quote_literal(
        quote_ident(newtopo) || '.topogeo_s_' || rec.layer_id
    ) || ', ' || n || ')';
  END LOOP;

  -- Copy TopoGeometry definitions
  EXECUTE 'INSERT INTO ' || quote_ident(newtopo)
          || '.relation SELECT * FROM ' || quote_ident(atopology)
          || '.relation';

  RETURN newtopo_id;
END
$$;


--
-- TOC entry 848 (class 1255 OID 20172)
-- Name: createtopogeom(character varying, integer, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION createtopogeom(toponame character varying, tg_type integer, layer_id integer) RETURNS topogeometry
LANGUAGE sql STRICT
AS $_$
SELECT topology.CreateTopoGeom($1,$2,$3,'{{0,0}}');
$_$;


--
-- TOC entry 847 (class 1255 OID 20171)
-- Name: createtopogeom(character varying, integer, integer, topoelementarray); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION createtopogeom(toponame character varying, tg_type integer, layer_id integer, tg_objs topoelementarray) RETURNS topogeometry
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  i integer;
  dims varchar;
  outerdims varchar;
  innerdims varchar;
  obj_type integer;
  obj_id integer;
  ret topology.TopoGeometry;
  rec RECORD;
  layertype integer;
  layerlevel integer;
  layerchild integer;
BEGIN

  IF tg_type < 1 OR tg_type > 4 THEN
    RAISE EXCEPTION 'Invalid TopoGeometry type % (must be in the range 1..4)', tg_type;
  END IF;

  -- Get topology id into return TopoGeometry
  SELECT id FROM topology.topology into ret.topology_id
  WHERE name = toponame;

  --
  -- Get layer info
  --
  layertype := NULL;
  FOR rec IN EXECUTE 'SELECT * FROM topology.layer'
                     || ' WHERE topology_id = ' || ret.topology_id
                     || ' AND layer_id = ' || layer_id
  LOOP
    layertype = rec.feature_type;
    layerlevel = rec.level;
    layerchild = rec.child_id;
  END LOOP;

  -- Check for existence of given layer id
  IF layertype IS NULL THEN
    RAISE EXCEPTION 'No layer with id % is registered with topology %', layer_id, toponame;
  END IF;

  -- Verify compatibility between layer geometry type and
  -- TopoGeom requested geometry type
  IF layertype != 4 and layertype != tg_type THEN
    RAISE EXCEPTION 'A Layer of type % cannot contain a TopoGeometry of type %', layertype, tg_type;
  END IF;

  -- Set layer id and type in return object
  ret.layer_id = layer_id;
  ret.type = tg_type;

  --
  -- Get new TopoGeo id from sequence
  --
  FOR rec IN EXECUTE 'SELECT nextval(' ||
                     quote_literal(
                         quote_ident(toponame) || '.topogeo_s_' || layer_id
                     ) || ')'
  LOOP
    ret.id = rec.nextval;
  END LOOP;

  -- Loop over outer dimension
  i = array_lower(tg_objs, 1);
  LOOP
    obj_id = tg_objs[i][1];
    obj_type = tg_objs[i][2];

    -- Elements of type 0 represent emptiness, just skip them
    IF obj_type = 0 THEN
      IF obj_id != 0 THEN
        RAISE EXCEPTION 'Malformed empty topo element {0,%} -- id must be 0 as well', obj_id;
      END IF;
    ELSE
      IF layerlevel = 0 THEN -- array specifies lower-level objects
        IF tg_type != 4 and tg_type != obj_type THEN
          RAISE EXCEPTION 'A TopoGeometry of type % cannot contain topology elements of type %', tg_type, obj_type;
        END IF;
      ELSE -- array specifies lower-level topogeometries
        IF obj_type != layerchild THEN
          RAISE EXCEPTION 'TopoGeom element layer do not match TopoGeom child layer';
        END IF;
        -- TODO: verify that the referred TopoGeometry really
        -- exists in the relation table ?
      END IF;

      --RAISE NOTICE 'obj:% type:% id:%', i, obj_type, obj_id;

      --
      -- Insert record into the Relation table
      --
      EXECUTE 'INSERT INTO '||quote_ident(toponame)
              || '.relation(topogeo_id, layer_id, '
              || 'element_id,element_type) '
              || ' VALUES ('||ret.id
              ||','||ret.layer_id
              || ',' || obj_id || ',' || obj_type || ');';
    END IF;

    i = i+1;
    IF i > array_upper(tg_objs, 1) THEN
      EXIT;
    END IF;
  END LOOP;

  RETURN ret;

END
$$;


--
-- TOC entry 776 (class 1255 OID 20188)
-- Name: createtopology(character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION createtopology(character varying) RETURNS integer
LANGUAGE sql STRICT
AS $_$ SELECT topology.CreateTopology($1, ST_SRID('POINT EMPTY'::geometry), 0); $_$;


--
-- TOC entry 775 (class 1255 OID 20187)
-- Name: createtopology(character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION createtopology(character varying, integer) RETURNS integer
LANGUAGE sql STRICT
AS $_$ SELECT topology.CreateTopology($1, $2, 0); $_$;


--
-- TOC entry 774 (class 1255 OID 20186)
-- Name: createtopology(character varying, integer, double precision); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION createtopology(toponame character varying, srid integer, prec double precision) RETURNS integer
LANGUAGE sql STRICT
AS $_$ SELECT topology.CreateTopology($1, $2, $3, false);$_$;


--
-- TOC entry 773 (class 1255 OID 20184)
-- Name: createtopology(character varying, integer, double precision, boolean); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION createtopology(atopology character varying, srid integer, prec double precision, hasz boolean) RETURNS integer
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  rec RECORD;
  topology_id integer;
  ndims integer;
BEGIN

  --  FOR rec IN SELECT * FROM pg_namespace WHERE text(nspname) = atopology
  --  LOOP
  --    RAISE EXCEPTION 'SQL/MM Spatial exception - schema already exists';
  --  END LOOP;

  ndims = 2;
  IF hasZ THEN ndims = 3; END IF;

  ------ Fetch next id for the new topology
  FOR rec IN SELECT nextval('topology.topology_id_seq')
  LOOP
    topology_id = rec.nextval;
  END LOOP;


  EXECUTE 'CREATE SCHEMA ' || quote_ident(atopology);

  -------------{ face CREATION
  EXECUTE
  'CREATE TABLE ' || quote_ident(atopology) || '.face ('
  || 'face_id SERIAL,'
  || ' CONSTRAINT face_primary_key PRIMARY KEY(face_id)'
  || ');';

  -- Add mbr column to the face table
  EXECUTE
  'SELECT AddGeometryColumn('||quote_literal(atopology)
  ||',''face'',''mbr'','||quote_literal(srid)
  ||',''POLYGON'',2)'; -- 2d only mbr is good enough

  -------------} END OF face CREATION


  --------------{ node CREATION

  EXECUTE
  'CREATE TABLE ' || quote_ident(atopology) || '.node ('
  || 'node_id SERIAL,'
  --|| 'geom GEOMETRY,'
  || 'containing_face INTEGER,'

  || 'CONSTRAINT node_primary_key PRIMARY KEY(node_id),'

  --|| 'CONSTRAINT node_geometry_type CHECK '
  --|| '( GeometryType(geom) = ''POINT'' ),'

  || 'CONSTRAINT face_exists FOREIGN KEY(containing_face) '
  || 'REFERENCES ' || quote_ident(atopology) || '.face(face_id)'

  || ');';

  -- Add geometry column to the node table
  EXECUTE
  'SELECT AddGeometryColumn('||quote_literal(atopology)
  ||',''node'',''geom'','||quote_literal(srid)
  ||',''POINT'',' || ndims || ')';

  --------------} END OF node CREATION

  --------------{ edge CREATION

  -- edge_data table
  EXECUTE
  'CREATE TABLE ' || quote_ident(atopology) || '.edge_data ('
  || 'edge_id SERIAL NOT NULL PRIMARY KEY,'
  || 'start_node INTEGER NOT NULL,'
  || 'end_node INTEGER NOT NULL,'
  || 'next_left_edge INTEGER NOT NULL,'
  || 'abs_next_left_edge INTEGER NOT NULL,'
  || 'next_right_edge INTEGER NOT NULL,'
  || 'abs_next_right_edge INTEGER NOT NULL,'
  || 'left_face INTEGER NOT NULL,'
  || 'right_face INTEGER NOT NULL,'
  --|| 'geom GEOMETRY NOT NULL,'

  --|| 'CONSTRAINT edge_geometry_type CHECK '
  --|| '( GeometryType(geom) = ''LINESTRING'' ),'

  || 'CONSTRAINT start_node_exists FOREIGN KEY(start_node)'
  || ' REFERENCES ' || quote_ident(atopology) || '.node(node_id),'

  || 'CONSTRAINT end_node_exists FOREIGN KEY(end_node) '
  || ' REFERENCES ' || quote_ident(atopology) || '.node(node_id),'

  || 'CONSTRAINT left_face_exists FOREIGN KEY(left_face) '
  || 'REFERENCES ' || quote_ident(atopology) || '.face(face_id),'

  || 'CONSTRAINT right_face_exists FOREIGN KEY(right_face) '
  || 'REFERENCES ' || quote_ident(atopology) || '.face(face_id),'

  || 'CONSTRAINT next_left_edge_exists FOREIGN KEY(abs_next_left_edge)'
  || ' REFERENCES ' || quote_ident(atopology)
  || '.edge_data(edge_id)'
  || ' DEFERRABLE INITIALLY DEFERRED,'

  || 'CONSTRAINT next_right_edge_exists '
  || 'FOREIGN KEY(abs_next_right_edge)'
  || ' REFERENCES ' || quote_ident(atopology)
  || '.edge_data(edge_id) '
  || ' DEFERRABLE INITIALLY DEFERRED'
  || ');';

  -- Add geometry column to the edge_data table
  EXECUTE
  'SELECT AddGeometryColumn('||quote_literal(atopology)
  ||',''edge_data'',''geom'','||quote_literal(srid)
  ||',''LINESTRING'',' || ndims || ')';


  -- edge standard view (select rule)
  EXECUTE 'CREATE VIEW ' || quote_ident(atopology)
          || '.edge AS SELECT '
          || ' edge_id, start_node, end_node, next_left_edge, '
          || ' next_right_edge, '
          || ' left_face, right_face, geom FROM '
          || quote_ident(atopology) || '.edge_data';

  -- edge standard view description
  EXECUTE 'COMMENT ON VIEW ' || quote_ident(atopology)
          || '.edge IS '
          || '''Contains edge topology primitives''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
          || '.edge.edge_id IS '
          || '''Unique identifier of the edge''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
          || '.edge.start_node IS '
          || '''Unique identifier of the node at the start of the edge''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
          || '.edge.end_node IS '
          || '''Unique identifier of the node at the end of the edge''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
          || '.edge.next_left_edge IS '
          || '''Unique identifier of the next edge of the face on the left (when looking in the direction from START_NODE to END_NODE), moving counterclockwise around the face boundary''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
          || '.edge.next_right_edge IS '
          || '''Unique identifier of the next edge of the face on the right (when looking in the direction from START_NODE to END_NODE), moving counterclockwise around the face boundary''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
          || '.edge.left_face IS '
          || '''Unique identifier of the face on the left side of the edge when looking in the direction from START_NODE to END_NODE''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
          || '.edge.right_face IS '
          || '''Unique identifier of the face on the right side of the edge when looking in the direction from START_NODE to END_NODE''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
          || '.edge.geom IS '
          || '''The geometry of the edge''';

  -- edge standard view (insert rule)
  EXECUTE 'CREATE RULE edge_insert_rule AS ON INSERT '
          || 'TO ' || quote_ident(atopology)
          || '.edge DO INSTEAD '
          || ' INSERT into ' || quote_ident(atopology)
          || '.edge_data '
          || ' VALUES (NEW.edge_id, NEW.start_node, NEW.end_node, '
          || ' NEW.next_left_edge, abs(NEW.next_left_edge), '
          || ' NEW.next_right_edge, abs(NEW.next_right_edge), '
          || ' NEW.left_face, NEW.right_face, NEW.geom);';

  --------------} END OF edge CREATION

  --------------{ layer sequence
  EXECUTE 'CREATE SEQUENCE '
          || quote_ident(atopology) || '.layer_id_seq;';
  --------------} layer sequence

  --------------{ relation CREATION
  --
  EXECUTE
  'CREATE TABLE ' || quote_ident(atopology) || '.relation ('
  || ' topogeo_id integer NOT NULL, '
  || ' layer_id integer NOT NULL, '
  || ' element_id integer NOT NULL, '
  || ' element_type integer NOT NULL, '
  || ' UNIQUE(layer_id,topogeo_id,element_id,element_type));';

  EXECUTE
  'CREATE TRIGGER relation_integrity_checks '
  ||'BEFORE UPDATE OR INSERT ON '
  || quote_ident(atopology) || '.relation FOR EACH ROW '
  || ' EXECUTE PROCEDURE topology.RelationTrigger('
  ||topology_id||','||quote_literal(atopology)||')';
  --------------} END OF relation CREATION


  ------- Default (world) face
  EXECUTE 'INSERT INTO ' || quote_ident(atopology) || '.face(face_id) VALUES(0);';

  ------- GiST index on face
  EXECUTE 'CREATE INDEX face_gist ON '
          || quote_ident(atopology)
          || '.face using gist (mbr);';

  ------- GiST index on node
  EXECUTE 'CREATE INDEX node_gist ON '
          || quote_ident(atopology)
          || '.node using gist (geom);';

  ------- GiST index on edge
  EXECUTE 'CREATE INDEX edge_gist ON '
          || quote_ident(atopology)
          || '.edge_data using gist (geom);';

  ------- Indexes on left_face and right_face of edge_data
  ------- NOTE: these indexes speed up GetFaceGeometry (and thus
  -------       TopoGeometry::Geometry) by a factor of 10 !
  -------       See http://trac.osgeo.org/postgis/ticket/806
  EXECUTE 'CREATE INDEX edge_left_face_idx ON '
          || quote_ident(atopology)
          || '.edge_data (left_face);';
  EXECUTE 'CREATE INDEX edge_right_face_idx ON '
          || quote_ident(atopology)
          || '.edge_data (right_face);';

  ------- Indexes on start_node and end_node of edge_data
  ------- NOTE: this indexes speed up node deletion
  -------       by a factor of 1000 !
  -------       See http://trac.osgeo.org/postgis/ticket/2082
  EXECUTE 'CREATE INDEX edge_start_node_idx ON '
          || quote_ident(atopology)
          || '.edge_data (start_node);';
  EXECUTE 'CREATE INDEX edge_end_node_idx ON '
          || quote_ident(atopology)
          || '.edge_data (end_node);';

  -- TODO: consider also adding an index on node.containing_face

  ------- Add record to the "topology" metadata table
  EXECUTE 'INSERT INTO topology.topology '
          || '(id, name, srid, precision, hasZ) VALUES ('
          || quote_literal(topology_id) || ','
          || quote_literal(atopology) || ','
          || quote_literal(srid) || ',' || quote_literal(prec)
          || ',' || hasZ
          || ')';

  RETURN topology_id;
END
$$;


--
-- TOC entry 846 (class 1255 OID 20170)
-- Name: droptopogeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION droptopogeometrycolumn(schema character varying, tbl character varying, col character varying) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
  lyrinfo RECORD;
  ok BOOL;
  result text;
BEGIN

  -- Get layer and topology info
  ok = false;
  FOR rec IN EXECUTE 'SELECT t.name as toponame, l.* FROM '
                     || 'topology.topology t, topology.layer l '
                     || ' WHERE l.topology_id = t.id'
                     || ' AND l.schema_name = ' || quote_literal(schema)
                     || ' AND l.table_name = ' || quote_literal(tbl)
                     || ' AND l.feature_column = ' || quote_literal(col)
  LOOP
    ok = true;
    lyrinfo = rec;
  END LOOP;

  -- Layer not found
  IF NOT ok THEN
    RAISE EXCEPTION 'No layer registered on %.%.%',
    schema,tbl,col;
  END IF;

  -- Clean up the topology schema
  FOR rec IN SELECT * FROM pg_namespace
  WHERE text(nspname) = lyrinfo.toponame
  LOOP
    -- Cleanup the relation table
    EXECUTE 'DELETE FROM ' || quote_ident(lyrinfo.toponame)
            || '.relation '
            || ' WHERE '
            || 'layer_id = ' || lyrinfo.layer_id;

    -- Drop the sequence for topogeoms in this layer
    EXECUTE 'DROP SEQUENCE ' || quote_ident(lyrinfo.toponame)
            || '.topogeo_s_' || lyrinfo.layer_id;

  END LOOP;

  ok = false;
  FOR rec IN SELECT * FROM pg_namespace n, pg_class c, pg_attribute a
  WHERE text(n.nspname) = schema
        AND c.relnamespace = n.oid
        AND text(c.relname) = tbl
        AND a.attrelid = c.oid
        AND text(a.attname) = col
  LOOP
    ok = true;
    EXIT;
  END LOOP;


  IF ok THEN
    -- Set feature column to NULL to bypass referential integrity
    -- checks
    EXECUTE 'UPDATE ' || quote_ident(schema) || '.'
            || quote_ident(tbl)
            || ' SET ' || quote_ident(col)
            || ' = NULL';
  END IF;

  -- Delete the layer record
  EXECUTE 'DELETE FROM topology.layer '
          || ' WHERE topology_id = ' || lyrinfo.topology_id
          || ' AND layer_id = ' || lyrinfo.layer_id;

  IF ok THEN
    -- Drop the layer column
    EXECUTE 'ALTER TABLE ' || quote_ident(schema) || '.'
            || quote_ident(tbl)
            || ' DROP ' || quote_ident(col)
            || ' cascade';
  END IF;

  result = 'Layer ' || lyrinfo.layer_id || ' ('
           || schema || '.' || tbl || '.' || col
           || ') dropped';

  RETURN result;
END;
$$;


--
-- TOC entry 856 (class 1255 OID 20189)
-- Name: droptopology(character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION droptopology(atopology character varying) RETURNS text
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  topoid integer;
  rec RECORD;
BEGIN

  -- Get topology id
  SELECT id FROM topology.topology into topoid
  WHERE name = atopology;


  IF topoid IS NOT NULL THEN

    RAISE NOTICE 'Dropping all layers from topology % (%)',
    atopology, topoid;

    -- Drop all layers in the topology
    FOR rec IN EXECUTE 'SELECT * FROM topology.layer WHERE '
                       || ' topology_id = ' || topoid
    LOOP

      EXECUTE 'SELECT topology.DropTopoGeometryColumn('
              || quote_literal(rec.schema_name)
              || ','
              || quote_literal(rec.table_name)
              || ','
              || quote_literal(rec.feature_column)
              || ')';
    END LOOP;

    -- Delete record from topology.topology
    EXECUTE 'DELETE FROM topology.topology WHERE id = '
            || topoid;

  END IF;


  -- Drop the schema (if it exists)
  FOR rec IN SELECT * FROM pg_namespace WHERE text(nspname) = atopology
  LOOP
    EXECUTE 'DROP SCHEMA '||quote_ident(atopology)||' CASCADE';
  END LOOP;

  RETURN 'Topology ' || quote_literal(atopology) || ' dropped';
END
$$;


--
-- TOC entry 859 (class 1255 OID 20194)
-- Name: equals(topogeometry, topogeometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION equals(tg1 topogeometry, tg2 topogeometry) RETURNS boolean
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  rec RECORD;
  toponame varchar;
  query text;
BEGIN

  IF tg1.topology_id != tg2.topology_id THEN
    -- TODO: revert to ::geometry instead ?
    RAISE EXCEPTION 'Cannot compare TopoGeometries from different topologies';
  END IF;

  -- Not the same type, not equal
  IF tg1.type != tg2.type THEN
    RETURN FALSE;
  END IF;

  -- Geometry collection are not currently supported
  IF tg2.type = 4 THEN
    RAISE EXCEPTION 'GeometryCollection are not supported by equals()';
  END IF;

  -- Get topology name
  SELECT name FROM topology.topology into toponame
  WHERE id = tg1.topology_id;

  -- Two geometries are equal if they are composed by
  -- the same TopoElements
  FOR rec IN EXECUTE 'SELECT * FROM '
                     || ' topology.GetTopoGeomElements('
                     || quote_literal(toponame) || ', '
                     || tg1.layer_id || ',' || tg1.id || ') '
                     || ' EXCEPT SELECT * FROM '
                     || ' topology.GetTopogeomElements('
                     || quote_literal(toponame) || ', '
                     || tg2.layer_id || ',' || tg2.id || ');'
  LOOP
    RETURN FALSE;
  END LOOP;

  FOR rec IN EXECUTE 'SELECT * FROM '
                     || ' topology.GetTopoGeomElements('
                     || quote_literal(toponame) || ', '
                     || tg2.layer_id || ',' || tg2.id || ')'
                     || ' EXCEPT SELECT * FROM '
                     || ' topology.GetTopogeomElements('
                     || quote_literal(toponame) || ', '
                     || tg1.layer_id || ',' || tg1.id || '); '
  LOOP
    RETURN FALSE;
  END LOOP;
  RETURN TRUE;
END
$$;


--
-- TOC entry 855 (class 1255 OID 20180)
-- Name: geometry(topogeometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION geometry(topogeom topogeometry) RETURNS public.geometry
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  toponame varchar;
  geom geometry;
  rec RECORD;
  plyr RECORD;
  clyr RECORD;
  sql TEXT;
BEGIN

  -- Get topology name
  SELECT name FROM topology.topology
  WHERE id = topogeom.topology_id
  INTO toponame;
  IF toponame IS NULL THEN
    RAISE EXCEPTION 'Invalid TopoGeometry (unexistent topology id %)', topogeom.topology_id;
  END IF;

  -- Get layer info
  SELECT * FROM topology.layer
  WHERE topology_id = topogeom.topology_id
        AND layer_id = topogeom.layer_id
  INTO plyr;
  IF plyr IS NULL THEN
    RAISE EXCEPTION 'Could not find TopoGeometry layer % in topology %', topogeom.layer_id, topogeom.topology_id;
  END IF;

  --
  -- If this feature layer is on any level > 0 we will
  -- compute the topological union of all child features
  -- in fact recursing.
  --
  IF plyr.level > 0 THEN -- {

    -- Get child layer info
    SELECT * FROM topology.layer WHERE layer_id = plyr.child_id
                                       AND topology_id = topogeom.topology_id
    INTO clyr;
    IF clyr IS NULL THEN
      RAISE EXCEPTION 'Invalid layer % in topology % (unexistent child layer %)', topogeom.layer_id, topogeom.topology_id, plyr.child_id;
    END IF;

    sql := 'SELECT st_multi(st_union(topology.Geometry('
           || quote_ident(clyr.feature_column)
           || '))) as geom FROM '
           || quote_ident(clyr.schema_name) || '.'
           || quote_ident(clyr.table_name)
           || ', ' || quote_ident(toponame) || '.relation pr'
           || ' WHERE '
           || ' pr.topogeo_id = ' || topogeom.id
           || ' AND '
           || ' pr.layer_id = ' || topogeom.layer_id
           || ' AND '
           || ' id('||quote_ident(clyr.feature_column)
           || ') = pr.element_id '
           || ' AND '
           || 'layer_id('||quote_ident(clyr.feature_column)
           || ') = pr.element_type ';
    --RAISE DEBUG '%', query;
    EXECUTE sql INTO geom;

  ELSIF topogeom.type = 3 THEN -- [multi]polygon -- }{

    sql := 'SELECT st_multi(st_union('
           || 'topology.ST_GetFaceGeometry('
           || quote_literal(toponame) || ','
           || 'element_id))) as g FROM '
           || quote_ident(toponame)
           || '.relation WHERE topogeo_id = '
           || topogeom.id || ' AND layer_id = '
           || topogeom.layer_id || ' AND element_type = 3 ';
    EXECUTE sql INTO geom;

  ELSIF topogeom.type = 2 THEN -- [multi]line -- }{

    sql :=
    'SELECT st_multi(ST_LineMerge(ST_Collect(e.geom))) as g FROM '
    || quote_ident(toponame) || '.edge e, '
    || quote_ident(toponame) || '.relation r '
    || ' WHERE r.topogeo_id = ' || topogeom.id
    || ' AND r.layer_id = ' || topogeom.layer_id
    || ' AND r.element_type = 2 '
    || ' AND abs(r.element_id) = e.edge_id';
    EXECUTE sql INTO geom;

  ELSIF topogeom.type = 1 THEN -- [multi]point -- }{

    sql :=
    'SELECT st_multi(st_union(n.geom)) as g FROM '
    || quote_ident(toponame) || '.node n, '
    || quote_ident(toponame) || '.relation r '
    || ' WHERE r.topogeo_id = ' || topogeom.id
    || ' AND r.layer_id = ' || topogeom.layer_id
    || ' AND r.element_type = 1 '
    || ' AND r.element_id = n.node_id';
    EXECUTE sql INTO geom;

  ELSIF topogeom.type = 4 THEN -- mixed collection -- }{

    sql := 'WITH areas AS ( SELECT ST_Union('
           || 'topology.ST_GetFaceGeometry('
           || quote_literal(toponame) || ','
           || 'element_id)) as g FROM '
           || quote_ident(toponame)
           || '.relation WHERE topogeo_id = '
           || topogeom.id || ' AND layer_id = '
           || topogeom.layer_id || ' AND element_type = 3), '
           || 'lines AS ( SELECT ST_LineMerge(ST_Collect(e.geom)) as g FROM '
           || quote_ident(toponame) || '.edge e, '
           || quote_ident(toponame) || '.relation r '
           || ' WHERE r.topogeo_id = ' || topogeom.id
           || ' AND r.layer_id = ' || topogeom.layer_id
           || ' AND r.element_type = 2 '
           || ' AND abs(r.element_id) = e.edge_id ), '
           || ' points as ( SELECT st_union(n.geom) as g FROM '
           || quote_ident(toponame) || '.node n, '
           || quote_ident(toponame) || '.relation r '
           || ' WHERE r.topogeo_id = ' || topogeom.id
           || ' AND r.layer_id = ' || topogeom.layer_id
           || ' AND r.element_type = 1 '
           || ' AND r.element_id = n.node_id ), '
           || ' un as ( SELECT g FROM areas UNION ALL SELECT g FROM lines '
           || '          UNION ALL SELECT g FROM points ) '
           || 'SELECT ST_Multi(ST_Collect(g)) FROM un';
    EXECUTE sql INTO geom;

  ELSE -- }{

    RAISE EXCEPTION 'Invalid TopoGeometries (unknown type %)', topogeom.type;

  END IF; -- }

  IF geom IS NULL THEN
    IF topogeom.type = 3 THEN -- [multi]polygon
      geom := 'MULTIPOLYGON EMPTY';
    ELSIF topogeom.type = 2 THEN -- [multi]line
      geom := 'MULTILINESTRING EMPTY';
    ELSIF topogeom.type = 1 THEN -- [multi]point
      geom := 'MULTIPOINT EMPTY';
    ELSE
      geom := 'GEOMETRYCOLLECTION EMPTY';
    END IF;
  END IF;

  RETURN geom;
END
$$;


--
-- TOC entry 874 (class 1255 OID 20213)
-- Name: geometrytype(topogeometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION geometrytype(tg topogeometry) RETURNS text
LANGUAGE sql STABLE STRICT
AS $_$
SELECT CASE
       WHEN type($1) = 1 THEN 'MULTIPOINT'
       WHEN type($1) = 2 THEN 'MULTILINESTRING'
       WHEN type($1) = 3 THEN 'MULTIPOLYGON'
       WHEN type($1) = 4 THEN 'GEOMETRYCOLLECTION'
       ELSE 'UNEXPECTED'
       END;
$_$;


--
-- TOC entry 862 (class 1255 OID 20196)
-- Name: getedgebypoint(character varying, public.geometry, double precision); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION getedgebypoint(atopology character varying, apoint public.geometry, tol1 double precision) RETURNS integer
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  sql text;
  idedge int;
BEGIN
  --
  -- Atopology and apoint are required
  --
  IF atopology IS NULL OR apoint IS NULL THEN
    RAISE EXCEPTION 'Invalid null argument';
  END IF;

  --
  -- Apoint must be a point
  --
  IF substring(geometrytype(apoint), 1, 5) != 'POINT'
  THEN
    RAISE EXCEPTION 'Node geometry must be a point';
  END IF;

  --
  -- Tolerance must be >= 0
  --
  IF tol1 < 0
  THEN
    RAISE EXCEPTION 'Tolerance must be >=0';
  END IF;


  if tol1 = 0 then
    sql := 'SELECT a.edge_id FROM '
           || quote_ident(atopology)
           || '.edge_data as a WHERE '
           || '(a.geom && ' || quote_literal(apoint::text)||'::geometry) '
           || ' AND (ST_Intersects(a.geom,' || quote_literal(apoint::text)||'::geometry) );';
  else
    sql := 'SELECT a.edge_id FROM '
           || quote_ident(atopology)
           || '.edge_data as a WHERE '
           || '(ST_DWithin(a.geom,' || quote_literal(apoint::text)||'::geometry,' || tol1::text || ') );';
  end if;

  BEGIN
    EXECUTE sql INTO STRICT idedge;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      idedge = 0;
    WHEN TOO_MANY_ROWS THEN
      RAISE EXCEPTION 'Two or more edges found';
  END;

  RETURN idedge;

END
$$;


--
-- TOC entry 863 (class 1255 OID 20197)
-- Name: getfacebypoint(character varying, public.geometry, double precision); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION getfacebypoint(atopology character varying, apoint public.geometry, tol1 double precision) RETURNS integer
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  sql text;
  idface int;
BEGIN

  idface := -1;

  --
  -- Atopology and apoint are required
  --
  IF atopology IS NULL OR apoint IS NULL THEN
    RAISE EXCEPTION 'Invalid null argument';
  END IF;

  --
  -- Apoint must be a point
  --
  IF substring(geometrytype(apoint), 1, 5) != 'POINT'
  THEN
    RAISE EXCEPTION 'Node geometry must be a point';
  END IF;

  --
  -- Tolerance must be >= 0
  --
  IF tol1 < 0
  THEN
    RAISE EXCEPTION 'Tolerance must be >=0';
  END IF;
  --
  -- first test is to check if there is inside an mbr
  --
  if tol1 = 0 then
    sql := 'SELECT a.face_id FROM '
           || quote_ident(atopology)
           || '.face as a WHERE '
           || '(a.mbr && ' || quote_literal(apoint::text)||'::geometry) '
           || 'LIMIT 1;';
  else
    sql := 'SELECT a.face_id FROM '
           || quote_ident(atopology)
           || '.face as a WHERE '
           || '(ST_DWithin(a.mbr,' || quote_literal(apoint::text)||'::geometry,' || tol1::text || ') ) '
           || 'LIMIT 1;';
  end if;

  BEGIN
    EXECUTE sql INTO STRICT idface;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      idface = 0;
  END;

  if idface > 0 then
    --
    -- probably there is something so now check the exact test
    --

    if tol1 = 0 then
      sql := 'SELECT e.face_id FROM ('
             || 'SELECT d.face_id,ST_BuildArea(ST_Union(geom)) as geom FROM ('
             || 'SELECT b.edge_id as edge_id,b.left_face as face_id,b.geom as geom FROM '
             || quote_ident(atopology) || '.edge_data as b,'
             || '(SELECT a.face_id FROM '
             || quote_ident(atopology) || '.face as a '
             || 'WHERE ST_Intersects(a.mbr,' || quote_literal(apoint::text)||'::geometry)=true'
             || ') as c '
             || 'WHERE (b.left_face = c.face_id) '
             || ' UNION ALL '
             || 'SELECT b.edge_id as edge_id, b.right_face as face_id, b.geom as geom FROM '
             || quote_ident(atopology) || '.edge_data as b,'
             || '(SELECT a.face_id FROM '
             || quote_ident(atopology) || '.face as a '
             || 'WHERE ST_Intersects(a.mbr,' || quote_literal(apoint::text)||'::geometry)=true'
             || ') as c '
             || 'WHERE (b.right_face = c.face_id) '
             || ') as d '
             || 'GROUP BY face_id '
             || ') as e '
             || 'WHERE ST_Intersects(e.geom, ' || quote_literal(apoint::text)||'::geometry)=true;';
    else
      sql := 'SELECT e.face_id FROM ('
             || 'SELECT d.face_id,ST_BuildArea(ST_Union(geom)) as geom FROM ('
             || 'SELECT b.edge_id as edge_id,b.left_face as face_id,b.geom as geom FROM '
             || quote_ident(atopology) || '.edge_data as b,'
             || '(SELECT a.face_id FROM '
             || quote_ident(atopology) || '.face as a '
             || 'WHERE ST_DWithin(a.mbr,' || quote_literal(apoint::text)||'::geometry,' || tol1::text || ')=true'
             || ') as c '
             || 'WHERE (b.left_face = c.face_id) '
             || ' UNION ALL '
             || 'SELECT b.edge_id as edge_id, b.right_face as face_id, b.geom as geom FROM '
             || quote_ident(atopology) || '.edge_data as b,'
             || '(SELECT a.face_id FROM '
             || quote_ident(atopology) || '.face as a '
             || 'WHERE ST_DWithin(a.mbr,' || quote_literal(apoint::text)||'::geometry,' || tol1::text || ')=true'
             || ') as c '
             || 'WHERE (b.right_face = c.face_id) '
             || ') as d '
             || 'GROUP BY face_id '
             || ') as e '
             || 'WHERE ST_DWithin(e.geom, ' || quote_literal(apoint::text)||'::geometry,' || tol1::text || ')=true;';
    end if;

    RAISE DEBUG ' ==> %',sql;

    BEGIN
      EXECUTE sql INTO STRICT idface;
      EXCEPTION
      WHEN NO_DATA_FOUND THEN
        idface = 0;
      WHEN TOO_MANY_ROWS THEN
        RAISE EXCEPTION 'Two or more faces found';
    END;

  end if;

  RETURN idface;

END
$$;


--
-- TOC entry 860 (class 1255 OID 20195)
-- Name: getnodebypoint(character varying, public.geometry, double precision); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION getnodebypoint(atopology character varying, apoint public.geometry, tol1 double precision) RETURNS integer
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  sql text;
  idnode int;
BEGIN
  --
  -- Atopology and apoint are required
  --
  IF atopology IS NULL OR apoint IS NULL THEN
    RAISE EXCEPTION 'Invalid null argument';
  END IF;

  --
  -- Apoint must be a point
  --
  IF substring(geometrytype(apoint), 1, 5) != 'POINT'
  THEN
    RAISE EXCEPTION 'Node geometry must be a point';
  END IF;

  --
  -- Tolerance must be >= 0
  --
  IF tol1 < 0
  THEN
    RAISE EXCEPTION 'Tolerance must be >=0';
  END IF;


  if tol1 = 0 then
    sql := 'SELECT a.node_id FROM '
           || quote_ident(atopology)
           || '.node as a WHERE '
           || '(a.geom && ' || quote_literal(apoint::text)||'::geometry) '
           || ' AND (ST_Intersects(a.geom,' || quote_literal(apoint::text)||'::geometry) );';
  else
    sql := 'SELECT a.node_id FROM '
           || quote_ident(atopology)
           || '.node as a WHERE '
           || '(ST_DWithin(a.geom,' || quote_literal(apoint::text)||'::geometry,' || tol1::text || ') );';
  end if;

  BEGIN
    EXECUTE sql INTO STRICT idnode;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      idnode = 0;
    WHEN TOO_MANY_ROWS THEN
      RAISE EXCEPTION 'Two or more nodes found';
  END;

  RETURN idnode;

END
$$;


--
-- TOC entry 890 (class 1255 OID 20263)
-- Name: getnodeedges(character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION getnodeedges(atopology character varying, anode integer) RETURNS SETOF getfaceedges_returntype
LANGUAGE plpgsql STABLE
AS $$
DECLARE
  curedge int;
  nextedge int;
  rec RECORD;
  retrec topology.GetFaceEdges_ReturnType;
  n int;
  sql text;
BEGIN

  n := 0;
  sql :=
  'WITH incident_edges AS ( SELECT edge_id, start_node, end_node, ST_RemoveRepeatedPoints(geom) as geom FROM '
  || quote_ident(atopology)
  || '.edge_data WHERE start_node = ' || anode
  || ' or end_node = ' || anode
  || ') SELECT edge_id, ST_Azimuth(ST_StartPoint(geom), ST_PointN(geom, 2)) as az FROM  incident_edges WHERE start_node = ' || anode
  || ' UNION ALL SELECT -edge_id, ST_Azimuth(ST_EndPoint(geom), ST_PointN(geom, ST_NumPoints(geom)-1)) FROM incident_edges WHERE end_node = ' || anode
  || ' ORDER BY az';

  FOR rec IN EXECUTE sql
  LOOP -- incident edges {

    n := n + 1;
    retrec.sequence := n;
    retrec.edge := rec.edge_id;
    RETURN NEXT retrec;
  END LOOP; -- incident edges }

END
$$;


--
-- TOC entry 896 (class 1255 OID 20262)
-- Name: getringedges(character varying, integer, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION getringedges(atopology character varying, anedge integer, maxedges integer DEFAULT NULL::integer) RETURNS SETOF getfaceedges_returntype
LANGUAGE plpgsql STABLE
AS $$
DECLARE
  rec RECORD;
  retrec topology.GetFaceEdges_ReturnType;
  n int;
  sql text;
BEGIN
  sql := 'WITH RECURSIVE edgering AS ( SELECT '
         || anedge
         || ' as signed_edge_id, edge_id, next_left_edge, next_right_edge FROM '
         || quote_ident(atopology)
         || '.edge_data WHERE edge_id = '
         || abs(anedge)
         || ' UNION '
         || ' SELECT CASE WHEN p.signed_edge_id < 0 THEN p.next_right_edge '
         || ' ELSE p.next_left_edge END, e.edge_id, e.next_left_edge, e.next_right_edge '
         || ' FROM ' || quote_ident(atopology)
         || '.edge_data e, edgering p WHERE e.edge_id = CASE WHEN p.signed_edge_id < 0 '
         || 'THEN abs(p.next_right_edge) ELSE abs(p.next_left_edge) END ) SELECT * FROM edgering';

  n := 1;
  FOR rec IN EXECUTE sql
  LOOP
    retrec.sequence := n;
    retrec.edge := rec.signed_edge_id;
    RETURN NEXT retrec;

    n := n + 1;

    IF n > maxedges THEN
      RAISE EXCEPTION 'Max traversing limit hit: %', maxedges;
    END IF;
  END LOOP;

END
$$;


--
-- TOC entry 852 (class 1255 OID 20177)
-- Name: gettopogeomelementarray(topogeometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION gettopogeomelementarray(tg topogeometry) RETURNS topoelementarray
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  toponame varchar;
BEGIN
  toponame = topology.GetTopologyName(tg.topology_id);
  RETURN topology.GetTopoGeomElementArray(toponame, tg.layer_id, tg.id);
END;
$$;


--
-- TOC entry 713 (class 1255 OID 20176)
-- Name: gettopogeomelementarray(character varying, integer, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION gettopogeomelementarray(toponame character varying, layer_id integer, tgid integer) RETURNS topoelementarray
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  rec RECORD;
  tg_objs varchar := '{';
  i integer;
  query text;
BEGIN

  query = 'SELECT * FROM topology.GetTopoGeomElements('
          || quote_literal(toponame) || ','
          || quote_literal(layer_id) || ','
          || quote_literal(tgid)
          || ') as obj ORDER BY obj';


  -- TODO: why not using array_agg here ?

  i = 1;
  FOR rec IN EXECUTE query
  LOOP
    IF i > 1 THEN
      tg_objs = tg_objs || ',';
    END IF;
    tg_objs = tg_objs || '{'
              || rec.obj[1] || ',' || rec.obj[2]
              || '}';
    i = i+1;
  END LOOP;

  tg_objs = tg_objs || '}';

  RETURN tg_objs;
END;
$$;


--
-- TOC entry 854 (class 1255 OID 20179)
-- Name: gettopogeomelements(topogeometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION gettopogeomelements(tg topogeometry) RETURNS SETOF topoelement
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  toponame varchar;
  rec RECORD;
BEGIN
  toponame = topology.GetTopologyName(tg.topology_id);
  FOR rec IN SELECT * FROM topology.GetTopoGeomElements(toponame,
                                                        tg.layer_id,tg.id) as ret
  LOOP
    RETURN NEXT rec.ret;
  END LOOP;
  RETURN;
END;
$$;


--
-- TOC entry 853 (class 1255 OID 20178)
-- Name: gettopogeomelements(character varying, integer, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION gettopogeomelements(toponame character varying, layerid integer, tgid integer) RETURNS SETOF topoelement
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  ret topology.TopoElement;
  rec RECORD;
  rec2 RECORD;
  query text;
  query2 text;
  lyr RECORD;
  ok bool;
BEGIN

  -- Get layer info
  ok = false;
  FOR rec IN EXECUTE 'SELECT * FROM '
                     || ' topology.layer '
                     || ' WHERE layer_id = ' || layerid
  LOOP
    lyr = rec;
    ok = true;
  END LOOP;

  IF NOT ok THEN
    RAISE EXCEPTION 'Layer % does not exist', layerid;
  END IF;


  query = 'SELECT abs(element_id) as element_id, element_type FROM '
          || quote_ident(toponame) || '.relation WHERE '
          || ' layer_id = ' || layerid
          || ' AND topogeo_id = ' || quote_literal(tgid)
          || ' ORDER BY element_type, element_id';

  --RAISE NOTICE 'Query: %', query;

  FOR rec IN EXECUTE query
  LOOP
    IF lyr.level > 0 THEN
      query2 = 'SELECT * from topology.GetTopoGeomElements('
               || quote_literal(toponame) || ','
               || rec.element_type
               || ','
               || rec.element_id
               || ') as ret;';
      --RAISE NOTICE 'Query2: %', query2;
      FOR rec2 IN EXECUTE query2
      LOOP
        RETURN NEXT rec2.ret;
      END LOOP;
    ELSE
      ret = '{' || rec.element_id || ',' || rec.element_type || '}';
      RETURN NEXT ret;
    END IF;

  END LOOP;

  RETURN;
END;
$$;


--
-- TOC entry 850 (class 1255 OID 20174)
-- Name: gettopologyid(character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION gettopologyid(toponame character varying) RETURNS integer
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  ret integer;
BEGIN
  SELECT id FROM topology.topology into ret
  WHERE name = toponame;
  RETURN ret;
END
$$;


--
-- TOC entry 849 (class 1255 OID 20173)
-- Name: gettopologyname(integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION gettopologyname(topoid integer) RETURNS character varying
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  ret varchar;
BEGIN
  SELECT name FROM topology.topology into ret
  WHERE id = topoid;
  RETURN ret;
END
$$;


--
-- TOC entry 851 (class 1255 OID 20175)
-- Name: gettopologysrid(character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION gettopologysrid(toponame character varying) RETURNS integer
LANGUAGE sql STABLE STRICT
AS $_$
SELECT SRID FROM topology.topology WHERE name = $1;
$_$;


--
-- TOC entry 729 (class 1255 OID 20192)
-- Name: intersects(topogeometry, topogeometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION intersects(tg1 topogeometry, tg2 topogeometry) RETURNS boolean
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  tgbuf topology.TopoGeometry;
  rec RECORD;
  toponame varchar;
  query text;
BEGIN
  IF tg1.topology_id != tg2.topology_id THEN
    -- TODO: revert to ::geometry instead ?
    RAISE EXCEPTION 'Cannot compute intersection between TopoGeometries from different topologies';
  END IF;

  -- Order TopoGeometries so that tg1 has less-or-same
  -- dimensionality of tg1 (point,line,polygon,collection)
  IF tg1.type > tg2.type THEN
    tgbuf := tg2;
    tg2 := tg1;
    tg1 := tgbuf;
  END IF;

  --RAISE NOTICE 'tg1.id:% tg2.id:%', tg1.id, tg2.id;
  -- Geometry collection are not currently supported
  IF tg2.type = 4 THEN
    RAISE EXCEPTION 'GeometryCollection are not supported by intersects()';
  END IF;

  -- Get topology name
  SELECT name FROM topology.topology into toponame
  WHERE id = tg1.topology_id;

  -- Hierarchical TopoGeometries are not currently supported
  query = 'SELECT level FROM topology.layer'
          || ' WHERE '
          || ' topology_id = ' || tg1.topology_id
          || ' AND '
          || '( layer_id = ' || tg1.layer_id
          || ' OR layer_id = ' || tg2.layer_id
          || ' ) '
          || ' AND level > 0 ';

  --RAISE NOTICE '%', query;

  FOR rec IN EXECUTE query
  LOOP
    -- TODO: revert to ::geometry instead ?
    RAISE EXCEPTION 'Hierarchical TopoGeometries are not currently supported by intersects()';
  END LOOP;

  IF tg1.type = 1 THEN -- [multi]point


    IF tg2.type = 1 THEN -- point/point
      ---------------------------------------------------------
      --
      --  Two [multi]point features intersect if they share
      --  any Node
      --
      --
      --
      query =
      'SELECT a.topogeo_id FROM '
      || quote_ident(toponame) ||
      '.relation a, '
      || quote_ident(toponame) ||
      '.relation b '
      || 'WHERE a.layer_id = ' || tg1.layer_id
      || ' AND b.layer_id = ' || tg2.layer_id
      || ' AND a.topogeo_id = ' || tg1.id
      || ' AND b.topogeo_id = ' || tg2.id
      || ' AND a.element_id = b.element_id '
      || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- they share an element
      END LOOP;
      RETURN FALSE; -- no elements shared
      --
      ---------------------------------------------------------


    ELSIF tg2.type = 2 THEN -- point/line
      ---------------------------------------------------------
      --
      --  A [multi]point intersects a [multi]line if they share
      --  any Node.
      --
      --
      --
      query =
      'SELECT a.topogeo_id FROM '
      || quote_ident(toponame) ||
      '.relation a, '
      || quote_ident(toponame) ||
      '.relation b, '
      || quote_ident(toponame) ||
      '.edge_data e '
      || 'WHERE a.layer_id = ' || tg1.layer_id
      || ' AND b.layer_id = ' || tg2.layer_id
      || ' AND a.topogeo_id = ' || tg1.id
      || ' AND b.topogeo_id = ' || tg2.id
      || ' AND abs(b.element_id) = e.edge_id '
      || ' AND ( '
      || ' e.start_node = a.element_id '
      || ' OR '
      || ' e.end_node = a.element_id '
      || ' )'
      || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- they share an element
      END LOOP;
      RETURN FALSE; -- no elements shared
      --
      ---------------------------------------------------------

    ELSIF tg2.type = 3 THEN -- point/polygon
      ---------------------------------------------------------
      --
      --  A [multi]point intersects a [multi]polygon if any
      --  Node of the point is contained in any face of the
      --  polygon OR ( is end_node or start_node of any edge
      --  of any polygon face ).
      --
      --  We assume the Node-in-Face check is faster becasue
      --  there will be less Faces then Edges in any polygon.
      --
      --
      --
      --
      -- Check if any node is contained in a face
      query =
      'SELECT n.node_id as id FROM '
      || quote_ident(toponame) ||
      '.relation r1, '
      || quote_ident(toponame) ||
      '.relation r2, '
      || quote_ident(toponame) ||
      '.node n '
      || 'WHERE r1.layer_id = ' || tg1.layer_id
      || ' AND r2.layer_id = ' || tg2.layer_id
      || ' AND r1.topogeo_id = ' || tg1.id
      || ' AND r2.topogeo_id = ' || tg2.id
      || ' AND n.node_id = r1.element_id '
      || ' AND r2.element_id = n.containing_face '
      || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        --RAISE NOTICE 'Node % in polygon face', rec.id;
        RETURN TRUE; -- one (or more) nodes are
        -- contained in a polygon face
      END LOOP;

      -- Check if any node is start or end of any polygon
      -- face edge
      query =
      'SELECT n.node_id as nid, e.edge_id as eid '
      || ' FROM '
      || quote_ident(toponame) ||
      '.relation r1, '
      || quote_ident(toponame) ||
      '.relation r2, '
      || quote_ident(toponame) ||
      '.edge_data e, '
      || quote_ident(toponame) ||
      '.node n '
      || 'WHERE r1.layer_id = ' || tg1.layer_id
      || ' AND r2.layer_id = ' || tg2.layer_id
      || ' AND r1.topogeo_id = ' || tg1.id
      || ' AND r2.topogeo_id = ' || tg2.id
      || ' AND n.node_id = r1.element_id '
      || ' AND ( '
      || ' e.left_face = r2.element_id '
      || ' OR '
      || ' e.right_face = r2.element_id '
      || ' ) '
      || ' AND ( '
      || ' e.start_node = r1.element_id '
      || ' OR '
      || ' e.end_node = r1.element_id '
      || ' ) '
      || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        --RAISE NOTICE 'Node % on edge % bound', rec.nid, rec.eid;
        RETURN TRUE; -- one node is start or end
        -- of a face edge
      END LOOP;

      RETURN FALSE; -- no intersection
      --
      ---------------------------------------------------------

    ELSIF tg2.type = 4 THEN -- point/collection
      RAISE EXCEPTION 'Intersection point/collection not implemented yet';

    ELSE
      RAISE EXCEPTION 'Invalid TopoGeometry type', tg2.type;
    END IF;

  ELSIF tg1.type = 2 THEN -- [multi]line
    IF tg2.type = 2 THEN -- line/line
      ---------------------------------------------------------
      --
      --  A [multi]line intersects a [multi]line if they share
      --  any Node.
      --
      --
      --
      query =
      'SELECT e1.start_node FROM '
      || quote_ident(toponame) ||
      '.relation r1, '
      || quote_ident(toponame) ||
      '.relation r2, '
      || quote_ident(toponame) ||
      '.edge_data e1, '
      || quote_ident(toponame) ||
      '.edge_data e2 '
      || 'WHERE r1.layer_id = ' || tg1.layer_id
      || ' AND r2.layer_id = ' || tg2.layer_id
      || ' AND r1.topogeo_id = ' || tg1.id
      || ' AND r2.topogeo_id = ' || tg2.id
      || ' AND abs(r1.element_id) = e1.edge_id '
      || ' AND abs(r2.element_id) = e2.edge_id '
      || ' AND ( '
      || ' e1.start_node = e2.start_node '
      || ' OR '
      || ' e1.start_node = e2.end_node '
      || ' OR '
      || ' e1.end_node = e2.start_node '
      || ' OR '
      || ' e1.end_node = e2.end_node '
      || ' )'
      || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- they share an element
      END LOOP;
      RETURN FALSE; -- no elements shared
      --
      ---------------------------------------------------------

    ELSIF tg2.type = 3 THEN -- line/polygon
      ---------------------------------------------------------
      --
      -- A [multi]line intersects a [multi]polygon if they share
      -- any Node (touch-only case), or if any line edge has any
      -- polygon face on the left or right (full-containment case
      -- + edge crossing case).
      --
      --
      -- E1 are line edges, E2 are polygon edges
      -- R1 are line relations.
      -- R2 are polygon relations.
      -- R2.element_id are FACE ids
      query =
      'SELECT e1.edge_id'
      || ' FROM '
      || quote_ident(toponame) ||
      '.relation r1, '
      || quote_ident(toponame) ||
      '.relation r2, '
      || quote_ident(toponame) ||
      '.edge_data e1, '
      || quote_ident(toponame) ||
      '.edge_data e2 '
      || 'WHERE r1.layer_id = ' || tg1.layer_id
      || ' AND r2.layer_id = ' || tg2.layer_id
      || ' AND r1.topogeo_id = ' || tg1.id
      || ' AND r2.topogeo_id = ' || tg2.id

      -- E1 are line edges
      || ' AND e1.edge_id = abs(r1.element_id) '

      -- E2 are face edges
      || ' AND ( e2.left_face = r2.element_id '
      || '   OR e2.right_face = r2.element_id ) '

      || ' AND ( '

      -- Check if E1 have left-or-right face
      -- being part of R2.element_id
      || ' e1.left_face = r2.element_id '
      || ' OR '
      || ' e1.right_face = r2.element_id '

      -- Check if E1 share start-or-end node
      -- with any E2.
      || ' OR '
      || ' e1.start_node = e2.start_node '
      || ' OR '
      || ' e1.start_node = e2.end_node '
      || ' OR '
      || ' e1.end_node = e2.start_node '
      || ' OR '
      || ' e1.end_node = e2.end_node '

      || ' ) '

      || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- either common node
        -- or edge-in-face
      END LOOP;

      RETURN FALSE; -- no intersection
      --
      ---------------------------------------------------------

    ELSIF tg2.type = 4 THEN -- line/collection
      RAISE EXCEPTION 'Intersection line/collection not implemented yet', tg1.type, tg2.type;

    ELSE
      RAISE EXCEPTION 'Invalid TopoGeometry type', tg2.type;
    END IF;


  ELSIF tg1.type = 3 THEN -- [multi]polygon

    IF tg2.type = 3 THEN -- polygon/polygon
      ---------------------------------------------------------
      --
      -- A [multi]polygon intersects a [multi]polygon if they share
      -- any Node (touch-only case), or if any face edge has any of the
      -- other polygon face on the left or right (full-containment case
      -- + edge crossing case).
      --
      --
      -- E1 are poly1 edges.
      -- E2 are poly2 edges
      -- R1 are poly1 relations.
      -- R2 are poly2 relations.
      -- R1.element_id are poly1 FACE ids
      -- R2.element_id are poly2 FACE ids
      query =
      'SELECT e1.edge_id'
      || ' FROM '
      || quote_ident(toponame) ||
      '.relation r1, '
      || quote_ident(toponame) ||
      '.relation r2, '
      || quote_ident(toponame) ||
      '.edge_data e1, '
      || quote_ident(toponame) ||
      '.edge_data e2 '
      || 'WHERE r1.layer_id = ' || tg1.layer_id
      || ' AND r2.layer_id = ' || tg2.layer_id
      || ' AND r1.topogeo_id = ' || tg1.id
      || ' AND r2.topogeo_id = ' || tg2.id

      -- E1 are poly1 edges
      || ' AND ( e1.left_face = r1.element_id '
      || '   OR e1.right_face = r1.element_id ) '

      -- E2 are poly2 edges
      || ' AND ( e2.left_face = r2.element_id '
      || '   OR e2.right_face = r2.element_id ) '

      || ' AND ( '

      -- Check if any edge from a polygon face
      -- has any of the other polygon face
      -- on the left or right
      || ' e1.left_face = r2.element_id '
      || ' OR '
      || ' e1.right_face = r2.element_id '
      || ' OR '
      || ' e2.left_face = r1.element_id '
      || ' OR '
      || ' e2.right_face = r1.element_id '

      -- Check if E1 share start-or-end node
      -- with any E2.
      || ' OR '
      || ' e1.start_node = e2.start_node '
      || ' OR '
      || ' e1.start_node = e2.end_node '
      || ' OR '
      || ' e1.end_node = e2.start_node '
      || ' OR '
      || ' e1.end_node = e2.end_node '

      || ' ) '

      || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- either common node
        -- or edge-in-face
      END LOOP;

      RETURN FALSE; -- no intersection
      --
      ---------------------------------------------------------

    ELSIF tg2.type = 4 THEN -- polygon/collection
      RAISE EXCEPTION 'Intersection poly/collection not implemented yet', tg1.type, tg2.type;

    ELSE
      RAISE EXCEPTION 'Invalid TopoGeometry type', tg2.type;
    END IF;

  ELSIF tg1.type = 4 THEN -- collection
    IF tg2.type = 4 THEN -- collection/collection
      RAISE EXCEPTION 'Intersection collection/collection not implemented yet', tg1.type, tg2.type;
    ELSE
      RAISE EXCEPTION 'Invalid TopoGeometry type', tg2.type;
    END IF;

  ELSE
    RAISE EXCEPTION 'Invalid TopoGeometry type %', tg1.type;
  END IF;
END
$$;


--
-- TOC entry 838 (class 1255 OID 20137)
-- Name: layertrigger(); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION layertrigger() RETURNS trigger
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  rec RECORD;
  ok BOOL;
  toponame varchar;
  query TEXT;
BEGIN

  --RAISE NOTICE 'LayerTrigger called % % at % level', TG_WHEN, TG_OP, TG_LEVEL;


  IF TG_OP = 'INSERT' THEN
    RAISE EXCEPTION 'LayerTrigger not meant to be called on INSERT';
  ELSIF TG_OP = 'UPDATE' THEN
    RAISE EXCEPTION 'The topology.layer table cannot be updated';
  END IF;


  -- Check for existance of any feature column referencing
  -- this layer
  FOR rec IN SELECT * FROM pg_namespace n, pg_class c, pg_attribute a
  WHERE text(n.nspname) = OLD.schema_name
        AND c.relnamespace = n.oid
        AND text(c.relname) = OLD.table_name
        AND a.attrelid = c.oid
        AND text(a.attname) = OLD.feature_column
  LOOP
    query = 'SELECT * '
            || ' FROM ' || quote_ident(OLD.schema_name)
            || '.' || quote_ident(OLD.table_name)
            || ' WHERE layer_id('
            || quote_ident(OLD.feature_column)||') '
            || '=' || OLD.layer_id
            || ' LIMIT 1';
    --RAISE NOTICE '%', query;
    FOR rec IN EXECUTE query
    LOOP
      RAISE NOTICE 'A feature referencing layer % of topology % still exists in %.%.%', OLD.layer_id, OLD.topology_id, OLD.schema_name, OLD.table_name, OLD.feature_column;
      RETURN NULL;
    END LOOP;
  END LOOP;


  -- Get topology name
  SELECT name FROM topology.topology INTO toponame
  WHERE id = OLD.topology_id;

  IF toponame IS NULL THEN
    RAISE NOTICE 'Could not find name of topology with id %',
    OLD.layer_id;
  END IF;

  -- Check if any record in the relation table references this layer
  FOR rec IN SELECT * FROM pg_namespace
  WHERE text(nspname) = toponame
  LOOP
    query = 'SELECT * '
            || ' FROM ' || quote_ident(toponame)
            || '.relation '
            || ' WHERE layer_id = '|| OLD.layer_id
            || ' LIMIT 1';
    --RAISE NOTICE '%', query;
    FOR rec IN EXECUTE query
    LOOP
      RAISE NOTICE 'A record in %.relation still references layer %', toponame, OLD.layer_id;
      RETURN NULL;
    END LOOP;
  END LOOP;

  RETURN OLD;
END;
$$;


--
-- TOC entry 872 (class 1255 OID 20210)
-- Name: polygonize(character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION polygonize(toponame character varying) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  sql text;
  rec RECORD;
  faces int;
BEGIN

  sql := 'SELECT (st_dump(st_polygonize(geom))).geom from '
         || quote_ident(toponame) || '.edge_data';

  faces = 0;
  FOR rec in EXECUTE sql LOOP
    BEGIN
      PERFORM topology.AddFace(toponame, rec.geom);
      faces = faces + 1;
      EXCEPTION
      WHEN OTHERS THEN
        RAISE WARNING 'Error registering face % (%)', rec.geom, SQLERRM;
    END;
  END LOOP;
  RETURN faces || ' faces registered';
END
$$;


--
-- TOC entry 839 (class 1255 OID 20167)
-- Name: relationtrigger(); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION relationtrigger() RETURNS trigger
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  toponame varchar;
  topoid integer;
  plyr RECORD; -- parent layer
  rec RECORD;
  ok BOOL;

BEGIN
  IF TG_NARGS != 2 THEN
    RAISE EXCEPTION 'RelationTrigger called with wrong number of arguments';
  END IF;

  topoid = TG_ARGV[0];
  toponame = TG_ARGV[1];

  --RAISE NOTICE 'RelationTrigger called % % on %.relation for a %', TG_WHEN, TG_OP, toponame, TG_LEVEL;


  IF TG_OP = 'DELETE' THEN
    RAISE EXCEPTION 'RelationTrigger not meant to be called on DELETE';
  END IF;

  -- Get layer info (and verify it exists)
  ok = false;
  FOR plyr IN EXECUTE 'SELECT * FROM topology.layer '
                      || 'WHERE '
                      || ' topology_id = ' || topoid
                      || ' AND'
                      || ' layer_id = ' || NEW.layer_id
  LOOP
    ok = true;
    EXIT;
  END LOOP;
  IF NOT ok THEN
    RAISE EXCEPTION 'Layer % does not exist in topology %',
    NEW.layer_id, topoid;
    RETURN NULL;
  END IF;

  IF plyr.level > 0 THEN -- this is hierarchical layer

    -- ElementType must be the layer child id
    IF NEW.element_type != plyr.child_id THEN
      RAISE EXCEPTION 'Type of elements in layer % must be set to its child layer id %', plyr.layer_id, plyr.child_id;
      RETURN NULL;
    END IF;

    -- ElementId must be an existent TopoGeometry in child layer
    ok = false;
    FOR rec IN EXECUTE 'SELECT topogeo_id FROM '
                       || quote_ident(toponame) || '.relation '
                       || ' WHERE layer_id = ' || plyr.child_id
                       || ' AND topogeo_id = ' || NEW.element_id
    LOOP
      ok = true;
      EXIT;
    END LOOP;
    IF NOT ok THEN
      RAISE EXCEPTION 'TopoGeometry % does not exist in the child layer %', NEW.element_id, plyr.child_id;
      RETURN NULL;
    END IF;

  ELSE -- this is a basic layer

    -- ElementType must be compatible with layer type
    IF plyr.feature_type != 4
       AND plyr.feature_type != NEW.element_type
    THEN
      RAISE EXCEPTION 'Element of type % is not compatible with layer of type %', NEW.element_type, plyr.feature_type;
      RETURN NULL;
    END IF;

    --
    -- Now lets see if the element is consistent, which
    -- is it exists in the topology tables.
    --

    --
    -- Element is a Node
    --
    IF NEW.element_type = 1
    THEN
      ok = false;
      FOR rec IN EXECUTE 'SELECT node_id FROM '
                         || quote_ident(toponame) || '.node '
                         || ' WHERE node_id = ' || NEW.element_id
      LOOP
        ok = true;
        EXIT;
      END LOOP;
      IF NOT ok THEN
        RAISE EXCEPTION 'Node % does not exist in topology %', NEW.element_id, toponame;
        RETURN NULL;
      END IF;

      --
      -- Element is an Edge
      --
    ELSIF NEW.element_type = 2
      THEN
        ok = false;
        FOR rec IN EXECUTE 'SELECT edge_id FROM '
                           || quote_ident(toponame) || '.edge_data '
                           || ' WHERE edge_id = ' || abs(NEW.element_id)
        LOOP
          ok = true;
          EXIT;
        END LOOP;
        IF NOT ok THEN
          RAISE EXCEPTION 'Edge % does not exist in topology %', NEW.element_id, toponame;
          RETURN NULL;
        END IF;

        --
        -- Element is a Face
        --
    ELSIF NEW.element_type = 3
      THEN
        IF NEW.element_id = 0 THEN
          RAISE EXCEPTION 'Face % cannot be associated with any feature', NEW.element_id;
          RETURN NULL;
        END IF;
        ok = false;
        FOR rec IN EXECUTE 'SELECT face_id FROM '
                           || quote_ident(toponame) || '.face '
                           || ' WHERE face_id = ' || NEW.element_id
        LOOP
          ok = true;
          EXIT;
        END LOOP;
        IF NOT ok THEN
          RAISE EXCEPTION 'Face % does not exist in topology %', NEW.element_id, toponame;
          RETURN NULL;
        END IF;
    END IF;

  END IF;

  RETURN NEW;
END;
$$;


--
-- TOC entry 902 (class 1255 OID 20258)
-- Name: st_addedgemodface(character varying, integer, integer, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_addedgemodface(atopology character varying, anode integer, anothernode integer, acurve public.geometry) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
  rrec RECORD;
  i INTEGER;
  topoid INTEGER;
  az FLOAT8;
  span RECORD; -- start point analysis data
  epan RECORD; --   end point analysis data
  fan RECORD; -- face analisys
  newedge RECORD; -- informations about new edge
  sql TEXT;
  newfaces INTEGER[];
  newface INTEGER;
BEGIN

  --
  -- All args required
  --
  IF atopology IS NULL
     OR anode IS NULL
     OR anothernode IS NULL
     OR acurve IS NULL
  THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  --
  -- Acurve must be a LINESTRING
  --
  IF substring(geometrytype(acurve), 1, 4) != 'LINE'
  THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - invalid curve';
  END IF;

  --
  -- Curve must be simple
  --
  IF NOT ST_IsSimple(acurve) THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - curve not simple';
  END IF;

  --
  -- Get topology id
  --
  BEGIN
    SELECT id FROM topology.topology
    INTO STRICT topoid WHERE name = atopology;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END;

  -- Initialize new edge info (will be filled up more later)
  SELECT anode as start_node, anothernode as end_node, acurve as geom,
         NULL::int as next_left_edge, NULL::int as next_right_edge,
         NULL::int as left_face, NULL::int as right_face, NULL::int as edge_id,
         NULL::int as prev_left_edge, NULL::int as prev_right_edge, -- convenience
         anode = anothernode as isclosed, -- convenience
         false as start_node_isolated, -- convenience
         false as end_node_isolated, -- convenience
         NULL::geometry as start_node_geom, -- convenience
         NULL::geometry as end_node_geom, -- convenience
         ST_RemoveRepeatedPoints(acurve) as cleangeom -- convenience
  INTO newedge;

  -- Compute azimut of first edge end on start node
  SELECT null::int AS nextCW, null::int AS nextCCW,
         null::float8 AS minaz, null::float8 AS maxaz,
         false AS was_isolated,
         ST_Azimuth(ST_StartPoint(newedge.cleangeom),
                    ST_PointN(newedge.cleangeom, 2)) AS myaz
  INTO span;
  IF span.myaz IS NULL THEN
    RAISE EXCEPTION 'Invalid edge (no two distinct vertices exist)';
  END IF;

  -- Compute azimuth of last edge end on end node
  SELECT null::int AS nextCW, null::int AS nextCCW,
         null::float8 AS minaz, null::float8 AS maxaz,
         false AS was_isolated,
         ST_Azimuth(ST_EndPoint(newedge.cleangeom),
                    ST_PointN(newedge.cleangeom,
                              ST_NumPoints(newedge.cleangeom)-1)) AS myaz
  INTO epan;
  IF epan.myaz IS NULL THEN
    RAISE EXCEPTION 'Invalid edge (no two distinct vertices exist)';
  END IF;


  --
  -- Check endpoints existance, match with Curve geometry
  -- and get face information (if any)
  --
  i := 0;
  FOR rec IN EXECUTE 'SELECT node_id, containing_face, geom FROM '
                     || quote_ident(atopology)
                     || '.node WHERE node_id IN ( '
                     || anode || ',' || anothernode
                     || ')'
  LOOP
    IF rec.containing_face IS NOT NULL THEN
      IF newedge.left_face IS NULL THEN
        newedge.left_face := rec.containing_face;
        newedge.right_face := rec.containing_face;
      ELSE
        IF newedge.left_face != rec.containing_face THEN
          RAISE EXCEPTION
          'SQL/MM Spatial exception - geometry crosses an edge (endnodes in faces % and %)', newedge.left_face, rec.containing_face;
        END IF;
      END IF;
    END IF;

    IF rec.node_id = anode THEN
      newedge.start_node_geom = rec.geom;
    END IF;

    IF rec.node_id = anothernode THEN
      newedge.end_node_geom = rec.geom;
    END IF;

    i := i + 1;
  END LOOP;

  IF newedge.start_node_geom IS NULL
  THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent node';
  ELSIF NOT Equals(newedge.start_node_geom, ST_StartPoint(acurve))
    THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - start node not geometry start point.';
  END IF;

  IF newedge.end_node_geom IS NULL
  THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent node';
  ELSIF NOT Equals(newedge.end_node_geom, ST_EndPoint(acurve))
    THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - end node not geometry end point.';
  END IF;

  --
  -- Check if this geometry crosses any node
  --
  FOR rec IN EXECUTE
  'SELECT node_id, ST_Relate(geom, '
  || quote_literal(acurve::text) || '::geometry, 2) as relate FROM '
  || quote_ident(atopology)
  || '.node WHERE geom && '
  || quote_literal(acurve::text)
  || '::geometry'
  LOOP
    IF ST_RelateMatch(rec.relate, 'T********') THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - geometry crosses a node';
    END IF;
  END LOOP;

  --
  -- Check if this geometry has any interaction with any existing edge
  --
  FOR rec IN EXECUTE 'SELECT edge_id, ST_Relate(geom,'
                     || quote_literal(acurve::text)
                     || '::geometry, 2) as im FROM '
                     || quote_ident(atopology)
                     || '.edge_data WHERE geom && '
                     || quote_literal(acurve::text) || '::geometry'
  LOOP

    --RAISE DEBUG 'IM=%',rec.im;

    IF ST_RelateMatch(rec.im, 'F********') THEN
      CONTINUE; -- no interior intersection
    END IF;

    IF ST_RelateMatch(rec.im, '1FFF*FFF2') THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - coincident edge %', rec.edge_id;
    END IF;

    -- NOT IN THE SPECS: geometry touches an edge
    IF ST_RelateMatch(rec.im, '1********') THEN
      RAISE EXCEPTION
      'Spatial exception - geometry intersects edge %', rec.edge_id;
    END IF;

    IF ST_RelateMatch(rec.im, 'T********') THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - geometry crosses edge %', rec.edge_id;
    END IF;

  END LOOP;

  ---------------------------------------------------------------
  --
  -- All checks passed, time to prepare the new edge
  --
  ---------------------------------------------------------------

  EXECUTE 'SELECT nextval(' || quote_literal(
      quote_ident(atopology) || '.edge_data_edge_id_seq') || ')'
  INTO STRICT newedge.edge_id;


  -- Find links on start node -- {


  sql :=
  'SELECT edge_id, -1 AS end_node, start_node, left_face, right_face, '
  || 'ST_RemoveRepeatedPoints(geom) as geom FROM '
  || quote_ident(atopology)
  || '.edge_data WHERE start_node = ' || anode
  || ' UNION SELECT edge_id, end_node, -1, left_face, right_face, '
  || 'ST_RemoveRepeatedPoints(geom) FROM '
  || quote_ident(atopology)
  || '.edge_data WHERE end_node = ' || anode;
  IF newedge.isclosed THEN
    sql := sql || ' UNION SELECT '
           || newedge.edge_id || ',' || newedge.end_node
           || ',-1,0,0,' -- pretend we start elsewhere
           || quote_literal(newedge.cleangeom::text);
  END IF;
  i := 0;
  FOR rec IN EXECUTE sql
  LOOP -- incident edges {

    i := i + 1;

    IF rec.start_node = anode THEN
      --
      -- Edge starts at our node, we compute
      -- azimuth from node to its second point
      --
      az := ST_Azimuth(ST_StartPoint(rec.geom), ST_PointN(rec.geom, 2));

    ELSE
      --
      -- Edge ends at our node, we compute
      -- azimuth from node to its second-last point
      --
      az := ST_Azimuth(ST_EndPoint(rec.geom),
                       ST_PointN(rec.geom, ST_NumPoints(rec.geom)-1));
      rec.edge_id := -rec.edge_id;

    END IF;

    IF az IS NULL THEN
      RAISE EXCEPTION 'Invalid edge % found (no two distinct nodes exist)',
      rec.edge_id;
    END IF;


    az = az - span.myaz;
    IF az < 0 THEN
      az := az + 2*PI();
    END IF;

    -- RAISE DEBUG ' normalized az %', az;

    IF span.maxaz IS NULL OR az > span.maxaz THEN
      span.maxaz := az;
      span.nextCCW := rec.edge_id;
      IF abs(rec.edge_id) != newedge.edge_id THEN
        IF rec.edge_id < 0 THEN
          -- TODO: check for mismatch ?
          newedge.left_face := rec.left_face;
        ELSE
          -- TODO: check for mismatch ?
          newedge.left_face := rec.right_face;
        END IF;
      END IF;
    END IF;

    IF span.minaz IS NULL OR az < span.minaz THEN
      span.minaz := az;
      span.nextCW := rec.edge_id;
      IF abs(rec.edge_id) != newedge.edge_id THEN
        IF rec.edge_id < 0 THEN
          -- TODO: check for mismatch ?
          newedge.right_face := rec.right_face;
        ELSE
          -- TODO: check for mismatch ?
          newedge.right_face := rec.left_face;
        END IF;
      END IF;
    END IF;

    --RAISE DEBUG 'Closest edges: CW:%(%) CCW:%(%)', span.nextCW, span.minaz, span.nextCCW, span.maxaz;

  END LOOP; -- incident edges }

  IF newedge.isclosed THEN
    IF i < 2 THEN span.was_isolated = true; END IF;
  ELSE
    IF i < 1 THEN span.was_isolated = true; END IF;
  END IF;

  IF span.nextCW IS NULL THEN
    -- This happens if the destination node is isolated
    newedge.next_right_edge := newedge.edge_id;
    newedge.prev_left_edge := -newedge.edge_id;
  ELSE
    newedge.next_right_edge := span.nextCW;
    newedge.prev_left_edge := -span.nextCCW;
  END IF;


  -- } start_node analysis


  -- Find links on end_node {


  sql :=
  'SELECT edge_id, -1 as end_node, start_node, left_face, right_face, '
  || 'ST_RemoveRepeatedPoints(geom) as geom FROM '
  || quote_ident(atopology)
  || '.edge_data WHERE start_node = ' || anothernode
  || 'UNION SELECT edge_id, end_node, -1, left_face, right_face, '
  || 'ST_RemoveRepeatedPoints(geom) FROM '
  || quote_ident(atopology)
  || '.edge_data WHERE end_node = ' || anothernode;
  IF newedge.isclosed THEN
    sql := sql || ' UNION SELECT '
           || newedge.edge_id || ',' || -1 -- pretend we end elsewhere
           || ',' || newedge.start_node || ',0,0,'
           || quote_literal(newedge.cleangeom::text);
  END IF;
  i := 0;
  FOR rec IN EXECUTE sql
  LOOP -- incident edges {

    i := i + 1;

    IF rec.start_node = anothernode THEN
      --
      -- Edge starts at our node, we compute
      -- azimuth from node to its second point
      --
      az := ST_Azimuth(ST_StartPoint(rec.geom),
                       ST_PointN(rec.geom, 2));

    ELSE
      --
      -- Edge ends at our node, we compute
      -- azimuth from node to its second-last point
      --
      az := ST_Azimuth(ST_EndPoint(rec.geom),
                       ST_PointN(rec.geom, ST_NumPoints(rec.geom)-1));
      rec.edge_id := -rec.edge_id;

    END IF;


    az := az - epan.myaz;
    IF az < 0 THEN
      az := az + 2*PI();
    END IF;

    -- RAISE DEBUG ' normalized az %', az;

    IF epan.maxaz IS NULL OR az > epan.maxaz THEN
      epan.maxaz := az;
      epan.nextCCW := rec.edge_id;
      IF abs(rec.edge_id) != newedge.edge_id THEN
        IF rec.edge_id < 0 THEN
          -- TODO: check for mismatch ?
          newedge.right_face := rec.left_face;
        ELSE
          -- TODO: check for mismatch ?
          newedge.right_face := rec.right_face;
        END IF;
      END IF;
    END IF;

    IF epan.minaz IS NULL OR az < epan.minaz THEN
      epan.minaz := az;
      epan.nextCW := rec.edge_id;
      IF abs(rec.edge_id) != newedge.edge_id THEN
        IF rec.edge_id < 0 THEN
          -- TODO: check for mismatch ?
          newedge.left_face := rec.right_face;
        ELSE
          -- TODO: check for mismatch ?
          newedge.left_face := rec.left_face;
        END IF;
      END IF;
    END IF;

    --RAISE DEBUG 'Closest edges: CW:%(%) CCW:%(%)', epan.nextCW, epan.minaz, epan.nextCCW, epan.maxaz;

  END LOOP; -- incident edges }

  IF newedge.isclosed THEN
    IF i < 2 THEN epan.was_isolated = true; END IF;
  ELSE
    IF i < 1 THEN epan.was_isolated = true; END IF;
  END IF;

  IF epan.nextCW IS NULL THEN
    -- This happens if the destination node is isolated
    newedge.next_left_edge := -newedge.edge_id;
    newedge.prev_right_edge := newedge.edge_id;
  ELSE
    newedge.next_left_edge := epan.nextCW;
    newedge.prev_right_edge := -epan.nextCCW;
  END IF;

  -- } end_node analysis


  ----------------------------------------------------------------------
  --
  -- If we don't have faces setup by now we must have encountered
  -- a malformed topology (no containing_face on isolated nodes, no
  -- left/right faces on adjacent edges or mismatching values)
  --
  ----------------------------------------------------------------------
  IF newedge.left_face != newedge.right_face THEN
    RAISE EXCEPTION 'Left(%)/right(%) faces mismatch: invalid topology ?',
    newedge.left_face, newedge.right_face;
  END IF;
  IF newedge.left_face IS NULL THEN
    RAISE EXCEPTION 'Could not derive edge face from linked primitives: invalid topology ?';
  END IF;

  ----------------------------------------------------------------------
  --
  -- Insert the new edge, and update all linking
  --
  ----------------------------------------------------------------------

  -- Insert the new edge with what we have so far
  EXECUTE 'INSERT INTO ' || quote_ident(atopology)
          || '.edge VALUES(' || newedge.edge_id
          || ',' || newedge.start_node
          || ',' || newedge.end_node
          || ',' || newedge.next_left_edge
          || ',' || newedge.next_right_edge
          || ',' || newedge.left_face
          || ',' || newedge.right_face
          || ',' || quote_literal(newedge.geom::geometry::text)
          || ')';

  -- Link prev_left_edge to us
  -- (if it's not us already)
  IF abs(newedge.prev_left_edge) != newedge.edge_id THEN
    IF newedge.prev_left_edge > 0 THEN
      -- its next_left_edge is us
      EXECUTE 'UPDATE ' || quote_ident(atopology)
              || '.edge_data SET next_left_edge = '
              || newedge.edge_id
              || ', abs_next_left_edge = '
              || newedge.edge_id
              || ' WHERE edge_id = '
              || newedge.prev_left_edge;
    ELSE
      -- its next_right_edge is us
      EXECUTE 'UPDATE ' || quote_ident(atopology)
              || '.edge_data SET next_right_edge = '
              || newedge.edge_id
              || ', abs_next_right_edge = '
              || newedge.edge_id
              || ' WHERE edge_id = '
              || -newedge.prev_left_edge;
    END IF;
  END IF;

  -- Link prev_right_edge to us
  -- (if it's not us already)
  IF abs(newedge.prev_right_edge) != newedge.edge_id THEN
    IF newedge.prev_right_edge > 0 THEN
      -- its next_left_edge is -us
      EXECUTE 'UPDATE ' || quote_ident(atopology)
              || '.edge_data SET next_left_edge = '
              || -newedge.edge_id
              || ', abs_next_left_edge = '
              || newedge.edge_id
              || ' WHERE edge_id = '
              || newedge.prev_right_edge;
    ELSE
      -- its next_right_edge is -us
      EXECUTE 'UPDATE ' || quote_ident(atopology)
              || '.edge_data SET next_right_edge = '
              || -newedge.edge_id
              || ', abs_next_right_edge = '
              || newedge.edge_id
              || ' WHERE edge_id = '
              || -newedge.prev_right_edge;
    END IF;
  END IF;

  -- NOT IN THE SPECS...
  -- set containing_face = null for start_node and end_node
  -- if they where isolated
  IF span.was_isolated OR epan.was_isolated THEN
    EXECUTE 'UPDATE ' || quote_ident(atopology)
            || '.node SET containing_face = null WHERE node_id IN ('
            || anode || ',' || anothernode || ')';
  END IF;

  --------------------------------------------
  -- Check face splitting
  --------------------------------------------

  SELECT topology._ST_AddFaceSplit(atopology, newedge.edge_id, newedge.left_face, false)
  INTO newface;
  IF newface = 0 THEN
    RETURN newedge.edge_id;
  END IF;

  IF newface IS NULL THEN -- must be forming a maximal ring in universal face
    SELECT topology._ST_AddFaceSplit(atopology, -newedge.edge_id, newedge.left_face, false)
    INTO newface;
  ELSE
    PERFORM topology._ST_AddFaceSplit(atopology, -newedge.edge_id, newedge.left_face, true);
  END IF;

  IF newface IS NULL THEN
    RETURN newedge.edge_id;
  END IF;

  --------------------------------------------
  -- Update topogeometries, if needed
  --------------------------------------------

  IF newedge.left_face != 0 THEN -- {

    -- NOT IN THE SPECS:
    -- update TopoGeometry compositions to add newface
    sql := 'SELECT r.topogeo_id, r.layer_id FROM '
           || quote_ident(atopology)
           || '.relation r, topology.layer l '
           || ' WHERE l.topology_id = ' || topoid
           || ' AND l.level = 0 '
           || ' AND l.layer_id = r.layer_id '
           || ' AND r.element_id = ' || newedge.left_face
           || ' AND r.element_type = 3 ';
    --RAISE DEBUG 'SQL: %', sql;
    FOR rec IN EXECUTE sql
    LOOP

      -- Add reference to the other face
      sql := 'INSERT INTO ' || quote_ident(atopology)
             || '.relation VALUES( ' || rec.topogeo_id
             || ',' || rec.layer_id || ',' || newface || ', 3)';
      --RAISE DEBUG 'SQL: %', sql;
      EXECUTE sql;

    END LOOP;

  END IF; -- }

  RETURN newedge.edge_id;
END
$$;


--
-- TOC entry 901 (class 1255 OID 20256)
-- Name: st_addedgenewfaces(character varying, integer, integer, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_addedgenewfaces(atopology character varying, anode integer, anothernode integer, acurve public.geometry) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
  i INTEGER;
  topoid INTEGER;
  az FLOAT8;
  span RECORD; -- start point analysis data
  epan RECORD; --   end point analysis data
  fan RECORD; -- face analisys
  newedge RECORD; -- informations about new edge
  sql TEXT;
  newfaces INTEGER[];
  newface INTEGER;
BEGIN

  --
  -- All args required
  --
  IF atopology IS NULL
     OR anode IS NULL
     OR anothernode IS NULL
     OR acurve IS NULL
  THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  --
  -- Acurve must be a LINESTRING
  --
  IF substring(geometrytype(acurve), 1, 4) != 'LINE'
  THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - invalid curve';
  END IF;

  --
  -- Curve must be simple
  --
  IF NOT ST_IsSimple(acurve) THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - curve not simple';
  END IF;

  --
  -- Get topology id
  --
  BEGIN
    SELECT id FROM topology.topology
    INTO STRICT topoid WHERE name = atopology;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END;

  -- Initialize new edge info (will be filled up more later)
  SELECT anode as start_node, anothernode as end_node, acurve as geom,
         NULL::int as next_left_edge, NULL::int as next_right_edge,
         NULL::int as left_face, NULL::int as right_face, NULL::int as edge_id,
         NULL::int as prev_left_edge, NULL::int as prev_right_edge, -- convenience
         anode = anothernode as isclosed, -- convenience
         false as start_node_isolated, -- convenience
         false as end_node_isolated, -- convenience
         NULL::geometry as start_node_geom, -- convenience
         NULL::geometry as end_node_geom, -- convenience
         ST_RemoveRepeatedPoints(acurve) as cleangeom -- convenience
  INTO newedge;

  -- Compute azimuth of first edge end on start node
  SELECT null::int AS nextCW, null::int AS nextCCW,
         null::float8 AS minaz, null::float8 AS maxaz,
         false AS was_isolated,
         ST_Azimuth(ST_StartPoint(newedge.cleangeom),
                    ST_PointN(newedge.cleangeom, 2)) AS myaz
  INTO span;
  IF span.myaz IS NULL THEN
    RAISE EXCEPTION 'Invalid edge (no two distinct vertices exist)';
  END IF;

  -- Compute azimuth of last edge end on end node
  SELECT null::int AS nextCW, null::int AS nextCCW,
         null::float8 AS minaz, null::float8 AS maxaz,
         false AS was_isolated,
         ST_Azimuth(ST_EndPoint(newedge.cleangeom),
                    ST_PointN(newedge.cleangeom,
                              ST_NumPoints(newedge.cleangeom)-1)) AS myaz
  INTO epan;
  IF epan.myaz IS NULL THEN
    RAISE EXCEPTION 'Invalid edge (no two distinct vertices exist)';
  END IF;


  --
  -- Check endpoints existance, match with Curve geometry
  -- and get face information (if any)
  --
  i := 0;
  FOR rec IN EXECUTE 'SELECT node_id, containing_face, geom FROM '
                     || quote_ident(atopology)
                     || '.node WHERE node_id IN ( '
                     || anode || ',' || anothernode
                     || ')'
  LOOP
    IF rec.containing_face IS NOT NULL THEN
      IF newedge.left_face IS NULL THEN
        newedge.left_face := rec.containing_face;
        newedge.right_face := rec.containing_face;
      ELSE
        IF newedge.left_face != rec.containing_face THEN
          RAISE EXCEPTION
          'SQL/MM Spatial exception - geometry crosses an edge (endnodes in faces % and %)', newedge.left_face, rec.containing_face;
        END IF;
      END IF;
    END IF;

    IF rec.node_id = anode THEN
      newedge.start_node_geom = rec.geom;
    END IF;

    IF rec.node_id = anothernode THEN
      newedge.end_node_geom = rec.geom;
    END IF;

    i := i + 1;
  END LOOP;

  IF newedge.start_node_geom IS NULL
  THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent node';
  ELSIF NOT Equals(newedge.start_node_geom, ST_StartPoint(acurve))
    THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - start node not geometry start point.';
  END IF;

  IF newedge.end_node_geom IS NULL
  THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent node';
  ELSIF NOT Equals(newedge.end_node_geom, ST_EndPoint(acurve))
    THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - end node not geometry end point.';
  END IF;

  RAISE DEBUG 'All Checked !';

  --
  -- Check if this geometry crosses any node
  --
  FOR rec IN EXECUTE
  'SELECT node_id, ST_Relate(geom, '
  || quote_literal(acurve::text) || '::geometry, 2) as relate FROM '
  || quote_ident(atopology)
  || '.node WHERE geom && '
  || quote_literal(acurve::text)
  || '::geometry'
  LOOP
    IF ST_RelateMatch(rec.relate, 'T********') THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - geometry crosses a node';
    END IF;
  END LOOP;

  --
  -- Check if this geometry has any interaction with any existing edge
  --
  FOR rec IN EXECUTE 'SELECT edge_id, ST_Relate(geom,'
                     || quote_literal(acurve::text)
                     || '::geometry, 2) as im FROM '
                     || quote_ident(atopology)
                     || '.edge_data WHERE geom && '
                     || quote_literal(acurve::text) || '::geometry'
  LOOP

    --RAISE DEBUG 'IM=%',rec.im;

    IF ST_RelateMatch(rec.im, 'F********') THEN
      CONTINUE; -- no interior intersection
    END IF;

    IF ST_RelateMatch(rec.im, '1FFF*FFF2') THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - coincident edge %', rec.edge_id;
    END IF;

    -- NOT IN THE SPECS: geometry touches an edge
    IF ST_RelateMatch(rec.im, '1********') THEN
      RAISE EXCEPTION
      'Spatial exception - geometry intersects edge %', rec.edge_id;
    END IF;

    IF ST_RelateMatch(rec.im, 'T********') THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - geometry crosses edge %', rec.edge_id;
    END IF;

  END LOOP;

  ---------------------------------------------------------------
  --
  -- All checks passed, time to prepare the new edge
  --
  ---------------------------------------------------------------

  EXECUTE 'SELECT nextval(' || quote_literal(
      quote_ident(atopology) || '.edge_data_edge_id_seq') || ')'
  INTO STRICT newedge.edge_id;


  -- Find links on start node -- {


  sql :=
  'SELECT edge_id, -1 AS end_node, start_node, left_face, right_face, '
  || 'ST_RemoveRepeatedPoints(geom) as geom FROM '
  || quote_ident(atopology)
  || '.edge_data WHERE start_node = ' || anode
  || ' UNION SELECT edge_id, end_node, -1, left_face, right_face, '
  || 'ST_RemoveRepeatedPoints(geom) FROM '
  || quote_ident(atopology)
  || '.edge_data WHERE end_node = ' || anode;
  IF newedge.isclosed THEN
    sql := sql || ' UNION SELECT '
           || newedge.edge_id || ',' || newedge.end_node
           || ',-1,0,0,' -- pretend we start elsewhere
           || quote_literal(newedge.cleangeom::text);
  END IF;
  i := 0;
  FOR rec IN EXECUTE sql
  LOOP -- incident edges {

    i := i + 1;

    IF rec.start_node = anode THEN
      --
      -- Edge starts at our node, we compute
      -- azimuth from node to its second point
      --
      az := ST_Azimuth(ST_StartPoint(rec.geom), ST_PointN(rec.geom, 2));

    ELSE
      --
      -- Edge ends at our node, we compute
      -- azimuth from node to its second-last point
      --
      az := ST_Azimuth(ST_EndPoint(rec.geom),
                       ST_PointN(rec.geom, ST_NumPoints(rec.geom)-1));
      rec.edge_id := -rec.edge_id;

    END IF;

    IF az IS NULL THEN
      RAISE EXCEPTION 'Invalid edge % found (no two distinct nodes exist)',
      rec.edge_id;
    END IF;


    az = az - span.myaz;
    IF az < 0 THEN
      az := az + 2*PI();
    END IF;

    -- RAISE DEBUG ' normalized az %', az;

    IF span.maxaz IS NULL OR az > span.maxaz THEN
      span.maxaz := az;
      span.nextCCW := rec.edge_id;
      IF abs(rec.edge_id) != newedge.edge_id THEN
        IF rec.edge_id < 0 THEN
          -- TODO: check for mismatch ?
          newedge.left_face := rec.left_face;
        ELSE
          -- TODO: check for mismatch ?
          newedge.left_face := rec.right_face;
        END IF;
      END IF;
    END IF;

    IF span.minaz IS NULL OR az < span.minaz THEN
      span.minaz := az;
      span.nextCW := rec.edge_id;
      IF abs(rec.edge_id) != newedge.edge_id THEN
        IF rec.edge_id < 0 THEN
          -- TODO: check for mismatch ?
          newedge.right_face := rec.right_face;
        ELSE
          -- TODO: check for mismatch ?
          newedge.right_face := rec.left_face;
        END IF;
      END IF;
    END IF;

    --RAISE DEBUG 'Closest edges: CW:%(%) CCW:%(%)', span.nextCW, span.minaz, span.nextCCW, span.maxaz;

  END LOOP; -- incident edges }

  IF newedge.isclosed THEN
    IF i < 2 THEN span.was_isolated = true; END IF;
  ELSE
    IF i < 1 THEN span.was_isolated = true; END IF;
  END IF;

  IF span.nextCW IS NULL THEN
    -- This happens if the destination node is isolated
    newedge.next_right_edge := newedge.edge_id;
    newedge.prev_left_edge := -newedge.edge_id;
  ELSE
    newedge.next_right_edge := span.nextCW;
    newedge.prev_left_edge := -span.nextCCW;
  END IF;


  -- } start_node analysis


  -- Find links on end_node {


  sql :=
  'SELECT edge_id, -1 as end_node, start_node, left_face, right_face, '
  || 'ST_RemoveRepeatedPoints(geom) as geom FROM '
  || quote_ident(atopology)
  || '.edge_data WHERE start_node = ' || anothernode
  || 'UNION SELECT edge_id, end_node, -1, left_face, right_face, '
  || 'ST_RemoveRepeatedPoints(geom) FROM '
  || quote_ident(atopology)
  || '.edge_data WHERE end_node = ' || anothernode;
  IF newedge.isclosed THEN
    sql := sql || ' UNION SELECT '
           || newedge.edge_id || ',' || -1 -- pretend we end elsewhere
           || ',' || newedge.start_node || ',0,0,'
           || quote_literal(newedge.cleangeom::text);
  END IF;
  i := 0;
  FOR rec IN EXECUTE sql
  LOOP -- incident edges {

    i := i + 1;

    IF rec.start_node = anothernode THEN
      --
      -- Edge starts at our node, we compute
      -- azimuth from node to its second point
      --
      az := ST_Azimuth(ST_StartPoint(rec.geom),
                       ST_PointN(rec.geom, 2));

    ELSE
      --
      -- Edge ends at our node, we compute
      -- azimuth from node to its second-last point
      --
      az := ST_Azimuth(ST_EndPoint(rec.geom),
                       ST_PointN(rec.geom, ST_NumPoints(rec.geom)-1));
      rec.edge_id := -rec.edge_id;

    END IF;


    az := az - epan.myaz;
    IF az < 0 THEN
      az := az + 2*PI();
    END IF;

    -- RAISE DEBUG ' normalized az %', az;

    IF epan.maxaz IS NULL OR az > epan.maxaz THEN
      epan.maxaz := az;
      epan.nextCCW := rec.edge_id;
      IF abs(rec.edge_id) != newedge.edge_id THEN
        IF rec.edge_id < 0 THEN
          -- TODO: check for mismatch ?
          newedge.right_face := rec.left_face;
        ELSE
          -- TODO: check for mismatch ?
          newedge.right_face := rec.right_face;
        END IF;
      END IF;
    END IF;

    IF epan.minaz IS NULL OR az < epan.minaz THEN
      epan.minaz := az;
      epan.nextCW := rec.edge_id;
      IF abs(rec.edge_id) != newedge.edge_id THEN
        IF rec.edge_id < 0 THEN
          -- TODO: check for mismatch ?
          newedge.left_face := rec.right_face;
        ELSE
          -- TODO: check for mismatch ?
          newedge.left_face := rec.left_face;
        END IF;
      END IF;
    END IF;

    --RAISE DEBUG 'Closest edges: CW:%(%) CCW:%(%)', epan.nextCW, epan.minaz, epan.nextCCW, epan.maxaz;

  END LOOP; -- incident edges }

  IF newedge.isclosed THEN
    IF i < 2 THEN epan.was_isolated = true; END IF;
  ELSE
    IF i < 1 THEN epan.was_isolated = true; END IF;
  END IF;

  IF epan.nextCW IS NULL THEN
    -- This happens if the destination node is isolated
    newedge.next_left_edge := -newedge.edge_id;
    newedge.prev_right_edge := newedge.edge_id;
  ELSE
    newedge.next_left_edge := epan.nextCW;
    newedge.prev_right_edge := -epan.nextCCW;
  END IF;

  -- } end_node analysis


  ----------------------------------------------------------------------
  --
  -- If we don't have faces setup by now we must have encountered
  -- a malformed topology (no containing_face on isolated nodes, no
  -- left/right faces on adjacent edges or mismatching values)
  --
  ----------------------------------------------------------------------
  IF newedge.left_face != newedge.right_face THEN
    RAISE EXCEPTION 'Left(%)/right(%) faces mismatch: invalid topology ?',
    newedge.left_face, newedge.right_face;
  END IF;
  IF newedge.left_face IS NULL THEN
    RAISE EXCEPTION 'Could not derive edge face from linked primitives: invalid topology ?';
  END IF;

  ----------------------------------------------------------------------
  --
  -- Insert the new edge, and update all linking
  --
  ----------------------------------------------------------------------

  -- Insert the new edge with what we have so far
  EXECUTE 'INSERT INTO ' || quote_ident(atopology)
          || '.edge VALUES(' || newedge.edge_id
          || ',' || newedge.start_node
          || ',' || newedge.end_node
          || ',' || newedge.next_left_edge
          || ',' || newedge.next_right_edge
          || ',' || newedge.left_face
          || ',' || newedge.right_face
          || ',' || quote_literal(newedge.geom::geometry::text)
          || ')';

  -- Link prev_left_edge to us
  -- (if it's not us already)
  IF abs(newedge.prev_left_edge) != newedge.edge_id THEN
    IF newedge.prev_left_edge > 0 THEN
      -- its next_left_edge is us
      EXECUTE 'UPDATE ' || quote_ident(atopology)
              || '.edge_data SET next_left_edge = '
              || newedge.edge_id
              || ', abs_next_left_edge = '
              || newedge.edge_id
              || ' WHERE edge_id = '
              || newedge.prev_left_edge;
    ELSE
      -- its next_right_edge is us
      EXECUTE 'UPDATE ' || quote_ident(atopology)
              || '.edge_data SET next_right_edge = '
              || newedge.edge_id
              || ', abs_next_right_edge = '
              || newedge.edge_id
              || ' WHERE edge_id = '
              || -newedge.prev_left_edge;
    END IF;
  END IF;

  -- Link prev_right_edge to us
  -- (if it's not us already)
  IF abs(newedge.prev_right_edge) != newedge.edge_id THEN
    IF newedge.prev_right_edge > 0 THEN
      -- its next_left_edge is -us
      EXECUTE 'UPDATE ' || quote_ident(atopology)
              || '.edge_data SET next_left_edge = '
              || -newedge.edge_id
              || ', abs_next_left_edge = '
              || newedge.edge_id
              || ' WHERE edge_id = '
              || newedge.prev_right_edge;
    ELSE
      -- its next_right_edge is -us
      EXECUTE 'UPDATE ' || quote_ident(atopology)
              || '.edge_data SET next_right_edge = '
              || -newedge.edge_id
              || ', abs_next_right_edge = '
              || newedge.edge_id
              || ' WHERE edge_id = '
              || -newedge.prev_right_edge;
    END IF;
  END IF;

  -- NOT IN THE SPECS...
  -- set containing_face = null for start_node and end_node
  -- if they where isolated
  IF span.was_isolated OR epan.was_isolated THEN
    EXECUTE 'UPDATE ' || quote_ident(atopology)
            || '.node SET containing_face = null WHERE node_id IN ('
            || anode || ',' || anothernode || ')';
  END IF;

  --------------------------------------------
  -- Check face splitting
  --------------------------------------------


  SELECT topology._ST_AddFaceSplit(atopology, -newedge.edge_id, newedge.left_face, false)
  INTO newface;

  IF newface = 0 THEN
    RETURN newedge.edge_id;
  END IF;

  newfaces[1] := newface;

  SELECT topology._ST_AddFaceSplit(atopology, newedge.edge_id, newedge.left_face, false)
  INTO newface;

  newfaces[2] := newface;

  IF newedge.left_face != 0 THEN -- {

    -- NOT IN THE SPECS:
    -- update TopoGeometry compositions to substitute oldface with newfaces
    sql := 'UPDATE '
           || quote_ident(atopology)
           || '.relation r set element_id = ' || newfaces[1]
           || ' FROM topology.layer l '
           || ' WHERE l.topology_id = ' || topoid
           || ' AND l.level = 0 '
           || ' AND l.layer_id = r.layer_id '
           || ' AND r.element_id = ' || newedge.left_face
           || ' AND r.element_type = 3 RETURNING r.topogeo_id, r.layer_id';
    --RAISE DEBUG 'SQL: %', sql;
    FOR rec IN EXECUTE sql
    LOOP

      -- Add reference to the other face
      sql := 'INSERT INTO ' || quote_ident(atopology)
             || '.relation VALUES( ' || rec.topogeo_id
             || ',' || rec.layer_id || ',' || newfaces[2] || ', 3)';
      --RAISE DEBUG 'SQL: %', sql;
      EXECUTE sql;

    END LOOP;

    -- drop old face from faces table
    sql := 'DELETE FROM ' || quote_ident(atopology)
           || '.face WHERE face_id = ' || newedge.left_face;
    EXECUTE sql;

  END IF; -- }

  RETURN newedge.edge_id;
END
$$;


--
-- TOC entry 897 (class 1255 OID 20251)
-- Name: st_addisoedge(character varying, integer, integer, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_addisoedge(atopology character varying, anode integer, anothernode integer, acurve public.geometry) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  aface INTEGER;
  face GEOMETRY;
  snodegeom GEOMETRY;
  enodegeom GEOMETRY;
  count INTEGER;
  rec RECORD;
  edgeid INTEGER;
BEGIN

  --
  -- All arguments required
  --
  IF atopology IS NULL
     OR anode IS NULL
     OR anothernode IS NULL
     OR acurve IS NULL
  THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - null argument';
  END IF;

  -- NOT IN THE SPECS:
  -- A closed edge is never isolated (as it forms a face)
  IF anode = anothernode THEN
    RAISE EXCEPTION
    'Closed edges would not be isolated, try ST_AddEdgeNewFaces';
  END IF;

  --
  -- Acurve must be a LINESTRING
  --
  IF substring(geometrytype(acurve), 1, 4) != 'LINE'
  THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - invalid curve';
  END IF;

  --
  -- Acurve must be simple
  --
  IF NOT ST_IsSimple(acurve)
  THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - curve not simple';
  END IF;

  --
  -- Check for:
  --    existence of nodes
  --    nodes faces match
  -- Extract:
  --    nodes face id
  --    nodes geoms
  --
  aface := NULL;
  count := 0;
  FOR rec IN EXECUTE 'SELECT geom, containing_face, node_id FROM '
                     || quote_ident(atopology) || '.node
    WHERE node_id = ' || anode ||
                     ' OR node_id = ' || anothernode
  LOOP

    IF rec.containing_face IS NULL THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - not isolated node';
    END IF;

    IF aface IS NULL THEN
      aface := rec.containing_face;
    ELSE
      IF aface != rec.containing_face THEN
        RAISE EXCEPTION 'SQL/MM Spatial exception - nodes in different faces';
      END IF;
    END IF;

    -- Get nodes geom
    IF rec.node_id = anode THEN
      snodegeom = rec.geom;
    ELSE
      enodegeom = rec.geom;
    END IF;

    count = count+1;

  END LOOP;

  -- TODO: don't need count, can do with snodegeom/enodegeom instead..
  IF count < 2 THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent node';
  END IF;


  --
  -- l) Check that start point of acurve match start node
  -- geoms.
  --
  IF ST_X(snodegeom) != ST_X(ST_StartPoint(acurve)) OR
     ST_Y(snodegeom) != ST_Y(ST_StartPoint(acurve))
  THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - start node not geometry start point.';
  END IF;

  --
  -- m) Check that end point of acurve match end node
  -- geoms.
  --
  IF ST_X(enodegeom) != ST_X(ST_EndPoint(acurve)) OR
     ST_Y(enodegeom) != ST_Y(ST_EndPoint(acurve))
  THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - end node not geometry end point.';
  END IF;

  --
  -- n) Check if curve crosses (contains) any node
  -- I used _contains_ here to leave endpoints out
  --
  FOR rec IN EXECUTE 'SELECT node_id FROM '
                     || quote_ident(atopology) || '.node '
                     || ' WHERE geom && ' || quote_literal(acurve::text)
                     || ' AND ST_Contains(' || quote_literal(acurve::text)
                     || ',geom)'
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - geometry crosses a node';
  END LOOP;

  --
  -- o) Check if curve intersects any other edge
  --
  FOR rec IN EXECUTE 'SELECT * FROM '
                     || quote_ident(atopology) || '.edge_data
    WHERE ST_Intersects(geom, ' || quote_literal(acurve::text) || '::geometry)'
  LOOP
    RAISE EXCEPTION 'SQL/MM Spatial exception - geometry intersects an edge';
  END LOOP;

  --
  -- Get new edge id from sequence
  --
  FOR rec IN EXECUTE 'SELECT nextval(''' ||
                     atopology || '.edge_data_edge_id_seq'')'
  LOOP
    edgeid = rec.nextval;
  END LOOP;

  -- TODO: this should likely be an exception instead !
  IF aface IS NULL THEN
    aface := 0;
  END IF;

  --
  -- Insert the new row
  --
  EXECUTE 'INSERT INTO ' || quote_ident(atopology)
          || '.edge VALUES(' || edgeid || ',' || anode
          || ',' || anothernode || ',' || (-edgeid)
          || ',' || edgeid || ','
          || aface || ',' || aface || ','
          || quote_literal(acurve::text) || ')';

  --
  -- Update Node containing_face values
  --
  -- the nodes anode and anothernode are no more isolated
  -- because now there is an edge connecting them
  --
  EXECUTE 'UPDATE ' || quote_ident(atopology)
          || '.node SET containing_face = NULL where (node_id ='
          || anode
          || ' OR node_id='
          || anothernode
          || ')';

  RETURN edgeid;

END
$$;


--
-- TOC entry 892 (class 1255 OID 20242)
-- Name: st_addisonode(character varying, integer, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_addisonode(atopology character varying, aface integer, apoint public.geometry) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
  nodeid integer;
  sql text;
  containingface integer;
BEGIN

  --
  -- Atopology and apoint are required
  --
  IF atopology IS NULL OR apoint IS NULL THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - null argument';
  END IF;

  --
  -- Apoint must be a point
  --
  IF substring(geometrytype(apoint), 1, 5) != 'POINT'
  THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - invalid point';
  END IF;

  --
  -- Check if a coincident node already exists
  --
  -- We use index AND x/y equality
  --
  FOR rec IN EXECUTE 'SELECT node_id FROM '
                     || quote_ident(atopology) || '.node ' ||
                     'WHERE ST_Equals(geom, ' || quote_literal(apoint::text) || '::geometry)'
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - coincident node';
  END LOOP;

  --
  -- Check if any edge crosses (intersects) this node
  -- I used _intersects_ here to include boundaries (endpoints)
  --
  FOR rec IN EXECUTE 'SELECT edge_id FROM '
                     || quote_ident(atopology) || '.edge '
                     || 'WHERE ST_Intersects(geom, ' || quote_literal(apoint::text)
                     || '::geometry)'
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - edge crosses node.';
  END LOOP;

  -- retrieve the face that contains (eventually) the point

  --
  -- first test is to check if there is inside an mbr (more fast)
  --
  sql := 'SELECT f.face_id FROM '
         || quote_ident(atopology)
         || '.face f WHERE f.face_id > 0 AND f.mbr && '
         || quote_literal(apoint::text)
         || '::geometry AND ST_Contains(topology.ST_GetFaceGeometry('
         || quote_literal(atopology)
         || ', f.face_id), '
         || quote_literal(apoint::text)
         || '::geometry)';
  IF aface IS NOT NULL AND aface != 0 THEN
    sql := sql || ' AND f.face_id = ' || aface;
  END IF;

  EXECUTE sql INTO containingface;

  -- If aface was specified, check that it was correct
  IF aface IS NOT NULL THEN -- {
    IF aface = 0 THEN -- {
      IF containingface IS NOT NULL THEN -- {
        RAISE EXCEPTION
        'SQL/MM Spatial exception - within face % (not universe)',
        containingface;
      ELSE -- }{
        containingface := 0;
      END IF; -- }
    ELSE -- }{ -- aface != 0
      IF containingface IS NULL OR containingface != aface THEN -- {
        RAISE EXCEPTION 'SQL/MM Spatial exception - not within face';
      END IF; -- }
    END IF; -- }
  ELSE -- }{ -- aface is null
    containingface := COALESCE(containingface, 0);
  END IF; -- }

  --
  -- Insert the new row
  --
  sql := 'INSERT INTO '
         || quote_ident(atopology)
         || '.node(node_id, geom, containing_face) SELECT nextval('
         || quote_literal( quote_ident(atopology) || '.node_node_id_seq' )
         || '),'
         ||quote_literal(apoint::text)
         || '::geometry,' || containingface
         || ' RETURNING node_id';

  EXECUTE sql INTO nodeid;

  RETURN nodeid;
  EXCEPTION
  -- TODO: avoid the EXCEPTION handling here ?
  WHEN INVALID_SCHEMA_NAME THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
END
$$;


--
-- TOC entry 899 (class 1255 OID 20253)
-- Name: st_changeedgegeom(character varying, integer, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_changeedgegeom(atopology character varying, anedge integer, acurve public.geometry) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
  rng_info RECORD; -- movement range info
  oldedge RECORD;
  range GEOMETRY; -- movement range
  tmp1 GEOMETRY;
  snode_info RECORD;
  enode_info RECORD;
  sql TEXT;
  iscw BOOLEAN;
BEGIN

  --
  -- All arguments required
  --
  IF atopology IS NULL
     OR anedge IS NULL
     OR acurve IS NULL
  THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - null argument';
  END IF;

  --
  -- Acurve must be a LINESTRING
  --
  IF substring(geometrytype(acurve), 1, 4) != 'LINE'
  THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - invalid curve';
  END IF;

  --
  -- Acurve must be a simple
  --
  IF NOT ST_IsSimple(acurve)
  THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - curve not simple';
  END IF;

  --
  -- Get data about existing edge
  --
  BEGIN
    EXECUTE 'SELECT * FROM ' || quote_ident(atopology) || '.edge_data  '
            || ' WHERE edge_id = ' || anedge
    INTO STRICT oldedge;
    EXCEPTION
    -- NOT IN THE SPECS: check given edge existance
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent edge %', anedge;
  END;

  --
  -- e) Check StartPoint consistency
  --
  IF NOT ST_Equals(ST_StartPoint(acurve), ST_StartPoint(oldedge.geom)) THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - start node not geometry start point.';
  END IF;

  IF oldedge.start_node = oldedge.end_node THEN -- {

    -- Not in the specs:
    -- if the edge is closed, check we didn't change winding !
    --       (should be part of isomorphism checking)
    range := ST_MakePolygon(oldedge.geom);
    iscw := ST_OrderingEquals(range, ST_ForceRHR(range));

    IF ST_NumPoints(ST_RemoveRepeatedPoints(acurve)) < 3 THEN
      RAISE EXCEPTION 'Invalid edge (no two distinct vertices exist)';
    END IF;
    range := ST_MakePolygon(acurve);

    IF iscw != ST_OrderingEquals(range, ST_ForceRHR(range)) THEN
      RAISE EXCEPTION 'Edge twist at node %',
      ST_AsText(ST_StartPoint(oldedge.geom));
    END IF;

  ELSE -- }{

    --
    -- f) Check EndPoint consistency
    --
    IF NOT ST_Equals(ST_EndPoint(acurve), ST_EndPoint(oldedge.geom)) THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - end node not geometry end point.';
    END IF;

  END IF; -- }

  --
  -- g) Check if curve crosses any node
  --
  FOR rec IN EXECUTE
  'SELECT node_id, ST_Relate(geom, '
  || quote_literal(acurve::text) || '::geometry, 2) as relate FROM '
  || quote_ident(atopology)
  || '.node WHERE geom && '
  || quote_literal(acurve::text)
  || '::geometry AND node_id NOT IN ('
  || oldedge.start_node || ',' || oldedge.end_node
  || ')'
  LOOP
    IF ST_RelateMatch(rec.relate, 'T********') THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - geometry crosses a node';
    END IF;
  END LOOP;

  --
  -- h) Check if this geometry has any interaction with any existing edge
  --
  sql := 'SELECT edge_id, ST_Relate(geom,'
         || quote_literal(acurve::text)
         || '::geometry, 2) as im FROM '
         || quote_ident(atopology)
         || '.edge_data WHERE edge_id != ' || anedge || ' AND geom && '
         || quote_literal(acurve::text) || '::geometry';
  FOR rec IN EXECUTE sql LOOP -- {

    --RAISE DEBUG 'IM=%',rec.im;

    IF ST_RelateMatch(rec.im, 'F********') THEN
      CONTINUE; -- no interior-interior intersection
    END IF;

    IF ST_RelateMatch(rec.im, '1FFF*FFF2') THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - coincident edge %', rec.edge_id;
    END IF;

    -- NOT IN THE SPECS: geometry touches an edge
    IF ST_RelateMatch(rec.im, '1********') THEN
      RAISE EXCEPTION
      'Spatial exception - geometry intersects edge %', rec.edge_id;
    END IF;

    IF ST_RelateMatch(rec.im, 'T********') THEN
      RAISE EXCEPTION
      'SQL/MM Spatial exception - geometry crosses edge %', rec.edge_id;
    END IF;

  END LOOP; -- }

  --
  -- Not in the specs:
  -- Check topological isomorphism
  --

  -- Check that the "motion range" doesn't include any node
  --{

  sql := 'SELECT ST_Collect(geom) as nodes, '
         || 'null::geometry as r1, null::geometry as r2 FROM '
         || quote_ident(atopology)
         || '.node WHERE geom && '
         || quote_literal(ST_Collect(ST_Envelope(oldedge.geom),
                                     ST_Envelope(acurve))::text)
         || '::geometry AND node_id NOT IN ( '
         || oldedge.start_node || ',' || oldedge.end_node || ')';
  EXECUTE sql INTO rng_info;

  -- There's no collision if there's no nodes in the combined
  -- bbox of old and new edges.
  --
  IF NOT ST_IsEmpty(rng_info.nodes) THEN -- {


    tmp1 := ST_MakeLine(ST_EndPoint(oldedge.geom), ST_StartPoint(oldedge.geom));

    rng_info.r1 := ST_MakeLine(oldedge.geom, tmp1);
    IF ST_NumPoints(rng_info.r1) < 4 THEN
      rng_info.r1 := ST_AddPoint(rng_info.r1, ST_StartPoint(oldedge.geom));
    END IF;
    rng_info.r1 := ST_CollectionExtract(
        ST_MakeValid(ST_MakePolygon(rng_info.r1)), 3);

    rng_info.r2 := ST_MakeLine(acurve, tmp1);
    IF ST_NumPoints(rng_info.r2) < 4 THEN
      rng_info.r2 := ST_AddPoint(rng_info.r2, ST_StartPoint(oldedge.geom));
    END IF;
    rng_info.r2 := ST_CollectionExtract(
        ST_MakeValid(ST_MakePolygon(rng_info.r2)), 3);

    FOR rec IN WITH
    nodes AS ( SELECT * FROM ST_Dump(rng_info.nodes) ),
    inr1 AS ( SELECT path[1] FROM nodes WHERE ST_Contains(rng_info.r1, geom) ),
    inr2 AS ( SELECT path[1] FROM nodes WHERE ST_Contains(rng_info.r2, geom) )
    ( SELECT * FROM inr1
    EXCEPT
    SELECT * FROM inr2
    ) UNION
    ( SELECT * FROM inr2
    EXCEPT
    SELECT * FROM inr1
    )
    LOOP
    RAISE EXCEPTION 'Edge motion collision at %',
    ST_AsText(ST_GeometryN(rng_info.nodes, rec.path));
  END LOOP;

END IF; -- }

--} motion range checking end

--
-- Check edge adjacency before
--{

SELECT topology._ST_AdjacentEdges(
           atopology, oldedge.start_node, anedge
       ) as pre, NULL::integer[] as post
INTO STRICT snode_info;

SELECT topology._ST_AdjacentEdges(
           atopology, oldedge.end_node, -anedge
       ) as pre, NULL::integer[] as post
INTO STRICT enode_info;

--}

--
-- Update edge geometry
--
EXECUTE 'UPDATE ' || quote_ident(atopology) || '.edge_data '
        || ' SET geom = ' || quote_literal(acurve::text)
        || ' WHERE edge_id = ' || anedge;

--
-- Check edge adjacency after
--{

snode_info.post := topology._ST_AdjacentEdges(
    atopology, oldedge.start_node, anedge
);

enode_info.post := topology._ST_AdjacentEdges(
    atopology, oldedge.end_node, -anedge
);

IF snode_info.pre != snode_info.post THEN
  RAISE EXCEPTION 'Edge changed disposition around start node %',
  oldedge.start_node;
END IF;

IF enode_info.pre != enode_info.post THEN
  RAISE EXCEPTION 'Edge changed disposition around end node %',
  oldedge.end_node;
END IF;

--}

-- Update faces MBR of left and right faces
-- TODO: think about ways to optimize this part, like see if
--       the old edge geometry partecipated in the definition
--       of the current MBR (for shrinking) or the new edge MBR
--       would be larger than the old face MBR...
--
IF oldedge.left_face != 0 THEN
  sql := 'UPDATE ' || quote_ident(atopology) || '.face '
         || ' SET mbr = ' || quote_literal(
             ST_Envelope(ST_GetFaceGeometry(atopology, oldedge.left_face))::text
         )
         || '::geometry WHERE face_id = ' || oldedge.left_face;
  EXECUTE sql;
END IF;
IF oldedge.right_face != 0 AND oldedge.right_face != oldedge.left_face THEN
  sql := 'UPDATE ' || quote_ident(atopology) || '.face '
         || ' SET mbr = ' || quote_literal(
             ST_Envelope(ST_GetFaceGeometry(atopology, oldedge.right_face))::text
         )
         || '::geometry WHERE face_id = ' || oldedge.right_face;
  EXECUTE sql;
END IF;


RETURN 'Edge ' || anedge || ' changed';

END
$$;


--
-- TOC entry 904 (class 1255 OID 20261)
-- Name: st_createtopogeo(character varying, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_createtopogeo(atopology character varying, acollection public.geometry) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  typ char(4);
  rec RECORD;
  ret int;
  nodededges GEOMETRY;
  points GEOMETRY;
  snode_id int;
  enode_id int;
  tolerance FLOAT8;
  topoinfo RECORD;
BEGIN

  IF atopology IS NULL OR acollection IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  -- Get topology information
  BEGIN
    SELECT * FROM topology.topology
    INTO STRICT topoinfo WHERE name = atopology;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END;

  -- Check SRID compatibility
  IF ST_SRID(acollection) != topoinfo.SRID THEN
    RAISE EXCEPTION 'Geometry SRID (%) does not match topology SRID (%)',
    ST_SRID(acollection), topoinfo.SRID;
  END IF;

  -- Verify pre-conditions (valid, empty topology schema exists)
  BEGIN -- {

    -- Verify the topology views in the topology schema to be empty
    FOR rec in EXECUTE
    'SELECT count(*) FROM '
    || quote_ident(atopology) || '.edge_data '
    || ' UNION ' ||
    'SELECT count(*) FROM '
    || quote_ident(atopology) || '.node '
    LOOP
      IF rec.count > 0 THEN
        RAISE EXCEPTION 'SQL/MM Spatial exception - non-empty view';
      END IF;
    END LOOP;

    -- face check is separated as it will contain a single (world)
    -- face record
    FOR rec in EXECUTE
    'SELECT count(*) FROM '
    || quote_ident(atopology) || '.face '
    LOOP
      IF rec.count != 1 THEN
        RAISE EXCEPTION 'SQL/MM Spatial exception - non-empty face view';
      END IF;
    END LOOP;

    EXCEPTION
    WHEN INVALID_SCHEMA_NAME THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
    WHEN UNDEFINED_TABLE THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent view';

  END; -- }


  --
  -- Node input linework with itself
  --
  WITH components AS ( SELECT geom FROM ST_Dump(acollection) )
  SELECT ST_UnaryUnion(ST_Collect(geom)) FROM (
                                                SELECT geom FROM components
                                                WHERE ST_Dimension(geom) = 1
                                                UNION ALL
                                                SELECT ST_Boundary(geom) FROM components
                                                WHERE ST_Dimension(geom) = 2
                                              ) as linework INTO STRICT nodededges;


  --
  -- Linemerge the resulting edges, to reduce the working set
  -- NOTE: this is more of a workaround for GEOS splitting overlapping
  --       lines to each of the segments.
  --
  SELECT ST_LineMerge(nodededges) INTO STRICT nodededges;



  --
  -- Collect input points and input lines endpoints
  --
  WITH components AS ( SELECT geom FROM ST_Dump(acollection) )
  SELECT ST_Union(geom) FROM (
                               SELECT geom FROM components
                               WHERE ST_Dimension(geom) = 0
                               UNION ALL
                               SELECT ST_Boundary(geom) FROM components
                               WHERE ST_Dimension(geom) = 1
                             ) as nodes INTO STRICT points;


  --
  -- Further split edges by points
  -- TODO: optimize this adding ST_Split support for multiline/multipoint
  --
  FOR rec IN SELECT geom FROM ST_Dump(points)
  LOOP
    -- Use the node to split edges
    SELECT ST_Collect(geom)
    FROM ST_Dump(ST_Split(nodededges, rec.geom))
    INTO STRICT nodededges;
  END LOOP;
  SELECT ST_UnaryUnion(nodededges) INTO STRICT nodededges;


  --
  -- Collect all nodes (from points and noded linework endpoints)
  --

  WITH edges AS ( SELECT geom FROM ST_Dump(nodededges) )
  SELECT ST_Union( -- TODO: ST_UnaryUnion ?
      COALESCE(ST_UnaryUnion(ST_Collect(geom)),
               ST_SetSRID('POINT EMPTY'::geometry, topoinfo.SRID)),
      COALESCE(points,
               ST_SetSRID('POINT EMPTY'::geometry, topoinfo.SRID))
  )
  FROM (
         SELECT ST_StartPoint(geom) as geom FROM edges
         UNION ALL
         SELECT ST_EndPoint(geom) FROM edges
       ) as endpoints INTO points;


  --
  -- Add all nodes as isolated so that
  -- later calls to AddEdgeModFace will tweak their being
  -- isolated or not...
  --
  FOR rec IN SELECT geom FROM ST_Dump(points)
  LOOP
    PERFORM topology.ST_AddIsoNode(atopology, 0, rec.geom);
  END LOOP;


  FOR rec IN SELECT geom FROM ST_Dump(nodededges)
  LOOP
    SELECT topology.GetNodeByPoint(atopology, st_startpoint(rec.geom), 0)
    INTO STRICT snode_id;
    SELECT topology.GetNodeByPoint(atopology, st_endpoint(rec.geom), 0)
    INTO STRICT enode_id;
    PERFORM topology.ST_AddEdgeModFace(atopology, snode_id, enode_id, rec.geom);
  END LOOP;

  RETURN 'Topology ' || atopology || ' populated';

END
$$;


--
-- TOC entry 875 (class 1255 OID 20214)
-- Name: st_geometrytype(topogeometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_geometrytype(tg topogeometry) RETURNS text
LANGUAGE sql STABLE STRICT
AS $_$
SELECT CASE
       WHEN type($1) = 1 THEN 'ST_MultiPoint'
       WHEN type($1) = 2 THEN 'ST_MultiLinestring'
       WHEN type($1) = 3 THEN 'ST_MultiPolygon'
       WHEN type($1) = 4 THEN 'ST_GeometryCollection'
       ELSE 'ST_Unexpected'
       END;
$_$;


--
-- TOC entry 885 (class 1255 OID 20232)
-- Name: st_getfaceedges(character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_getfaceedges(toponame character varying, face_id integer) RETURNS SETOF getfaceedges_returntype
LANGUAGE plpgsql STABLE
AS $$
DECLARE
  rec RECORD;
  bounds geometry;
  retrec topology.GetFaceEdges_ReturnType;
  n int;
  sql TEXT;
BEGIN
  --
  -- toponame and face_id are required
  --
  IF toponame IS NULL OR face_id IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  IF toponame = '' THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END IF;

  n := 1;

  -- Construct the face geometry, then for each ring of each polygon:
  sql := 'SELECT (ST_DumpRings((ST_Dump(ST_ForceRHR('
         || 'ST_BuildArea(ST_Collect(geom))))).geom)).geom FROM '
         || quote_ident(toponame) || '.edge_data WHERE left_face = '
         || face_id || ' OR right_face = ' || face_id;
  FOR rec IN EXECUTE sql
  LOOP -- {

    -- Find the edges constituting its boundary
    bounds = ST_Boundary(rec.geom);


    sql := 'WITH er2 AS ( '
           || 'WITH er AS ( SELECT '
           || 'min(e.edge_id) over (), count(*) over () as cnt, e.edge_id, '
           || 'ST_Line_Locate_Point('
           || quote_literal(bounds::text)
           || ', ST_Line_Interpolate_Point(e.geom, 0.2)) as pos'
           || ', ST_Line_Locate_Point('
           || quote_literal(bounds::text)
           || ', ST_Line_Interpolate_Point(e.geom, 0.8)) as pos2 FROM '
           || quote_ident(toponame)
           || '.edge e WHERE ( e.left_face = ' || face_id
           || ' OR e.right_face = ' || face_id
           || ') AND ST_Covers('
           || quote_literal(bounds::text)
           || ', e.geom)';
    IF face_id = 0 THEN
      sql := sql || ' ORDER BY POS ASC) ';
    ELSE
      sql := sql || ' ORDER BY POS DESC) ';
    END IF;

    -- Reorder rows so to start with the one with smaller edge_id
    sql := sql || 'SELECT row_number() over () - 1 as rn, * FROM er ) '
           || 'SELECT *, ( rn + cnt - ( select rn FROM er2 WHERE edge_id = min ) ) % cnt AS reord FROM er2 ORDER BY reord';


    --RAISE DEBUG 'SQL: %', sql;

    FOR rec IN EXECUTE sql
    LOOP


      retrec.sequence = n;
      retrec.edge = rec.edge_id;

      IF face_id = 0 THEN
        -- if this edge goes in opposite direction to the
        --       ring bounds, make it with negative orientation
        IF rec.pos2 < rec.pos THEN -- edge goes in opposite direction
          retrec.edge = -retrec.edge;
        END IF;
      ELSE
        -- if this edge goes in same direction to the
        --       ring bounds, make it with negative orientation
        IF rec.pos2 > rec.pos THEN -- edge goes in same direction
          retrec.edge = -retrec.edge;
        END IF;
      END IF;

      RETURN NEXT retrec;

      n = n+1;

    END LOOP;
  END LOOP; -- }

  RETURN;
  EXCEPTION
  WHEN INVALID_SCHEMA_NAME THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
END
$$;


--
-- TOC entry 891 (class 1255 OID 20241)
-- Name: st_getfacegeometry(character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_getfacegeometry(toponame character varying, aface integer) RETURNS public.geometry
LANGUAGE plpgsql STABLE
AS $$
DECLARE
  rec RECORD;
  sql TEXT;
BEGIN

  --
  -- toponame and aface are required
  --
  IF toponame IS NULL OR aface IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  IF toponame = '' THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END IF;

  IF aface = 0 THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - universal face has no geometry';
  END IF;

  BEGIN

    -- No such face
    sql := 'SELECT NOT EXISTS (SELECT * from ' || quote_ident(toponame)
           || '.face WHERE face_id = ' || aface
           || ') as none';
    EXECUTE sql INTO rec;
    IF rec.none THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent face.';
    END IF;

    --
    -- Construct face
    --
    sql :=
    'SELECT ST_BuildArea(ST_Collect(geom)) as geom FROM '
    || quote_ident(toponame)
    || '.edge_data WHERE left_face = ' || aface
    || ' OR right_face = ' || aface;
    FOR rec IN EXECUTE sql
    LOOP
      RETURN rec.geom;
    END LOOP;

    EXCEPTION
    WHEN INVALID_SCHEMA_NAME THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
    WHEN UNDEFINED_TABLE THEN
      RAISE EXCEPTION 'corrupted topology "%"', toponame;
  END;

  RETURN NULL;
END
$$;


--
-- TOC entry 903 (class 1255 OID 20260)
-- Name: st_inittopogeo(character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_inittopogeo(atopology character varying) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
  topology_id numeric;
BEGIN
  IF atopology IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  FOR rec IN SELECT * FROM pg_namespace WHERE text(nspname) = atopology
  LOOP
    RAISE EXCEPTION 'SQL/MM Spatial exception - schema already exists';
  END LOOP;

  FOR rec IN EXECUTE 'SELECT topology.CreateTopology('
                     ||quote_literal(atopology)|| ') as id'
  LOOP
    topology_id := rec.id;
  END LOOP;

  RETURN 'Topology-Geometry ' || quote_literal(atopology)
         || ' (id:' || topology_id || ') created.';
END
$$;


--
-- TOC entry 887 (class 1255 OID 20235)
-- Name: st_modedgeheal(character varying, integer, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_modedgeheal(toponame character varying, e1id integer, e2id integer) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  e1rec RECORD;
  e2rec RECORD;
  rec RECORD;
  connectededges int[];
  commonnode int;
  caseno int;
  topoid int;
  sql text;
  e2sign int;
  eidary int[];
BEGIN
  --
  -- toponame and face_id are required
  --
  IF toponame IS NULL OR e1id IS NULL OR e2id IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  -- NOT IN THE SPECS: see if the same edge is given twice..
  IF e1id = e2id THEN
    RAISE EXCEPTION 'Cannot heal edge % with itself, try with another', e1id;
  END IF;

  -- Get topology id
  BEGIN
    SELECT id FROM topology.topology
    INTO STRICT topoid WHERE name = toponame;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END;

  BEGIN
    EXECUTE 'SELECT * FROM ' || quote_ident(toponame)
            || '.edge_data WHERE edge_id = ' || e1id
    INTO STRICT e1rec;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent edge %', e1id;
    WHEN INVALID_SCHEMA_NAME THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
    WHEN UNDEFINED_TABLE THEN
      RAISE EXCEPTION 'corrupted topology "%" (missing edge_data table)',
      toponame;
  END;

  BEGIN
    EXECUTE 'SELECT * FROM ' || quote_ident(toponame)
            || '.edge_data WHERE edge_id = ' || e2id
    INTO STRICT e2rec;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent edge %', e2id;
      -- NOTE: checks for INVALID_SCHEMA_NAME or UNDEFINED_TABLE done before
  END;


  -- NOT IN THE SPECS: See if any of the two edges are closed.
  IF e1rec.start_node = e1rec.end_node THEN
    RAISE EXCEPTION 'Edge % is closed, cannot heal to edge %', e1id, e2id;
  END IF;
  IF e2rec.start_node = e2rec.end_node THEN
    RAISE EXCEPTION 'Edge % is closed, cannot heal to edge %', e2id, e1id;
  END IF;

  -- Find common node

  IF e1rec.end_node = e2rec.start_node THEN
    commonnode = e1rec.end_node;
    caseno = 1;
  ELSIF e1rec.end_node = e2rec.end_node THEN
    commonnode = e1rec.end_node;
    caseno = 2;
  END IF;

  -- Check if any other edge is connected to the common node
  IF commonnode IS NOT NULL THEN
    FOR rec IN EXECUTE 'SELECT edge_id FROM ' || quote_ident(toponame)
                       || '.edge_data WHERE ( edge_id != ' || e1id
                       || ' AND edge_id != ' || e2id || ') AND ( start_node = '
                       || commonnode || ' OR end_node = ' || commonnode || ' )'
    LOOP
      commonnode := NULL;
      connectededges = connectededges || rec.edge_id;
    END LOOP;
  END IF;

  IF commonnode IS NULL THEN
    IF e1rec.start_node = e2rec.start_node THEN
      commonnode = e1rec.start_node;
      caseno = 3;
    ELSIF e1rec.start_node = e2rec.end_node THEN
      commonnode = e1rec.start_node;
      caseno = 4;
    END IF;

    -- Check if any other edge is connected to the common node
    IF commonnode IS NOT NULL THEN
      FOR rec IN EXECUTE 'SELECT edge_id FROM ' || quote_ident(toponame)
                         || '.edge_data WHERE ( edge_id != ' || e1id
                         || ' AND edge_id != ' || e2id || ') AND ( start_node = '
                         || commonnode || ' OR end_node = ' || commonnode || ' )'
      LOOP
        commonnode := NULL;
        connectededges = connectededges || rec.edge_id;
      END LOOP;
    END IF;
  END IF;

  IF commonnode IS NULL THEN
    IF connectededges IS NOT NULL THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - other edges connected (%)', array_to_string(connectededges, ',');
    ELSE
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-connected edges';
    END IF;
  END IF;

  -- NOT IN THE SPECS:
  -- check if any topo_geom is defined only by one of the
  -- input edges. In such case there would be no way to adapt
  -- the definition in case of healing, so we'd have to bail out
  eidary = ARRAY[e1id, e2id];
  sql := 'SELECT t.* from ('
         || 'SELECT r.topogeo_id, r.layer_id'
         || ', l.schema_name, l.table_name, l.feature_column'
         || ', array_agg(abs(r.element_id)) as elems '
         || 'FROM topology.layer l INNER JOIN '
         || quote_ident(toponame)
         || '.relation r ON (l.layer_id = r.layer_id) '
         || 'WHERE l.level = 0 AND l.feature_type = 2 '
         || ' AND l.topology_id = ' || topoid
         || ' AND abs(r.element_id) IN (' || e1id || ',' || e2id || ') '
         || 'group by r.topogeo_id, r.layer_id, l.schema_name, l.table_name, '
         || ' l.feature_column ) t WHERE NOT t.elems @> '
         || quote_literal(eidary);
  --RAISE DEBUG 'SQL: %', sql;
  FOR rec IN EXECUTE sql LOOP
    RAISE EXCEPTION 'TopoGeom % in layer % (%.%.%) cannot be represented healing edges % and %',
    rec.topogeo_id, rec.layer_id,
    rec.schema_name, rec.table_name, rec.feature_column,
    e1id, e2id;
  END LOOP;

  -- Update data of the first edge {
  rec := e1rec;
  IF caseno = 1 THEN -- e1.end = e2.start
    rec.geom = ST_MakeLine(e1rec.geom, e2rec.geom);
    rec.end_node = e2rec.end_node;
    rec.next_left_edge = e2rec.next_left_edge;
    e2sign = 1;
  ELSIF caseno = 2 THEN -- e1.end = e2.end
    rec.geom = ST_MakeLine(e1rec.geom, st_reverse(e2rec.geom));
    rec.end_node = e2rec.start_node;
    rec.next_left_edge = e2rec.next_right_edge;
    e2sign = -1;
  ELSIF caseno = 3 THEN -- e1.start = e2.start
    rec.geom = ST_MakeLine(st_reverse(e2rec.geom), e1rec.geom);
    rec.start_node = e2rec.end_node;
    rec.next_right_edge = e2rec.next_left_edge;
    e2sign = -1;
  ELSIF caseno = 4 THEN -- e1.start = e2.end
    rec.geom = ST_MakeLine(e2rec.geom, e1rec.geom);
    rec.start_node = e2rec.start_node;
    rec.next_right_edge = e2rec.next_right_edge;
    e2sign = 1;
  END IF;
  EXECUTE 'UPDATE ' || quote_ident(toponame)
          || '.edge_data SET geom = ' || quote_literal(rec.geom::text)
          || ', start_node = ' || rec.start_node
          || ', end_node = ' || rec.end_node
          || ', next_left_edge = ' || rec.next_left_edge
          || ', abs_next_left_edge = ' || abs(rec.next_left_edge)
          || ', next_right_edge = ' || rec.next_right_edge
          || ', abs_next_right_edge = ' || abs(rec.next_right_edge)
          || ' WHERE edge_id = ' || e1id;
  -- End of first edge update }

  -- Update next_left_edge/next_right_edge for
  -- any edge having them still pointing at the edge being removed (e2id)
  --
  -- NOTE:
  -- *(next_XXX_edge/e2id) serves the purpose of extracting existing
  -- sign from the value, while *e2sign changes that sign again if we
  -- reverted edge2 direction
  --
  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET abs_next_left_edge = ' || e1id
         || ', next_left_edge = ' || e2sign*e1id
         || '*(next_left_edge/'
         || e2id || ')  WHERE abs_next_left_edge = ' || e2id;
  --RAISE DEBUG 'SQL: %', sql;
  EXECUTE sql;
  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET abs_next_right_edge = ' || e1id
         || ', next_right_edge = ' || e2sign*e1id
         || '*(next_right_edge/'
         || e2id || ') WHERE abs_next_right_edge = ' || e2id;
  --RAISE DEBUG 'SQL: %', sql;
  EXECUTE sql;

  -- Delete the second edge
  EXECUTE 'DELETE FROM ' || quote_ident(toponame)
          || '.edge_data WHERE edge_id = ' || e2id;

  -- Delete the common node
  BEGIN
    EXECUTE 'DELETE FROM ' || quote_ident(toponame)
            || '.node WHERE node_id = ' || commonnode;
    EXCEPTION
    WHEN UNDEFINED_TABLE THEN
      RAISE EXCEPTION 'corrupted topology "%" (missing node table)',
      toponame;
  END;

  --
  -- NOT IN THE SPECS:
  -- Drop composition rows involving second
  -- edge, as the first edge took its space,
  -- and all affected TopoGeom have been previously checked
  -- for being composed by both edges.
  sql := 'DELETE FROM ' || quote_ident(toponame)
         || '.relation r USING topology.layer l '
         || 'WHERE l.level = 0 AND l.feature_type = 2'
         || ' AND l.topology_id = ' || topoid
         || ' AND l.layer_id = r.layer_id AND abs(r.element_id) = '
         || e2id;
  --RAISE DEBUG 'SQL: %', sql;
  EXECUTE sql;

  RETURN commonnode;
END
$$;


--
-- TOC entry 799 (class 1255 OID 20249)
-- Name: st_modedgesplit(character varying, integer, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_modedgesplit(atopology character varying, anedge integer, apoint public.geometry) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  oldedge RECORD;
  rec RECORD;
  tmp integer;
  topoid integer;
  nodeid integer;
  nodepos float8;
  newedgeid integer;
  newedge1 geometry;
  newedge2 geometry;
  query text;
  ok BOOL;
BEGIN

  --
  -- All args required
  --
  IF atopology IS NULL OR anedge IS NULL OR apoint IS NULL THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - null argument';
  END IF;

  -- Get topology id
  SELECT id FROM topology.topology into topoid
  WHERE name = atopology;

  --
  -- Check node existance
  --
  ok = false;
  FOR oldedge IN EXECUTE 'SELECT * FROM '
                         || quote_ident(atopology) || '.edge_data ' ||
                         ' WHERE edge_id =  ' || anedge
  LOOP
    ok = true;
  END LOOP;
  IF NOT ok THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - non-existent edge';
  END IF;

  --
  -- Check that given point is Within(anedge.geom)
  --
  IF NOT ST_Within(apoint, oldedge.geom) THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - point not on edge';
  END IF;

  --
  -- Check if a coincident node already exists
  --
  FOR rec IN EXECUTE 'SELECT node_id FROM '
                     || quote_ident(atopology) || '.node ' ||
                     'WHERE geom && '
                     || quote_literal(apoint::text) || '::geometry'
                     ||' AND ST_X(geom) = ST_X('
                     || quote_literal(apoint::text) || '::geometry)'
                     ||' AND ST_Y(geom) = ST_Y('
                     ||quote_literal(apoint::text)||'::geometry)'
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - coincident node';
  END LOOP;

  --
  -- Get new node id
  --
  FOR rec IN EXECUTE 'SELECT nextval(''' ||
                     atopology || '.node_node_id_seq'')'
  LOOP
    nodeid = rec.nextval;
  END LOOP;

  --RAISE NOTICE 'Next node id = % ', nodeid;

  --
  -- Add the new node
  --
  EXECUTE 'INSERT INTO ' || quote_ident(atopology)
          || '.node(node_id, geom)
    VALUES('||nodeid||','||quote_literal(apoint::text)||
          ')';

  --
  -- Compute new edge
  --
  newedge2 := ST_Split(oldedge.geom, apoint);
  newedge1 := ST_GeometryN(newedge2, 1);
  newedge2 := ST_GeometryN(newedge2, 2);

  --
  -- Get ids for the new edge
  --
  FOR rec IN EXECUTE 'SELECT nextval(''' ||
                     atopology || '.edge_data_edge_id_seq'')'
  LOOP
    newedgeid = rec.nextval;
  END LOOP;


  --
  -- Insert the new edge
  --
  EXECUTE 'INSERT INTO ' || quote_ident(atopology)
          || '.edge '
          || '(edge_id, start_node, end_node,'
          || 'next_left_edge, next_right_edge,'
          || 'left_face, right_face, geom) '
          || 'VALUES('
          || newedgeid
          || ',' || nodeid
          || ',' || oldedge.end_node
          || ',' || COALESCE(                      -- next_left_edge
              NULLIF(
                  oldedge.next_left_edge,
                  -anedge
              ),
              -newedgeid
          )
          || ',' || -anedge                        -- next_right_edge
          || ',' || oldedge.left_face              -- left_face
          || ',' || oldedge.right_face             -- right_face
          || ',' || quote_literal(newedge2::text)  -- geom
          ||')';

  --
  -- Update the old edge
  --
  EXECUTE 'UPDATE ' || quote_ident(atopology) || '.edge_data '
          || ' SET geom = ' || quote_literal(newedge1::text)
          || ','
          || ' next_left_edge = ' || newedgeid
          || ', abs_next_left_edge = ' || newedgeid
          || ','
          || ' end_node = ' || nodeid
          || ' WHERE edge_id = ' || anedge;


  --
  -- Update all next edge references to match new layout
  --

  EXECUTE 'UPDATE ' || quote_ident(atopology)
          || '.edge_data SET next_right_edge = '
          || -newedgeid
          || ','
          || ' abs_next_right_edge = ' || newedgeid
          || ' WHERE edge_id != ' || newedgeid
          || ' AND next_right_edge = ' || -anedge;

  EXECUTE 'UPDATE ' || quote_ident(atopology)
          || '.edge_data SET '
          || ' next_left_edge = ' || -newedgeid
          || ','
          || ' abs_next_left_edge = ' || newedgeid
          || ' WHERE edge_id != ' || newedgeid
          || ' AND next_left_edge = ' || -anedge;

  --
  -- Update references in the Relation table.
  -- We only take into considerations non-hierarchical
  -- TopoGeometry here, for obvious reasons.
  --
  FOR rec IN EXECUTE 'SELECT r.* FROM '
                     || quote_ident(atopology)
                     || '.relation r, topology.layer l '
                     || ' WHERE '
                     || ' l.topology_id = ' || topoid
                     || ' AND l.level = 0 '
                     || ' AND l.layer_id = r.layer_id '
                     || ' AND abs(r.element_id) = ' || anedge
                     || ' AND r.element_type = 2'
  LOOP
    --RAISE NOTICE 'TopoGeometry % in layer % contains the edge being split (%) - updating to add new edge %', rec.topogeo_id, rec.layer_id, anedge, newedgeid;

    -- Add new reference to edge1
    IF rec.element_id < 0 THEN
      tmp = -newedgeid;
    ELSE
      tmp = newedgeid;
    END IF;
    query = 'INSERT INTO ' || quote_ident(atopology)
            || '.relation '
            || ' VALUES( '
            || rec.topogeo_id
            || ','
            || rec.layer_id
            || ','
            || tmp
            || ','
            || rec.element_type
            || ')';

    --RAISE NOTICE '%', query;
    EXECUTE query;
  END LOOP;

  --RAISE NOTICE 'Edge % split in edges % and % by node %',
  --  anedge, anedge, newedgeid, nodeid;

  RETURN nodeid;
END
$$;


--
-- TOC entry 893 (class 1255 OID 20243)
-- Name: st_moveisonode(character varying, integer, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_moveisonode(atopology character varying, anode integer, apoint public.geometry) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
BEGIN

  --
  -- All arguments are required
  --
  IF atopology IS NULL OR anode IS NULL OR apoint IS NULL THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - null argument';
  END IF;

  --
  -- Apoint must be a point
  --
  IF substring(geometrytype(apoint), 1, 5) != 'POINT'
  THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - invalid point';
  END IF;

  --
  -- Check node isolation.
  --
  FOR rec IN EXECUTE 'SELECT edge_id FROM '
                     || quote_ident(atopology) || '.edge ' ||
                     ' WHERE start_node =  ' || anode ||
                     ' OR end_node = ' || anode
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - not isolated node';
  END LOOP;

  --
  -- Check if a coincident node already exists
  --
  -- We use index AND x/y equality
  --
  FOR rec IN EXECUTE 'SELECT node_id FROM '
                     || quote_ident(atopology) || '.node ' ||
                     'WHERE geom && ' || quote_literal(apoint::text) || '::geometry'
                     ||' AND ST_X(geom) = ST_X('||quote_literal(apoint::text)||'::geometry)'
                     ||' AND ST_Y(geom) = ST_Y('||quote_literal(apoint::text)||'::geometry)'
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - coincident node';
  END LOOP;

  --
  -- Check if any edge crosses (intersects) this node
  -- I used _intersects_ here to include boundaries (endpoints)
  --
  FOR rec IN EXECUTE 'SELECT edge_id FROM '
                     || quote_ident(atopology) || '.edge '
                     || 'WHERE geom && ' || quote_literal(apoint::text)
                     || ' AND ST_Intersects(geom, ' || quote_literal(apoint::text)
                     || '::geometry)'
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - edge crosses node.';
  END LOOP;

  --
  -- Update node point
  --
  EXECUTE 'UPDATE ' || quote_ident(atopology) || '.node '
          || ' SET geom = ' || quote_literal(apoint::text)
          || ' WHERE node_id = ' || anode;

  RETURN 'Isolated Node ' || anode || ' moved to location '
         || ST_X(apoint) || ',' || ST_Y(apoint);
END
$$;


--
-- TOC entry 886 (class 1255 OID 20233)
-- Name: st_newedgeheal(character varying, integer, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_newedgeheal(toponame character varying, e1id integer, e2id integer) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  e1rec RECORD;
  e2rec RECORD;
  rec RECORD;
  newedgeid int;
  connectededges int[];
  commonnode int;
  caseno int;
  topoid int;
  sql text;
  e2sign int;
  eidary int[];
BEGIN
  --
  -- toponame and face_id are required
  --
  IF toponame IS NULL OR e1id IS NULL OR e2id IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  -- NOT IN THE SPECS: see if the same edge is given twice..
  IF e1id = e2id THEN
    RAISE EXCEPTION 'Cannot heal edge % with itself, try with another', e1id;
  END IF;

  -- Get topology id
  BEGIN
    SELECT id FROM topology.topology
    INTO STRICT topoid WHERE name = toponame;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END;

  BEGIN
    EXECUTE 'SELECT * FROM ' || quote_ident(toponame)
            || '.edge_data WHERE edge_id = ' || e1id
    INTO STRICT e1rec;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent edge %', e1id;
    WHEN INVALID_SCHEMA_NAME THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
    WHEN UNDEFINED_TABLE THEN
      RAISE EXCEPTION 'corrupted topology "%" (missing edge_data table)',
      toponame;
  END;

  BEGIN
    EXECUTE 'SELECT * FROM ' || quote_ident(toponame)
            || '.edge_data WHERE edge_id = ' || e2id
    INTO STRICT e2rec;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent edge %', e2id;
      -- NOTE: checks for INVALID_SCHEMA_NAME or UNDEFINED_TABLE done before
  END;


  -- NOT IN THE SPECS: See if any of the two edges are closed.
  IF e1rec.start_node = e1rec.end_node THEN
    RAISE EXCEPTION 'Edge % is closed, cannot heal to edge %', e1id, e2id;
  END IF;
  IF e2rec.start_node = e2rec.end_node THEN
    RAISE EXCEPTION 'Edge % is closed, cannot heal to edge %', e2id, e1id;
  END IF;

  -- Find common node

  IF e1rec.end_node = e2rec.start_node THEN
    commonnode = e1rec.end_node;
    caseno = 1;
  ELSIF e1rec.end_node = e2rec.end_node THEN
    commonnode = e1rec.end_node;
    caseno = 2;
  END IF;

  -- Check if any other edge is connected to the common node
  IF commonnode IS NOT NULL THEN
    FOR rec IN EXECUTE 'SELECT edge_id FROM ' || quote_ident(toponame)
                       || '.edge_data WHERE ( edge_id != ' || e1id
                       || ' AND edge_id != ' || e2id || ') AND ( start_node = '
                       || commonnode || ' OR end_node = ' || commonnode || ' )'
    LOOP
      commonnode := NULL;
      connectededges = connectededges || rec.edge_id;
    END LOOP;
  END IF;

  IF commonnode IS NULL THEN
    IF e1rec.start_node = e2rec.start_node THEN
      commonnode = e1rec.start_node;
      caseno = 3;
    ELSIF e1rec.start_node = e2rec.end_node THEN
      commonnode = e1rec.start_node;
      caseno = 4;
    END IF;

    -- Check if any other edge is connected to the common node
    IF commonnode IS NOT NULL THEN
      FOR rec IN EXECUTE 'SELECT edge_id FROM ' || quote_ident(toponame)
                         || '.edge_data WHERE ( edge_id != ' || e1id
                         || ' AND edge_id != ' || e2id || ') AND ( start_node = '
                         || commonnode || ' OR end_node = ' || commonnode || ' )'
      LOOP
        commonnode := NULL;
        connectededges = connectededges || rec.edge_id;
      END LOOP;
    END IF;
  END IF;

  IF commonnode IS NULL THEN
    IF connectededges IS NOT NULL THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - other edges connected (%)', array_to_string(connectededges, ',');
    ELSE
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-connected edges';
    END IF;
  END IF;

  -- NOT IN THE SPECS:
  -- check if any topo_geom is defined only by one of the
  -- input edges. In such case there would be no way to adapt
  -- the definition in case of healing, so we'd have to bail out
  eidary = ARRAY[e1id, e2id];
  sql := 'SELECT t.* from ('
         || 'SELECT r.topogeo_id, r.layer_id'
         || ', l.schema_name, l.table_name, l.feature_column'
         || ', array_agg(abs(r.element_id)) as elems '
         || 'FROM topology.layer l INNER JOIN '
         || quote_ident(toponame)
         || '.relation r ON (l.layer_id = r.layer_id) '
         || 'WHERE l.level = 0 AND l.feature_type = 2 '
         || ' AND l.topology_id = ' || topoid
         || ' AND abs(r.element_id) IN (' || e1id || ',' || e2id || ') '
         || 'group by r.topogeo_id, r.layer_id, l.schema_name, l.table_name, '
         || ' l.feature_column ) t WHERE NOT t.elems @> '
         || quote_literal(eidary);
  --RAISE DEBUG 'SQL: %', sql;
  FOR rec IN EXECUTE sql LOOP
    RAISE EXCEPTION 'TopoGeom % in layer % (%.%.%) cannot be represented healing edges % and %',
    rec.topogeo_id, rec.layer_id,
    rec.schema_name, rec.table_name, rec.feature_column,
    e1id, e2id;
  END LOOP;

  -- Create new edge {
  rec := e1rec;
  IF caseno = 1 THEN -- e1.end = e2.start
    rec.geom = ST_MakeLine(e1rec.geom, e2rec.geom);
    rec.end_node = e2rec.end_node;
    rec.next_left_edge = e2rec.next_left_edge;
    e2sign = 1;
  ELSIF caseno = 2 THEN -- e1.end = e2.end
    rec.geom = ST_MakeLine(e1rec.geom, st_reverse(e2rec.geom));
    rec.end_node = e2rec.start_node;
    rec.next_left_edge = e2rec.next_right_edge;
    e2sign = -1;
  ELSIF caseno = 3 THEN -- e1.start = e2.start
    rec.geom = ST_MakeLine(st_reverse(e2rec.geom), e1rec.geom);
    rec.start_node = e2rec.end_node;
    rec.next_right_edge = e2rec.next_left_edge;
    e2sign = -1;
  ELSIF caseno = 4 THEN -- e1.start = e2.end
    rec.geom = ST_MakeLine(e2rec.geom, e1rec.geom);
    rec.start_node = e2rec.start_node;
    rec.next_right_edge = e2rec.next_right_edge;
    e2sign = 1;
  END IF;
  -- }

  -- Insert new edge {
  EXECUTE 'SELECT nextval(' || quote_literal(
      quote_ident(toponame) || '.edge_data_edge_id_seq'
  ) || ')' INTO STRICT newedgeid;
  EXECUTE 'INSERT INTO ' || quote_ident(toponame)
          || '.edge VALUES(' || newedgeid
          || ',' || rec.start_node
          || ',' || rec.end_node
          || ',' || rec.next_left_edge
          || ',' || rec.next_right_edge
          || ',' || rec.left_face
          || ',' || rec.right_face
          || ',' || quote_literal(rec.geom::text)
          || ')';
  -- End of new edge insertion }

  -- Update next_left_edge/next_right_edge for
  -- any edge having them still pointing at the edges being removed
  -- (e2id)
  --
  -- NOTE:
  -- *(next_XXX_edge/e2id) serves the purpose of extracting existing
  -- sign from the value, while *e2sign changes that sign again if we
  -- reverted edge2 direction
  --
  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET abs_next_left_edge = ' || newedgeid
         || ', next_left_edge = ' || e2sign*newedgeid
         || '*(next_left_edge/'
         || e2id || ')  WHERE abs_next_left_edge = ' || e2id;
  --RAISE DEBUG 'SQL: %', sql;
  EXECUTE sql;
  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET abs_next_right_edge = ' || newedgeid
         || ', next_right_edge = ' || e2sign*newedgeid
         || '*(next_right_edge/'
         || e2id || ') WHERE abs_next_right_edge = ' || e2id;
  --RAISE DEBUG 'SQL: %', sql;
  EXECUTE sql;

  -- New edge has the same direction as old edge 1
  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET abs_next_left_edge = ' || newedgeid
         || ', next_left_edge = ' || newedgeid
         || '*(next_left_edge/'
         || e1id || ')  WHERE abs_next_left_edge = ' || e1id;
  --RAISE DEBUG 'SQL: %', sql;
  EXECUTE sql;
  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET abs_next_right_edge = ' || newedgeid
         || ', next_right_edge = ' || newedgeid
         || '*(next_right_edge/'
         || e1id || ') WHERE abs_next_right_edge = ' || e1id;
  --RAISE DEBUG 'SQL: %', sql;
  EXECUTE sql;

  --
  -- NOT IN THE SPECS:
  -- Replace composition rows involving the two
  -- edges as one involving the new edge.
  -- It takes a DELETE and an UPDATE to do all
  sql := 'DELETE FROM ' || quote_ident(toponame)
         || '.relation r USING topology.layer l '
         || 'WHERE l.level = 0 AND l.feature_type = 2'
         || ' AND l.topology_id = ' || topoid
         || ' AND l.layer_id = r.layer_id AND abs(r.element_id) = '
         || e2id;
  --RAISE DEBUG 'SQL: %', sql;
  EXECUTE sql;
  sql := 'UPDATE ' || quote_ident(toponame)
         || '.relation r '
         || ' SET element_id = ' || newedgeid || '*(element_id/'
         || e1id
         || ') FROM topology.layer l WHERE l.level = 0 AND l.feature_type = 2'
         || ' AND l.topology_id = ' || topoid
         || ' AND l.layer_id = r.layer_id AND abs(r.element_id) = '
         || e1id
  ;
  EXECUTE sql;


  -- Delete both edges
  EXECUTE 'DELETE FROM ' || quote_ident(toponame)
          || '.edge_data WHERE edge_id = ' || e2id;
  EXECUTE 'DELETE FROM ' || quote_ident(toponame)
          || '.edge_data WHERE edge_id = ' || e1id;

  -- Delete the common node
  BEGIN
    EXECUTE 'DELETE FROM ' || quote_ident(toponame)
            || '.node WHERE node_id = ' || commonnode;
    EXCEPTION
    WHEN UNDEFINED_TABLE THEN
      RAISE EXCEPTION 'corrupted topology "%" (missing node table)',
      toponame;
  END;

  RETURN newedgeid;
END
$$;


--
-- TOC entry 798 (class 1255 OID 20247)
-- Name: st_newedgessplit(character varying, integer, public.geometry); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_newedgessplit(atopology character varying, anedge integer, apoint public.geometry) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  oldedge RECORD;
  rec RECORD;
  tmp integer;
  topoid integer;
  nodeid integer;
  nodepos float8;
  edgeid1 integer;
  edgeid2 integer;
  edge1 geometry;
  edge2 geometry;
  ok BOOL;
BEGIN

  --
  -- All args required
  --
  IF atopology IS NULL OR anedge IS NULL OR apoint IS NULL THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - null argument';
  END IF;

  --
  -- Check node existance
  --
  ok = false;
  FOR oldedge IN EXECUTE 'SELECT * FROM '
                         || quote_ident(atopology) || '.edge_data ' ||
                         ' WHERE edge_id =  ' || anedge
  LOOP
    ok = true;
  END LOOP;
  IF NOT ok THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - non-existent edge';
  END IF;

  --
  -- Check that given point is Within(anedge.geom)
  --
  IF NOT ST_Within(apoint, oldedge.geom) THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - point not on edge';
  END IF;

  --
  -- Check if a coincident node already exists
  --
  FOR rec IN EXECUTE 'SELECT node_id FROM '
                     || quote_ident(atopology) || '.node '
                     || 'WHERE geom && '
                     || quote_literal(apoint::text) || '::geometry'
                     || ' AND ST_X(geom) = ST_X('
                     || quote_literal(apoint::text) || '::geometry)'
                     || ' AND ST_Y(geom) = ST_Y('
                     || quote_literal(apoint::text) || '::geometry)'
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - coincident node';
  END LOOP;

  --
  -- Get new node id
  --
  FOR rec IN EXECUTE 'SELECT nextval(''' ||
                     atopology || '.node_node_id_seq'')'
  LOOP
    nodeid = rec.nextval;
  END LOOP;

  --RAISE NOTICE 'Next node id = % ', nodeid;

  --
  -- Add the new node
  --
  EXECUTE 'INSERT INTO ' || quote_ident(atopology)
          || '.node(node_id, geom)
    VALUES(' || nodeid || ','
          || quote_literal(apoint::text)
          || ')';

  --
  -- Delete the old edge
  --
  EXECUTE 'DELETE FROM ' || quote_ident(atopology) || '.edge_data '
          || ' WHERE edge_id = ' || anedge;

  --
  -- Compute new edges
  --
  edge2 := ST_Split(oldedge.geom, apoint);
  edge1 := ST_GeometryN(edge2, 1);
  edge2 := ST_GeometryN(edge2, 2);

  --
  -- Get ids for the new edges
  --
  FOR rec IN EXECUTE 'SELECT nextval(''' ||
                     atopology || '.edge_data_edge_id_seq'')'
  LOOP
    edgeid1 = rec.nextval;
  END LOOP;
  FOR rec IN EXECUTE 'SELECT nextval(''' ||
                     atopology || '.edge_data_edge_id_seq'')'
  LOOP
    edgeid2 = rec.nextval;
  END LOOP;


  --RAISE NOTICE 'EdgeId1 % EdgeId2 %', edgeid1, edgeid2;

  --RAISE DEBUG 'oldedge.next_left_edge: %', oldedge.next_left_edge;
  --RAISE DEBUG 'oldedge.next_right_edge: %', oldedge.next_right_edge;

  --
  -- Insert the two new edges
  --
  EXECUTE 'INSERT INTO ' || quote_ident(atopology)
          || '.edge VALUES('
          || edgeid1                                -- edge_id
          || ',' || oldedge.start_node              -- start_node
          || ',' || nodeid                          -- end_node
          || ',' || edgeid2                         -- next_left_edge
          || ',' || CASE                            -- next_right_edge
                    WHEN
                      oldedge.next_right_edge = anedge
                      THEN edgeid1
                    WHEN
                      oldedge.next_right_edge = -anedge
                      THEN -edgeid2
                    ELSE oldedge.next_right_edge
                    END
          || ',' || oldedge.left_face               -- left_face
          || ',' || oldedge.right_face              -- right_face
          || ',' || quote_literal(edge1::text)      -- geom
          ||')';

  EXECUTE 'INSERT INTO ' || quote_ident(atopology)
          || '.edge VALUES('
          || edgeid2                                -- edge_id
          || ',' || nodeid                          -- start_node
          || ',' || oldedge.end_node                -- end_node
          || ',' || CASE                            -- next_left_edge
                    WHEN
                      oldedge.next_left_edge =
                      -anedge
                      THEN -edgeid2
                    WHEN
                      oldedge.next_left_edge =
                      anedge
                      THEN edgeid1
                    ELSE oldedge.next_left_edge
                    END
          || ',' || -edgeid1                        -- next_right_edge
          || ',' || oldedge.left_face               -- left_face
          || ',' || oldedge.right_face              -- right_face
          || ',' || quote_literal(edge2::text)      -- geom
          ||')';

  --
  -- Update all next edge references to match new layout
  --

  EXECUTE 'UPDATE ' || quote_ident(atopology)
          || '.edge_data SET next_right_edge = '
          || edgeid2
          || ','
          || ' abs_next_right_edge = ' || edgeid2
          || ' WHERE next_right_edge = ' || anedge
          || ' AND edge_id NOT IN (' || edgeid1 || ',' || edgeid2 || ')'
  ;
  EXECUTE 'UPDATE ' || quote_ident(atopology)
          || '.edge_data SET next_right_edge = '
          || -edgeid1
          || ','
          || ' abs_next_right_edge = ' || edgeid1
          || ' WHERE next_right_edge = ' || -anedge
          || ' AND edge_id NOT IN (' || edgeid1 || ',' || edgeid2 || ')'
  ;

  EXECUTE 'UPDATE ' || quote_ident(atopology)
          || '.edge_data SET next_left_edge = '
          || edgeid1
          || ','
          || ' abs_next_left_edge = ' || edgeid1
          || ' WHERE next_left_edge = ' || anedge
          || ' AND edge_id NOT IN (' || edgeid1 || ',' || edgeid2 || ')'
  ;
  EXECUTE 'UPDATE ' || quote_ident(atopology)
          || '.edge_data SET '
          || ' next_left_edge = ' || -edgeid2
          || ','
          || ' abs_next_left_edge = ' || edgeid2
          || ' WHERE next_left_edge = ' || -anedge
          || ' AND edge_id NOT IN (' || edgeid1 || ',' || edgeid2 || ')'
  ;

  -- Get topology id
  SELECT id FROM topology.topology into topoid
  WHERE name = atopology;
  IF topoid IS NULL THEN
    RAISE EXCEPTION 'No topology % registered',
    quote_ident(atopology);
  END IF;

  --
  -- Update references in the Relation table.
  -- We only take into considerations non-hierarchical
  -- TopoGeometry here, for obvious reasons.
  --
  FOR rec IN EXECUTE 'SELECT r.* FROM '
                     || quote_ident(atopology)
                     || '.relation r, topology.layer l '
                     || ' WHERE '
                     || ' l.topology_id = ' || topoid
                     || ' AND l.level = 0 '
                     || ' AND l.layer_id = r.layer_id '
                     || ' AND abs(r.element_id) = ' || anedge
                     || ' AND r.element_type = 2'
  LOOP
    --RAISE NOTICE 'TopoGeometry % in layer % contains the edge being split', rec.topogeo_id, rec.layer_id;

    -- Delete old reference
    EXECUTE 'DELETE FROM ' || quote_ident(atopology)
            || '.relation '
            || ' WHERE '
            || 'layer_id = ' || rec.layer_id
            || ' AND '
            || 'topogeo_id = ' || rec.topogeo_id
            || ' AND '
            || 'element_type = ' || rec.element_type
            || ' AND '
            || 'abs(element_id) = ' || anedge;

    -- Add new reference to edge1
    IF rec.element_id < 0 THEN
      tmp = -edgeid1;
    ELSE
      tmp = edgeid1;
    END IF;
    EXECUTE 'INSERT INTO ' || quote_ident(atopology)
            || '.relation '
            || ' VALUES( '
            || rec.topogeo_id
            || ','
            || rec.layer_id
            || ','
            || tmp
            || ','
            || rec.element_type
            || ')';

    -- Add new reference to edge2
    IF rec.element_id < 0 THEN
      tmp = -edgeid2;
    ELSE
      tmp = edgeid2;
    END IF;
    EXECUTE 'INSERT INTO ' || quote_ident(atopology)
            || '.relation '
            || ' VALUES( '
            || rec.topogeo_id
            || ','
            || rec.layer_id
            || ','
            || tmp
            || ','
            || rec.element_type
            || ')';

  END LOOP;

  --RAISE NOTICE 'Edge % split in edges % and % by node %',
  --  anedge, edgeid1, edgeid2, nodeid;

  RETURN nodeid;
END
$$;


--
-- TOC entry 889 (class 1255 OID 20239)
-- Name: st_remedgemodface(character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_remedgemodface(toponame character varying, e1id integer) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  e1rec RECORD;
  rec RECORD;
  fidary int[];
  topoid int;
  sql text;
  floodfaceid int;
  elink int;
BEGIN
  --
  -- toponame and face_id are required
  --
  IF toponame IS NULL OR e1id IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  -- Get topology id
  BEGIN
    SELECT id FROM topology.topology
    INTO STRICT topoid WHERE name = toponame;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END;

  BEGIN
    EXECUTE 'SELECT * FROM ' || quote_ident(toponame)
            || '.edge_data WHERE edge_id = ' || e1id
    INTO STRICT e1rec;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent edge %', e1id;
    WHEN INVALID_SCHEMA_NAME THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
    WHEN UNDEFINED_TABLE THEN
      RAISE EXCEPTION 'corrupted topology "%" (missing edge_data table)',
      toponame;
  END;

  -- Check that no TopoGeometry references the edge being removed
  sql := 'SELECT r.topogeo_id, r.layer_id'
         || ', l.schema_name, l.table_name, l.feature_column '
         || 'FROM topology.layer l INNER JOIN '
         || quote_ident(toponame)
         || '.relation r ON (l.layer_id = r.layer_id) '
         || 'WHERE l.level = 0 AND l.feature_type = 2 '
         || ' AND l.topology_id = ' || topoid
         || ' AND abs(r.element_id) = ' || e1id ;
  FOR rec IN EXECUTE sql LOOP
    RAISE EXCEPTION 'TopoGeom % in layer % (%.%.%) cannot be represented dropping edge %',
    rec.topogeo_id, rec.layer_id,
    rec.schema_name, rec.table_name, rec.feature_column,
    e1id;
  END LOOP;

  -- Update next_left_edge and next_right_edge face
  -- for all edges bounding the new face
  RAISE NOTICE 'Updating next_{right,left}_face of ring edges...';

  -- TODO: reduce the following to 2 UPDATE rather than 4

  -- Update next_left_edge of previous edges in left face -- {

  elink := e1rec.next_left_edge;

  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET next_left_edge = '
         || elink
         || ', abs_next_left_edge = '
         || abs(elink)
         || ' WHERE next_left_edge < 0 AND abs(next_left_edge) = '
         || e1id;
  EXECUTE sql;

  -- If the edge being removed links to self,
  -- we use the other face
  IF e1rec.abs_next_right_edge = e1rec.edge_id THEN
    elink := e1rec.next_left_edge;
  ELSE
    elink := e1rec.next_right_edge;
  END IF;

  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET next_left_edge = '
         || elink
         || ', abs_next_left_edge = '
         || abs(elink)
         || ' WHERE next_left_edge > 0 AND abs(next_left_edge) = '
         || e1id;
  EXECUTE sql;

  -- }

  -- Update next_right_edge of previous edges in right face -- {

  elink := e1rec.next_left_edge;

  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET next_right_edge = '
         || elink
         || ', abs_next_right_edge = '
         || abs(elink)
         || ' WHERE next_right_edge < 0 AND abs(next_right_edge) = '
         || e1id;
  EXECUTE sql;

  -- If the edge being removed links to self,
  -- we use the other face
  IF e1rec.abs_next_right_edge = e1rec.edge_id THEN
    elink := e1rec.next_left_edge;
  ELSE
    elink := e1rec.next_right_edge;
  END IF;

  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET next_right_edge = '
         || elink
         || ', abs_next_right_edge = '
         || abs(elink)
         || ' WHERE next_right_edge > 0 AND abs(next_right_edge) = '
         || e1id;
  EXECUTE sql;

  -- }

  IF e1rec.left_face = e1rec.right_face THEN -- {

    RAISE NOTICE 'Deletion of edge % affects no face',
    e1rec.edge_id;

    floodfaceid = e1rec.left_face;

  ELSE -- }{

    RAISE NOTICE 'Deletion of edge % joins faces % and %',
    e1rec.edge_id, e1rec.left_face, e1rec.right_face;

    -- NOT IN THE SPECS:
    -- check if any topo_geom is defined only by one of the
    -- joined faces. In such case there would be no way to adapt
    -- the definition in case of healing, so we'd have to bail out
    --
    -- TODO: use an internal function and share with ST_RemEdgeNewFace
    --
    fidary = ARRAY[e1rec.left_face, e1rec.right_face];
    sql := 'SELECT t.* from ('
           || 'SELECT r.topogeo_id, r.layer_id'
           || ', l.schema_name, l.table_name, l.feature_column'
           || ', array_agg(r.element_id) as elems '
           || 'FROM topology.layer l INNER JOIN '
           || quote_ident(toponame)
           || '.relation r ON (l.layer_id = r.layer_id) '
           || 'WHERE l.level = 0 AND l.feature_type = 3 '
           || ' AND l.topology_id = ' || topoid
           || ' AND r.element_id = ANY (' || quote_literal(fidary)
           || ') group by r.topogeo_id, r.layer_id, l.schema_name, l.table_name, '
           || ' l.feature_column ) t';

    -- No surface can be defined by universal face
    IF NOT 0 = ANY ( fidary ) THEN -- {
      sql := sql || ' WHERE NOT t.elems @> ' || quote_literal(fidary);
    END IF; -- }


    FOR rec IN EXECUTE sql LOOP
      RAISE EXCEPTION 'TopoGeom % in layer % (%.%.%) cannot be represented healing faces % and %',
      rec.topogeo_id, rec.layer_id,
      rec.schema_name, rec.table_name, rec.feature_column,
      e1rec.right_face, e1rec.left_face;
    END LOOP;

    IF e1rec.left_face = 0 OR e1rec.right_face = 0 THEN -- {

      --
      -- We won't add any new face, but rather let the universe
      -- flood the removed face.
      --

      floodfaceid = 0;

    ELSE -- }{

      -- we choose right face as the face that will remain
      -- to be symmetric with ST_AddEdgeModFace
      floodfaceid = e1rec.right_face;

      sql := 'UPDATE '
             || quote_ident(toponame)
             || '.face SET mbr = (SELECT '
             -- minimum bounding rectangle is the union of the old faces mbr
             -- (doing this without GEOS would be faster)
             || 'ST_Envelope(ST_Union(mbr)) FROM '
             || quote_ident(toponame)
             || '.face WHERE face_id IN ('
             || e1rec.left_face || ',' || e1rec.right_face
             || ') ) WHERE face_id = ' || floodfaceid ;
      EXECUTE sql;

    END IF; -- }

    -- Update left_face for all edges still referencing old faces
    sql := 'UPDATE ' || quote_ident(toponame)
           || '.edge_data SET left_face = ' || floodfaceid
           || ' WHERE left_face IN ('
           || e1rec.left_face || ',' || e1rec.right_face
           || ')';
    EXECUTE sql;

    -- Update right_face for all edges still referencing old faces
    sql := 'UPDATE ' || quote_ident(toponame)
           || '.edge_data SET right_face = ' || floodfaceid
           || ' WHERE right_face IN ('
           || e1rec.left_face || ',' || e1rec.right_face
           || ')';
    EXECUTE sql;

    -- Update containing_face for all nodes still referencing old faces
    sql := 'UPDATE ' || quote_ident(toponame)
           || '.node SET containing_face = ' || floodfaceid
           || ' WHERE containing_face IN ('
           || e1rec.left_face || ',' || e1rec.right_face
           || ')';
    EXECUTE sql;

    -- NOT IN THE SPECS:
    -- Replace composition rows involving the two
    -- faces as one involving the new face.
    -- It takes a single DELETE to do that.
    sql := 'DELETE FROM ' || quote_ident(toponame)
           || '.relation r USING topology.layer l '
           || 'WHERE l.level = 0 AND l.feature_type = 3'
           || ' AND l.topology_id = ' || topoid
           || ' AND l.layer_id = r.layer_id AND abs(r.element_id) IN ('
           || e1rec.left_face || ',' || e1rec.right_face
           || ') AND abs(r.element_id) != '
           || floodfaceid; -- could be optimized..
    EXECUTE sql;

  END IF; -- } two faces healed...

  -- Delete the edge
  sql := 'DELETE FROM ' || quote_ident(toponame)
         || '.edge_data WHERE edge_id = ' || e1id;
  EXECUTE sql;

  -- Check if any of the edge nodes remains isolated,
  -- set containing_face  = floodfaceid in that case
  sql := 'UPDATE ' || quote_ident(toponame)
         || '.node n SET containing_face = ' || floodfaceid
         || ' WHERE node_id IN ('
         || e1rec.start_node || ','
         || e1rec.end_node || ') AND NOT EXISTS (SELECT edge_id FROM '
         || quote_ident(toponame)
         || '.edge_data WHERE start_node = n.node_id OR end_node = n.node_id)';
  EXECUTE sql;

  IF e1rec.right_face != e1rec.left_face THEN -- {

    -- Delete left face, if not universe and not "flood" face
    IF e1rec.left_face != 0 AND e1rec.left_face != floodfaceid
    THEN
      sql := 'DELETE FROM ' || quote_ident(toponame)
             || '.face WHERE face_id = ' || e1rec.left_face;
      EXECUTE sql;
    END IF;

    -- Delete right face, if not universe and not "flood" face
    IF e1rec.right_face != 0 AND e1rec.right_face != floodfaceid
    THEN
      sql := 'DELETE FROM ' || quote_ident(toponame)
             || '.face WHERE face_id = ' || e1rec.right_face;
      EXECUTE sql;
    END IF;

  END IF; -- }

  RETURN floodfaceid;
END
$$;


--
-- TOC entry 888 (class 1255 OID 20237)
-- Name: st_remedgenewface(character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_remedgenewface(toponame character varying, e1id integer) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  e1rec RECORD;
  rec RECORD;
  fidary int[];
  topoid int;
  sql text;
  newfaceid int;
  newfacecreated bool;
  elink int;
BEGIN
  --
  -- toponame and face_id are required
  --
  IF toponame IS NULL OR e1id IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  -- Get topology id
  BEGIN
    SELECT id FROM topology.topology
    INTO STRICT topoid WHERE name = toponame;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END;

  BEGIN
    EXECUTE 'SELECT * FROM ' || quote_ident(toponame)
            || '.edge_data WHERE edge_id = ' || e1id
    INTO STRICT e1rec;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent edge %', e1id;
    WHEN INVALID_SCHEMA_NAME THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
    WHEN UNDEFINED_TABLE THEN
      RAISE EXCEPTION 'corrupted topology "%" (missing edge_data table)',
      toponame;
  END;

  -- Check that no TopoGeometry references the edge being removed
  sql := 'SELECT r.topogeo_id, r.layer_id'
         || ', l.schema_name, l.table_name, l.feature_column '
         || 'FROM topology.layer l INNER JOIN '
         || quote_ident(toponame)
         || '.relation r ON (l.layer_id = r.layer_id) '
         || 'WHERE l.level = 0 AND l.feature_type = 2 '
         || ' AND l.topology_id = ' || topoid
         || ' AND abs(r.element_id) = ' || e1id ;
  FOR rec IN EXECUTE sql LOOP
    RAISE EXCEPTION 'TopoGeom % in layer % (%.%.%) cannot be represented dropping edge %',
    rec.topogeo_id, rec.layer_id,
    rec.schema_name, rec.table_name, rec.feature_column,
    e1id;
  END LOOP;

  -- Update next_left_edge and next_right_edge face
  -- for all edges bounding the new face
  RAISE NOTICE 'Updating next_{right,left}_face of ring edges...';

  -- TODO: reduce the following to 2 UPDATE rather than 4

  -- Update next_left_edge of previous edges in left face -- {

  elink := e1rec.next_left_edge;

  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET next_left_edge = '
         || elink
         || ', abs_next_left_edge = '
         || abs(elink)
         || ' WHERE next_left_edge < 0 AND abs(next_left_edge) = '
         || e1id;
  EXECUTE sql;

  -- If the edge being removed links to self,
  -- we use the other face
  IF e1rec.abs_next_right_edge = e1rec.edge_id THEN
    elink := e1rec.next_left_edge;
  ELSE
    elink := e1rec.next_right_edge;
  END IF;

  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET next_left_edge = '
         || elink
         || ', abs_next_left_edge = '
         || abs(elink)
         || ' WHERE next_left_edge > 0 AND abs(next_left_edge) = '
         || e1id;
  EXECUTE sql;

  -- }

  -- Update next_right_edge of previous edges in right face -- {

  elink := e1rec.next_left_edge;

  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET next_right_edge = '
         || elink
         || ', abs_next_right_edge = '
         || abs(elink)
         || ' WHERE next_right_edge < 0 AND abs(next_right_edge) = '
         || e1id;
  EXECUTE sql;

  -- If the edge being removed links to self,
  -- we use the other face
  IF e1rec.abs_next_right_edge = e1rec.edge_id THEN
    elink := e1rec.next_left_edge;
  ELSE
    elink := e1rec.next_right_edge;
  END IF;

  sql := 'UPDATE ' || quote_ident(toponame)
         || '.edge_data SET next_right_edge = '
         || elink
         || ', abs_next_right_edge = '
         || abs(elink)
         || ' WHERE next_right_edge > 0 AND abs(next_right_edge) = '
         || e1id;
  EXECUTE sql;

  -- }

  IF e1rec.left_face = e1rec.right_face THEN -- {

    RAISE NOTICE 'Deletion of edge % affects no face',
    e1rec.edge_id;

    newfaceid := e1rec.left_face; -- TODO: or what should we return ?
    newfacecreated := false;

  ELSE -- }{

    RAISE NOTICE 'Deletion of edge % joins faces % and %',
    e1rec.edge_id, e1rec.left_face, e1rec.right_face;

    -- NOT IN THE SPECS:
    -- check if any topo_geom is defined only by one of the
    -- joined faces. In such case there would be no way to adapt
    -- the definition in case of healing, so we'd have to bail out
    --
    -- TODO: use an internal function and share with ST_RemEdgeNewFace
    --
    --
    fidary = ARRAY[e1rec.left_face, e1rec.right_face];
    sql := 'SELECT t.* from ('
           || 'SELECT r.topogeo_id, r.layer_id'
           || ', l.schema_name, l.table_name, l.feature_column'
           || ', array_agg(r.element_id) as elems '
           || 'FROM topology.layer l INNER JOIN '
           || quote_ident(toponame)
           || '.relation r ON (l.layer_id = r.layer_id) '
           || 'WHERE l.level = 0 AND l.feature_type = 3 '
           || ' AND l.topology_id = ' || topoid
           || ' AND r.element_id = ANY (' || quote_literal(fidary)
           || ') group by r.topogeo_id, r.layer_id, l.schema_name, l.table_name, '
           || ' l.feature_column ) t';

    -- No surface can be defined by universal face
    IF e1rec.left_face != 0 AND e1rec.right_face != 0 THEN -- {
      sql := sql || ' WHERE NOT t.elems @> ' || quote_literal(fidary);
    END IF; -- }


    FOR rec IN EXECUTE sql LOOP
      RAISE EXCEPTION 'TopoGeom % in layer % (%.%.%) cannot be represented healing faces % and %',
      rec.topogeo_id, rec.layer_id,
      rec.schema_name, rec.table_name, rec.feature_column,
      e1rec.right_face, e1rec.left_face;
    END LOOP;

    IF e1rec.left_face = 0 OR e1rec.right_face = 0 THEN -- {

      --
      -- We won't add any new face, but rather let the universe
      -- flood the removed face.
      --

      newfaceid := 0;
      newfacecreated := false;

    ELSE -- }{

      --
      -- Insert the new face
      --

      sql := 'SELECT nextval(' || quote_literal(
          quote_ident(toponame) || '.face_face_id_seq'
      ) || ')';

      EXECUTE sql INTO STRICT newfaceid;
      newfacecreated := true;

      sql := 'INSERT INTO '
             || quote_ident(toponame)
             || '.face(face_id, mbr) SELECT '
             -- face_id
             || newfaceid  || ', '
             -- minimum bounding rectangle is the union of the old faces mbr
             -- (doing this without GEOS would be faster)
             || 'ST_Envelope(ST_Union(mbr)) FROM '
             || quote_ident(toponame)
             || '.face WHERE face_id IN ('
             || e1rec.left_face || ',' || e1rec.right_face
             || ')';
      EXECUTE sql;

    END IF; -- }

    -- Update left_face for all edges still referencing old faces
    sql := 'UPDATE ' || quote_ident(toponame)
           || '.edge_data SET left_face = ' || newfaceid
           || ' WHERE left_face IN ('
           || e1rec.left_face || ',' || e1rec.right_face
           || ')';
    EXECUTE sql;

    -- Update right_face for all edges still referencing old faces
    sql := 'UPDATE ' || quote_ident(toponame)
           || '.edge_data SET right_face = ' || newfaceid
           || ' WHERE right_face IN ('
           || e1rec.left_face || ',' || e1rec.right_face
           || ')';
    EXECUTE sql;

    -- Update containing_face for all nodes still referencing old faces
    sql := 'UPDATE ' || quote_ident(toponame)
           || '.node SET containing_face = ' || newfaceid
           || ' WHERE containing_face IN ('
           || e1rec.left_face || ',' || e1rec.right_face
           || ')';
    EXECUTE sql;

    -- NOT IN THE SPECS:
    -- Replace composition rows involving the two
    -- faces as one involving the new face.
    -- It takes a DELETE and an UPDATE to do all
    sql := 'DELETE FROM ' || quote_ident(toponame)
           || '.relation r USING topology.layer l '
           || 'WHERE l.level = 0 AND l.feature_type = 3'
           || ' AND l.topology_id = ' || topoid
           || ' AND l.layer_id = r.layer_id AND abs(r.element_id) = '
           || e1rec.left_face;
    EXECUTE sql;
    sql := 'UPDATE ' || quote_ident(toponame)
           || '.relation r '
           || ' SET element_id = ' || newfaceid
           || ' FROM topology.layer l WHERE l.level = 0 AND l.feature_type = 3'
           || ' AND l.topology_id = ' || topoid
           || ' AND l.layer_id = r.layer_id AND r.element_id = '
           || e1rec.right_face;
    EXECUTE sql;

  END IF; -- } two faces healed...

  -- Delete the edge
  sql := 'DELETE FROM ' || quote_ident(toponame)
         || '.edge_data WHERE edge_id = ' || e1id;
  EXECUTE sql;

  -- Check if any of the edge nodes remains isolated,
  -- set containing_face  = newfaceid in that case
  sql := 'UPDATE ' || quote_ident(toponame)
         || '.node n SET containing_face = ' || newfaceid
         || ' WHERE node_id IN ('
         || e1rec.start_node || ','
         || e1rec.end_node || ') AND NOT EXISTS (SELECT edge_id FROM '
         || quote_ident(toponame)
         || '.edge_data WHERE start_node = n.node_id OR end_node = n.node_id)';
  EXECUTE sql;

  IF e1rec.right_face != e1rec.left_face THEN -- {

    -- Delete left face, if not universe
    IF e1rec.left_face != 0 THEN
      sql := 'DELETE FROM ' || quote_ident(toponame)
             || '.face WHERE face_id = ' || e1rec.left_face;
      EXECUTE sql;
    END IF;

    -- Delete right face, if not universe
    IF e1rec.right_face != 0
    THEN
      sql := 'DELETE FROM ' || quote_ident(toponame)
             || '.face WHERE face_id = ' || e1rec.right_face;
      EXECUTE sql;
    END IF;

  END IF; -- }

  IF newfacecreated THEN
    RETURN newfaceid;
  ELSE
    RETURN NULL; -- -newfaceid;
  END IF;
END
$$;


--
-- TOC entry 797 (class 1255 OID 20245)
-- Name: st_remisonode(character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_remisonode(character varying, integer) RETURNS text
LANGUAGE sql
AS $_$
SELECT topology.ST_RemoveIsoNode($1, $2)
$_$;


--
-- TOC entry 895 (class 1255 OID 20246)
-- Name: st_removeisoedge(character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_removeisoedge(atopology character varying, anedge integer) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  edge RECORD;
  rec RECORD;
  ok BOOL;
BEGIN

  --
  -- Atopology and anedge are required
  --
  IF atopology IS NULL OR anedge IS NULL THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - null argument';
  END IF;

  --
  -- Check node existance
  --
  ok = false;
  FOR edge IN EXECUTE 'SELECT * FROM '
                      || quote_ident(atopology) || '.edge_data ' ||
                      ' WHERE edge_id =  ' || anedge
  LOOP
    ok = true;
  END LOOP;
  IF NOT ok THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - non-existent edge';
  END IF;

  --
  -- Check node isolation
  --
  IF edge.left_face != edge.right_face THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - not isolated edge';
  END IF;

  FOR rec IN EXECUTE 'SELECT * FROM '
                     || quote_ident(atopology) || '.edge_data '
                     || ' WHERE edge_id !=  ' || anedge
                     || ' AND ( start_node = ' || edge.start_node
                     || ' OR start_node = ' || edge.end_node
                     || ' OR end_node = ' || edge.start_node
                     || ' OR end_node = ' || edge.end_node
                     || ' ) '
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - not isolated edge';
  END LOOP;

  --
  -- Delete the edge
  --
  EXECUTE 'DELETE FROM ' || quote_ident(atopology) || '.edge_data '
          || ' WHERE edge_id = ' || anedge;

  RETURN 'Isolated edge ' || anedge || ' removed';
END
$$;


--
-- TOC entry 894 (class 1255 OID 20244)
-- Name: st_removeisonode(character varying, integer); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION st_removeisonode(atopology character varying, anode integer) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
BEGIN

  --
  -- Atopology and apoint are required
  --
  IF atopology IS NULL OR anode IS NULL THEN
    RAISE EXCEPTION
    'SQL/MM Spatial exception - null argument';
  END IF;

  --
  -- Check node isolation.
  --
  FOR rec IN EXECUTE 'SELECT edge_id FROM '
                     || quote_ident(atopology) || '.edge_data ' ||
                     ' WHERE start_node =  ' || anode ||
                     ' OR end_node = ' || anode
  LOOP
    RAISE EXCEPTION
    'SQL/MM Spatial exception - not isolated node';
  END LOOP;

  EXECUTE 'DELETE FROM ' || quote_ident(atopology) || '.node '
          || ' WHERE node_id = ' || anode;

  RETURN 'Isolated node ' || anode || ' removed';
END
$$;


--
-- TOC entry 873 (class 1255 OID 20211)
-- Name: topoelementarray_append(topoelementarray, topoelement); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION topoelementarray_append(topoelementarray, topoelement) RETURNS topoelementarray
LANGUAGE sql IMMUTABLE
AS $_$
SELECT CASE
       WHEN $1 IS NULL THEN
         topology.TopoElementArray('{' || $2::text || '}')
       ELSE
         topology.TopoElementArray($1::int[][]||$2::int[])
       END;
$_$;


--
-- TOC entry 871 (class 1255 OID 20209)
-- Name: topogeo_addgeometry(character varying, public.geometry, double precision); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION topogeo_addgeometry(atopology character varying, ageom public.geometry, tolerance double precision DEFAULT 0) RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN
  RAISE EXCEPTION 'TopoGeo_AddGeometry not implemented yet';
END
$$;


--
-- TOC entry 869 (class 1255 OID 20206)
-- Name: topogeo_addlinestring(character varying, public.geometry, double precision); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION topogeo_addlinestring(atopology character varying, aline public.geometry, tolerance double precision DEFAULT 0) RETURNS SETOF integer
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
  rec2 RECORD;
  sql TEXT;
  set1 GEOMETRY;
  set2 GEOMETRY;
  snapped GEOMETRY;
  noded GEOMETRY;
  start_node INTEGER;
  end_node INTEGER;
  id INTEGER;
  inodes GEOMETRY;
  iedges GEOMETRY;
  tol float8;
BEGIN

  -- 0. Check arguments
  IF geometrytype(aline) != 'LINESTRING' THEN
    RAISE EXCEPTION 'Invalid geometry type (%) passed to TopoGeo_AddLinestring, expected LINESTRING', geometrytype(aline);
  END IF;

  -- Get tolerance, if 0 was given
  tol := COALESCE( NULLIF(tolerance, 0), topology._st_mintolerance(atopology, aline) );

  -- 1. Self-node
  noded := ST_UnaryUnion(aline);

  -- 2. Node to edges falling within tol distance
  sql := 'WITH nearby AS ( SELECT e.geom FROM '
         || quote_ident(atopology)
         || '.edge e WHERE ST_DWithin(e.geom, '
         || quote_literal(noded::text)
         || '::geometry, '
         || tol || ') ) SELECT st_collect(geom) FROM nearby;';
  EXECUTE sql INTO iedges;
  IF iedges IS NOT NULL THEN


    snapped := ST_Snap(noded, iedges, tol);

    noded := ST_Difference(snapped, iedges);

    set1 := ST_Intersection(snapped, iedges);

    set2 := ST_LineMerge(set1);

    noded := ST_Union(noded, set2);

  END IF;

  -- 2.1. Node with existing nodes within tol
  -- TODO: check if we should be only considering _isolated_ nodes!
  sql := 'WITH nearby AS ( SELECT n.geom FROM '
         || quote_ident(atopology)
         || '.node n WHERE ST_DWithin(n.geom, '
         || quote_literal(noded::text)
         || '::geometry, '
         || tol || ') ) SELECT st_collect(geom) FROM nearby;';
  EXECUTE sql INTO inodes;

  IF inodes IS NOT NULL THEN -- {

    -- TODO: consider snapping once against all elements
    ---      (rather than once with edges and once with nodes)
    noded := ST_Snap(noded, inodes, tol);

    FOR rec IN SELECT (ST_Dump(inodes)).*
    LOOP
      -- Use the node to split edges
      SELECT ST_Collect(geom)
      FROM ST_Dump(ST_Split(noded, rec.geom))
      INTO STRICT noded;
    END LOOP;

    -- re-node to account for ST_Snap introduced self-intersections
    -- See http://trac.osgeo.org/postgis/ticket/1714
    -- TODO: consider running UnaryUnion once after all noding
    noded := ST_UnaryUnion(noded);
  END IF; -- }

  -- 3. For each (now-noded) segment, insert an edge
  FOR rec IN SELECT (ST_Dump(noded)).geom LOOP

    -- TODO: skip point elements ?


    start_node := topology.TopoGeo_AddPoint(atopology,
                                            ST_StartPoint(rec.geom),
                                            tol);

    end_node := topology.TopoGeo_AddPoint(atopology,
                                          ST_EndPoint(rec.geom),
                                          tol);

    -- Added endpoints may have drifted due to tolerance, so
    -- we need to re-snap the edge to the new nodes before adding it
    sql := 'SELECT n1.geom as sn, n2.geom as en FROM ' || quote_ident(atopology)
           || '.node n1, ' || quote_ident(atopology)
           || '.node n2 WHERE n1.node_id = '
           || start_node || ' AND n2.node_id = ' || end_node;

    EXECUTE sql INTO STRICT rec2;

    snapped := ST_SetPoint(
        ST_SetPoint(rec.geom, ST_NPoints(rec.geom)-1, rec2.en),
        0, rec2.sn);


    snapped := ST_CollectionExtract(ST_MakeValid(snapped), 2);


    -- Check if the so-snapped edge collapsed (see #1650)
    IF ST_IsEmpty(snapped) THEN
      CONTINUE;
    END IF;

    -- Check if the so-snapped edge _now_ exists
    sql := 'SELECT edge_id FROM ' || quote_ident(atopology)
           || '.edge_data WHERE ST_Equals(geom, ' || quote_literal(snapped::text)
           || '::geometry)';
    EXECUTE sql INTO id;
    IF id IS NULL THEN
      id := topology.ST_AddEdgeModFace(atopology, start_node, end_node,
                                       snapped);
    ELSE
    END IF;

    RETURN NEXT id;

  END LOOP;

  RETURN;
END
$$;


--
-- TOC entry 868 (class 1255 OID 20205)
-- Name: topogeo_addpoint(character varying, public.geometry, double precision); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION topogeo_addpoint(atopology character varying, apoint public.geometry, tolerance double precision DEFAULT 0) RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
  id integer;
  rec RECORD;
  sql text;
  prj GEOMETRY;
  snapedge GEOMETRY;
  snaptol FLOAT8;
  tol FLOAT8;
  z FLOAT8;
BEGIN

  -- 0. Check arguments
  IF geometrytype(apoint) != 'POINT' THEN
    RAISE EXCEPTION 'Invalid geometry type (%) passed to TopoGeo_AddPoint, expected POINT', geometrytype(apoint);
  END IF;

  -- Get tolerance, if 0 was given
  tol := COALESCE( NULLIF(tolerance, 0), topology._st_mintolerance(atopology, apoint) );

  -- 1. Check if any existing node falls within tolerance
  --    and if so pick the closest
  sql := 'SELECT a.node_id FROM '
         || quote_ident(atopology)
         || '.node as a WHERE ST_DWithin(a.geom,'
         || quote_literal(apoint::text) || '::geometry,'
         || tol || ') ORDER BY ST_Distance('
         || quote_literal(apoint::text)
         || '::geometry, a.geom) LIMIT 1;';
  EXECUTE sql INTO id;
  IF id IS NOT NULL THEN
    RETURN id;
  END IF;


  -- 2. Check if any existing edge falls within tolerance
  --    and if so split it by a point projected on it
  sql := 'SELECT a.edge_id, a.geom FROM '
         || quote_ident(atopology)
         || '.edge as a WHERE ST_DWithin(a.geom,'
         || quote_literal(apoint::text) || '::geometry,'
         || tol || ') ORDER BY ST_Distance('
         || quote_literal(apoint::text)
         || '::geometry, a.geom) LIMIT 1;';
  EXECUTE sql INTO rec;
  IF rec IS NOT NULL THEN
    -- project point to line, split edge by point
    prj := ST_ClosestPoint(rec.geom, apoint);
    -- This is a workaround for ClosestPoint lack of Z support:
    -- http://trac.osgeo.org/postgis/ticket/2033
    z := ST_Z(apoint);
    IF z IS NOT NULL THEN
      prj := ST_Translate(ST_Force_3DZ(prj), 0, 0, z); -- no ST_SetZ ...
    END IF;
    IF NOT ST_Contains(rec.geom, prj) THEN
      -- The tolerance must be big enough for snapping to happen
      -- and small enough to snap only to the projected point.
      -- Unfortunately ST_Distance returns 0 because it also uses
      -- a projected point internally, so we need another way.
      snaptol := topology._st_mintolerance(prj);
      snapedge := ST_Snap(rec.geom, prj, snaptol);

      -- Snapping currently snaps the first point below tolerance
      -- so may possibly move first point. See ticket #1631
      IF NOT ST_Equals(ST_StartPoint(rec.geom), ST_StartPoint(snapedge))
      THEN
        snapedge := ST_MakeLine(ST_StartPoint(rec.geom), snapedge);
      END IF;

      PERFORM ST_ChangeEdgeGeom(atopology, rec.edge_id, snapedge);
    END IF;
    id := topology.ST_ModEdgeSplit(atopology, rec.edge_id, prj);
  ELSE
    id := topology.ST_AddIsoNode(atopology, NULL, apoint);
  END IF;

  RETURN id;
END
$$;


--
-- TOC entry 870 (class 1255 OID 20208)
-- Name: topogeo_addpolygon(character varying, public.geometry, double precision); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION topogeo_addpolygon(atopology character varying, apoly public.geometry, tolerance double precision DEFAULT 0) RETURNS SETOF integer
LANGUAGE plpgsql
AS $$
DECLARE
  boundary GEOMETRY;
  fgeom GEOMETRY;
  rec RECORD;
  edges INTEGER[];
  sql TEXT;
  tol FLOAT8;
BEGIN

  -- 0. Check arguments
  IF geometrytype(apoly) != 'POLYGON' THEN
    RAISE EXCEPTION 'Invalid geometry type (%) passed to TopoGeo_AddPolygon, expected POLYGON', geometrytype(apoly);
  END IF;

  -- Get tolerance, if 0 was given
  tol := COALESCE( NULLIF(tolerance, 0), topology._st_mintolerance(atopology, apoly) );

  -- 1. Extract boundary
  boundary := ST_Boundary(apoly);

  -- 2. Add boundaries as edges
  FOR rec IN SELECT (ST_Dump(boundary)).geom LOOP
    edges := array_cat(edges, array_agg(x)) FROM ( select topology.TopoGeo_addLinestring(atopology, rec.geom, tol) as x ) as foo;
  END LOOP;

  -- 3. Find faces covered by input polygon
  --    NOTE: potential snapping changed polygon edges
  sql := 'SELECT DISTINCT f.face_id FROM ' || quote_ident(atopology)
         || '.face f WHERE f.mbr && '
         || quote_literal(apoly::text)
         || '::geometry';
  FOR rec IN EXECUTE sql LOOP
    -- check for actual containment
    fgeom := ST_PointOnSurface(ST_GetFaceGeometry(atopology, rec.face_id));
    IF NOT ST_Covers(apoly, fgeom) THEN
      CONTINUE;
    END IF;
    RETURN NEXT rec.face_id;
  END LOOP;

END
$$;


--
-- TOC entry 857 (class 1255 OID 20190)
-- Name: topologysummary(character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION topologysummary(atopology character varying) RETURNS text
LANGUAGE plpgsql STABLE STRICT
AS $$
DECLARE
  rec RECORD;
  rec2 RECORD;
  var_topology_id integer;
  n int4;
  ret text;
BEGIN

  ret := 'Topology ' || quote_ident(atopology) ;

  BEGIN
    SELECT * FROM topology.topology WHERE name = atopology INTO STRICT rec;
    -- TODO: catch <no_rows> to give a nice error message
    var_topology_id := rec.id;

    ret := ret || ' (' || rec.id || '), ';
    ret := ret || 'SRID ' || rec.srid || ', '
           || 'precision ' || rec.precision;
    IF rec.hasz THEN ret := ret || ', has Z'; END IF;
    ret := ret || E'\n';
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      ret := ret || E' (X)\n';
  END;

  BEGIN

    BEGIN
      EXECUTE 'SELECT count(node_id) FROM ' || quote_ident(atopology)
              || '.node ' INTO STRICT n;
      ret = ret || n || ' nodes, ';
      EXCEPTION
      WHEN UNDEFINED_TABLE OR INVALID_SCHEMA_NAME THEN
      ret = ret || 'X nodes, ';
  END;

  BEGIN
    EXECUTE 'SELECT count(edge_id) FROM ' || quote_ident(atopology)
            || '.edge_data ' INTO STRICT n;
    ret = ret || n || ' edges, ';
    EXCEPTION
    WHEN UNDEFINED_TABLE OR INVALID_SCHEMA_NAME THEN
    ret = ret || 'X edges, ';
END;

BEGIN
  EXECUTE 'SELECT count(face_id) FROM ' || quote_ident(atopology)
          || '.face WHERE face_id != 0' INTO STRICT n;
  ret = ret || n || ' faces, ';
  EXCEPTION
  WHEN UNDEFINED_TABLE OR INVALID_SCHEMA_NAME THEN
  ret = ret || 'X faces, ';
END;

BEGIN

  EXECUTE 'SELECT count(*) FROM (SELECT DISTINCT layer_id,topogeo_id FROM '
          || quote_ident(atopology) || '.relation ) foo ' INTO STRICT n;
  ret = ret || n || ' topogeoms in ';

  EXECUTE 'SELECT count(*) FROM (SELECT DISTINCT layer_id FROM '
          || quote_ident(atopology) || '.relation ) foo ' INTO STRICT n;
  ret = ret || n || ' layers' || E'\n';
  EXCEPTION
  WHEN UNDEFINED_TABLE OR INVALID_SCHEMA_NAME THEN
  ret = ret || 'X topogeoms in X layers' || E'\n';
END;

-- TODO: print informations about layers
FOR rec IN SELECT * FROM topology.layer l
WHERE l.topology_id = var_topology_id
           ORDER by layer_id
LOOP -- {
  ret = ret || 'Layer ' || rec.layer_id || ', type ';
  CASE
    WHEN rec.feature_type = 1 THEN
    ret = ret || 'Puntal';
    WHEN rec.feature_type = 2 THEN
    ret = ret || 'Lineal';
    WHEN rec.feature_type = 3 THEN
    ret = ret || 'Polygonal';
    WHEN rec.feature_type = 4 THEN
    ret = ret || 'Mixed';
  ELSE
    ret = ret || '???';
  END CASE;

  ret = ret || ' (' || rec.feature_type || '), ';

  BEGIN

    EXECUTE 'SELECT count(*) FROM ( SELECT DISTINCT topogeo_id FROM '
            || quote_ident(atopology)
            || '.relation r WHERE r.layer_id = ' || rec.layer_id
            || ' ) foo ' INTO STRICT n;

    ret = ret || n || ' topogeoms' || E'\n';

    EXCEPTION WHEN UNDEFINED_TABLE THEN
    ret = ret || 'X topogeoms' || E'\n';
  END;

  IF rec.level > 0 THEN
    ret = ret || ' Hierarchy level ' || rec.level
          || ', child layer ' || rec.child_id || E'\n';
  END IF;

  ret = ret || ' Deploy: ';
  IF rec.feature_column != '' THEN
    ret = ret || quote_ident(rec.schema_name) || '.'
          || quote_ident(rec.table_name) || '.'
          || quote_ident(rec.feature_column)
          || E'\n';
  ELSE
    ret = ret || E'NONE (detached)\n';
  END IF;

END LOOP; -- }

EXCEPTION
WHEN INVALID_SCHEMA_NAME THEN
ret = ret || E'\n- missing schema - ';
WHEN OTHERS THEN
RAISE EXCEPTION 'Got % (%)', SQLERRM, SQLSTATE;
END;


RETURN ret;
END
$$;


--
-- TOC entry 876 (class 1255 OID 20420)
-- Name: totopogeom(public.geometry, character varying, integer, double precision); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION totopogeom(ageom public.geometry, atopology character varying, alayer integer, atolerance double precision DEFAULT 0) RETURNS topogeometry
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  layer_info RECORD;
  topology_info RECORD;
  rec RECORD;
  tg topology.TopoGeometry;
  elems topology.TopoElementArray = '{{0,0}}';
  sql TEXT;
  typ TEXT;
  tolerance FLOAT8;
BEGIN

  -- Get topology information
  BEGIN
    SELECT *
    FROM topology.topology
    INTO STRICT topology_info WHERE name = atopology;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'No topology with name "%" in topology.topology',
      atopology;
  END;

  -- Get tolerance, if 0 was given
  tolerance := COALESCE( NULLIF(atolerance, 0), topology._st_mintolerance(atopology, ageom) );

  -- Get layer information
  BEGIN
    SELECT *, CASE
              WHEN feature_type = 1 THEN 'puntal'
              WHEN feature_type = 2 THEN 'lineal'
              WHEN feature_type = 3 THEN 'areal'
              WHEN feature_type = 4 THEN 'mixed'
              ELSE 'unexpected_'||feature_type
              END as typename
    FROM topology.layer l
    INTO STRICT layer_info
    WHERE l.layer_id = alayer
    AND l.topology_id = topology_info.id;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'No layer with id "%" in topology "%"',
      alayer, atopology;
  END;

  -- Can't convert to a hierarchical topogeometry
  IF layer_info.level > 0 THEN
    RAISE EXCEPTION 'Layer "%" of topology "%" is hierarchical, cannot convert to it.',
    alayer, atopology;
  END IF;


  --
  -- Check type compatibility and create empty TopoGeometry
  -- 1:puntal, 2:lineal, 3:areal, 4:collection
  --
  typ = geometrytype(ageom);
  IF typ = 'GEOMETRYCOLLECTION' THEN
    --  A collection can only go collection layer
    IF layer_info.feature_type != 4 THEN
      RAISE EXCEPTION
      'Layer "%" of topology "%" is %, cannot hold a collection feature.',
      layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg := topology.CreateTopoGeom(atopology, 4, alayer);
  ELSIF typ = 'POINT' OR typ = 'MULTIPOINT' THEN -- puntal
    --  A point can go in puntal or collection layer
    IF layer_info.feature_type != 4 and layer_info.feature_type != 1 THEN
      RAISE EXCEPTION
      'Layer "%" of topology "%" is %, cannot hold a puntal feature.',
      layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg := topology.CreateTopoGeom(atopology, 1, alayer);
  ELSIF typ = 'LINESTRING' or typ = 'MULTILINESTRING' THEN -- lineal
    --  A line can go in lineal or collection layer
    IF layer_info.feature_type != 4 and layer_info.feature_type != 2 THEN
      RAISE EXCEPTION
      'Layer "%" of topology "%" is %, cannot hold a lineal feature.',
      layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg := topology.CreateTopoGeom(atopology, 2, alayer);
  ELSIF typ = 'POLYGON' OR typ = 'MULTIPOLYGON' THEN -- areal
    --  An area can go in areal or collection layer
    IF layer_info.feature_type != 4 and layer_info.feature_type != 3 THEN
      RAISE EXCEPTION
      'Layer "%" of topology "%" is %, cannot hold an areal feature.',
      layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg := topology.CreateTopoGeom(atopology, 3, alayer);
  ELSE
    -- Should never happen
    RAISE EXCEPTION
    'Unsupported feature type %', typ;
  END IF;

  -- Now that we have a topogeometry, we loop over distinct components
  -- and add them to the definition of it. We add them as soon
  -- as possible so that each element can further edit the
  -- definition by splitting
  FOR rec IN SELECT DISTINCT id(tg), alayer as lyr,
                                     CASE WHEN ST_Dimension(geom) = 0 THEN 1
                                     WHEN ST_Dimension(geom) = 1 THEN 2
                                     WHEN ST_Dimension(geom) = 2 THEN 3
                                     END as type,
                                     CASE WHEN ST_Dimension(geom) = 0 THEN
                                       topology.topogeo_addPoint(atopology, geom, tolerance)
                                     WHEN ST_Dimension(geom) = 1 THEN
                                       topology.topogeo_addLineString(atopology, geom, tolerance)
                                     WHEN ST_Dimension(geom) = 2 THEN
                                       topology.topogeo_addPolygon(atopology, geom, tolerance)
                                     END as primitive
             FROM (SELECT (ST_Dump(ageom)).geom) as f
             WHERE NOT ST_IsEmpty(geom)
  LOOP
    -- TODO: consider use a single INSERT statement for the whole thing
    sql := 'INSERT INTO ' || quote_ident(atopology)
           || '.relation(topogeo_id, layer_id, element_type, element_id) VALUES ('
           || rec.id || ',' || rec.lyr || ',' || rec.type
           || ',' || rec.primitive || ')';
    EXECUTE sql;
  END LOOP;

  RETURN tg;

END
$$;


--
-- TOC entry 772 (class 1255 OID 20182)
-- Name: validatetopology(character varying); Type: FUNCTION; Schema: topology; Owner: -
--

CREATE FUNCTION validatetopology(toponame character varying) RETURNS SETOF validatetopology_returntype
LANGUAGE plpgsql STRICT
AS $$
DECLARE
  retrec topology.ValidateTopology_ReturnType;
  rec RECORD;
  rec2 RECORD;
  i integer;
  invalid_edges integer[];
  invalid_faces integer[];
  sql text;
BEGIN

  -- Check for coincident nodes
  FOR rec IN EXECUTE 'SELECT a.node_id as id1, b.node_id as id2 FROM '
                     || quote_ident(toponame) || '.node a, '
                     || quote_ident(toponame) || '.node b '
                     || 'WHERE a.node_id < b.node_id '
                     || ' AND ST_DWithin(a.geom, b.geom, 0)' -- NOTE: see #1625 and #1789
  LOOP
    retrec.error = 'coincident nodes';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
  END LOOP;

  -- Check for edge crossed nodes
  -- TODO: do this in the single edge loop
  FOR rec IN EXECUTE 'SELECT n.node_id as id1, e.edge_id as id2 FROM '
                     || quote_ident(toponame) || '.node n, '
                     || quote_ident(toponame) || '.edge e '
                     || 'WHERE e.start_node != n.node_id '
                     || 'AND e.end_node != n.node_id '
                     || 'AND ST_Within(n.geom, e.geom)'
  LOOP
    retrec.error = 'edge crosses node';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
  END LOOP;

  -- Scan all edges
  FOR rec IN EXECUTE 'SELECT e.geom, e.edge_id as id1, e.left_face, e.right_face FROM '
                     || quote_ident(toponame) || '.edge e ORDER BY edge_id'
  LOOP

    -- Any invalid edge becomes a cancer for higher level complexes
    IF NOT ST_IsValid(rec.geom) THEN

      retrec.error = 'invalid edge';
      retrec.id1 = rec.id1;
      retrec.id2 = NULL;
      RETURN NEXT retrec;
      invalid_edges := array_append(invalid_edges, rec.id1);

      IF invalid_faces IS NULL OR NOT rec.left_face = ANY ( invalid_faces )
      THEN
        invalid_faces := array_append(invalid_faces, rec.left_face);
      END IF;

      IF rec.right_face != rec.left_face AND ( invalid_faces IS NULL OR
                                               NOT rec.right_face = ANY ( invalid_faces ) )
      THEN
        invalid_faces := array_append(invalid_faces, rec.right_face);
      END IF;

      CONTINUE;

    END IF;

    IF NOT ST_IsSimple(rec.geom) THEN
      retrec.error = 'edge not simple';
      retrec.id1 = rec.id1;
      retrec.id2 = NULL;
      RETURN NEXT retrec;
    END IF;

  END LOOP;

  -- Check for edge crossing
  sql := 'SELECT e1.edge_id as id1, e2.edge_id as id2, '
         || ' e1.geom as g1, e2.geom as g2, '
         || 'ST_Relate(e1.geom, e2.geom) as im FROM '
         || quote_ident(toponame) || '.edge e1, '
         || quote_ident(toponame) || '.edge e2 '
         || 'WHERE e1.edge_id < e2.edge_id '
         || ' AND e1.geom && e2.geom ';
  IF invalid_edges IS NOT NULL THEN
    sql := sql || ' AND NOT e1.edge_id = ANY ('
           || quote_literal(invalid_edges) || ')'
           || ' AND NOT e2.edge_id = ANY ('
           || quote_literal(invalid_edges) || ')';
  END IF;

  FOR rec IN EXECUTE sql
  LOOP
    IF ST_RelateMatch(rec.im, 'FF1F**1*2') THEN
      CONTINUE; -- no interior intersection
    END IF;

    --
    -- Closed lines have no boundary, so endpoint
    -- intersection would be considered interior
    -- See http://trac.osgeo.org/postgis/ticket/770
    -- See also full explanation in topology.AddEdge
    --

    IF ST_RelateMatch(rec.im, 'FF10F01F2') THEN
      -- first line (g1) is open, second (g2) is closed
      -- first boundary has puntual intersection with second interior
      --
      -- compute intersection, check it equals second endpoint
      IF ST_Equals(ST_Intersection(rec.g2, rec.g1),
                   ST_StartPoint(rec.g2))
      THEN
        CONTINUE;
      END IF;
    END IF;

    IF ST_RelateMatch(rec.im, 'F01FFF102') THEN
      -- second line (g2) is open, first (g1) is closed
      -- second boundary has puntual intersection with first interior
      --
      -- compute intersection, check it equals first endpoint
      IF ST_Equals(ST_Intersection(rec.g2, rec.g1),
                   ST_StartPoint(rec.g1))
      THEN
        CONTINUE;
      END IF;
    END IF;

    IF ST_RelateMatch(rec.im, '0F1FFF1F2') THEN
      -- both lines are closed (boundary intersects nothing)
      -- they have puntual intersection between interiors
      --
      -- compute intersection, check it's a single point
      -- and equals first StartPoint _and_ second StartPoint
      IF ST_Equals(ST_Intersection(rec.g1, rec.g2),
                   ST_StartPoint(rec.g1)) AND
         ST_Equals(ST_StartPoint(rec.g1), ST_StartPoint(rec.g2))
      THEN
        CONTINUE;
      END IF;
    END IF;

    retrec.error = 'edge crosses edge';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
  END LOOP;

  -- Check for edge start_node geometry mis-match
  -- TODO: move this in the first edge table scan
  FOR rec IN EXECUTE 'SELECT e.edge_id as id1, n.node_id as id2 FROM '
                     || quote_ident(toponame) || '.edge e, '
                     || quote_ident(toponame) || '.node n '
                     || 'WHERE e.start_node = n.node_id '
                     || 'AND NOT ST_Equals(ST_StartPoint(e.geom), n.geom)'
  LOOP
    retrec.error = 'edge start node geometry mis-match';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
  END LOOP;

  -- Check for edge end_node geometry mis-match
  -- TODO: move this in the first edge table scan
  FOR rec IN EXECUTE 'SELECT e.edge_id as id1, n.node_id as id2 FROM '
                     || quote_ident(toponame) || '.edge e, '
                     || quote_ident(toponame) || '.node n '
                     || 'WHERE e.end_node = n.node_id '
                     || 'AND NOT ST_Equals(ST_EndPoint(e.geom), n.geom)'
  LOOP
    retrec.error = 'edge end node geometry mis-match';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
  END LOOP;

  -- Check for faces w/out edges
  FOR rec IN EXECUTE 'SELECT face_id as id1 FROM '
                     || quote_ident(toponame) || '.face '
                     || 'WHERE face_id > 0 EXCEPT ( SELECT left_face FROM '
                     || quote_ident(toponame) || '.edge '
                     || ' UNION SELECT right_face FROM '
                     || quote_ident(toponame) || '.edge '
                     || ')'
  LOOP
    retrec.error = 'face without edges';
    retrec.id1 = rec.id1;
    retrec.id2 = NULL;
    RETURN NEXT retrec;
  END LOOP;

  -- Now create a temporary table to construct all face geometries
  -- for checking their consistency

  sql := 'CREATE TEMP TABLE face_check ON COMMIT DROP AS '
         || 'SELECT face_id, topology.ST_GetFaceGeometry('
         || quote_literal(toponame) || ', face_id) as geom, mbr FROM '
         || quote_ident(toponame) || '.face WHERE face_id > 0';
  IF invalid_faces IS NOT NULL THEN
    sql := sql || ' AND NOT face_id = ANY ('
           || quote_literal(invalid_faces) || ')';
  END IF;
  EXECUTE sql;

  -- Build a gist index on geom
  EXECUTE 'CREATE INDEX "face_check_gist" ON '
          || 'face_check USING gist (geom);';

  -- Build a btree index on id
  EXECUTE 'CREATE INDEX "face_check_bt" ON '
          || 'face_check (face_id);';

  -- Scan the table looking for NULL geometries
  FOR rec IN EXECUTE
  'SELECT f1.face_id FROM '
  || 'face_check f1 WHERE f1.geom IS NULL'
  LOOP
    -- Face missing !
    retrec.error := 'face has no rings';
    retrec.id1 := rec.face_id;
    retrec.id2 := NULL;
    RETURN NEXT retrec;
  END LOOP;


  -- Scan the table looking for overlap or containment
  -- TODO: also check for MBR consistency
  FOR rec IN EXECUTE
  'SELECT f1.geom, f1.face_id as id1, f2.face_id as id2, '
  || ' ST_Relate(f1.geom, f2.geom) as im'
  || ' FROM '
  || 'face_check f1, '
  || 'face_check f2 '
  || 'WHERE f1.face_id < f2.face_id'
  || ' AND f1.geom && f2.geom'
  LOOP

    -- Face overlap
    IF ST_RelateMatch(rec.im, 'T*T***T**') THEN
      retrec.error = 'face overlaps face';
      retrec.id1 = rec.id1;
      retrec.id2 = rec.id2;
      RETURN NEXT retrec;
    END IF;

    -- Face 1 is within face 2
    IF ST_RelateMatch(rec.im, 'T*F**F***') THEN
      retrec.error = 'face within face';
      retrec.id1 = rec.id1;
      retrec.id2 = rec.id2;
      RETURN NEXT retrec;
    END IF;

    -- Face 1 contains face 2
    IF ST_RelateMatch(rec.im, 'T*****FF*') THEN
      retrec.error = 'face within face';
      retrec.id1 = rec.id2;
      retrec.id2 = rec.id1;
      RETURN NEXT retrec;
    END IF;

  END LOOP;


  DROP TABLE face_check;

  RETURN;
END
$$;


SET search_path = public, pg_catalog;

--
-- TOC entry 1509 (class 1255 OID 21344)
-- Name: accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum(geometry) (
SFUNC = pgis_geometry_accum_transfn,
STYPE = pgis_abs,
FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- TOC entry 1510 (class 1255 OID 21345)
-- Name: collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE collect(geometry) (
SFUNC = pgis_geometry_accum_transfn,
STYPE = pgis_abs,
FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- TOC entry 1511 (class 1255 OID 21346)
-- Name: makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE makeline(geometry) (
SFUNC = pgis_geometry_accum_transfn,
STYPE = pgis_abs,
FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- TOC entry 1512 (class 1255 OID 21347)
-- Name: memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memcollect(geometry) (
SFUNC = public.st_collect,
STYPE = geometry
);


--
-- TOC entry 1513 (class 1255 OID 21348)
-- Name: polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE polygonize(geometry) (
SFUNC = pgis_geometry_accum_transfn,
STYPE = pgis_abs,
FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- TOC entry 1500 (class 1255 OID 20067)
-- Name: st_3dextent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_3dextent(geometry) (
SFUNC = public.st_combine_bbox,
STYPE = box3d
);


--
-- TOC entry 1503 (class 1255 OID 20070)
-- Name: st_accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum(geometry) (
SFUNC = pgis_geometry_accum_transfn,
STYPE = pgis_abs,
FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- TOC entry 1505 (class 1255 OID 20072)
-- Name: st_collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_collect(geometry) (
SFUNC = pgis_geometry_accum_transfn,
STYPE = pgis_abs,
FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- TOC entry 1499 (class 1255 OID 20066)
-- Name: st_extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent(geometry) (
SFUNC = public.st_combine_bbox,
STYPE = box3d,
FINALFUNC = public.box2d
);


--
-- TOC entry 1514 (class 1255 OID 21349)
-- Name: st_extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent3d(geometry) (
SFUNC = public.st_combine_bbox,
STYPE = box3d
);


--
-- TOC entry 1507 (class 1255 OID 20074)
-- Name: st_makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_makeline(geometry) (
SFUNC = pgis_geometry_accum_transfn,
STYPE = pgis_abs,
FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- TOC entry 1501 (class 1255 OID 20068)
-- Name: st_memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memcollect(geometry) (
SFUNC = public.st_collect,
STYPE = geometry
);


--
-- TOC entry 1502 (class 1255 OID 20069)
-- Name: st_memunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memunion(geometry) (
SFUNC = public.st_union,
STYPE = geometry
);


--
-- TOC entry 1506 (class 1255 OID 20073)
-- Name: st_polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_polygonize(geometry) (
SFUNC = pgis_geometry_accum_transfn,
STYPE = pgis_abs,
FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- TOC entry 1504 (class 1255 OID 20071)
-- Name: st_union(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_union(geometry) (
SFUNC = pgis_geometry_accum_transfn,
STYPE = pgis_abs,
FINALFUNC = pgis_geometry_union_finalfn
);


SET search_path = topology, pg_catalog;

--
-- TOC entry 1508 (class 1255 OID 20419)
-- Name: topoelementarray_agg(topoelement); Type: AGGREGATE; Schema: topology; Owner: -
--

CREATE AGGREGATE topoelementarray_agg(topoelement) (
SFUNC = topoelementarray_append,
STYPE = topoelementarray
);


SET search_path = public, pg_catalog;

--
-- TOC entry 2248 (class 2617 OID 19418)
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
PROCEDURE = geometry_overlaps,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = &&,
RESTRICT = geometry_gist_sel_2d,
JOIN = geometry_gist_joinsel_2d
);


--
-- TOC entry 2263 (class 2617 OID 19917)
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
PROCEDURE = geography_overlaps,
LEFTARG = geography,
RIGHTARG = geography,
COMMUTATOR = &&,
RESTRICT = geography_gist_selectivity,
JOIN = geography_gist_join_selectivity
);


--
-- TOC entry 2262 (class 2617 OID 19477)
-- Name: &&&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &&& (
PROCEDURE = geometry_overlaps_nd,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = &&&,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2255 (class 2617 OID 19434)
-- Name: &<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &< (
PROCEDURE = geometry_overleft,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = &>,
RESTRICT = positionsel,
JOIN = positionjoinsel
);


--
-- TOC entry 2257 (class 2617 OID 19440)
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &<| (
PROCEDURE = geometry_overbelow,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = |&>,
RESTRICT = positionsel,
JOIN = positionjoinsel
);


--
-- TOC entry 2258 (class 2617 OID 19433)
-- Name: &>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &> (
PROCEDURE = geometry_overright,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = &<,
RESTRICT = positionsel,
JOIN = positionjoinsel
);


--
-- TOC entry 2243 (class 2617 OID 19396)
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
PROCEDURE = geometry_lt,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = >,
NEGATOR = >=,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2264 (class 2617 OID 19936)
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
PROCEDURE = geography_lt,
LEFTARG = geography,
RIGHTARG = geography,
COMMUTATOR = >,
NEGATOR = >=,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2251 (class 2617 OID 19424)
-- Name: <#>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <#> (
PROCEDURE = geometry_distance_box,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = <#>
);


--
-- TOC entry 2250 (class 2617 OID 19423)
-- Name: <->; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <-> (
PROCEDURE = geometry_distance_centroid,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = <->
);


--
-- TOC entry 2254 (class 2617 OID 19431)
-- Name: <<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR << (
PROCEDURE = geometry_left,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = >>,
RESTRICT = positionsel,
JOIN = positionjoinsel
);


--
-- TOC entry 2256 (class 2617 OID 19437)
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <<| (
PROCEDURE = geometry_below,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = |>>,
RESTRICT = positionsel,
JOIN = positionjoinsel
);


--
-- TOC entry 2244 (class 2617 OID 19397)
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
PROCEDURE = geometry_le,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = >=,
NEGATOR = >,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2265 (class 2617 OID 19937)
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
PROCEDURE = geography_le,
LEFTARG = geography,
RIGHTARG = geography,
COMMUTATOR = >=,
NEGATOR = >,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2245 (class 2617 OID 19398)
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
PROCEDURE = geometry_eq,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = =,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2266 (class 2617 OID 19938)
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
PROCEDURE = geography_eq,
LEFTARG = geography,
RIGHTARG = geography,
COMMUTATOR = =,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2247 (class 2617 OID 19394)
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
PROCEDURE = geometry_gt,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = <,
NEGATOR = <=,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2268 (class 2617 OID 19934)
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
PROCEDURE = geography_gt,
LEFTARG = geography,
RIGHTARG = geography,
COMMUTATOR = <,
NEGATOR = <=,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2246 (class 2617 OID 19395)
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
PROCEDURE = geometry_ge,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = <=,
NEGATOR = <,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2267 (class 2617 OID 19935)
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
PROCEDURE = geography_ge,
LEFTARG = geography,
RIGHTARG = geography,
COMMUTATOR = <=,
NEGATOR = <,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2259 (class 2617 OID 19430)
-- Name: >>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >> (
PROCEDURE = geometry_right,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = <<,
RESTRICT = positionsel,
JOIN = positionjoinsel
);


--
-- TOC entry 2252 (class 2617 OID 19428)
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
PROCEDURE = geometry_within,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = ~,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2260 (class 2617 OID 19439)
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |&> (
PROCEDURE = geometry_overabove,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = &<|,
RESTRICT = positionsel,
JOIN = positionjoinsel
);


--
-- TOC entry 2261 (class 2617 OID 19436)
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |>> (
PROCEDURE = geometry_above,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = <<|,
RESTRICT = positionsel,
JOIN = positionjoinsel
);


--
-- TOC entry 2253 (class 2617 OID 19427)
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
PROCEDURE = geometry_contains,
LEFTARG = geometry,
RIGHTARG = geometry,
COMMUTATOR = @,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2249 (class 2617 OID 19420)
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~= (
PROCEDURE = geometry_same,
LEFTARG = geometry,
RIGHTARG = geometry,
RESTRICT = contsel,
JOIN = contjoinsel
);


--
-- TOC entry 2473 (class 2753 OID 19939)
-- Name: btree_geography_ops; Type: OPERATOR FAMILY; Schema: public; Owner: -
--

CREATE OPERATOR FAMILY btree_geography_ops USING btree;


--
-- TOC entry 2392 (class 2616 OID 19940)
-- Name: btree_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS btree_geography_ops
DEFAULT FOR TYPE geography USING btree FAMILY btree_geography_ops AS
OPERATOR 1 <(geography,geography) ,
OPERATOR 2 <=(geography,geography) ,
OPERATOR 3 =(geography,geography) ,
OPERATOR 4 >=(geography,geography) ,
OPERATOR 5 >(geography,geography) ,
FUNCTION 1 (geography, geography) geography_cmp(geography,geography);


--
-- TOC entry 2469 (class 2753 OID 19399)
-- Name: btree_geometry_ops; Type: OPERATOR FAMILY; Schema: public; Owner: -
--

CREATE OPERATOR FAMILY btree_geometry_ops USING btree;


--
-- TOC entry 2388 (class 2616 OID 19400)
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS btree_geometry_ops
DEFAULT FOR TYPE geometry USING btree FAMILY btree_geometry_ops AS
OPERATOR 1 <(geometry,geometry) ,
OPERATOR 2 <=(geometry,geometry) ,
OPERATOR 3 =(geometry,geometry) ,
OPERATOR 4 >=(geometry,geometry) ,
OPERATOR 5 >(geometry,geometry) ,
FUNCTION 1 (geometry, geometry) geometry_cmp(geometry,geometry);


--
-- TOC entry 2472 (class 2753 OID 19918)
-- Name: gist_geography_ops; Type: OPERATOR FAMILY; Schema: public; Owner: -
--

CREATE OPERATOR FAMILY gist_geography_ops USING gist;


--
-- TOC entry 2391 (class 2616 OID 19919)
-- Name: gist_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_geography_ops
DEFAULT FOR TYPE geography USING gist FAMILY gist_geography_ops AS
STORAGE gidx ,
OPERATOR 3 &&(geography,geography) ,
FUNCTION 1 (geography, geography) geography_gist_consistent(internal,geography,integer) ,
FUNCTION 2 (geography, geography) geography_gist_union(bytea,internal) ,
FUNCTION 3 (geography, geography) geography_gist_compress(internal) ,
FUNCTION 4 (geography, geography) geography_gist_decompress(internal) ,
FUNCTION 5 (geography, geography) geography_gist_penalty(internal,internal,internal) ,
FUNCTION 6 (geography, geography) geography_gist_picksplit(internal,internal) ,
FUNCTION 7 (geography, geography) geography_gist_same(box2d,box2d,internal);


--
-- TOC entry 2470 (class 2753 OID 19445)
-- Name: gist_geometry_ops_2d; Type: OPERATOR FAMILY; Schema: public; Owner: -
--

CREATE OPERATOR FAMILY gist_geometry_ops_2d USING gist;


--
-- TOC entry 2389 (class 2616 OID 19446)
-- Name: gist_geometry_ops_2d; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_geometry_ops_2d
DEFAULT FOR TYPE geometry USING gist FAMILY gist_geometry_ops_2d AS
STORAGE box2df ,
OPERATOR 1 <<(geometry,geometry) ,
OPERATOR 2 &<(geometry,geometry) ,
OPERATOR 3 &&(geometry,geometry) ,
OPERATOR 4 &>(geometry,geometry) ,
OPERATOR 5 >>(geometry,geometry) ,
OPERATOR 6 ~=(geometry,geometry) ,
OPERATOR 7 ~(geometry,geometry) ,
OPERATOR 8 @(geometry,geometry) ,
OPERATOR 9 &<|(geometry,geometry) ,
OPERATOR 10 <<|(geometry,geometry) ,
OPERATOR 11 |>>(geometry,geometry) ,
OPERATOR 12 |&>(geometry,geometry) ,
OPERATOR 13 <->(geometry,geometry) FOR ORDER BY pg_catalog.float_ops ,
OPERATOR 14 <#>(geometry,geometry) FOR ORDER BY pg_catalog.float_ops ,
FUNCTION 1 (geometry, geometry) geometry_gist_consistent_2d(internal,geometry,integer) ,
FUNCTION 2 (geometry, geometry) geometry_gist_union_2d(bytea,internal) ,
FUNCTION 3 (geometry, geometry) geometry_gist_compress_2d(internal) ,
FUNCTION 4 (geometry, geometry) geometry_gist_decompress_2d(internal) ,
FUNCTION 5 (geometry, geometry) geometry_gist_penalty_2d(internal,internal,internal) ,
FUNCTION 6 (geometry, geometry) geometry_gist_picksplit_2d(internal,internal) ,
FUNCTION 7 (geometry, geometry) geometry_gist_same_2d(geometry,geometry,internal) ,
FUNCTION 8 (geometry, geometry) geometry_gist_distance_2d(internal,geometry,integer);


--
-- TOC entry 2471 (class 2753 OID 19478)
-- Name: gist_geometry_ops_nd; Type: OPERATOR FAMILY; Schema: public; Owner: -
--

CREATE OPERATOR FAMILY gist_geometry_ops_nd USING gist;


--
-- TOC entry 2390 (class 2616 OID 19479)
-- Name: gist_geometry_ops_nd; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_geometry_ops_nd
FOR TYPE geometry USING gist FAMILY gist_geometry_ops_nd AS
STORAGE gidx ,
OPERATOR 3 &&&(geometry,geometry) ,
FUNCTION 1 (geometry, geometry) geometry_gist_consistent_nd(internal,geometry,integer) ,
FUNCTION 2 (geometry, geometry) geometry_gist_union_nd(bytea,internal) ,
FUNCTION 3 (geometry, geometry) geometry_gist_compress_nd(internal) ,
FUNCTION 4 (geometry, geometry) geometry_gist_decompress_nd(internal) ,
FUNCTION 5 (geometry, geometry) geometry_gist_penalty_nd(internal,internal,internal) ,
FUNCTION 6 (geometry, geometry) geometry_gist_picksplit_nd(internal,internal) ,
FUNCTION 7 (geometry, geometry) geometry_gist_same_nd(geometry,geometry,internal);


SET search_path = pg_catalog;

--
-- TOC entry 3723 (class 2605 OID 20058)
-- Name: CAST (public.box2d AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.box3d) WITH FUNCTION public.box3d(public.box2d) AS IMPLICIT;


--
-- TOC entry 3722 (class 2605 OID 20059)
-- Name: CAST (public.box2d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.geometry) WITH FUNCTION public.geometry(public.box2d) AS IMPLICIT;


--
-- TOC entry 3719 (class 2605 OID 20060)
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.box(public.box3d) AS IMPLICIT;


--
-- TOC entry 3721 (class 2605 OID 20057)
-- Name: CAST (public.box3d AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.box2d) WITH FUNCTION public.box2d(public.box3d) AS IMPLICIT;


--
-- TOC entry 3720 (class 2605 OID 20061)
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.geometry(public.box3d) AS IMPLICIT;


--
-- TOC entry 3518 (class 2605 OID 20076)
-- Name: CAST (bytea AS public.geography); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (bytea AS public.geography) WITH FUNCTION public.geography(bytea) AS IMPLICIT;


--
-- TOC entry 3517 (class 2605 OID 20064)
-- Name: CAST (bytea AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (bytea AS public.geometry) WITH FUNCTION public.geometry(bytea) AS IMPLICIT;


--
-- TOC entry 3724 (class 2605 OID 20077)
-- Name: CAST (public.geography AS bytea); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geography AS bytea) WITH FUNCTION public.bytea(public.geography) AS IMPLICIT;


--
-- TOC entry 3726 (class 2605 OID 20075)
-- Name: CAST (public.geography AS public.geography); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geography AS public.geography) WITH FUNCTION public.geography(public.geography, integer, boolean) AS IMPLICIT;


--
-- TOC entry 3725 (class 2605 OID 20080)
-- Name: CAST (public.geography AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geography AS public.geometry) WITH FUNCTION public.geometry(public.geography);


--
-- TOC entry 3714 (class 2605 OID 20056)
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.box(public.geometry) AS IMPLICIT;


--
-- TOC entry 3717 (class 2605 OID 20054)
-- Name: CAST (public.geometry AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box2d) WITH FUNCTION public.box2d(public.geometry) AS IMPLICIT;


--
-- TOC entry 3716 (class 2605 OID 20055)
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.box3d(public.geometry) AS IMPLICIT;


--
-- TOC entry 3712 (class 2605 OID 20065)
-- Name: CAST (public.geometry AS bytea); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS bytea) WITH FUNCTION public.bytea(public.geometry) AS IMPLICIT;


--
-- TOC entry 3718 (class 2605 OID 20079)
-- Name: CAST (public.geometry AS public.geography); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.geography) WITH FUNCTION public.geography(public.geometry) AS IMPLICIT;


--
-- TOC entry 3715 (class 2605 OID 20049)
-- Name: CAST (public.geometry AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.geometry) WITH FUNCTION public.geometry(public.geometry, integer, boolean) AS IMPLICIT;


--
-- TOC entry 3713 (class 2605 OID 20063)
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.text(public.geometry) AS IMPLICIT;


--
-- TOC entry 3586 (class 2605 OID 20062)
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.geometry(text) AS IMPLICIT;


--
-- TOC entry 3727 (class 2605 OID 20181)
-- Name: CAST (topology.topogeometry AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (topology.topogeometry AS public.geometry) WITH FUNCTION topology.geometry(topology.topogeometry) AS IMPLICIT;


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 220 (class 1259 OID 21807)
-- Name: chart_params; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE chart_params (
  _id integer NOT NULL,
  id_mobile_station integer,
  param character varying,
  param_name_en character varying,
  param_name_it character varying,
  param_name_fr character varying,
  chart_type character varying,
  aggregation_type character varying,
  unit character varying,
  min_limit double precision,
  max_limit double precision
);


--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE chart_params; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE chart_params IS 'settings parameters showed by chart module for each station';


--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN chart_params.max_limit; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN chart_params.max_limit IS '
';


--
-- TOC entry 219 (class 1259 OID 21805)
-- Name: chart_param__id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE chart_param__id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 219
-- Name: chart_param__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE chart_param__id_seq OWNED BY chart_params._id;


--
-- TOC entry 209 (class 1259 OID 21674)
-- Name: data_table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE data_table (
  id_data_table integer NOT NULL,
  table_name character varying,
  id_data_table_type integer,
  description character varying,
  tname character varying
);


--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE data_table; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE data_table IS 'table contiaing the list of all data tables in the db';


--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN data_table.table_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN data_table.table_name IS 'name of the data table';


--
-- TOC entry 208 (class 1259 OID 21672)
-- Name: data_table_id_data_table_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_table_id_data_table_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 208
-- Name: data_table_id_data_table_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_table_id_data_table_seq OWNED BY data_table.id_data_table;


--
-- TOC entry 207 (class 1259 OID 21663)
-- Name: data_table_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE data_table_type (
  id_data_table_type integer NOT NULL,
  data_type character varying,
  description character varying
);


--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE data_table_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE data_table_type IS 'list of types for all available data tables';


--
-- TOC entry 206 (class 1259 OID 21661)
-- Name: data_table_type_id_data_table_type_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_table_type_id_data_table_type_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 206
-- Name: data_table_type_id_data_table_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_table_type_id_data_table_type_seq OWNED BY data_table_type.id_data_table_type;


--
-- TOC entry 181 (class 1259 OID 21351)
-- Name: dati; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dati (
  data timestamp without time zone NOT NULL,
  id_mobile_station integer NOT NULL,
  the_geom geometry,
  co2 integer,
  tair double precision,
  rad double precision,
  noise double precision,
  gpsstring character varying,
  utc double precision,
  latn character(1),
  longitudine double precision,
  longe character(1),
  latitudine double precision,
  id_bikedata integer NOT NULL,
  o3 integer,
  ntc double precision,
  ds18 double precision,
  pk integer,
  no2 integer,
  co integer,
  voc integer,
  utcstr character varying,
  pm2_5 integer,
  pm10 integer,
  CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
  CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
  CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- TOC entry 191 (class 1259 OID 21465)
-- Name: dati_eddy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dati_eddy (
  data timestamp without time zone NOT NULL,
  id_mobile_station integer NOT NULL,
  pacchetti integer,
  co2_flux double precision,
  hx double precision,
  le double precision,
  ustar double precision,
  co2 double precision,
  wind double precision,
  wind_ang double precision,
  tair double precision,
  analog_3 integer,
  analog_4 integer,
  tau double precision,
  h2o double precision,
  h2o_flux double precision
);


--
-- TOC entry 218 (class 1259 OID 21781)
-- Name: dati_fotovoltaico; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dati_fotovoltaico (
  data timestamp without time zone NOT NULL,
  id_mobile_station integer NOT NULL,
  upv_lst double precision,
  pac double precision,
  uac double precision,
  upv_soll double precision,
  fac double precision,
  zac double precision,
  riso double precision,
  uac_srr double precision,
  fac_srr double precision,
  zac_srr double precision,
  lzac double precision,
  lpv double precision,
  netz_ein double precision,
  event_cnt double precision,
  serial_nummer double precision,
  tkk_max double precision,
  upv_max double precision,
  e_total double precision,
  h_total double precision,
  h_on double precision,
  id_data integer NOT NULL,
  status character varying,
  fehler character varying,
  dzac double precision,
  iac_ist double precision,
  iac_soll double precision
);


--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.upv_lst; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.upv_lst IS 'PV generator voltage';


--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.pac; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.pac IS 'present output power';


--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.uac; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.uac IS 'grid voltage
';


--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.upv_soll; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.upv_soll IS 'PV nominal voltage
';


--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.fac; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.fac IS 'Grid frequency';


--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.zac; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.zac IS 'grid impedence';


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.riso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.riso IS 'insulation resistance of pv plant before the connection to the grid';


--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.lpv; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.lpv IS 'continous current';


--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.netz_ein; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.netz_ein IS 'total number of connections to the grid';


--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.event_cnt; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.event_cnt IS '
';


--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.serial_nummer; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.serial_nummer IS 'serial number of the sunny boy';


--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.e_total; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.e_total IS 'total power fed to the grid acccumulated from the day  of installation';


--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.h_total; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.h_total IS 'total sum of operating hours in feeding operation';


--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN dati_fotovoltaico.h_on; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_fotovoltaico.h_on IS 'total sum of operating hours';


--
-- TOC entry 217 (class 1259 OID 21779)
-- Name: dati_fotovoltaico_id_data_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dati_fotovoltaico_id_data_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 217
-- Name: dati_fotovoltaico_id_data_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dati_fotovoltaico_id_data_seq OWNED BY dati_fotovoltaico.id_data;


--
-- TOC entry 182 (class 1259 OID 21360)
-- Name: dati_id_bikedata_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dati_id_bikedata_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 182
-- Name: dati_id_bikedata_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dati_id_bikedata_seq OWNED BY dati.id_bikedata;


--
-- TOC entry 183 (class 1259 OID 21362)
-- Name: dati_no_geo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dati_no_geo (
  data timestamp without time zone NOT NULL,
  id_mobile_station integer NOT NULL,
  co2 integer,
  tair double precision,
  rad double precision,
  noise double precision,
  id_bikedata integer NOT NULL,
  o3 integer,
  ntc double precision,
  ds18 double precision,
  pk integer
);


--
-- TOC entry 184 (class 1259 OID 21365)
-- Name: dati_no_geo_id_bikedata_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dati_no_geo_id_bikedata_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 184
-- Name: dati_no_geo_id_bikedata_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dati_no_geo_id_bikedata_seq OWNED BY dati_no_geo.id_bikedata;


--
-- TOC entry 190 (class 1259 OID 21454)
-- Name: dati_stazioni_fisse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dati_stazioni_fisse (
  data timestamp without time zone NOT NULL,
  id_mobile_station integer NOT NULL,
  co2 integer,
  tair double precision,
  rad double precision,
  noise double precision,
  o3 integer,
  ntc double precision,
  ds18 double precision,
  pk integer,
  utc double precision,
  id_dato integer NOT NULL,
  k_s integer,
  wind double precision,
  precipitazione double precision,
  rad_solare double precision,
  bagnatura_fogliare double precision,
  solar_wm2_avg double precision,
  solar_wm2_max double precision,
  solar_w2_avg double precision,
  solar_w_2_max double precision,
  rs_solar_avg double precision,
  rs_solar_max double precision,
  hb_r3_w_avg double precision,
  batt_min_level double precision,
  pt100_sup_avg double precision,
  no2 integer,
  co integer,
  voc integer
);


--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN dati_stazioni_fisse.solar_wm2_avg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_stazioni_fisse.solar_wm2_avg IS 'Average solar irradiance on inclined plane';


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN dati_stazioni_fisse.solar_wm2_max; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_stazioni_fisse.solar_wm2_max IS 'Max solar irradiance on inclined plane';


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN dati_stazioni_fisse.solar_w2_avg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_stazioni_fisse.solar_w2_avg IS 'Average solar irradiance on horizontal plane';


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN dati_stazioni_fisse.solar_w_2_max; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_stazioni_fisse.solar_w_2_max IS 'Max solar irradiance on inclined plane';


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN dati_stazioni_fisse.rs_solar_avg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_stazioni_fisse.rs_solar_avg IS 'Average solar irradiance on horizontal plane from photocell';


--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN dati_stazioni_fisse.rs_solar_max; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_stazioni_fisse.rs_solar_max IS 'Max solar irradiance on horizontal plane from photocell';


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN dati_stazioni_fisse.hb_r3_w_avg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_stazioni_fisse.hb_r3_w_avg IS '1 Kohm resistance for temperatur measurament
';


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN dati_stazioni_fisse.batt_min_level; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_stazioni_fisse.batt_min_level IS 'Minimum Battery level';


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN dati_stazioni_fisse.pt100_sup_avg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_stazioni_fisse.pt100_sup_avg IS 'Average surface temperature';


--
-- TOC entry 189 (class 1259 OID 21452)
-- Name: dati_stazioni_fisse_id_dato_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dati_stazioni_fisse_id_dato_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 189
-- Name: dati_stazioni_fisse_id_dato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dati_stazioni_fisse_id_dato_seq OWNED BY dati_stazioni_fisse.id_dato;


--
-- TOC entry 222 (class 1259 OID 21838)
-- Name: dati_swe; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dati_swe (
  data timestamp without time zone NOT NULL,
  id_mobile_station integer NOT NULL,
  tair_ext double precision,
  hum_ext double precision,
  t_flux_out_h2o double precision,
  t_flux_ret_h2o double precision,
  h20_flux double precision,
  boiler_room_counter double precision,
  ash_chamber_counter integer,
  energy_consuption double precision,
  woodchips double precision
);


--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN dati_swe.tair_ext; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_swe.tair_ext IS 'External air temperature';


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN dati_swe.hum_ext; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_swe.hum_ext IS 'External air humidity
';


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN dati_swe.t_flux_out_h2o; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_swe.t_flux_out_h2o IS 'outgoing h2o flux temperature';


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN dati_swe.t_flux_ret_h2o; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_swe.t_flux_ret_h2o IS 'ingoing h20 flux temperature';


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN dati_swe.h20_flux; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN dati_swe.h20_flux IS 'h2o flux';


--
-- TOC entry 211 (class 1259 OID 21690)
-- Name: domains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE domains (
  id_domain integer NOT NULL,
  domain character varying
);


--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE domains; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE domains IS 'domains table contains the list of all domains managed by SWH deployed system';


--
-- TOC entry 210 (class 1259 OID 21688)
-- Name: domains_id_domain_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domains_id_domain_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4030 (class 0 OID 0)
-- Dependencies: 210
-- Name: domains_id_domain_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domains_id_domain_seq OWNED BY domains.id_domain;


--
-- TOC entry 205 (class 1259 OID 21653)
-- Name: field_aliases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE field_aliases (
  field_name character varying NOT NULL,
  it character varying,
  en character varying,
  fr character varying,
  table_name character varying
);


--
-- TOC entry 173 (class 1259 OID 19898)
-- Name: geography_columns; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW geography_columns AS
  SELECT current_database() AS f_table_catalog, n.nspname AS f_table_schema, c.relname AS f_table_name, a.attname AS f_geography_column, postgis_typmod_dims(a.atttypmod) AS coord_dimension, postgis_typmod_srid(a.atttypmod) AS srid, postgis_typmod_type(a.atttypmod) AS type FROM pg_class c, pg_attribute a, pg_type t, pg_namespace n WHERE (((((((t.typname = 'geography'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND (NOT pg_is_other_temp_schema(c.relnamespace))) AND has_table_privilege(c.oid, 'SELECT'::text));


--
-- TOC entry 174 (class 1259 OID 20002)
-- Name: geometry_columns; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW geometry_columns AS
  SELECT (current_database())::character varying(256) AS f_table_catalog, (n.nspname)::character varying(256) AS f_table_schema, (c.relname)::character varying(256) AS f_table_name, (a.attname)::character varying(256) AS f_geometry_column, COALESCE(NULLIF(postgis_typmod_dims(a.atttypmod), 2), postgis_constraint_dims((n.nspname)::text, (c.relname)::text, (a.attname)::text), 2) AS coord_dimension, COALESCE(NULLIF(postgis_typmod_srid(a.atttypmod), 0), postgis_constraint_srid((n.nspname)::text, (c.relname)::text, (a.attname)::text), 0) AS srid, (replace(replace(COALESCE(NULLIF(upper(postgis_typmod_type(a.atttypmod)), 'GEOMETRY'::text), (postgis_constraint_type((n.nspname)::text, (c.relname)::text, (a.attname)::text))::text, 'GEOMETRY'::text), 'ZM'::text, ''::text), 'Z'::text, ''::text))::character varying(30) AS type FROM pg_class c, pg_attribute a, pg_type t, pg_namespace n WHERE (((((((((t.typname = 'geometry'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND ((c.relkind = 'r'::"char") OR (c.relkind = 'v'::"char"))) AND (NOT pg_is_other_temp_schema(c.relnamespace))) AND (NOT ((n.nspname = 'public'::name) AND (c.relname = 'raster_columns'::name)))) AND has_table_privilege(c.oid, 'SELECT'::text));


--
-- TOC entry 195 (class 1259 OID 21560)
-- Name: gruppi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gruppi (
  id integer NOT NULL,
  nome_it character varying,
  descrizione character varying,
  nome_en character varying,
  nome_fr character varying
);


--
-- TOC entry 194 (class 1259 OID 21558)
-- Name: gruppi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gruppi_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4031 (class 0 OID 0)
-- Dependencies: 194
-- Name: gruppi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gruppi_id_seq OWNED BY gruppi.id;


--
-- TOC entry 224 (class 1259 OID 21853)
-- Name: interoperability; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE interoperability (
  id_interoperability integer NOT NULL,
  id_mobile_station integer,
  code_name character varying,
  operation_type character varying,
  webservice character varying,
  fromdate character varying
);


--
-- TOC entry 223 (class 1259 OID 21851)
-- Name: interoperability_id_interoperability_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE interoperability_id_interoperability_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4032 (class 0 OID 0)
-- Dependencies: 223
-- Name: interoperability_id_interoperability_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE interoperability_id_interoperability_seq OWNED BY interoperability.id_interoperability;


--
-- TOC entry 202 (class 1259 OID 21632)
-- Name: lang; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lang (
  id integer NOT NULL,
  element character varying,
  it character varying,
  en character varying,
  fr character varying
);


--
-- TOC entry 201 (class 1259 OID 21630)
-- Name: lang_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lang_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4033 (class 0 OID 0)
-- Dependencies: 201
-- Name: lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lang_id_seq OWNED BY lang.id;


--
-- TOC entry 198 (class 1259 OID 21593)
-- Name: layerlist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE layerlist (
  nome_it character varying,
  nome_tabella character varying NOT NULL,
  id_gruppo integer,
  nome_en character varying,
  nome_fr character varying,
  id_legendtype integer
);


--
-- TOC entry 4034 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE layerlist; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE layerlist IS 'table containing spatial table list (for viewing purposes)
';


--
-- TOC entry 199 (class 1259 OID 21614)
-- Name: legende_id_legenda_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE legende_id_legenda_seq
START WITH 16
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 200 (class 1259 OID 21616)
-- Name: legende; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE legende (
  id_legenda integer DEFAULT nextval('legende_id_legenda_seq'::regclass) NOT NULL,
  valmin double precision,
  valmax double precision,
  colore character varying,
  nome_tabella character varying,
  opacita double precision,
  label_it character varying,
  campo character varying,
  stroke_color character varying,
  linewidth integer,
  value character varying,
  label_en character varying,
  label_fr character varying
);


--
-- TOC entry 197 (class 1259 OID 21584)
-- Name: legendtypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE legendtypes (
  id_legendtype integer NOT NULL,
  tipo character varying
);


--
-- TOC entry 196 (class 1259 OID 21582)
-- Name: legendtypes_id_legendtype_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE legendtypes_id_legendtype_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4035 (class 0 OID 0)
-- Dependencies: 196
-- Name: legendtypes_id_legendtype_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE legendtypes_id_legendtype_seq OWNED BY legendtypes.id_legendtype;


--
-- TOC entry 226 (class 1259 OID 21890)
-- Name: macro_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE macro_types (
  macro_type character varying NOT NULL,
  description character varying
);


--
-- TOC entry 213 (class 1259 OID 21726)
-- Name: metadati; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE metadati (
  id_metadato integer NOT NULL,
  id_mobile_station integer,
  responsabile character varying,
  data_registrazione timestamp without time zone,
  descrizione character varying,
  photo bytea,
  email character varying
);


--
-- TOC entry 212 (class 1259 OID 21724)
-- Name: metadati_id_metadato_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE metadati_id_metadato_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4036 (class 0 OID 0)
-- Dependencies: 212
-- Name: metadati_id_metadato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE metadati_id_metadato_seq OWNED BY metadati.id_metadato;


--
-- TOC entry 185 (class 1259 OID 21367)
-- Name: mobile_stations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mobile_stations (
  id_mobile_station integer NOT NULL,
  nome character varying,
  img character varying,
  tipo character varying,
  descrizione character varying,
  id_station_type integer,
  the_geom geometry,
  id_domain integer,
  activated boolean DEFAULT false,
  external boolean DEFAULT false,
  CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 3)),
  CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
  CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- TOC entry 186 (class 1259 OID 21373)
-- Name: mobile_station_id_mobile_station_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mobile_station_id_mobile_station_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4037 (class 0 OID 0)
-- Dependencies: 186
-- Name: mobile_station_id_mobile_station_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mobile_station_id_mobile_station_seq OWNED BY mobile_stations.id_mobile_station;




--
-- TOC entry 171 (class 1259 OID 19592)
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE spatial_ref_sys (
  srid integer NOT NULL,
  auth_name character varying(256),
  auth_srid integer,
  srtext character varying(2048),
  proj4text character varying(2048),
  CONSTRAINT spatial_ref_sys_srid_check CHECK (((srid > 0) AND (srid <= 998999)))
);


--
-- TOC entry 215 (class 1259 OID 21742)
-- Name: station_parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE station_parameters (
  id_station_parameter integer NOT NULL,
  id_mobile_station integer,
  parameter_field character varying,
  minvalue double precision,
  maxvalue double precision
);


--
-- TOC entry 4038 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE station_parameters; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE station_parameters IS 'Contains parameters information for each station';


--
-- TOC entry 214 (class 1259 OID 21740)
-- Name: station_parameters_id_station_parameter_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE station_parameters_id_station_parameter_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4039 (class 0 OID 0)
-- Dependencies: 214
-- Name: station_parameters_id_station_parameter_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE station_parameters_id_station_parameter_seq OWNED BY station_parameters.id_station_parameter;


--
-- TOC entry 193 (class 1259 OID 21540)
-- Name: station_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE station_types (
  id_station_type integer NOT NULL,
  tipo character varying,
  icona character varying,
  macro_type character varying
);


--
-- TOC entry 192 (class 1259 OID 21538)
-- Name: station_types_id_station_type_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE station_types_id_station_type_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4040 (class 0 OID 0)
-- Dependencies: 192
-- Name: station_types_id_station_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE station_types_id_station_type_seq OWNED BY station_types.id_station_type;


--
-- TOC entry 216 (class 1259 OID 21764)
-- Name: stations_domains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stations_domains (
  id_mobile_station integer NOT NULL,
  id_domain integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 21644)
-- Name: swh_modules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE swh_modules (
  id integer NOT NULL,
  nome character varying,
  modulo character varying,
  enabled boolean
);


--
-- TOC entry 203 (class 1259 OID 21642)
-- Name: swh_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE swh_modules_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4041 (class 0 OID 0)
-- Dependencies: 203
-- Name: swh_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE swh_modules_id_seq OWNED BY swh_modules.id;


--
-- TOC entry 228 (class 1259 OID 21917)
-- Name: table_field_params_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_field_params_list (
  "_id table_field_params_list" integer NOT NULL,
  table_name character varying,
  parameter_name character varying,
  field_name character varying
);


--
-- TOC entry 227 (class 1259 OID 21915)
-- Name: table_field_params_list__id table_field_params_list_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "table_field_params_list__id table_field_params_list_seq"
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4042 (class 0 OID 0)
-- Dependencies: 227
-- Name: table_field_params_list__id table_field_params_list_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "table_field_params_list__id table_field_params_list_seq" OWNED BY table_field_params_list."_id table_field_params_list";


--
-- TOC entry 221 (class 1259 OID 21832)
-- Name: table_in; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_in (
  anno integer,
  mese integer,
  giorno integer,
  ora integer,
  minuto integer,
  stazione character varying,
  temp_aria_esterna double precision,
  umidita_aria_esterna double precision,
  temp_flusso_acqua_di_mandata double precision,
  temp_flusso_acqua_ritorno double precision,
  flusso_acqua double precision,
  contatore_vano_caldaia integer,
  contatore_vano_ceneri integer,
  consumo_corrente double precision,
  livello_del_cippato double precision
);


--
-- TOC entry 4043 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN table_in.ora; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN table_in.ora IS '
';


--
-- TOC entry 4044 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN table_in.umidita_aria_esterna; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN table_in.umidita_aria_esterna IS '
';


--
-- TOC entry 230 (class 1259 OID 21949)
-- Name: tracks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tracks (
  id_track integer NOT NULL,
  id_mobile_station integer,
  the_geom geometry(LineString,4326),
  data timestamp without time zone
);


--
-- TOC entry 229 (class 1259 OID 21947)
-- Name: tracks_id_track_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tracks_id_track_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4045 (class 0 OID 0)
-- Dependencies: 229
-- Name: tracks_id_track_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tracks_id_track_seq OWNED BY tracks.id_track;


--
-- TOC entry 187 (class 1259 OID 21383)
-- Name: utenti; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE utenti (
  id_utente integer NOT NULL,
  userid character varying,
  pwd character varying,
  livello integer,
  id_domain integer
);


--
-- TOC entry 4046 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN utenti.id_domain; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN utenti.id_domain IS 'for connecting user profile to specific domain';


--
-- TOC entry 188 (class 1259 OID 21389)
-- Name: utenti_id_utente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE utenti_id_utente_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4047 (class 0 OID 0)
-- Dependencies: 188
-- Name: utenti_id_utente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE utenti_id_utente_seq OWNED BY utenti.id_utente;


SET search_path = topology, pg_catalog;

--
-- TOC entry 177 (class 1259 OID 20138)
-- Name: layer; Type: TABLE; Schema: topology; Owner: -
--

CREATE TABLE layer (
  topology_id integer NOT NULL,
  layer_id integer NOT NULL,
  schema_name character varying NOT NULL,
  table_name character varying NOT NULL,
  feature_column character varying NOT NULL,
  feature_type integer NOT NULL,
  level integer DEFAULT 0 NOT NULL,
  child_id integer
);


--
-- TOC entry 176 (class 1259 OID 20125)
-- Name: topology; Type: TABLE; Schema: topology; Owner: -
--

CREATE TABLE topology (
  id integer NOT NULL,
  name character varying NOT NULL,
  srid integer NOT NULL,
  "precision" double precision NOT NULL,
  hasz boolean DEFAULT false NOT NULL
);


--
-- TOC entry 175 (class 1259 OID 20123)
-- Name: topology_id_seq; Type: SEQUENCE; Schema: topology; Owner: -
--

CREATE SEQUENCE topology_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 4048 (class 0 OID 0)
-- Dependencies: 175
-- Name: topology_id_seq; Type: SEQUENCE OWNED BY; Schema: topology; Owner: -
--

ALTER SEQUENCE topology_id_seq OWNED BY topology.id;


SET search_path = public, pg_catalog;

--
-- TOC entry 3757 (class 2604 OID 21810)
-- Name: chart_params _id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_params ALTER COLUMN _id SET DEFAULT nextval('chart_param__id_seq'::regclass);


--
-- TOC entry 3752 (class 2604 OID 21677)
-- Name: data_table id_data_table; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_table ALTER COLUMN id_data_table SET DEFAULT nextval('data_table_id_data_table_seq'::regclass);


--
-- TOC entry 3751 (class 2604 OID 21666)
-- Name: data_table_type id_data_table_type; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_table_type ALTER COLUMN id_data_table_type SET DEFAULT nextval('data_table_type_id_data_table_type_seq'::regclass);


--
-- TOC entry 3732 (class 2604 OID 21391)
-- Name: dati id_bikedata; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati ALTER COLUMN id_bikedata SET DEFAULT nextval('dati_id_bikedata_seq'::regclass);


--
-- TOC entry 3756 (class 2604 OID 21784)
-- Name: dati_fotovoltaico id_data; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_fotovoltaico ALTER COLUMN id_data SET DEFAULT nextval('dati_fotovoltaico_id_data_seq'::regclass);


--
-- TOC entry 3736 (class 2604 OID 21392)
-- Name: dati_no_geo id_bikedata; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_no_geo ALTER COLUMN id_bikedata SET DEFAULT nextval('dati_no_geo_id_bikedata_seq'::regclass);


--
-- TOC entry 3744 (class 2604 OID 21457)
-- Name: dati_stazioni_fisse id_dato; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_stazioni_fisse ALTER COLUMN id_dato SET DEFAULT nextval('dati_stazioni_fisse_id_dato_seq'::regclass);


--
-- TOC entry 3753 (class 2604 OID 21693)
-- Name: domains id_domain; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains ALTER COLUMN id_domain SET DEFAULT nextval('domains_id_domain_seq'::regclass);


--
-- TOC entry 3746 (class 2604 OID 21563)
-- Name: gruppi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY gruppi ALTER COLUMN id SET DEFAULT nextval('gruppi_id_seq'::regclass);


--
-- TOC entry 3758 (class 2604 OID 21856)
-- Name: interoperability id_interoperability; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY interoperability ALTER COLUMN id_interoperability SET DEFAULT nextval('interoperability_id_interoperability_seq'::regclass);


--
-- TOC entry 3749 (class 2604 OID 21635)
-- Name: lang id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lang ALTER COLUMN id SET DEFAULT nextval('lang_id_seq'::regclass);


--
-- TOC entry 3747 (class 2604 OID 21587)
-- Name: legendtypes id_legendtype; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY legendtypes ALTER COLUMN id_legendtype SET DEFAULT nextval('legendtypes_id_legendtype_seq'::regclass);


--
-- TOC entry 3754 (class 2604 OID 21729)
-- Name: metadati id_metadato; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY metadati ALTER COLUMN id_metadato SET DEFAULT nextval('metadati_id_metadato_seq'::regclass);


--
-- TOC entry 3737 (class 2604 OID 21393)
-- Name: mobile_stations id_mobile_station; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mobile_stations ALTER COLUMN id_mobile_station SET DEFAULT nextval('mobile_station_id_mobile_station_seq'::regclass);


--
-- TOC entry 3755 (class 2604 OID 21745)
-- Name: station_parameters id_station_parameter; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY station_parameters ALTER COLUMN id_station_parameter SET DEFAULT nextval('station_parameters_id_station_parameter_seq'::regclass);


--
-- TOC entry 3745 (class 2604 OID 21543)
-- Name: station_types id_station_type; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY station_types ALTER COLUMN id_station_type SET DEFAULT nextval('station_types_id_station_type_seq'::regclass);


--
-- TOC entry 3750 (class 2604 OID 21647)
-- Name: swh_modules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY swh_modules ALTER COLUMN id SET DEFAULT nextval('swh_modules_id_seq'::regclass);


--
-- TOC entry 3759 (class 2604 OID 21920)
-- Name: table_field_params_list _id table_field_params_list; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_field_params_list ALTER COLUMN "_id table_field_params_list" SET DEFAULT nextval('"table_field_params_list__id table_field_params_list_seq"'::regclass);


--
-- TOC entry 3760 (class 2604 OID 21952)
-- Name: tracks id_track; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracks ALTER COLUMN id_track SET DEFAULT nextval('tracks_id_track_seq'::regclass);


--
-- TOC entry 3743 (class 2604 OID 21395)
-- Name: utenti id_utente; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY utenti ALTER COLUMN id_utente SET DEFAULT nextval('utenti_id_utente_seq'::regclass);


SET search_path = topology, pg_catalog;

--
-- TOC entry 3729 (class 2604 OID 20128)
-- Name: topology id; Type: DEFAULT; Schema: topology; Owner: -
--

ALTER TABLE ONLY topology ALTER COLUMN id SET DEFAULT nextval('topology_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 3835 (class 2606 OID 21815)
-- Name: chart_params chart_param_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_params
ADD CONSTRAINT chart_param_pkey PRIMARY KEY (_id);


--
-- TOC entry 3823 (class 2606 OID 21682)
-- Name: data_table data_table_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_table
ADD CONSTRAINT data_table_pkey PRIMARY KEY (id_data_table);


--
-- TOC entry 3821 (class 2606 OID 21671)
-- Name: data_table_type data_table_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_table_type
ADD CONSTRAINT data_table_type_pkey PRIMARY KEY (id_data_table_type);


--
-- TOC entry 3803 (class 2606 OID 21469)
-- Name: dati_eddy dati_eddy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_eddy
ADD CONSTRAINT dati_eddy_pkey PRIMARY KEY (id_mobile_station, data);


--
-- TOC entry 3792 (class 2606 OID 21459)
-- Name: dati_stazioni_fisse dati_fissi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_stazioni_fisse
ADD CONSTRAINT dati_fissi_pkey PRIMARY KEY (id_mobile_station, data);


--
-- TOC entry 3833 (class 2606 OID 21786)
-- Name: dati_fotovoltaico dati_fotovoltaico_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_fotovoltaico
ADD CONSTRAINT dati_fotovoltaico_pkey PRIMARY KEY (data, id_mobile_station);


--
-- TOC entry 3781 (class 2606 OID 21431)
-- Name: dati_no_geo dati_no_geo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_no_geo
ADD CONSTRAINT dati_no_geo_pkey PRIMARY KEY (id_mobile_station, data);


--
-- TOC entry 3779 (class 2606 OID 21397)
-- Name: dati dati_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati
ADD CONSTRAINT dati_pkey PRIMARY KEY (id_mobile_station, data);


--
-- TOC entry 3837 (class 2606 OID 21842)
-- Name: dati_swe dati_swe_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_swe
ADD CONSTRAINT dati_swe_pkey PRIMARY KEY (data, id_mobile_station);


--
-- TOC entry 3825 (class 2606 OID 21698)
-- Name: domains domains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains
ADD CONSTRAINT domains_pkey PRIMARY KEY (id_domain);


--
-- TOC entry 3819 (class 2606 OID 21660)
-- Name: field_aliases field_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY field_aliases
ADD CONSTRAINT field_aliases_pkey PRIMARY KEY (field_name);


--
-- TOC entry 3807 (class 2606 OID 21568)
-- Name: gruppi gruppi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gruppi
ADD CONSTRAINT gruppi_pkey PRIMARY KEY (id);


--
-- TOC entry 3839 (class 2606 OID 21861)
-- Name: interoperability interoperability_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interoperability
ADD CONSTRAINT interoperability_pkey PRIMARY KEY (id_interoperability);


--
-- TOC entry 3815 (class 2606 OID 21640)
-- Name: lang lang_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lang
ADD CONSTRAINT lang_pkey PRIMARY KEY (id);


--
-- TOC entry 3811 (class 2606 OID 21600)
-- Name: layerlist layerlist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY layerlist
ADD CONSTRAINT layerlist_pkey PRIMARY KEY (nome_tabella);


--
-- TOC entry 3813 (class 2606 OID 21624)
-- Name: legende legende_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY legende
ADD CONSTRAINT legende_pkey PRIMARY KEY (id_legenda);


--
-- TOC entry 3809 (class 2606 OID 21592)
-- Name: legendtypes legendtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY legendtypes
ADD CONSTRAINT legendtypes_pkey PRIMARY KEY (id_legendtype);


--
-- TOC entry 3841 (class 2606 OID 21899)
-- Name: macro_types macro_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY macro_types
ADD CONSTRAINT macro_types_pkey PRIMARY KEY (macro_type);


--
-- TOC entry 3827 (class 2606 OID 21734)
-- Name: metadati metadati_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY metadati
ADD CONSTRAINT metadati_pkey PRIMARY KEY (id_metadato);


--
-- TOC entry 3783 (class 2606 OID 21399)
-- Name: mobile_stations mobile_station_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mobile_stations
ADD CONSTRAINT mobile_station_pkey PRIMARY KEY (id_mobile_station);


--
-- TOC entry 3843 (class 2606 OID 21925)
-- Name: table_field_params_list pk_table_param_list; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_field_params_list
ADD CONSTRAINT pk_table_param_list PRIMARY KEY ("_id table_field_params_list");


--
-- TOC entry 3762 (class 2606 OID 19600)
-- Name: spatial_ref_sys spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY spatial_ref_sys
ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


--
-- TOC entry 3829 (class 2606 OID 21750)
-- Name: station_parameters station_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY station_parameters
ADD CONSTRAINT station_parameters_pkey PRIMARY KEY (id_station_parameter);


--
-- TOC entry 3805 (class 2606 OID 21548)
-- Name: station_types station_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY station_types
ADD CONSTRAINT station_types_pkey PRIMARY KEY (id_station_type);


--
-- TOC entry 3831 (class 2606 OID 21768)
-- Name: stations_domains stations_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stations_domains
ADD CONSTRAINT stations_domains_pkey PRIMARY KEY (id_mobile_station, id_domain);


--
-- TOC entry 3817 (class 2606 OID 21652)
-- Name: swh_modules swh_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY swh_modules
ADD CONSTRAINT swh_modules_pkey PRIMARY KEY (id);


--
-- TOC entry 3846 (class 2606 OID 21957)
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracks
ADD CONSTRAINT tracks_pkey PRIMARY KEY (id_track);


--
-- TOC entry 3785 (class 2606 OID 21403)
-- Name: utenti utenti_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY utenti
ADD CONSTRAINT utenti_pkey PRIMARY KEY (id_utente);


SET search_path = topology, pg_catalog;

--
-- TOC entry 3768 (class 2606 OID 20146)
-- Name: layer layer_pkey; Type: CONSTRAINT; Schema: topology; Owner: -
--

ALTER TABLE ONLY layer
ADD CONSTRAINT layer_pkey PRIMARY KEY (topology_id, layer_id);


--
-- TOC entry 3770 (class 2606 OID 20148)
-- Name: layer layer_schema_name_table_name_feature_column_key; Type: CONSTRAINT; Schema: topology; Owner: -
--

ALTER TABLE ONLY layer
ADD CONSTRAINT layer_schema_name_table_name_feature_column_key UNIQUE (schema_name, table_name, feature_column);


--
-- TOC entry 3764 (class 2606 OID 20136)
-- Name: topology topology_name_key; Type: CONSTRAINT; Schema: topology; Owner: -
--

ALTER TABLE ONLY topology
ADD CONSTRAINT topology_name_key UNIQUE (name);


--
-- TOC entry 3766 (class 2606 OID 20134)
-- Name: topology topology_pkey; Type: CONSTRAINT; Schema: topology; Owner: -
--

ALTER TABLE ONLY topology
ADD CONSTRAINT topology_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 3793 (class 1259 OID 21527)
-- Name: data_st_eddy_co2_flux_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_eddy_co2_flux_idx ON dati_eddy USING btree (co2_flux);


--
-- TOC entry 3794 (class 1259 OID 21478)
-- Name: data_st_eddy_co2_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_eddy_co2_idx ON dati_eddy USING btree (co2);


--
-- TOC entry 3795 (class 1259 OID 21528)
-- Name: data_st_eddy_h2o_flux_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_eddy_h2o_flux_idx ON dati_eddy USING btree (h2o_flux);


--
-- TOC entry 3796 (class 1259 OID 21529)
-- Name: data_st_eddy_h2o_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_eddy_h2o_idx ON dati_eddy USING btree (h2o);


--
-- TOC entry 3797 (class 1259 OID 21530)
-- Name: data_st_eddy_hx_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_eddy_hx_idx ON dati_eddy USING btree (hx);


--
-- TOC entry 3798 (class 1259 OID 21476)
-- Name: data_st_eddy_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_eddy_idx ON dati_eddy USING btree (data DESC);


--
-- TOC entry 3799 (class 1259 OID 21531)
-- Name: data_st_eddy_le_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_eddy_le_idx ON dati_eddy USING btree (le);


--
-- TOC entry 3800 (class 1259 OID 21477)
-- Name: data_st_eddy_tair_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_eddy_tair_idx ON dati_eddy USING btree (tair);


--
-- TOC entry 3801 (class 1259 OID 21537)
-- Name: data_st_eddy_wind_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_eddy_wind_idx ON dati_eddy USING btree (wind);


--
-- TOC entry 3771 (class 1259 OID 21482)
-- Name: data_st_mobile_co2_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_mobile_co2_idx ON dati USING btree (co2);


--
-- TOC entry 3772 (class 1259 OID 21526)
-- Name: data_st_mobile_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_mobile_id_idx ON dati USING btree (id_bikedata);


--
-- TOC entry 3773 (class 1259 OID 21525)
-- Name: data_st_mobile_o3_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_mobile_o3_idx ON dati USING btree (o3);


--
-- TOC entry 3774 (class 1259 OID 21524)
-- Name: data_st_mobile_rad_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_mobile_rad_idx ON dati USING btree (rad);


--
-- TOC entry 3775 (class 1259 OID 21481)
-- Name: data_st_mobile_tair_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_mobile_tair_idx ON dati USING btree (tair);


--
-- TOC entry 3776 (class 1259 OID 21475)
-- Name: data_st_mobili_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_mobili_idx ON dati USING btree (data DESC);


--
-- TOC entry 3786 (class 1259 OID 21532)
-- Name: data_st_stazioni_fisse_co2_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_stazioni_fisse_co2_idx ON dati_stazioni_fisse USING btree (co2);


--
-- TOC entry 3787 (class 1259 OID 21533)
-- Name: data_st_stazioni_fisse_data_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_stazioni_fisse_data_idx ON dati_stazioni_fisse USING btree (data);


--
-- TOC entry 3788 (class 1259 OID 21536)
-- Name: data_st_stazioni_fisse_o3_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_stazioni_fisse_o3_idx ON dati_stazioni_fisse USING btree (o3);


--
-- TOC entry 3789 (class 1259 OID 21535)
-- Name: data_st_stazioni_fisse_rad_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_stazioni_fisse_rad_idx ON dati_stazioni_fisse USING btree (rad);


--
-- TOC entry 3790 (class 1259 OID 21534)
-- Name: data_st_stazioni_fisse_tair_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX data_st_stazioni_fisse_tair_idx ON dati_stazioni_fisse USING btree (tair);


--
-- TOC entry 3777 (class 1259 OID 21964)
-- Name: dati_gix; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dati_gix ON dati USING gist (the_geom);


--
-- TOC entry 3844 (class 1259 OID 21963)
-- Name: tracks_gix; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tracks_gix ON tracks USING gist (the_geom);


--
-- TOC entry 3980 (class 2618 OID 20009)
-- Name: geometry_columns geometry_columns_delete; Type: RULE; Schema: public; Owner: -
--

CREATE RULE geometry_columns_delete AS ON DELETE TO geometry_columns DO INSTEAD NOTHING;


--
-- TOC entry 3978 (class 2618 OID 20007)
-- Name: geometry_columns geometry_columns_insert; Type: RULE; Schema: public; Owner: -
--

CREATE RULE geometry_columns_insert AS ON INSERT TO geometry_columns DO INSTEAD NOTHING;


--
-- TOC entry 3979 (class 2618 OID 20008)
-- Name: geometry_columns geometry_columns_update; Type: RULE; Schema: public; Owner: -
--

CREATE RULE geometry_columns_update AS ON UPDATE TO geometry_columns DO INSTEAD NOTHING;


SET search_path = topology, pg_catalog;

--
-- TOC entry 3869 (class 2620 OID 20154)
-- Name: layer layer_integrity_checks; Type: TRIGGER; Schema: topology; Owner: -
--

CREATE TRIGGER layer_integrity_checks BEFORE DELETE OR UPDATE ON layer FOR EACH ROW EXECUTE PROCEDURE layertrigger();


SET search_path = public, pg_catalog;

--
-- TOC entry 3865 (class 2606 OID 21816)
-- Name: chart_params chart_param_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_params
ADD CONSTRAINT chart_param_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3859 (class 2606 OID 21683)
-- Name: data_table data_table_id_data_table_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_table
ADD CONSTRAINT data_table_id_data_table_type_fkey FOREIGN KEY (id_data_table_type) REFERENCES data_table_type(id_data_table_type);


--
-- TOC entry 3864 (class 2606 OID 21797)
-- Name: dati_fotovoltaico dati_fotovoltaico_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_fotovoltaico
ADD CONSTRAINT dati_fotovoltaico_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3848 (class 2606 OID 21425)
-- Name: dati dati_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati
ADD CONSTRAINT dati_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3853 (class 2606 OID 21460)
-- Name: dati_stazioni_fisse dati_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_stazioni_fisse
ADD CONSTRAINT dati_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3854 (class 2606 OID 21470)
-- Name: dati_eddy dati_id_mobile_stationeddy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_eddy
ADD CONSTRAINT dati_id_mobile_stationeddy_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3849 (class 2606 OID 21432)
-- Name: dati_no_geo dati_no_geo_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_no_geo
ADD CONSTRAINT dati_no_geo_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3866 (class 2606 OID 21843)
-- Name: dati_swe dati_swe_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dati_swe
ADD CONSTRAINT dati_swe_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3867 (class 2606 OID 21862)
-- Name: interoperability interoperability_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interoperability
ADD CONSTRAINT interoperability_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3856 (class 2606 OID 21601)
-- Name: layerlist layerlist_id_gruppo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY layerlist
ADD CONSTRAINT layerlist_id_gruppo_fkey FOREIGN KEY (id_gruppo) REFERENCES gruppi(id);


--
-- TOC entry 3857 (class 2606 OID 21606)
-- Name: layerlist layerlist_id_legendtype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY layerlist
ADD CONSTRAINT layerlist_id_legendtype_fkey FOREIGN KEY (id_legendtype) REFERENCES legendtypes(id_legendtype);


--
-- TOC entry 3858 (class 2606 OID 21625)
-- Name: legende legende_nome_tabella_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY legende
ADD CONSTRAINT legende_nome_tabella_fkey FOREIGN KEY (nome_tabella) REFERENCES layerlist(nome_tabella);


--
-- TOC entry 3860 (class 2606 OID 21735)
-- Name: metadati metadati_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY metadati
ADD CONSTRAINT metadati_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3851 (class 2606 OID 21719)
-- Name: mobile_stations mobile_stations_id_domain_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mobile_stations
ADD CONSTRAINT mobile_stations_id_domain_fkey FOREIGN KEY (id_domain) REFERENCES domains(id_domain);


--
-- TOC entry 3850 (class 2606 OID 21549)
-- Name: mobile_stations mobile_stations_id_station_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mobile_stations
ADD CONSTRAINT mobile_stations_id_station_type_fkey FOREIGN KEY (id_station_type) REFERENCES station_types(id_station_type);


--
-- TOC entry 3861 (class 2606 OID 21751)
-- Name: station_parameters station_parameters_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY station_parameters
ADD CONSTRAINT station_parameters_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3855 (class 2606 OID 21910)
-- Name: station_types station_types_macro_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY station_types
ADD CONSTRAINT station_types_macro_type_fkey FOREIGN KEY (macro_type) REFERENCES macro_types(macro_type);


--
-- TOC entry 3863 (class 2606 OID 21774)
-- Name: stations_domains stations_domains_id_domain_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stations_domains
ADD CONSTRAINT stations_domains_id_domain_fkey FOREIGN KEY (id_domain) REFERENCES domains(id_domain);


--
-- TOC entry 3862 (class 2606 OID 21769)
-- Name: stations_domains stations_domains_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stations_domains
ADD CONSTRAINT stations_domains_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3868 (class 2606 OID 21958)
-- Name: tracks tracks_id_mobile_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracks
ADD CONSTRAINT tracks_id_mobile_station_fkey FOREIGN KEY (id_mobile_station) REFERENCES mobile_stations(id_mobile_station);


--
-- TOC entry 3852 (class 2606 OID 21699)
-- Name: utenti utenti_id_domain_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY utenti
ADD CONSTRAINT utenti_id_domain_fkey FOREIGN KEY (id_domain) REFERENCES domains(id_domain);


SET search_path = topology, pg_catalog;

--
-- TOC entry 3847 (class 2606 OID 20149)
-- Name: layer layer_topology_id_fkey; Type: FK CONSTRAINT; Schema: topology; Owner: -
--

ALTER TABLE ONLY layer
ADD CONSTRAINT layer_topology_id_fkey FOREIGN KEY (topology_id) REFERENCES topology(id);


-- Completed on 2017-02-13 15:51:10 CET

--
-- PostgreSQL database dump complete
--

