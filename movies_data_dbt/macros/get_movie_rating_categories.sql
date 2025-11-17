{% macro get_movie_rating_categories(column_name) %}
    {% set rating_categories = [
        ('Excellent', 9.0),
        ('Good', 7.5),
        ('Average', 6.0),
        ('Poor', 0.0)
    ] %}

    CASE
        {% for category, min_rating in rating_categories %}
            WHEN {{ column_name }} >= {{ min_rating }} THEN '{{ category }}'
        {% endfor %}
        ELSE 'Unrated'
    END AS rating_category
{% endmacro %}



-- function getMovieRatingCategory(rating) {
--   const categories = [
--     { name: "Excellent", min: 9.0 },
--     { name: "Good",      min: 7.5 },
--     { name: "Average",   min: 6.0 },
--     { name: "Poor",      min: 0.0 }
--   ];

--   for (const { name, min } of categories) {
--     if (rating >= min) {
--       return name;
--     }
--   }

--   return "Unrated";
-- }


-- console.log(getMovieRatingCategory(6.2)); // Average
-- console.log(getMovieRatingCategory(3.5)); // Poor
-- console.log(getMovieRatingCategory(-1));  // Unrated