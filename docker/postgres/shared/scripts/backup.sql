--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE executor;
ALTER ROLE executor WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md55c01b3a5b69996d05f1d9550407fb23b';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

--
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data';


--
-- Data for Name: cache_inval_bgw_job; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: executor
--

COPY _timescaledb_cache.cache_inval_bgw_job  FROM stdin;
\.


--
-- Data for Name: cache_inval_extension; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: executor
--

COPY _timescaledb_cache.cache_inval_extension  FROM stdin;
\.


--
-- Data for Name: cache_inval_hypertable; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: executor
--

COPY _timescaledb_cache.cache_inval_hypertable  FROM stdin;
\.


--
-- Data for Name: hypertable; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, replication_factor) FROM stdin;
\.


--
-- Data for Name: chunk; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped) FROM stdin;
\.


--
-- Data for Name: dimension; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, integer_now_func_schema, integer_now_func) FROM stdin;
\.


--
-- Data for Name: dimension_slice; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;
\.


--
-- Data for Name: chunk_constraint; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;
\.


--
-- Data for Name: chunk_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk_data_node (chunk_id, node_chunk_id, node_name) FROM stdin;
\.


--
-- Data for Name: chunk_index; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk_index (chunk_id, index_name, hypertable_id, hypertable_index_name) FROM stdin;
\.


--
-- Data for Name: compression_chunk_size; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression) FROM stdin;
\.


--
-- Data for Name: continuous_agg; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, bucket_width, direct_view_schema, direct_view_name, materialized_only) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_hypertable_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_invalidation_threshold; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_materialization_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: hypertable_compression; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.hypertable_compression (hypertable_id, attname, compression_algorithm_id, segmentby_column_index, orderby_column_index, orderby_asc, orderby_nullsfirst) FROM stdin;
\.


--
-- Data for Name: hypertable_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.hypertable_data_node (hypertable_id, node_hypertable_id, node_name, block_chunks) FROM stdin;
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
\.


--
-- Data for Name: remote_txn; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.remote_txn (data_node_name, remote_transaction_id) FROM stdin;
\.


--
-- Data for Name: tablespace; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;
\.


--
-- Data for Name: bgw_job; Type: TABLE DATA; Schema: _timescaledb_config; Owner: executor
--

COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, hypertable_id, config) FROM stdin;
\.


--
-- Name: chunk_constraint_name; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 1, false);


--
-- Name: chunk_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 1, false);


--
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 1, false);


--
-- Name: dimension_slice_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 1, false);


--
-- Name: hypertable_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 1, false);


--
-- Name: bgw_job_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_config; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1000, false);


--
-- PostgreSQL database dump complete
--

--
-- Database "crypto-executor" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

--
-- Name: crypto-executor; Type: DATABASE; Schema: -; Owner: executor
--

CREATE DATABASE "crypto-executor" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "crypto-executor" OWNER TO executor;

\connect -reuse-previous=on "dbname='crypto-executor'"

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

--
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ohlc; Type: TABLE; Schema: public; Owner: executor
--

CREATE TABLE public.ohlc (
    "time" timestamp with time zone NOT NULL,
    open double precision,
    close double precision,
    volume double precision,
    low double precision,
    high double precision,
    pair character varying NOT NULL
);


ALTER TABLE public.ohlc OWNER TO executor;

--
-- Name: _direct_view_2; Type: VIEW; Schema: _timescaledb_internal; Owner: executor
--

CREATE VIEW _timescaledb_internal._direct_view_2 AS
 SELECT ohlc.pair,
    public.time_bucket('01:00:00'::interval, ohlc."time") AS bucket,
    avg(ohlc.close) AS avg,
    max(ohlc.close) AS max,
    min(ohlc.close) AS min
   FROM public.ohlc
  GROUP BY ohlc.pair, (public.time_bucket('01:00:00'::interval, ohlc."time"));


ALTER TABLE _timescaledb_internal._direct_view_2 OWNER TO executor;

--
-- Name: _direct_view_3; Type: VIEW; Schema: _timescaledb_internal; Owner: executor
--

CREATE VIEW _timescaledb_internal._direct_view_3 AS
 SELECT ohlc.pair,
    public.time_bucket('1 day'::interval, ohlc."time") AS bucket,
    avg(ohlc.close) AS avg,
    max(ohlc.close) AS max,
    min(ohlc.close) AS min
   FROM public.ohlc
  GROUP BY ohlc.pair, (public.time_bucket('1 day'::interval, ohlc."time"));


ALTER TABLE _timescaledb_internal._direct_view_3 OWNER TO executor;

--
-- Name: _hyper_1_1_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: executor
--

CREATE TABLE _timescaledb_internal._hyper_1_1_chunk (
    CONSTRAINT constraint_1 CHECK ((("time" >= '2021-03-18 00:00:00+00'::timestamp with time zone) AND ("time" < '2021-03-25 00:00:00+00'::timestamp with time zone)))
)
INHERITS (public.ohlc);


ALTER TABLE _timescaledb_internal._hyper_1_1_chunk OWNER TO executor;

--
-- Name: _materialized_hypertable_2; Type: TABLE; Schema: _timescaledb_internal; Owner: executor
--

CREATE TABLE _timescaledb_internal._materialized_hypertable_2 (
    pair character varying,
    bucket timestamp with time zone NOT NULL,
    agg_3_3 bytea,
    agg_4_4 bytea,
    agg_5_5 bytea,
    chunk_id integer
);


ALTER TABLE _timescaledb_internal._materialized_hypertable_2 OWNER TO executor;

--
-- Name: _materialized_hypertable_3; Type: TABLE; Schema: _timescaledb_internal; Owner: executor
--

CREATE TABLE _timescaledb_internal._materialized_hypertable_3 (
    pair character varying,
    bucket timestamp with time zone NOT NULL,
    agg_3_3 bytea,
    agg_4_4 bytea,
    agg_5_5 bytea,
    chunk_id integer
);


ALTER TABLE _timescaledb_internal._materialized_hypertable_3 OWNER TO executor;

--
-- Name: _partial_view_2; Type: VIEW; Schema: _timescaledb_internal; Owner: executor
--

CREATE VIEW _timescaledb_internal._partial_view_2 AS
 SELECT ohlc.pair,
    public.time_bucket('01:00:00'::interval, ohlc."time") AS bucket,
    _timescaledb_internal.partialize_agg(avg(ohlc.close)) AS agg_3_3,
    _timescaledb_internal.partialize_agg(max(ohlc.close)) AS agg_4_4,
    _timescaledb_internal.partialize_agg(min(ohlc.close)) AS agg_5_5,
    _timescaledb_internal.chunk_id_from_relid(ohlc.tableoid) AS chunk_id
   FROM public.ohlc
  GROUP BY ohlc.pair, (public.time_bucket('01:00:00'::interval, ohlc."time")), (_timescaledb_internal.chunk_id_from_relid(ohlc.tableoid));


ALTER TABLE _timescaledb_internal._partial_view_2 OWNER TO executor;

--
-- Name: _partial_view_3; Type: VIEW; Schema: _timescaledb_internal; Owner: executor
--

CREATE VIEW _timescaledb_internal._partial_view_3 AS
 SELECT ohlc.pair,
    public.time_bucket('1 day'::interval, ohlc."time") AS bucket,
    _timescaledb_internal.partialize_agg(avg(ohlc.close)) AS agg_3_3,
    _timescaledb_internal.partialize_agg(max(ohlc.close)) AS agg_4_4,
    _timescaledb_internal.partialize_agg(min(ohlc.close)) AS agg_5_5,
    _timescaledb_internal.chunk_id_from_relid(ohlc.tableoid) AS chunk_id
   FROM public.ohlc
  GROUP BY ohlc.pair, (public.time_bucket('1 day'::interval, ohlc."time")), (_timescaledb_internal.chunk_id_from_relid(ohlc.tableoid));


ALTER TABLE _timescaledb_internal._partial_view_3 OWNER TO executor;

--
-- Name: ohlc_summary_daily; Type: VIEW; Schema: public; Owner: executor
--

CREATE VIEW public.ohlc_summary_daily AS
 SELECT _materialized_hypertable_3.pair,
    _materialized_hypertable_3.bucket,
    _timescaledb_internal.finalize_agg('avg(double precision)'::text, NULL::name, NULL::name, '{{pg_catalog,float8}}'::name[], _materialized_hypertable_3.agg_3_3, NULL::double precision) AS avg,
    _timescaledb_internal.finalize_agg('max(double precision)'::text, NULL::name, NULL::name, '{{pg_catalog,float8}}'::name[], _materialized_hypertable_3.agg_4_4, NULL::double precision) AS max,
    _timescaledb_internal.finalize_agg('min(double precision)'::text, NULL::name, NULL::name, '{{pg_catalog,float8}}'::name[], _materialized_hypertable_3.agg_5_5, NULL::double precision) AS min
   FROM _timescaledb_internal._materialized_hypertable_3
  WHERE (_materialized_hypertable_3.bucket < COALESCE(_timescaledb_internal.to_timestamp(_timescaledb_internal.cagg_watermark(3)), '-infinity'::timestamp with time zone))
  GROUP BY _materialized_hypertable_3.pair, _materialized_hypertable_3.bucket
UNION ALL
 SELECT ohlc.pair,
    public.time_bucket('1 day'::interval, ohlc."time") AS bucket,
    avg(ohlc.close) AS avg,
    max(ohlc.close) AS max,
    min(ohlc.close) AS min
   FROM public.ohlc
  WHERE (ohlc."time" >= COALESCE(_timescaledb_internal.to_timestamp(_timescaledb_internal.cagg_watermark(3)), '-infinity'::timestamp with time zone))
  GROUP BY ohlc.pair, (public.time_bucket('1 day'::interval, ohlc."time"));


ALTER TABLE public.ohlc_summary_daily OWNER TO executor;

--
-- Name: ohlc_summary_hourly; Type: VIEW; Schema: public; Owner: executor
--

CREATE VIEW public.ohlc_summary_hourly AS
 SELECT _materialized_hypertable_2.pair,
    _materialized_hypertable_2.bucket,
    _timescaledb_internal.finalize_agg('avg(double precision)'::text, NULL::name, NULL::name, '{{pg_catalog,float8}}'::name[], _materialized_hypertable_2.agg_3_3, NULL::double precision) AS avg,
    _timescaledb_internal.finalize_agg('max(double precision)'::text, NULL::name, NULL::name, '{{pg_catalog,float8}}'::name[], _materialized_hypertable_2.agg_4_4, NULL::double precision) AS max,
    _timescaledb_internal.finalize_agg('min(double precision)'::text, NULL::name, NULL::name, '{{pg_catalog,float8}}'::name[], _materialized_hypertable_2.agg_5_5, NULL::double precision) AS min
   FROM _timescaledb_internal._materialized_hypertable_2
  WHERE (_materialized_hypertable_2.bucket < COALESCE(_timescaledb_internal.to_timestamp(_timescaledb_internal.cagg_watermark(2)), '-infinity'::timestamp with time zone))
  GROUP BY _materialized_hypertable_2.pair, _materialized_hypertable_2.bucket
UNION ALL
 SELECT ohlc.pair,
    public.time_bucket('01:00:00'::interval, ohlc."time") AS bucket,
    avg(ohlc.close) AS avg,
    max(ohlc.close) AS max,
    min(ohlc.close) AS min
   FROM public.ohlc
  WHERE (ohlc."time" >= COALESCE(_timescaledb_internal.to_timestamp(_timescaledb_internal.cagg_watermark(2)), '-infinity'::timestamp with time zone))
  GROUP BY ohlc.pair, (public.time_bucket('01:00:00'::interval, ohlc."time"));


ALTER TABLE public.ohlc_summary_hourly OWNER TO executor;

--
-- Data for Name: cache_inval_bgw_job; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: executor
--

COPY _timescaledb_cache.cache_inval_bgw_job  FROM stdin;
\.


--
-- Data for Name: cache_inval_extension; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: executor
--

COPY _timescaledb_cache.cache_inval_extension  FROM stdin;
\.


--
-- Data for Name: cache_inval_hypertable; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: executor
--

COPY _timescaledb_cache.cache_inval_hypertable  FROM stdin;
\.


--
-- Data for Name: hypertable; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, replication_factor) FROM stdin;
1	public	ohlc	_timescaledb_internal	_hyper_1	1	_timescaledb_internal	calculate_chunk_interval	0	0	\N	\N
2	_timescaledb_internal	_materialized_hypertable_2	_timescaledb_internal	_hyper_2	1	_timescaledb_internal	calculate_chunk_interval	0	0	\N	\N
3	_timescaledb_internal	_materialized_hypertable_3	_timescaledb_internal	_hyper_3	1	_timescaledb_internal	calculate_chunk_interval	0	0	\N	\N
\.


--
-- Data for Name: chunk; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped) FROM stdin;
1	1	_timescaledb_internal	_hyper_1_1_chunk	\N	f
\.


--
-- Data for Name: dimension; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, integer_now_func_schema, integer_now_func) FROM stdin;
1	1	time	timestamp with time zone	t	\N	\N	\N	604800000000	\N	\N
2	2	bucket	timestamp with time zone	t	\N	\N	\N	6048000000000	\N	\N
3	3	bucket	timestamp with time zone	t	\N	\N	\N	6048000000000	\N	\N
\.


--
-- Data for Name: dimension_slice; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;
1	1	1616025600000000	1616630400000000
\.


--
-- Data for Name: chunk_constraint; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;
1	1	constraint_1	\N
1	\N	1_1_ohlc_pkey	ohlc_pkey
\.


--
-- Data for Name: chunk_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk_data_node (chunk_id, node_chunk_id, node_name) FROM stdin;
\.


--
-- Data for Name: chunk_index; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk_index (chunk_id, index_name, hypertable_id, hypertable_index_name) FROM stdin;
1	1_1_ohlc_pkey	1	ohlc_pkey
1	_hyper_1_1_chunk_ohlc_time_idx	1	ohlc_time_idx
\.


--
-- Data for Name: compression_chunk_size; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression) FROM stdin;
\.


--
-- Data for Name: continuous_agg; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, bucket_width, direct_view_schema, direct_view_name, materialized_only) FROM stdin;
2	1	public	ohlc_summary_hourly	_timescaledb_internal	_partial_view_2	3600000000	_timescaledb_internal	_direct_view_2	f
3	1	public	ohlc_summary_daily	_timescaledb_internal	_partial_view_3	86400000000	_timescaledb_internal	_direct_view_3	f
\.


--
-- Data for Name: continuous_aggs_hypertable_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_invalidation_threshold; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;
1	1616529600000000
\.


--
-- Data for Name: continuous_aggs_materialization_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
2	-9223372036854775808	1615928399999999
2	1616529600000000	9223372036854775807
3	-9223372036854775808	1614124799999999
3	1616457600000000	9223372036854775807
\.


--
-- Data for Name: hypertable_compression; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.hypertable_compression (hypertable_id, attname, compression_algorithm_id, segmentby_column_index, orderby_column_index, orderby_asc, orderby_nullsfirst) FROM stdin;
\.


--
-- Data for Name: hypertable_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.hypertable_data_node (hypertable_id, node_hypertable_id, node_name, block_chunks) FROM stdin;
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
\.


--
-- Data for Name: remote_txn; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.remote_txn (data_node_name, remote_transaction_id) FROM stdin;
\.


--
-- Data for Name: tablespace; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;
\.


--
-- Data for Name: bgw_job; Type: TABLE DATA; Schema: _timescaledb_config; Owner: executor
--

COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, hypertable_id, config) FROM stdin;
1000	Refresh Continuous Aggregate Policy [1000]	00:05:00	00:00:00	-1	00:05:00	_timescaledb_internal	policy_refresh_continuous_aggregate	executor	t	2	{"end_offset": "00:05:00", "start_offset": "7 days", "mat_hypertable_id": 2}
1001	Refresh Continuous Aggregate Policy [1001]	01:00:00	00:00:00	-1	01:00:00	_timescaledb_internal	policy_refresh_continuous_aggregate	executor	t	3	{"end_offset": "01:00:00", "start_offset": "1 mon", "mat_hypertable_id": 3}
\.


--
-- Data for Name: _hyper_1_1_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: executor
--

COPY _timescaledb_internal._hyper_1_1_chunk ("time", open, close, volume, low, high, pair) FROM stdin;
2021-03-23 20:34:00+00	46297.9	46309.7	0.02839268	46297.9	46309.8	BTCEUR
2021-03-23 20:34:00+00	1.57396	1.5739	220.87536777	1.5739	1.57396	STORJEUR
2021-03-23 20:34:00+00	15.097	15.097	0	15.097	15.097	SNXEUR
2021-03-23 20:34:00+00	13.632	13.632	0	13.632	13.632	EWTEUR
2021-03-23 20:35:00+00	46284.1	46302	0.08412021	46284.1	46302.1	BTCEUR
2021-03-23 20:35:00+00	1.57499	1.57589	3379.52290452	1.556	1.57589	STORJEUR
2021-03-23 20:35:00+00	15.097	15.097	0	15.097	15.097	SNXEUR
2021-03-23 20:35:00+00	13.632	13.632	0	13.632	13.632	EWTEUR
2021-03-23 20:36:00+00	46295.7	46302.1	0.04557749	46295.7	46302.1	BTCEUR
2021-03-23 20:36:00+00	1.575	1.6016	20867.67221077	1.55578	1.6016	STORJEUR
2021-03-23 20:36:00+00	15.097	15.097	0	15.097	15.097	SNXEUR
2021-03-23 20:36:00+00	13.632	13.632	0	13.632	13.632	EWTEUR
2021-03-23 20:37:00+00	46303.1	46303.1	0.00063556	46303.1	46303.1	BTCEUR
2021-03-23 20:37:00+00	1.60735	1.60735	25.00922215	1.60735	1.60735	STORJEUR
2021-03-23 20:37:00+00	15.097	15.097	0	15.097	15.097	SNXEUR
2021-03-23 20:37:00+00	13.632	13.632	0	13.632	13.632	EWTEUR
2021-03-23 20:38:00+00	46284	46284	0.03871018	46284	46284	BTCEUR
2021-03-23 20:38:00+00	1.60135	1.57401	7141.53773148	1.574	1.60136	STORJEUR
2021-03-23 20:38:00+00	15.097	15.097	0	15.097	15.097	SNXEUR
2021-03-23 20:38:00+00	13.794	13.794	0	13.794	13.794	EWTEUR
2021-03-23 20:39:00+00	46218.9	46218.8	1.4050551	46218.8	46218.9	BTCEUR
2021-03-23 20:39:00+00	1.57694	1.57697	947.44191	1.56308	1.57697	STORJEUR
2021-03-23 20:39:00+00	15.097	15.097	0	15.097	15.097	SNXEUR
2021-03-23 20:39:00+00	13.794	13.794	0	13.794	13.794	EWTEUR
2021-03-23 20:40:00+00	46285.4	46285.4	0.25795289	46285.4	46285.4	BTCEUR
2021-03-23 20:40:00+00	1.5808	1.5808	0	1.5808	1.5808	STORJEUR
2021-03-23 20:40:00+00	15.097	15.097	0	15.097	15.097	SNXEUR
2021-03-23 20:40:00+00	13.632	13.632	0	13.632	13.632	EWTEUR
2021-03-23 20:41:00+00	46305	46308.2	0.00306426	46304.7	46308.2	BTCEUR
2021-03-23 20:41:00+00	1.56004	1.56004	707.40037417	1.56001	1.56004	STORJEUR
2021-03-23 20:41:00+00	15.097	15.097	0	15.097	15.097	SNXEUR
2021-03-23 20:41:00+00	13.632	13.632	0	13.632	13.632	EWTEUR
2021-03-23 20:42:00+00	46311.9	46311.9	0	46311.9	46311.9	BTCEUR
2021-03-23 20:42:00+00	1.54031	1.53637	30	1.53637	1.54031	STORJEUR
2021-03-23 20:42:00+00	15.097	15.097	0	15.097	15.097	SNXEUR
2021-03-23 20:42:00+00	13.632	13.632	0	13.632	13.632	EWTEUR
2021-03-23 20:43:00+00	46341	46350	0.88116924	46341	46350	BTCEUR
2021-03-23 20:43:00+00	1.56845	1.55083	562.47689	1.55083	1.56845	STORJEUR
2021-03-23 20:43:00+00	15.094	15.094	0	15.094	15.094	SNXEUR
2021-03-23 20:43:00+00	13.632	13.632	0	13.632	13.632	EWTEUR
2021-03-23 20:44:00+00	46354.7	46354.7	0.00315124	46354.7	46354.7	BTCEUR
2021-03-23 20:44:00+00	1.58047	1.58047	0	1.58047	1.58047	STORJEUR
2021-03-23 20:44:00+00	15.094	15.094	0	15.094	15.094	SNXEUR
2021-03-23 20:44:00+00	13.631	13.631	1.00200641	13.631	13.631	EWTEUR
2021-03-23 20:45:00+00	46297.9	46298.5	0.01471773	46297.9	46298.5	BTCEUR
2021-03-23 20:45:00+00	1.585	1.58975	1089.25806977	1.585	1.58975	STORJEUR
2021-03-23 20:45:00+00	15.052	15.052	0.65484	15.052	15.052	SNXEUR
2021-03-23 20:45:00+00	13.631	13.631	0	13.631	13.631	EWTEUR
2021-03-23 20:46:00+00	46300.5	46298.5	0.20113649	46298.5	46300.5	BTCEUR
2021-03-23 20:46:00+00	1.60916	1.6	479.9605	1.6	1.60916	STORJEUR
2021-03-23 20:46:00+00	15.052	15.052	0	15.052	15.052	SNXEUR
2021-03-23 20:46:00+00	13.6	13.6	25	13.6	13.6	EWTEUR
2021-03-23 20:47:00+00	46227.1	46227.1	0.03187187	46227.1	46227.1	BTCEUR
2021-03-23 20:47:00+00	1.58347	1.58347	127.27614962	1.58347	1.58347	STORJEUR
2021-03-23 20:48:00+00	46154.5	46154.5	0.00805345	46154.5	46154.5	BTCEUR
2021-03-23 20:48:00+00	1.59999	1.59999	0	1.59999	1.59999	STORJEUR
2021-03-23 20:48:00+00	15.04	15.04	0	15.04	15.04	SNXEUR
2021-03-23 20:48:00+00	13.6	13.6	20	13.6	13.6	EWTEUR
\.


--
-- Data for Name: _materialized_hypertable_2; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: executor
--

COPY _timescaledb_internal._materialized_hypertable_2 (pair, bucket, agg_3_3, agg_4_4, agg_5_5, chunk_id) FROM stdin;
\.


--
-- Data for Name: _materialized_hypertable_3; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: executor
--

COPY _timescaledb_internal._materialized_hypertable_3 (pair, bucket, agg_3_3, agg_4_4, agg_5_5, chunk_id) FROM stdin;
\.


--
-- Data for Name: ohlc; Type: TABLE DATA; Schema: public; Owner: executor
--

COPY public.ohlc ("time", open, close, volume, low, high, pair) FROM stdin;
\.


--
-- Name: chunk_constraint_name; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 1, true);


--
-- Name: chunk_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 1, true);


--
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 3, true);


--
-- Name: dimension_slice_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 1, true);


--
-- Name: hypertable_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 3, true);


--
-- Name: bgw_job_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_config; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1001, true);


--
-- Name: _hyper_1_1_chunk 1_1_ohlc_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: executor
--

ALTER TABLE ONLY _timescaledb_internal._hyper_1_1_chunk
    ADD CONSTRAINT "1_1_ohlc_pkey" PRIMARY KEY ("time", pair);


--
-- Name: ohlc ohlc_pkey; Type: CONSTRAINT; Schema: public; Owner: executor
--

ALTER TABLE ONLY public.ohlc
    ADD CONSTRAINT ohlc_pkey PRIMARY KEY ("time", pair);


--
-- Name: _hyper_1_1_chunk_ohlc_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: executor
--

CREATE INDEX _hyper_1_1_chunk_ohlc_time_idx ON _timescaledb_internal._hyper_1_1_chunk USING btree ("time" DESC);


--
-- Name: _materialized_hypertable_2_bucket_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: executor
--

CREATE INDEX _materialized_hypertable_2_bucket_idx ON _timescaledb_internal._materialized_hypertable_2 USING btree (bucket DESC);


--
-- Name: _materialized_hypertable_2_pair_bucket_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: executor
--

CREATE INDEX _materialized_hypertable_2_pair_bucket_idx ON _timescaledb_internal._materialized_hypertable_2 USING btree (pair, bucket DESC);


--
-- Name: _materialized_hypertable_3_bucket_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: executor
--

CREATE INDEX _materialized_hypertable_3_bucket_idx ON _timescaledb_internal._materialized_hypertable_3 USING btree (bucket DESC);


--
-- Name: _materialized_hypertable_3_pair_bucket_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: executor
--

CREATE INDEX _materialized_hypertable_3_pair_bucket_idx ON _timescaledb_internal._materialized_hypertable_3 USING btree (pair, bucket DESC);


--
-- Name: ohlc_time_idx; Type: INDEX; Schema: public; Owner: executor
--

CREATE INDEX ohlc_time_idx ON public.ohlc USING btree ("time" DESC);


--
-- Name: _hyper_1_1_chunk ts_cagg_invalidation_trigger; Type: TRIGGER; Schema: _timescaledb_internal; Owner: executor
--

CREATE TRIGGER ts_cagg_invalidation_trigger AFTER INSERT OR DELETE OR UPDATE ON _timescaledb_internal._hyper_1_1_chunk FOR EACH ROW EXECUTE FUNCTION _timescaledb_internal.continuous_agg_invalidation_trigger('1');


--
-- Name: _materialized_hypertable_2 ts_insert_blocker; Type: TRIGGER; Schema: _timescaledb_internal; Owner: executor
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON _timescaledb_internal._materialized_hypertable_2 FOR EACH ROW EXECUTE FUNCTION _timescaledb_internal.insert_blocker();


--
-- Name: _materialized_hypertable_3 ts_insert_blocker; Type: TRIGGER; Schema: _timescaledb_internal; Owner: executor
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON _timescaledb_internal._materialized_hypertable_3 FOR EACH ROW EXECUTE FUNCTION _timescaledb_internal.insert_blocker();


--
-- Name: ohlc ts_cagg_invalidation_trigger; Type: TRIGGER; Schema: public; Owner: executor
--

CREATE TRIGGER ts_cagg_invalidation_trigger AFTER INSERT OR DELETE OR UPDATE ON public.ohlc FOR EACH ROW EXECUTE FUNCTION _timescaledb_internal.continuous_agg_invalidation_trigger('1');


--
-- Name: ohlc ts_insert_blocker; Type: TRIGGER; Schema: public; Owner: executor
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.ohlc FOR EACH ROW EXECUTE FUNCTION _timescaledb_internal.insert_blocker();


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

--
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data';


--
-- Data for Name: cache_inval_bgw_job; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: executor
--

COPY _timescaledb_cache.cache_inval_bgw_job  FROM stdin;
\.


--
-- Data for Name: cache_inval_extension; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: executor
--

COPY _timescaledb_cache.cache_inval_extension  FROM stdin;
\.


--
-- Data for Name: cache_inval_hypertable; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: executor
--

COPY _timescaledb_cache.cache_inval_hypertable  FROM stdin;
\.


--
-- Data for Name: hypertable; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, replication_factor) FROM stdin;
\.


--
-- Data for Name: chunk; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped) FROM stdin;
\.


--
-- Data for Name: dimension; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, integer_now_func_schema, integer_now_func) FROM stdin;
\.


--
-- Data for Name: dimension_slice; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;
\.


--
-- Data for Name: chunk_constraint; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;
\.


--
-- Data for Name: chunk_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk_data_node (chunk_id, node_chunk_id, node_name) FROM stdin;
\.


--
-- Data for Name: chunk_index; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.chunk_index (chunk_id, index_name, hypertable_id, hypertable_index_name) FROM stdin;
\.


--
-- Data for Name: compression_chunk_size; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression) FROM stdin;
\.


--
-- Data for Name: continuous_agg; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, bucket_width, direct_view_schema, direct_view_name, materialized_only) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_hypertable_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_invalidation_threshold; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_materialization_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: hypertable_compression; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.hypertable_compression (hypertable_id, attname, compression_algorithm_id, segmentby_column_index, orderby_column_index, orderby_asc, orderby_nullsfirst) FROM stdin;
\.


--
-- Data for Name: hypertable_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.hypertable_data_node (hypertable_id, node_hypertable_id, node_name, block_chunks) FROM stdin;
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
\.


--
-- Data for Name: remote_txn; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.remote_txn (data_node_name, remote_transaction_id) FROM stdin;
\.


--
-- Data for Name: tablespace; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: executor
--

COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;
\.


--
-- Data for Name: bgw_job; Type: TABLE DATA; Schema: _timescaledb_config; Owner: executor
--

COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, hypertable_id, config) FROM stdin;
\.


--
-- Name: chunk_constraint_name; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 1, false);


--
-- Name: chunk_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 1, false);


--
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 1, false);


--
-- Name: dimension_slice_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 1, false);


--
-- Name: hypertable_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 1, false);


--
-- Name: bgw_job_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_config; Owner: executor
--

SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1000, false);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

