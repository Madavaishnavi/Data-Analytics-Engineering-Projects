{{ config(
    materialized = 'view',
    alias = 'mart_listing_summary'
) }}

with listings as (
    select
        listing_id,
        name,
        neighbourhood,
        room_type,
        property_type
    from {{ ref('stg_listings') }}
),

calendar as (
    select
        listing_id,
        price_usd,
        is_available
    from {{ ref('stg_calendar') }}
),

reviews as (
    select
        listing_id,
        review_date
    from {{ ref('stg_reviews') }}
)

select
    l.listing_id,
    l.name,
    l.neighbourhood,
    l.room_type,
    l.property_type,
    round(avg(c.price_usd), 2) as avg_price_usd,
    {{ safe_sum('case when c.is_available then 1 else 0 end') }} as available_days,
    count(distinct r.review_date) as total_reviews,
    max(r.review_date) as last_review_date
from listings l
left join calendar c on l.listing_id = c.listing_id
left join reviews r on l.listing_id = r.listing_id
group by
    l.listing_id, l.name, l.neighbourhood, l.room_type, l.property_type