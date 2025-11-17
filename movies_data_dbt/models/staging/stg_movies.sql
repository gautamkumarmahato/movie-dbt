-- Staging model for Movies
SELECT
    movie_id,
    title,
    description,
    release_year,
    duration_minutes,
    rating,
    thumbnail_url,
    video_file_url,
    created_at AS movie_created_at
FROM
    {{ source('raw_streaming_db', 'movies') }}