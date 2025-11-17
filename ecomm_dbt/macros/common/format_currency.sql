{% macro format_currency(col, currency_symbol='$') %}
  concat('{{ currency_symbol }}', round(cast({{ col }} as numeric), 2)::text)
{% endmacro %}


-- function formatCurrency(value, currencySymbol = '$') {
--   return `${currencySymbol}${num.toFixed(2)}`;
-- }