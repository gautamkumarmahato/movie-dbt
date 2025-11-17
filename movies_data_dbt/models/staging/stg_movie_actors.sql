-- Staging model for Movie to Actor (Cast) Link
SELECT
    movie_id,
    actor_id,
    role_name
FROM
    {{ source('raw_streaming_db', 'movie_actors') }}