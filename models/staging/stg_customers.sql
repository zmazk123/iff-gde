select 
    cast(customer_id as integer) as id,
    md5(cast(customer_id as varchar)) as customer_sk,
    trim(name) as name,
    trim(location_city) as location_city,
    trim(location_country) as location_country,
    cast(strptime(generation_date, '%d/%m/%Y') AS DATE) as generation_date,
    cast(batch_number as integer) as batch_number

from (
    {{ deduplicate_latest_batch(
        'dev.main.customers',
        'customer_id',
        'batch_number'
    ) }}
)
