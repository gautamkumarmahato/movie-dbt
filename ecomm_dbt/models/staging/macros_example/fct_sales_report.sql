{{ config(materialized='view') }}

SELECT
  order_date,
  total_revenue,
  {{ format_currency('total_revenue', '₹') }} AS total_revenue_formatted
FROM {{ ref('fct_sales') }};
