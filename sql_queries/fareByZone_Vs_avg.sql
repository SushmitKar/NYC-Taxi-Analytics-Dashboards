-- Zone Fare vs Overall Average (CTE)
with zone_averages as (
  select
  pickup_location_id,
  round(avg(fare_amount), 2) as zone_average_fare,  -- avg fare for this zone
  count(*) as zone_total_trips       -- total trips for this zone and the avg fare for it
  from `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
  where fare_amount > 0
  group by pickup_location_id
),
overall_average as (
  select
  round(avg(fare_amount), 2) as overall_avg_fare, -- city wide average
  from `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
  where fare_amount > 0
)
select
z.pickup_location_id,
z.zone_average_fare,
z.zone_total_trips,
o.overall_avg_fare,
round(o.overall_avg_fare - z.zone_average_fare, 2) as difference  -- +ve means cheap zone
from zone_averages z
cross join overall_average o
order by difference desc;