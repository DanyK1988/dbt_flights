{% snapshot dim_flight_aircrafts %}

{{
   config(
       target_schema='snapshot',
       unique_key='aircraft_code',

       strategy='check',
       check_cols = ['aircraft_code', 'model']
   )
}}
select
    aircraft_code,
    model,
    range
from
    {{ ref('stg_flights__aircrafts') }}


{% endsnapshot %}