{% snapshot payments_snapshot %}

{{
  config(
    unique_key = 'payment_id',
    strategy   = 'timestamp',
    updated_at = 'updated_at'
  )
}}

SELECT
  payment_id,
  order_id,
  amount,
FROM {{ ref('stg_payments') }}

{% endsnapshot %}
