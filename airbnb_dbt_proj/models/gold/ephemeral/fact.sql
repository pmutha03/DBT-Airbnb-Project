{% set configs = [
    {
        "table": "AIRBNB.GOLD.OBT",
        "columns": "GOLD_OBT.BOOKING_ID, GOLD_OBT.LISTING_ID, GOLD_OBT.HOST_ID, GOLD_OBT.TOTAL_BOOKING_AMOUNT, GOLD_OBT.ACCOMMODATES, GOLD_OBT.BEDROOMS, GOLD_OBT.BATHROOMS, GOLD_OBT.PRICE_PER_NIGHT",
        "alias": "GOLD_OBT"
    }
] %}

SELECT
    {{configs[0]['columns'] }}
FROM
{{ configs[0]['table'] }} AS {{ configs[0]['alias'] }}