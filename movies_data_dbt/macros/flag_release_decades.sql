{% macro flag_release_decades(release_year_column) %}
    
    {% set decades = [2020, 2010, 2000] %}
    
    {% for year in decades %}
        -- Generate a column like: is_released_in_2020_decade
        IF(
            {{ release_year_column }} >= {{ year }}
            AND {{ release_year_column }} < {{ year + 10 }},
            TRUE,
            FALSE
        ) AS is_released_in_{{ year }}_decade,
    {% endfor %}

    -- Pre-2000 flag using IF
    IF(
        {{ release_year_column }} < 2000,
        TRUE,
        FALSE
    ) AS is_released_pre_2000

{% endmacro %}
