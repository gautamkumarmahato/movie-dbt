{{ config(materialized='ephemeral') }}

select
  o.order_id,
  o.user_id,
  p.product_id,
  p.product_name,
  p.category,
  p.unit_price,
  o.status,
  o.payment_method,
  o.order_date,
  o.total_amount
from {{ ref('stg_orders') }} o
left join {{ ref('stg_products') }} p
  on o.product_id = p.product_id
