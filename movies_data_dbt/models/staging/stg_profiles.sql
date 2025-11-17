-- Staging model for Profiles
SELECT
    profile_id,
    user_id,
    profile_name,
    avatar_url,
    is_kid_profile,
    created_at AS profile_created_at
FROM
    {{ source('raw_streaming_db', 'profiles') }}