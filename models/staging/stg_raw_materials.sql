select 
    cast(raw_material_id as integer) as id,
    md5(cast(raw_material_id as varchar)) as raw_material_sk,
    trim(name) as name,
    cast(strptime(generation_date, '%d/%m/%y') AS DATE) generation_date,
    cast(batch_number as integer) as batch_number

from (
    {{ deduplicate_latest_batch(
        'dev.main.raw_materials',
        'raw_material_id',
        'batch_number'
    ) }}
)
