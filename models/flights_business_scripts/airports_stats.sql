
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with airports_stats_cte as (

Select a.airport_name,round(sum(f.amount),2) as total_revenue,count(f.booking_date) as total_passengers
From flights.gold.fact_bookings f
inner join flights.gold.dim_airports a 
on a.dims_airports_key=f.dims_airports_key
Group by a.airport_name
)
Select * From airports_stats_cte

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
