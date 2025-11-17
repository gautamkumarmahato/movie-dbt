{% macro is_production_check(column_name) %}
    {% if target.name == 'prod' %}
        WHERE {{ column_name }} >= (CURRENT_DATE - INTERVAL '2 year')
    {% else %}
        WHERE 1=1
    {% endif %}
{% endmacro %}



-- function isProductionCheck(columnName, targetEnv) {
--   if (targetEnv === "prod") {
--     return `WHERE ${columnName} >= (CURRENT_DATE - INTERVAL '2 year')`;
--   } else {
--     return "WHERE 1=1"; // no filtering in non-prod environments
--   }
-- }

-- console.log(isProductionCheck("order_date", "prod"));
-- // WHERE order_date >= (CURRENT_DATE - INTERVAL '2 year')

-- console.log(isProductionCheck("order_date", "dev"));
-- // WHERE 1=1
