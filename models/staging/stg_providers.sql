select 
    cast(provider_id as integer) as id,
    md5(cast(provider_id as varchar)) as provider_sk,
    trim(name) as name,
    trim(location_city) as location_city,
    trim(location_country) as location_country,
    cast(strptime(generation_date, '%d/%m/%y') AS DATE) as generation_date,
    cast(batch_number as integer) as batch_number

from (
    {{ deduplicate_latest_batch(
        'dev.main.providers',
        'provider_id',
        'batch_number'
    ) }}
)