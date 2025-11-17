-- #################################################################
-- # 2. STAGING LAYER: stg_movies.sql (FIXED)
-- #################################################################

SELECT
    movie_id,
    title,
    description,
    release_year,
    duration_minutes,
    rating,
    
    release_year / 100.0 AS internal_score,

    -- Macro 1: Let the macro define the 'AS rating_category' alias internally
    {{ get_movie_rating_categories('release_year / 100.0') }}, 
    
    rating AS original_rating
FROM
    {{ source('raw_streaming_db', 'movies') }}