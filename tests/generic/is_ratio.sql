{% test is_ratio(model, column_name) %}

select *
from {{ model }}
where {{ column_name }} NOT BETWEEN 0 AND 1

{% endtest %}