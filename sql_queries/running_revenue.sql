SELECT
data_file_month AS month,
ROUND(SUM(fare_amount), 2) AS monthly_revenue,
ROUND(SUM(SUM(fare_amount)) OVER (ORDER BY data_file_month), 2) AS cumulative_revenue
  -- cumulative_revenue: window function adds up all previous months
  -- SUM(SUM(...)) = outer SUM runs across rows, inner SUM aggregates the GROUP BY
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
WHERE fare_amount > 0
GROUP BY data_file_month
ORDER BY month;