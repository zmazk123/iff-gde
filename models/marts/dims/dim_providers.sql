select
    provider_sk,
    id,
    name,
    location_city,
    location_country
from {{ ref('stg_providers') }}