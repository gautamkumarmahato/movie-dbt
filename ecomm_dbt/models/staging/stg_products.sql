-- models/staging/stg_products.sql
{{ config(materialized='table') }}

SELECT
  product_id::INT               AS product_id,    -- ensure INT type
  product_name,
  category,
  price::numeric(10,2)          AS price
FROM {{ source('public_raw', 'products') }}
