select
    aircraft_code,
    count(*)
from
    {{ ref('stg_flights_seats') }}
group by 1
order by 2 desc