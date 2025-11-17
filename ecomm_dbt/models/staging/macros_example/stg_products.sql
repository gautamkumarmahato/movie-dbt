{{ config(materialized='table') }}

SELECT
  product_id,
  product_name,
  category,
  price,
  {{ audit_columns('public_raw.products') }}
FROM {{ source('public_raw','products') }};
