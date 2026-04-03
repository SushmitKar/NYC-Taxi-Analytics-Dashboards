SELECT
pickup_location_id,
COUNT(*) AS total_trips,
ROUND(SUM(fare_amount), 2) AS total_revenue,
ROUND(AVG(fare_amount), 2) AS avg_fare,
ROUND(AVG(tip_amount), 2) AS avg_tip
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
WHERE fare_amount > 0
GROUP BY pickup_location_id
ORDER BY total_revenue DESC
LIMIT 20;