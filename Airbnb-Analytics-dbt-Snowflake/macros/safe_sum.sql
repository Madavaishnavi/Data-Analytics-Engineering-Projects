{% macro safe_sum(column_name) %}
    sum(case when {{ column_name }} is not null then {{ column_name }} else 0 end)
{% endmacro %}
