{{ config(materialized='incremental', unique_key='sale_id') }}

select
  s.sale_id,
  s.order_id,
  s.user_id,
  s.product_id,
  s.quantity,
  s.unit_price,
  s.total_amount,
  s.order_date,
  s.payment_method,
  s.status,
  current_timestamp as loaded_at
from {{ ref('int_sales_enriched') }} s

{% if is_incremental() %}
where s.sale_id > (select coalesce(max(sale_id), 0) from {{ this }})
{% endif %}
