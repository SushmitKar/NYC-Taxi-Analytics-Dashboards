# NYC Taxi Business Analytics

## Overview
Analysis of 67M+ NYC Yellow Taxi trips (2021–2022) using BigQuery SQL,
visualized in Tableau Public and Power BI Desktop.

## Live Dashboard
[View on Tableau Public](https://public.tableau.com/app/profile/sushmit.kar/viz/NYCTaxiBusinessAnalytics)

## Tools
- Google BigQuery (SQL analysis)
- Tableau Public (dashboard + publishing)
- Power BI Desktop (dashboard)

## Structure
- `sql_queries/` — 8 BigQuery SQL queries
- `data/` — aggregated CSV outputs
- `NYC Taxi Business Analytics — Insights Report.pdf` — business report

## Dashboard figures

### Tableau Public
* Monthly Revenue Trend (2021–2022)
![Monthly Trend](figures/tableau_monthly_trend.png)
* Revenue by Pickup Zone
![Revenue by Zone](figures/tableau_revenue_by_zone.png)
* Hourly Trip Demand
![Hourly Demand](figures/tableau_hourly_demand.png)
* Fare vs Distance (2021–2022)
![Fare vs Distance](figures/tableau_fare_vs_distance.png)

### Power BI
* Monthly Revenue Trend (2021–2022)
![Monthly Trend](figures/powerbi_monthly_trend.png)
* Revenue by Pickup Zone (2022)
![Revenue by Zone](figures/powerbi_revenue_by_zone.png)
* Hourly Trip Demand (2022)
![Hourly Demand](figures/powerbi_hourly_demand.png)
* Fare vs Distance (2021–2022)
![Fare vs Distance](figures/powerbi_fare_vs_distance.png)

## Key Findings
- 2022 revenue 25–40% higher than 2021 across all months
- Zone 132 (JFK) generated $80M+ — highest of all zones
- Peak demand at 6PM; early morning trips average 44 miles (airport runs)
- Fares increased across all distance buckets YoY