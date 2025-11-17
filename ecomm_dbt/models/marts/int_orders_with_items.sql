-- models/marts/int_orders_with_items.sql
{{ config(materialized='table') }}

SELECT
  oi.order_item_id,
  o.order_id,
  o.customer_id,
  o.order_date,
  oi.product_id,
  p.product_name,
  oi.quantity,
  oi.unit_price,
  oi.line_total,
  o.status
FROM {{ ref('stg_order_items') }} AS oi         -- ref() returns the compiled relation for stg_order_items
JOIN {{ ref('stg_orders') }}       AS o           -- join with orders staging model
  ON oi.order_id = o.order_id
LEFT JOIN {{ ref('stg_products') }} AS p         -- join with products staging model
  ON oi.product_id = p.product_id
