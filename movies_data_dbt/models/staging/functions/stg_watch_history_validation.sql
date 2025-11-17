
-- #################################################################
-- # 3. STAGING LAYER: stg_watch_history.sql (Uses 1 Macro)
-- #################################################################
-- Purpose: Filter data based on dbt execution environment (Prod/Dev).

SELECT
    history_id,
    profile_id,
    movie_id,
    watched_at,
    progress_minutes
FROM
    {{ source('raw_streaming_db', 'watch_history') }}

-- Macro 1: Dynamically filters the fact table based on the dbt environment
{{ is_production_check('watched_at') }}

