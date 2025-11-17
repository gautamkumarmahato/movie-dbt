-- models/staging/stg_orders.sql
{{ config(materialized='table') }}

SELECT
    order_id,
    customer_id,
    order_date::date AS order_date,
    status,
    total_amount::numeric(10,2) AS total_amount
FROM {{ source('public_raw', 'orders') }}
