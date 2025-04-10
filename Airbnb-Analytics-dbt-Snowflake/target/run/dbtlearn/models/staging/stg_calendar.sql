
  create or replace   view AIRBNB_AUSTIN.DEV.stg_calendar
  
   as (
    

with calendar as (
    select * from AIRBNB_AUSTIN.RAW_DATA.CALENDAR
),

cleaned_calendar as (
    select
        listing_id::int as listing_id,
        to_date(date) as calendar_date,
        case
            when available = 't' then true
            when available = 'f' then false
            else null
        end as is_available,
        replace(replace(price, '$', ''), ',', '')::float as price_usd
    from calendar
)

select * from cleaned_calendar
  );

