{% set configs = [
    {
        "table": "AIRBNB.SILVER.SILVER_BOOKINGS",
        "columns": "silver_bookings.*",
        "alias": "silver_bookings"
    },
    {
        "table": "AIRBNB.SILVER.SILVER_LISTINGS",
        "columns": "silver_listings.host_id, silver_listings.property_type, silver_listings.room_type, silver_listings.city, silver_listings.country, silver_listings.accommodates, silver_listings.bedrooms, silver_listings.bathrooms, silver_listings.price_per_night, silver_listings.price_tag",
        "alias": "silver_listings",
        "join_condition": "silver_bookings.listing_id = silver_listings.listing_id"
    },
    {
        "table": "AIRBNB.SILVER.SILVER_HOSTS",
        "columns": "silver_hosts.host_name, silver_hosts.host_since, silver_hosts.is_superhost, silver_hosts.response_rate, silver_hosts.response_tag",
        "alias": "silver_hosts",
        "join_condition": "silver_listings.host_id = silver_hosts.host_id"
    }
] %}

SELECT
    {% for cfg in configs %}
        {{ cfg['columns'] }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
{% for cfg in configs %}
    {% if loop.first %}
        {{ cfg['table'] }} AS {{ cfg['alias'] }}
    {% else %}
        LEFT JOIN {{ cfg['table'] }} AS {{ cfg['alias'] }}
        ON {{ cfg['join_condition'] }}
    {% endif %}
{% endfor %}
