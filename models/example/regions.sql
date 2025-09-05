
-- Use the `ref` function to select from seed

select 
country_name,
case when country_code in ('US','CA') then 'North America'
when country_code in ('GB') then 'Europe'
when country_code in ('IN') then 'Asia' else null end as region
from {{ ref('country_codes') }}
