-- Fact table detailing every watch event and the associated user/profile
SELECT
    act.history_id,
    act.watched_at,
    act.progress_minutes,
    act.watch_percentage,
    
    -- Foreign Keys / IDs
    act.movie_id,
    act.profile_id,
    act.user_id,

    -- Profile and Movie context
    act.profile_name,
    act.is_kid_profile,
    act.movie_title,
    act.movie_duration
FROM
    {{ ref('int_profile_movie_activity') }} act
-- Add filtering for incomplete watches if needed, e.g.,
-- WHERE act.watch_percentage IS NULL OR act.watch_percentage < 90