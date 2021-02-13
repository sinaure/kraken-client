CREATE VIEW directional_indicator_intermediate
AS
SELECT pair, bucket,
       max - min as tr,
       --max - lag(max) over (partition by pair ORDER BY bucket)  as dm_plus,
	   --lag(min) over (partition by pair ORDER BY bucket) - min  as dm_minus,
	   CASE
         WHEN ((max - lag(max) over (partition by pair ORDER BY bucket)) > (lag(min) over (partition by pair ORDER BY bucket) - min) AND 
         (max - lag(max) over (partition by pair ORDER BY bucket)) > 0) THEN 
       max - lag(max) over (partition by pair ORDER BY bucket)
       ELSE 0
       END 
       AS dm_plus,
	   CASE
         WHEN ((lag(min) over (partition by pair ORDER BY bucket) - min) > (max - lag(max) over (partition by pair ORDER BY bucket)) AND 
         (lag(min) over (partition by pair ORDER BY bucket) - min) > 0) THEN 
       lag(min) over (partition by pair ORDER BY bucket) - min
       ELSE 0
       END 
       AS dm_minus
FROM ohlc_summary_hourly
GROUP BY pair, bucket, max, min;

CREATE VIEW directional_indicator_intermediate_1
AS
SELECT pair, bucket,
       AVG(tr) OVER(partition by pair ORDER BY bucket ROWS BETWEEN 15 PRECEDING AND CURRENT ROW) AS atr,
       AVG(dm_minus) OVER(partition by pair ORDER BY bucket ROWS BETWEEN 15 PRECEDING AND CURRENT ROW) AS sm_dm_minus,
       AVG(dm_plus) OVER(partition by pair ORDER BY bucket ROWS BETWEEN 15 PRECEDING AND CURRENT ROW) AS sm_dm_plus
FROM directional_indicator_intermediate
GROUP BY pair, bucket, dm_plus, dm_minus,tr
ORDER BY bucket DESC;

CREATE VIEW directional_indicator_intermediate_2
AS
SELECT pair, bucket,
       sm_dm_plus/NULLIF(ABS(atr),0)*100 as dmi_plus,
       sm_dm_minus/NULLIF(ABS(atr),0)*100 as dmi_minus
FROM directional_indicator_intermediate_1
GROUP BY pair, bucket, sm_dm_plus, sm_dm_minus, atr
ORDER BY bucket DESC;

CREATE VIEW directional_indicator_intermediate_3
AS
SELECT pair, bucket,
       ABS(dmi_plus-dmi_minus)/NULLIF(ABS(dmi_plus+dmi_minus),0)*100 as dx
FROM directional_indicator_intermediate_2
GROUP BY pair, bucket, dmi_plus, dmi_minus
ORDER BY bucket DESC;

CREATE VIEW directional_indicator
AS
SELECT pair, bucket,
       AVG(dx) OVER(partition by pair ORDER BY bucket ROWS BETWEEN 15 PRECEDING AND CURRENT ROW) AS adx
FROM directional_indicator_intermediate_3
GROUP BY pair, bucket, dx
ORDER BY bucket DESC;