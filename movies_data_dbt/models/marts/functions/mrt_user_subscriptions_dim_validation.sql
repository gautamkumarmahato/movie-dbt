
-- #################################################################
-- # 5. MARTS LAYER: mrt_user_subscriptions_dim.sql (Uses 1 Macro)
-- #################################################################
-- Purpose: Apply final pricing/discount logic.

SELECT
    u.user_id,
    u.email,
    u.first_name, 
    u.subscription_status, 
    p.plan_name,
    p.monthly_price,

    -- Macro 1: Calculates a new price based on plan name using a Jinja loop/CASE logic
    {{ calculate_plan_discounts('p.monthly_price', 'p.plan_name') }} AS adjusted_monthly_price
    
FROM
    {{ ref('stg_users') }} u
LEFT JOIN
    {{ ref('stg_subscription_plans') }} p ON u.plan_id = p.plan_id