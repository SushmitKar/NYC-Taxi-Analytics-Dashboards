with bucketed as (
  select
  data_file_year as year,
  case
  when trip_distance < 1 then '0-1 miles'
  when trip_distance < 3 then '1-3 miles'
  when trip_distance < 6 then '3-6 miles'
  when trip_distance < 10 then '6-10 miles'
  else '10+ miles'
  end as distance_bucket,
  fare_amount
  from `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
  where fare_amount > 0 and trip_distance > 0

  union all

  select
  data_file_year as year,
  case
  when trip_distance < 1 then '0-1 miles'
  when trip_distance < 3 then '1-3 miles'
  when trip_distance < 6 then '3-6 miles'
  when trip_distance < 10 then '6-10 miles'
  else '10+ miles'
  end as distance_bucket,
  fare_amount
  from `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
  where fare_amount > 0 and trip_distance > 0
)
select
year,
distance_bucket,
count(*) as total_trips,
round(avg(fare_amount), 2) as avg_fare
from bucketed
group by year, distance_bucket
order by year, distance_bucket;