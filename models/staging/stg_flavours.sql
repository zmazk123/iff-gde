select 
    cast(flavour_id as integer) as id,
    md5(cast(flavour_id as varchar) || batch_number) as flavour_sk,
    trim(name) as name,
    trim(description) as description,
    cast(strptime(generation_date, '%d/%m/%y') AS DATE) as generation_date,
    cast(batch_number as integer) as batch_number

from (
    {{ deduplicate_latest_batch(
        'dev.main.flavours',
        'flavour_id',
        'batch_number'
    ) }}
)
