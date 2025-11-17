-- Staging model for Users
SELECT
    user_id,
    email,
    -- NOTE: We exclude password_hash from the final model for security/simplicity
    first_name,
    last_name,
    plan_id,
    subscription_status,
    billing_cycle_end,
    created_at AS user_created_at,
    updated_at AS user_updated_at
FROM
    {{ source('raw_streaming_db', 'users') }}