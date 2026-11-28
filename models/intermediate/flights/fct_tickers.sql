{{
  config(
    materialized = 'table',
    tags = 'intermediate'
    )
}}
select
    ticket_no,
    book_ref,
    passenger_id,
    passenger_name,
    contact_data
from
    {{ ref('stg_flights__facts__tickets') }}