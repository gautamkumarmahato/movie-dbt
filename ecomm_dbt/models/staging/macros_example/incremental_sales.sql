{{ config(materialized='incremental', unique_key='order_item_id') }}

WITH src AS (
  SELECT
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    {{ calc_line_total('oi.quantity','oi.unit_price') }} AS line_total,
    o.order_date
  FROM {{ ref('stg_order_items') }} oi
  JOIN {{ ref('stg_orders') }} o ON oi.order_id = o.order_id
)

SELECT *
FROM src
{{ is_incremental_where('order_date') }};
