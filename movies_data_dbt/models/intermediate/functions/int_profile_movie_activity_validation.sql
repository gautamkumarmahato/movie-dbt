
-- #################################################################
-- # 4. INTERMEDIATE LAYER: int_profile_movie_activity.sql (Uses 1 Macro)
-- #################################################################
-- Purpose: Feature engineering—determine if a watch event counts as "completed."

SELECT
    h.history_id,
    h.profile_id,
    h.movie_id,
    h.watched_at,
    h.progress_minutes,
    m.duration_minutes,
    
    -- Calculate watch percentage
    (h.progress_minutes * 100.0) / NULLIF(m.duration_minutes, 0) AS watch_percentage,

    -- Macro 1: Adds a boolean flag to easily identify completed views (default 90% threshold)
    {{ is_movie_completed('h.progress_minutes', 'm.duration_minutes') }}
    
FROM
    {{ ref('stg_watch_history') }} h
INNER JOIN
    {{ ref('stg_movies') }} m ON h.movie_id = m.movie_id
INNER JOIN
    {{ ref('stg_profiles') }} p ON h.profile_id = p.profile_id

