SELECT
  data_file_year AS year,
  data_file_month AS month,
  COUNT(*) AS total_trips,
  ROUND(SUM(fare_amount), 2) AS total_revenue,
  ROUND(AVG(fare_amount), 2) AS avg_fare,
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
WHERE fare_amount > 0
GROUP BY year, month

UNION ALL

SELECT
  data_file_year AS year,
  data_file_month AS month,
  COUNT(*) AS total_trips,
  ROUND(SUM(fare_amount), 2) AS total_revenue,
  ROUND(AVG(fare_amount), 2) AS avg_fare,
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
WHERE fare_amount > 0
GROUP BY year, month

ORDER BY year, month;