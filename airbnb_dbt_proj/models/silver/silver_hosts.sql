{{ config(materialized='incremental', unique_key='HOST_ID') }}

SELECT
    HOST_ID,
    REPLACE(HOST_NAME, ' ', '_') AS HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CASE 
        WHEN RESPONSE_RATE > 95 THEN 'HIGH'
        WHEN RESPONSE_RATE > 80 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS RESPONSE_TAG,
    CREATED_AT
FROM {{ref('bronze_hosts')}}