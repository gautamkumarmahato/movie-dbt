{% snapshot subscription_plans_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='plan_id',
      strategy='check',
      check_cols=['plan_name', 'monthly_price', 'video_quality', 'simultaneous_streams'],
      invalidate_hard_deletes=True,
    )
}}

SELECT
    plan_id,
    plan_name,
    monthly_price,
    video_quality,
    simultaneous_streams
FROM
    {{ source('raw_streaming_db', 'subscription_plans') }}

{% endsnapshot %}