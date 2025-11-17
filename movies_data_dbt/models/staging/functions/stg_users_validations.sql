-- #################################################################
-- # 1. STAGING LAYER: stg_users.sql (Uses 2 Macros)
-- #################################################################
-- Purpose: Clean user data, create full name, and translate status.

SELECT
    user_id,
    email,
    first_name,
    last_name,
    
    -- Macro 1: Safely concatenates first and last name, handling NULLs
    {{ safe_string_join(['first_name', 'last_name'], ' ') }} AS full_name,

    plan_id,
    
    -- Macro 2: Translates cryptic subscription status codes (e.g., 'A', 'P') to readable text
    {{ translate_subscription_status('subscription_status') }} AS subscription_status_desc,

    subscription_status,
    billing_cycle_end,
    created_at AS user_created_at,
    updated_at AS user_updated_at
FROM
    {{ source('raw_streaming_db', 'users') }}

