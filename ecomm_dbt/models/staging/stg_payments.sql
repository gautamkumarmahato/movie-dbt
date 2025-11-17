-- models/staging/stg_payments.sql
{{ config(materialized='table') }}

SELECT
  payment_id::INT        AS payment_id,
  order_id::INT          AS order_id,
  amount::NUMERIC(10,2)  AS amount,
  payment_method         AS payment_method
FROM {{ source('public_raw', 'payments') }}
