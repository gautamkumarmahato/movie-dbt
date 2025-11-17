{% docs stg_subscription_plans_description %}

# stg_subscription_plans

This table contains cleaned and standardized subscription plan data.  
Each record represents a plan a user can subscribe to (Basic, Standard, Premium, etc.)

### What this model does
- Normalizes plan names
- Ensures each plan has a unique `plan_id`
- Acts as a dimension table for user subscriptions

### Columns

| Column | Description |
|--------|-------------|
| **plan_id** | Unique identifier for the subscription plan. |
| **plan_name** | Human-readable name of the plan (e.g., Basic, Premium). |

{% enddocs %}
