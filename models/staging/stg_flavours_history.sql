select 
    cast(flavour_id as integer) as id,
    md5(cast(flavour_id as varchar) || batch_number) as flavour_sk,
    trim(name) as name,
    trim(description) as description,
    cast(strptime(generation_date, '%d/%m/%y') AS DATE) as generation_date,
    cast(batch_number as integer) as batch_number

from dev.main.flavours

-- Duplication of logic could be removed(with more time) if I added dbt sources and ref() them. Than I could ref() stg_flavours from stg_flavour_history.