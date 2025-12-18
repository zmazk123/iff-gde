{% macro deduplicate_latest_batch(table, key_column, batch_column) %}

select *
from (
    select
        *,
        row_number() over (
            partition by {{ key_column }}
            order by {{ batch_column }} desc
        ) as rn
    from {{ table }}
) t
where rn = 1

{% endmacro %}