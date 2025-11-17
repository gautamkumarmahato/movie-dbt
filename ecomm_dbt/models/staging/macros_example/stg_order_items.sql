{{ config(materialized='table') }}

SELECT
  order_item_id,
  order_id,
  product_id,
  quantity,
  unit_price,
  {{ calc_line_total('quantity','unit_price') }} AS line_total
FROM {{ source('public_raw','order_items') }};
