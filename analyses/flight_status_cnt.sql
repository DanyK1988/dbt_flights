{% set status_query %}
select distinct
    status
from
    {{ ref('stg_flights__facts__flights') }}
{% endset %}

{% set status_query_result = run_query(status_query) %}
{% if execute %}
    {% set all_statuses = status_query_result.columns[0].values() %}
{% else %}
    {% set all_statuses = [] %}
{% endif %}

select
    {% for sts in all_statuses -%}
    sum(case when status = '{{ sts }}' then 1 else 0 end) as status_{{ sts | replace(' ', '_') | lower }}
        {%- if not loop.last %},{% endif %}
    {% endfor %}
from
    {{ ref('stg_flights__facts__flights') }}