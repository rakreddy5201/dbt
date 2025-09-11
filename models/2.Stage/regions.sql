
-- Use the `ref` function to select from seed
{{ config(tags=["Tag_Test"]) }}
select 
country_name,
case when country_code in ('US','CA') then 'North America'
when country_code in ('GB') then 'Europe'
when country_code in ('IN') then 'Asia' else null end as region,
{{ dbt_date.week_start() }} as created_at,
{{ dbt_utils.generate_surrogate_key(['country_name', 'region']) }} as sk
from {{ ref('country_codes') }}
