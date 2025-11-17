{% macro is_incremental_where(col_name) %}
  {% if is_incremental() %}
    where {{ col_name }} > (select max({{ col_name }}) from {{ this }})
  {% else %}
    -- full-refresh: no incremental filter
    where true
  {% endif %}
{% endmacro %}



-- /**
--  * Builds a SQL WHERE clause similar to dbt's is_incremental_where macro.
--  * @param {string} colName - The column name to compare (e.g. 'updated_at' or 'id').
--  * @param {boolean} isIncremental - Whether this run is incremental (true) or full-refresh (false).
--  * @param {string} [tableName] - Optional table name for the subquery (defaults to current table alias).
--  * @returns {string} - The SQL WHERE clause.
--  */
-- function buildIncrementalWhere(colName, isIncremental, tableName = 'this_table') {
--   if (isIncremental) {
--     return `WHERE ${colName} > (SELECT MAX(${colName}) FROM ${tableName})`;
--   } else {
--     return `WHERE TRUE -- full-refresh: no incremental filter`;
--   }
-- }

-- // Examples:
-- console.log(buildIncrementalWhere('updated_at', true, 'my_table'));
-- // -> "WHERE updated_at > (SELECT MAX(updated_at) FROM my_table)"

-- console.log(buildIncrementalWhere('created_at', false));
-- // -> "WHERE TRUE -- full-refresh: no incremental filter"
