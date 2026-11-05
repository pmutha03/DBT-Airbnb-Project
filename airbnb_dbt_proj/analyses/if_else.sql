{% set flag = 0 %}

SELECT * FROM {{ref("bronze_booking")}}
{% if flag == 1 %}
    WHERE NIGHTS_BOOKED > 1
{% else %}
    WHERE NIGHTS_BOOKED = 1
{% endif %}