select 
    cast(transaction_id as integer) as id,
    cast(customer_id as integer) as fk_customer_id,
    cast(flavour_id as integer) as fk_flavour_id,
    cast(quantity_liters as integer) as quantity_liters,
    cast(strptime(transaction_date, '%m/%d/%y') AS DATE) as transaction_date,
    trim(transaction_country) as transaction_country,
    trim(transaction_town) as transaction_town,
    trim(postal_code) as postal_code,
    cast(amount_dollar as integer) as amount_dollar,
    cast(strptime(st.generation_date, '%d/%m/%y') AS DATE) as generation_date,
    cast(st.batch_number as integer) as batch_number,
    c.customer_sk as customer_sk,
    f.flavour_sk as flavour_sk

from (
    {{ deduplicate_latest_batch(
        'dev.main.sales_transactions',
        'transaction_id',
        'batch_number'
    ) }}
) st
left join {{ ref('stg_customers') }} c
    on st.customer_id = c.id

left join {{ ref('stg_flavours') }} f
    on st.flavour_id = f.id