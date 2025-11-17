-- Staging model for Watch History
SELECT
    history_id,
    profile_id,
    movie_id,
    watched_at,
    progress_minutes
FROM
    {{ source('raw_streaming_db', 'watch_history') }}