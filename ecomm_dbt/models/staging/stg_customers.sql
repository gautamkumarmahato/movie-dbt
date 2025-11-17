-- models/staging/stg_customers.sql
{{ config(materialized='table') }}

SELECT
  customer_id::INT AS customer_id,       -- ensure consistent type
  full_name,
  email,
  created_at::timestamp AS created_at
FROM {{ source('public_raw', 'customers') }}
