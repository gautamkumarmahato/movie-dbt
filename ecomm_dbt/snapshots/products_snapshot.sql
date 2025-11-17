{% snapshot products_snapshot %}

{{
  config(
    unique_key = 'product_id',
    strategy = 'check',
    check_cols = ['product_name','price'],
    hard_deletes = 'ignore'
  )
}}

SELECT
  product_id,
  product_name,
  category,
  price
FROM {{ source('public_raw', 'products') }}

{% endsnapshot %}
