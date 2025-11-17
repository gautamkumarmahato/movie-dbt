{% macro safe_string_join(columns_list, delimiter=' ') %}
    
    {% set non_null_columns = [] %}
    
    {% for column in columns_list %}
        {% if column is defined %}
            -- Ensure each part is wrapped in COALESCE
            {% do non_null_columns.append("COALESCE(" ~ column ~ ", '')") %} 
        {% endif %}
    {% endfor %}

    {% if non_null_columns | length > 0 %}
        -- FIX: Join the list of COALESCE expressions using the concatenation operator (||) 
        -- and embed the delimiter string between them.
        {{ non_null_columns | join(" || '" ~ delimiter ~ "' || ") }}
    {% else %}
        NULL
    {% endif %}

{% endmacro %}



-- function safeStringJoin(columns, delimiter = " ") {
--   // Filter out undefined or null columns
--   const validCols = columns.filter(col => col !== undefined && col !== null);

--   if (validCols.length === 0) {
--     return null; // same as your macro returning NULL
--   }

--   // Wrap each column in SQL COALESCE()
--   const coalesced = validCols.map(col => `COALESCE(${col}, '')`);

--   // Join using || and delimiter
--   return coalesced.join(` || '${delimiter}' || `);
-- }
