{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}
WITH src_reviews AS (
    SELECT *
    FROM {{ ref('src_reviews') }}
)
SELECT {{dbt_utils.generate_surrogate_key(['s.listing_id', 's.review_date','s.reviewer_name', 's.review_text']) }} as review_id, 
    s.*
FROM src_reviews s
WHERE s.review_text IS NOT NULL
{% if is_incremental() %}
    AND s.review_date > (SELECT MAX(s.review_date) FROM {{ this }})
{% endif %}