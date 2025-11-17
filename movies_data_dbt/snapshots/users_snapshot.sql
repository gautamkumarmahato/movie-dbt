{% snapshot users_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='user_id',
      strategy='check',
      check_cols=['first_name', 'last_name', 'plan_id', 'subscription_status'],
      invalidate_hard_deletes=True,
    )
}}

SELECT
    user_id,
    email,
    first_name,
    last_name,
    plan_id,
    subscription_status,
    updated_at -- Essential for timestamp-based tracking, but used here for context
FROM
    {{ source('raw_streaming_db', 'users') }}

{% endsnapshot %}