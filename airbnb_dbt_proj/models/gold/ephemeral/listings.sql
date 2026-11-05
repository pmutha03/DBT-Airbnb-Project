{{config(materialized='ephemeral')}}

WITH listings AS(
    SELECT 
        LISTING_ID,
        PROPERTY_TYPE,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        ACCOMMODATES,
        PRICE_TAG,
        CREATED_AT
FROM {{ref('obt')}}
)
SELECT * FROM listings