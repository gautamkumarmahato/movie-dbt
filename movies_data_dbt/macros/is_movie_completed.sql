{% macro is_movie_completed(progress_col, duration_col, threshold=90) %}
    {% set watch_pct = "(" ~ progress_col ~ " * 100.0) / NULLIF(" ~ duration_col ~ ", 0)" %}

    IF(
        {{ watch_pct }} >= {{ threshold }},
        TRUE,
        FALSE
    ) AS is_completed_watch
{% endmacro %}



-- function isMovieCompleted(progress, duration, threshold = 90) {
--   if (duration === 0 || duration == null) {
--     return false; // avoid divide-by-zero
--   }

--   const watchPct = (progress * 100) / duration;

--   return watchPct >= threshold;
-- }


-- console.log(isMovieCompleted(540, 600));          // true  (90%)
-- console.log(isMovieCompleted(300, 600));          // false (50%)
-- console.log(isMovieCompleted(600, 600));          // true  (100%)