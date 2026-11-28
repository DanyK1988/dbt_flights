{{
  config(
    materialized = 'table',
    tags = 'staging',
    )
}}

select
    flight_id,
    flight_no,
    scheduled_departure,
    scheduled_departure_local,
    scheduled_arrival,
    scheduled_arrival_local,
    scheduled_duration,
    departure_airport,
    arrival_airport,
    arrival_city,
    status,
    aircraft_code,
    actual_departure,
    actual_departure_local,
    actual_arrival,
    actual_arrival_local,
    actual_duration
from
    {{ source('demo_src', 'flights_v') }}