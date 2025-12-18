select distinct
    ingredient_sk,
    name,
    chemical_formula
from {{ ref('stg_ingredients') }}

-- Im not a chemist :) can same ingredient have a different formula?? IRL I would inquire with the right person and add tests.