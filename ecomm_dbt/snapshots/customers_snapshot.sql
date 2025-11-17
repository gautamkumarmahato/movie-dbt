{% snapshot customers_snapshot %}
{{
  config(
    unique_key = 'customer_id',
    strategy = 'check',
    check_cols = ['full_name', 'email']
  )
}}

SELECT
  customer_id,
  full_name,
  email
FROM {{ ref('stg_customers') }}

{% endsnapshot %}
