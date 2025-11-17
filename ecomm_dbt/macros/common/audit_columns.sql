{% macro audit_columns(source_name) -%}
  current_timestamp as loaded_at,
  '{{ source_name }}' as source_name
{%- endmacro %}


-- /**
--  * Adds audit columns (loaded_at, source_name) to each record.
--  * @param {Array<Object>} rows - Array of data objects (like from DB or CSV).
--  * @param {string} sourceName - Name of the source (e.g., 'stg_orders').
--  * @returns {Array<Object>} - New array with audit columns added.
--  */
-- function addAuditColumns(rows, sourceName) {
--   const now = new Date().toISOString(); 
--   return rows.map(row => ({
--     ...row,
--     loaded_at: now,
--     source_name: sourceName
--   }));
-- }