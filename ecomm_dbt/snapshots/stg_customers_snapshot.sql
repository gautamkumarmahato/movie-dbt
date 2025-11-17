{% snapshot customers_snapshot_ignore %}
{{
  config(
    unique_key = 'customer_id',
    strategy = 'timestamp',
    updated_at = 'updated_at',
    hard_deletes = 'ignore'   
  )
}}

SELECT customer_id, full_name, email, updated_at
FROM {{ ref('stg_customers') }}

{% endsnapshot %}
