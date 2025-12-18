select 
    id,
    raw_material_ratio,
    flavour_ratio,
    ingredient_ratio,
    heat_process,
    yield,
    ingredient_sk,
    provider_sk,
    raw_material_sk,
    flavour_sk
from {{ ref('stg_recipes') }}