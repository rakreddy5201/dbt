{% set old_query %}
  select
    lower(country_name) as country_name
      from {{ ref('regions') }}
{% endset %}

{% set new_query %}
  select
    --country_code,
    country_name
  from {{ ref('country_codes') }}
{% endset %}

{{ 
  audit_helper.compare_and_classify_query_results(
    old_query, 
    new_query, 
    primary_key_columns=['country_name'], 
    columns=['country_name']
  )
}}