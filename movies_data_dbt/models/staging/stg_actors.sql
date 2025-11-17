-- Staging model for Actors
SELECT
    actor_id,
    first_name,
    last_name,
    date_of_birth,
    first_name || ' ' || last_name AS full_name -- Concatenate names for convenience
FROM
    {{ source('raw_streaming_db', 'actors') }}