--Top 5 zones per month
SELECT * FROM(
  SELECT
  data_file_month AS month,
  pickup_location_id,
  COUNT(*) AS trip_volume ,-- trip volumne (basis of ranking)
  RANK() OVER (
    PARTITION BY data_file_month
    ORDER BY COUNT(*) DESC
  ) AS zone_rank
  FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
  WHERE fare_amount > 0 AND data_file_year = 2022
  GROUP BY data_file_month, pickup_location_id
)
WHERE zone_rank <= 5
ORDER BY month, zone_rank;