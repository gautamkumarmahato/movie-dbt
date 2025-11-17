{{ config(materialized='table') }}

select
  product_id,
  product_name,
  category,
  unit_price,
  description,
  created_at,
  current_timestamp as dbt_loaded_at
from {{ ref('stg_products') }}
