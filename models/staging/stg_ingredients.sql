select 
    cast(ingredient_id as integer) as id,
    md5(name || chemical_formula) as ingredient_sk,
    trim(name) as name,
    trim(chemical_formula) as chemical_formula,
    cast(weight_in_grams as decimal) as weight_in_grams,
    cast(cost_per_gram as decimal) as cost_per_gram,
    cast(provider_id as integer) as fk_provider_id,
    cast(strptime(generation_date, '%d-%b-%y') AS DATE) as generation_date,
    cast(batch_number as integer) as batch_number

from (
    {{ deduplicate_latest_batch(
        'dev.main.ingredients',
        'ingredient_id',
        'batch_number'
    ) }}
)
