-- Combines profile and watch history data with movie details.
SELECT
    h.history_id,
    h.profile_id,
    h.movie_id,
    h.watched_at,
    h.progress_minutes,
    m.title AS movie_title,
    m.duration_minutes AS movie_duration,
    p.user_id,
    p.profile_name,
    p.is_kid_profile,
    
    -- Calculate watch percentage
    (h.progress_minutes * 100.0) / NULLIF(m.duration_minutes, 0) AS watch_percentage
FROM
    {{ ref('stg_watch_history') }} h
INNER JOIN
    {{ ref('stg_movies') }} m ON h.movie_id = m.movie_id
INNER JOIN
    {{ ref('stg_profiles') }} p ON h.profile_id = p.profile_id