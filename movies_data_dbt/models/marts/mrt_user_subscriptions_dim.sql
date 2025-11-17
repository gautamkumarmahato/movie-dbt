-- Dimension table providing complete user and subscription plan details
SELECT
    u.user_id,
    u.email,
    u.first_name,
    u.last_name,
    u.subscription_status,
    u.billing_cycle_end,
    p.plan_name,
    p.monthly_price,
    p.video_quality,
    p.simultaneous_streams,
    u.user_created_at
FROM
    {{ ref('stg_users') }} u
LEFT JOIN
    {{ ref('stg_subscription_plans') }} p ON u.plan_id = p.plan_id