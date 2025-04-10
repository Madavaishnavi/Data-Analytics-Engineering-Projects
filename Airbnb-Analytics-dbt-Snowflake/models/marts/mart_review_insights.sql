{{ config(
    materialized = 'view',
    alias = 'mart_review_insights'
) }}

with reviews as (
    select
        listing_id,
        review_id,
        review_date,
        reviewer_id
    from {{ ref('stg_reviews') }}
)

select
    listing_id,
    count(*) as total_reviews,
    count(distinct reviewer_id) as unique_reviewers,
    min(review_date) as first_review_date,
    max(review_date) as latest_review_date
from reviews
group by listing_id
