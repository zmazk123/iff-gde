select
    p.provider_sk,
    s.ingredient_sk,
    s.weight_in_grams,
    s.cost_per_gram,
    s.weight_in_grams * s.cost_per_gram as inventory_value

from {{ ref('stg_ingredients') }} s

join {{ ref('dim_providers') }} p
  on s.fk_provider_id = p.id