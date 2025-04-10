{{ config(materialized='view') }}

with calendar as (
    select
        listing_id,
        calendar_date,
        price_usd,
        is_available
    from {{ ref('stg_calendar') }}
)

select
    listing_id,
    date_trunc('month', calendar_date) as month,
    round(avg(price_usd), 2) as avg_price_usd,
    sum(case when is_available then 1 else 0 end) as available_nights
from calendar
group by listing_id, month
