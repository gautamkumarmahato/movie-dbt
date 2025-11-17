-- Staging model for Subscription Plans
SELECT
    plan_id,
    plan_name,
    monthly_price,
    video_quality,
    simultaneous_streams,
    created_at AS plan_created_at
FROM
    {{ source('raw_streaming_db', 'subscription_plans') }}