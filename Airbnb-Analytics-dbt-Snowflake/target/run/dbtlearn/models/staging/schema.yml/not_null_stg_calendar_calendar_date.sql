select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select calendar_date
from AIRBNB_AUSTIN.DEV.stg_calendar
where calendar_date is null



      
    ) dbt_internal_test