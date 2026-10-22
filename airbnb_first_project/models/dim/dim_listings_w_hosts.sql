WITH listings as (
    SELECT *
    FROM {{ ref('dim_listings_cleansed') }}
), hosts as (
    SELECT *
    FROM {{ ref('dim_hosts_cleansed') }}
)
SELECT
    listings.listing_id,
    listings.listing_name,
    listings.room_type,
    listings.minimum_nights,
    listings.price,
    listings.host_id,
    hosts.host_name,
    hosts.is_superhost as host_is_superhost,
    listings.created_at,
    GREATEST(listings.updated_at, hosts.updated_at) as updated_at
FROM listings
LEFT JOIN hosts ON (hosts.host_id = listings.host_id)