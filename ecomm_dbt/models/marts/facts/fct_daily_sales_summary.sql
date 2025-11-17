{{ config(materialized='table') }}

select
  date_trunc('day', order_date) as sales_date,
  sum(total_amount) as daily_sales,
  count(distinct order_id) as total_orders
from {{ ref('fct_sales') }}
group by 1
