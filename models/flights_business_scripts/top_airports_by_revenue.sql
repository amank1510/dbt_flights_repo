With airports_ranking_by_revenue
as
(
    Select airport_name,total_revenue,dense_rank()over(order by total_revenue desc) as rankings
    From {{ref('airports_stats')}}
)
Select airport_name,total_revenue From airports_ranking_by_revenue
where rankings<=10