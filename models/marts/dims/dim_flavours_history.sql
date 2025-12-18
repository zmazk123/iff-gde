select 
    id,
    flavour_sk,
    name,
    description,
    batch_number,
    generation_date
from {{ ref('stg_flavours_history') }}