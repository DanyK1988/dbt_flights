select
    count(*)
from
    {{ ref('fct_flights') }}
where scheduled_departure::date between '{{ run_started_at.strftime("%Y-%m-%d") }}'::date - interval '10 year' and '{{ run_started_at.strftime("%Y-%m-%d") }}'::date