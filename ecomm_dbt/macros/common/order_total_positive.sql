{% test order_total_positive(model) %}
-- Custom test: fail if any row in the model has total_amount <= 0 or NULL
select *
from {{ model }}
where total_amount IS NULL OR total_amount <= 0
{% endtest %}



-- /**
--  * Validates that all rows in a dataset have a positive total_amount.
--  * Returns an array of failed rows (like dbt test would).
--  * @param {Array<Object>} rows - Array of row objects from your model/table.
--  * @returns {Array<Object>} - Rows that fail the test.
--  */
-- function testOrderTotalPositive(rows) {
--   return rows.filter(row => row.total_amount == null || row.total_amount <= 0);
-- }
