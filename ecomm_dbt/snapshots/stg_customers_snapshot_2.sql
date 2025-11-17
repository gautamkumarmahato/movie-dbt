{% snapshot customers_snapshot_new_record %}
{{
  config(
    unique_key = 'customer_id',
    strategy = 'timestamp',
    updated_at = 'updated_at',
    hard_deletes = 'new_record'   -- make a new record showing deletion
  )
}}

SELECT customer_id, full_name, email, updated_at
FROM {{ ref('stg_customers') }}

{% endsnapshot %}
