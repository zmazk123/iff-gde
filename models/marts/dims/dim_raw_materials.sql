select 
    id,
    raw_material_sk,
    name
from {{ ref('stg_raw_materials') }}