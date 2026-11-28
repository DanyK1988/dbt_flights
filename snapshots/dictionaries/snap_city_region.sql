{% snapshot snap_city_region %}

{{
   config(
       target_schema='snapshot',
       unique_key='city',

       strategy='timestamp',
       updated_at='updated_at',
   )
}}

select
    city,
    region,
    updated_at
from
    {{ ref('city_region') }}


{% endsnapshot %}