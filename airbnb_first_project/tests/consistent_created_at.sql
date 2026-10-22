SELECT r.review_date, 
        l.created_at
FROM {{ref('fact_reviews')}} r
    LEFT JOIN {{ref('dim_listings_cleansed')}} l 
    ON r.listing_id = l.listing_id
WHERE r.review_date < l.created_at