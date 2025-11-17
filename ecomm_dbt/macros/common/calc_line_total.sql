{% macro calc_line_total(quantity_col, unit_price_col) %}
  ({{ quantity_col }} * {{ unit_price_col }})
{% endmacro %}
