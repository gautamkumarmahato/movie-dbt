-- In models/staging/stg_movies.sql

SELECT
    movie_id,
    title,
    release_year,

    -- Macro Call: Generates is_released_in_2020_decade, is_released_in_2010_decade, etc.
    {{ flag_release_decades('release_year') }}

FROM
    {{ source('raw_streaming_db', 'movies') }}