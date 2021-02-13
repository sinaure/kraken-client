CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;
select * from pg_extension;

CREATE TABLE public.ohlc
(
    time TIMESTAMPTZ NOT NULL,
    open double precision,
    close double precision,
    volume double precision,
    low double precision,
    high double precision,
    source character varying,
    pair character varying COLLATE pg_catalog."default",
    PRIMARY KEY(time, pair)
);

SELECT * FROM create_hypertable('ohlc', 'time');

CREATE MATERIALIZED VIEW ohlc_summary_hourly
WITH (timescaledb.continuous) AS
SELECT pair,
       time_bucket(INTERVAL '1 hour', time) AS bucket,
       AVG(close) as avg,
       MAX(close) as max,
       MIN(close) as min
FROM ohlc
GROUP BY pair, bucket;

SELECT add_continuous_aggregate_policy('ohlc_summary_hourly',
    start_offset => INTERVAL '24 h',
    end_offset => INTERVAL '1 h',
    schedule_interval => INTERVAL '1 m');

CREATE MATERIALIZED VIEW ohlc_summary_daily
WITH (timescaledb.continuous) AS
SELECT pair,
       time_bucket(INTERVAL '1 day', time) AS bucket,
       AVG(close) as avg,
       MAX(close) as max,
       MIN(close) as min
FROM ohlc
GROUP BY pair, bucket;
    
SELECT add_continuous_aggregate_policy('ohlc_summary_daily',
    start_offset => INTERVAL '30 day',
    end_offset => INTERVAL '1 day',
    schedule_interval => INTERVAL '1 h');
  
