-- models/staging/stg_order_items.sql
{{ config(materialized='table') }}

SELECT
  order_item_id::INT            AS order_item_id,
  order_id::INT                 AS order_id,
  product_id::INT               AS product_id,
  quantity::INT                 AS quantity,
  unit_price::numeric(10,2)     AS unit_price,
  (quantity * unit_price)::numeric(12,2) AS line_total
FROM {{ source('public_raw', 'order_items') }}
