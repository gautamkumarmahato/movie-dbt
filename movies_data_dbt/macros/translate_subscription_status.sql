{% macro translate_subscription_status(status_column) %}
    CASE {{ status_column }}
        WHEN 'A' THEN 'Active and Billing'
        WHEN 'P' THEN 'Payment Pending'
        WHEN 'C' THEN 'Cancelled (Still Active)'
        WHEN 'I' THEN 'Inactive'
        ELSE 'Unknown Status: ' || COALESCE({{ status_column }}, 'NULL')
    END
{% endmacro %}



-- function translateSubscriptionStatus(status) {
--   switch (status) {
--     case "A":
--       return "Active and Billing";
--     case "P":
--       return "Payment Pending";
--     case "C":
--       return "Cancelled (Still Active)";
--     case "I":
--       return "Inactive";
--     default:
--       return `Unknown Status: ${status ?? "NULL"}`;
--   }
-- }
