

with listings as (
    select
        listing_id,
        name,
        neighbourhood,
        room_type,
        property_type
    from AIRBNB_AUSTIN.DEV.stg_listings
),

calendar as (
    select
        listing_id,
        price_usd,
        is_available
    from AIRBNB_AUSTIN.DEV.stg_calendar
),

reviews as (
    select
        listing_id,
        review_date
    from AIRBNB_AUSTIN.DEV.stg_reviews
)

select
    l.listing_id,
    l.name,
    l.neighbourhood,
    l.room_type,
    l.property_type,
    round(avg(c.price_usd), 2) as avg_price_usd,
    
    sum(case when case when c.is_available then 1 else 0 end is not null then case when c.is_available then 1 else 0 end else 0 end)
 as available_days,
    count(distinct r.review_date) as total_reviews,
    max(r.review_date) as last_review_date
from listings l
left join calendar c on l.listing_id = c.listing_id
left join reviews r on l.listing_id = r.listing_id
group by
    l.listing_id, l.name, l.neighbourhood, l.room_type, l.property_type