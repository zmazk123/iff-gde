{% set tolerance = 0.0001 %}

select *
from {{ ref('stg_recipes') }}
where abs(
    coalesce(raw_material_ratio, 0)
  + coalesce(flavour_ratio, 0)
  + coalesce(ingredient_ratio, 0)
) - 1 NOT BETWEEN -{{ tolerance }} AND {{ tolerance }}