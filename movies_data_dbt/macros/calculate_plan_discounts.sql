{% macro calculate_plan_discounts(price_column, plan_name_column) %}
    {% set plan_adjustments = [
        ('Basic', 0.95),
        ('Standard', 0.90),
        ('Premium', 0.85)
    ] %}

    CASE
        {% for plan, multiplier in plan_adjustments %}
            WHEN {{ plan_name_column }} = '{{ plan }}' THEN {{ price_column }} * {{ multiplier }}
        {% endfor %}
        ELSE {{ price_column }}
    END
{% endmacro %}



-- function calculatePlanDiscount(price, planName) {
--   const planAdjustments = {
--     Basic: 0.95,
--     Standard: 0.90,
--     Premium: 0.85
--   };

--   const multiplier = planAdjustments[planName] || 1; // default to no discount
--   return price * multiplier;
-- }



-- console.log(calculatePlanDiscount(100, "Basic"));     // 95
-- console.log(calculatePlanDiscount(100, "Standard"));  // 90
-- console.log(calculatePlanDiscount(100, "Premium"));   // 85
-- console.log(calculatePlanDiscount(100, "Unknown"));   // 100 (no discount)
