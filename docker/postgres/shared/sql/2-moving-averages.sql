CREATE VIEW ohlc_movingaverage_daily
 AS
SELECT pair, time_bucket(INTERVAL '1 day', bucket) AS bucket_ma,
AVG(avg) OVER(partition by pair ORDER BY bucket ROWS BETWEEN 100 PRECEDING AND CURRENT ROW) AS sma100,
AVG(avg) OVER(partition by pair ORDER BY bucket ROWS BETWEEN 50 PRECEDING AND CURRENT ROW) AS sma50,
AVG(avg) OVER(partition by pair ORDER BY bucket ROWS BETWEEN 21 PRECEDING AND CURRENT ROW) AS sma21,
AVG(avg) OVER(partition by pair ORDER BY bucket ROWS BETWEEN 10 PRECEDING AND CURRENT ROW) AS sma10
FROM ohlc_summary_daily
WHERE bucket > NOW() - INTERVAL '365 day'
ORDER BY pair, bucket_ma DESC;

