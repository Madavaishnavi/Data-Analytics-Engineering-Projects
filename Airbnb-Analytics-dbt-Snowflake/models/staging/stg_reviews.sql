{{ config(materialized='view') }}

with reviews as (
    select * from {{ source('raw_data', 'REVIEWS') }}
),

cleaned_reviews as (
    select
        listing_id::int as listing_id,
        id as review_id,
        reviewer_id::int as reviewer_id,
        reviewer_name as reviewer_name,
        to_date(date) as review_date,
        comments as comments
    from reviews
)

select * from cleaned_reviews

