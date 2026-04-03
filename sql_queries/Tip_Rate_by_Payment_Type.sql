SELECT
CASE payment_type
WHEN '1' THEN 'Credit Charge'
WHEN '2' THEN 'Cash'
WHEN '2' THEN 'No Charge'
WHEN '2' THEN 'Dispute'
ELSE 'Other'
END AS payment_method,
COUNT(*) AS total_trips,
ROUND(AVG(tip_amount), 2) AS avg_tip,
ROUND(AVG(fare_amount), 2) AS avg_fare,
ROUND(AVG(tip_amount/NULLIF(fare_amount, 0)) * 100, 2) AS tip_pct -- tip as % of fare
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
WHERE fare_amount > 0
GROUP BY payment_type
ORDER BY avg_tip DESC;