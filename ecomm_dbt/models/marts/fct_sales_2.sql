-- models/marts/fct_sales.sql
{{ config(materialized='table') }}

SELECT
  DATE(order_date)                     AS order_date,
  COUNT(DISTINCT order_id)             AS orders_count,
  SUM(line_total)                      AS total_revenue,
  SUM(quantity)                        AS total_items
FROM {{ ref('int_orders_with_items') }}    -- depends on int_orders_with_items
GROUP BY 1
ORDER BY 1
