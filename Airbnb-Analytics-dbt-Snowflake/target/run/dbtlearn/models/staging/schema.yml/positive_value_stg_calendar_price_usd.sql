select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    select *
    from AIRBNB_AUSTIN.DEV.stg_calendar
    where price_usd < 0

      
    ) dbt_internal_test