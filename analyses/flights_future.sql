select
    count(*)
from
    {{ ref('fct_flights') }}
where
    scheduled_departure::date >= '{{ run_started_at.strftime("%Y-%m-%d") }}'::date
