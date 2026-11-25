{% docs dim_listing_cleansed__minimum_nights %}
Minimum number of nights required to rent this property.

Keep in mind that old listings might have `minimum_nights` set
to 0 in the source tables. Our cleansing algorithm updates this to `1`.

{% enddocs %}



{% docs dim_hosts_cleansed_model_doc %}
This is the source code to generate dim_hosts_cleansed.

WITH src_hosts AS (
    SELECT *
    FROM src_hosts
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

{% enddocs %}