select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select month
from AIRBNB_AUSTIN.DEV.mart_calendar_metrics
where month is null



      
    ) dbt_internal_test