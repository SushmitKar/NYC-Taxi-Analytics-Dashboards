SELECT
  EXTRACT(HOUR FROM pickup_datetime) AS hour_of_day,
  COUNT(*) AS total_trips,
  ROUND(AVG(trip_distance), 2) AS avg_distance_miles,
  ROUND(AVG(fare_amount), 2) AS avg_fare
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
WHERE fare_amount > 0 AND trip_distance > 0
GROUP BY hour_of_day
ORDER BY hour_of_day;