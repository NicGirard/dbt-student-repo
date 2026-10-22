{{
    config(
        materialized='view'
    )
}}
WITH src_hosts AS (
    SELECT *
    FROM {{ref('src_hosts')}}
)
SELECT 
    host_id,
    NVL(host_name,'Anonymous') as host_name,
    CAST(
    CASE 
        WHEN is_superhost='t' THEN TRUE 
        WHEN is_superhost='f'  THEN FALSE
    END AS BOOLEAN) AS is_superhost,
    created_at,
    updated_at
FROM src_hosts