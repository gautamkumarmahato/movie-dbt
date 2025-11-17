-- Dimension table for the movie catalog, including genres and cast summary.
WITH movie_genre_list AS (
    SELECT
        mg.movie_id,
        g.name AS genre_name
    FROM
        {{ source('raw_streaming_db', 'movie_genres') }} mg
    INNER JOIN
        {{ source('raw_streaming_db', 'genres') }} g ON mg.genre_id = g.genre_id
),

movie_genre_summary AS (
    SELECT
        movie_id,
        STRING_AGG(genre_name, ', ') AS genres_list,
        COUNT(genre_name) AS total_genres
    FROM
        movie_genre_list
    GROUP BY 1
)

SELECT
    m.movie_id,
    m.title,
    m.description,
    m.release_year,
    m.duration_minutes,
    m.rating,
    m.movie_created_at,
    
    -- Cast Details from Intermediate Model
    c.total_cast_count,
    c.full_cast_details,
    
    -- Genre Details
    gs.genres_list,
    gs.total_genres
FROM
    {{ ref('stg_movies') }} m
LEFT JOIN
    {{ ref('int_movie_cast_details') }} c ON m.movie_id = c.movie_id
LEFT JOIN
    movie_genre_summary gs ON m.movie_id = gs.movie_id