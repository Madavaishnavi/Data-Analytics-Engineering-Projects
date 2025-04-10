{{ config(materialized='view') }}

with listings as (
    select * from {{ source('raw_data', 'LISTINGS') }}
),

cleaned_listings as (
    select
        id as listing_id,
        host_id as host_id,
        name as name,
        neighbourhood_cleansed as neighbourhood,
        neighbourhood_group_cleansed as neighbourhood_group,
        host_location as host_location,
        latitude::float as latitude,
        longitude::float as longitude,
        property_type as property_type,
        room_type as room_type,
        accommodates::int as accommodates,
        bathrooms_text as bathrooms_text,
        bedrooms::int as bedrooms,
        beds::int as beds,
        amenities as amenities,
        replace(replace(price, '$', ''), ',', '')::float as price_usd,
        minimum_nights::int as minimum_nights,
        maximum_nights::int as maximum_nights,
        has_availability as has_availability,
        availability_365::int as availability_365,
        number_of_reviews::int as number_of_reviews,
        review_scores_rating::float as review_scores_rating,
        review_scores_accuracy::float as review_scores_accuracy,
        review_scores_cleanliness::float as review_scores_cleanliness,
        review_scores_checkin::float as review_scores_checkin,
        review_scores_communication::float as review_scores_communication,
        review_scores_location::float as review_scores_location,
        review_scores_value::float as review_scores_value,
        instant_bookable as instant_bookable,
        calculated_host_listings_count::int as calculated_host_listings_count,
        reviews_per_month::float as reviews_per_month
    from listings
)

select * from cleaned_listings
