select 
    id,
    flavour_sk,
    name,
    description
from {{ ref('stg_flavours') }}