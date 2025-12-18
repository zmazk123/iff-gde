select 
    id,
    quantity_liters,
    transaction_date,
    transaction_country,
    transaction_town,
    postal_code,
    amount_dollar,
    customer_sk,
    flavour_sk
from {{ ref('stg_sales_transactions') }}