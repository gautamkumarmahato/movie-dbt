-- Joins movies with actors to list the cast and count cast members.
WITH movie_cast_list AS (
    SELECT
        ma.movie_id,
        a.full_name AS actor_name,
        ma.role_name
    FROM
        {{ ref('stg_movie_actors') }} ma
    INNER JOIN
        {{ ref('stg_actors') }} a ON ma.actor_id = a.actor_id
),

-- Aggregate cast members into a list and count them
movie_cast_summary AS (
    SELECT
        movie_id,
        COUNT(actor_name) AS total_cast_count,
        STRING_AGG(actor_name || ' (' || role_name || ')', ', ') AS full_cast_details
    FROM
        movie_cast_list
    GROUP BY 1
)

SELECT
    m.movie_id,
    m.title,
    m.release_year,
    m.duration_minutes,
    m.rating,
    mcs.total_cast_count,
    mcs.full_cast_details
FROM
    {{ ref('stg_movies') }} m
LEFT JOIN
    movie_cast_summary mcs ON m.movie_id = mcs.movie_id