select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select listing_id
from AIRBNB_AUSTIN.DEV.mart_calendar_metrics
where listing_id is null



      
    ) dbt_internal_test