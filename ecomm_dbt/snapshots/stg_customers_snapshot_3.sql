{% snapshot customers_snapshot_delete %}
{{
  config(
    unique_key = 'customer_id',
    strategy = 'timestamp',
    updated_at = 'updated_at',
    hard_deletes = 'delete'     -- dangerous: removes from snapshot
  )
}}

SELECT customer_id, full_name, email, updated_at
FROM {{ ref('stg_customers') }}

{% endsnapshot %}
