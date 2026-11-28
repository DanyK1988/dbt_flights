{{
    config(
        materialized="table",
        tags = 'staging',
    )
}}

select aircraft_code, model, "range"
from {{ source("demo_src", "aircrafts") }}
