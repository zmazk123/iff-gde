select 
    cast(recipe_id as varchar) as id,
    cast(raw_material_id as integer) as fk_raw_material_id,
    cast(raw_material_ratio as decimal) as raw_material_ratio,
    cast(flavour_id as integer) as fk_flavour_id,
    cast(flavour_ratio as decimal) as flavour_ratio,
    cast(ingredient_id as integer) as fk_ingredient_id,
    cast(ingredient_ratio as decimal) as ingredient_ratio,
    trim(heat_process) as heat_process,
    cast(yield as decimal)/100 as yield,
    cast(strptime(r.generation_date, '%d/%m/%y') AS DATE) as generation_date,
    cast(r.batch_number as integer) as batch_number,
    i.ingredient_sk as ingredient_sk,
    rm.raw_material_sk as raw_material_sk,
    f.flavour_sk as flavour_sk,
    -- injecting provider_sk, because we want to keep the start schema, for faster query speed
    p.provider_sk as provider_sk
from (
    {{ deduplicate_latest_batch(
        'dev.main.recipes',
        'recipe_id',
        'batch_number'
    ) }}
) r
left join {{ ref('stg_ingredients') }} i
    on r.ingredient_id = i.id
left join {{ ref('stg_raw_materials') }} rm
    on r.raw_material_id = rm.id
left join {{ ref('stg_flavours') }} f
    on r.flavour_id = f.id
-- to avoid the join we could do the md5(provider_id), but that would duplicate logic, which we dont want. so im keeping the join
left join {{ ref('stg_providers') }} p
    on i.fk_provider_id = p.id