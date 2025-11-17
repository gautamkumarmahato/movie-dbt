{% docs stg_users_description %}

# stg_users

This staging table contains a cleaned and standardized list of users.  
It is sourced from the raw user records and made analytics-ready.

### What this model does
- Cleans and normalizes email addresses  
- Ensures valid `plan_id` relationships  
- Standardizes subscription status values  
- Removes invalid or duplicate user records

### Columns

| Column | Description |
|--------|-------------|
| **user_id** | Unique ID for each user. |
| **email** | Cleaned and normalized user email. |
| **plan_id** | References which subscription plan the user is currently on. |
| **subscription_status** | User account state (`active`, `inactive`, `cancelled`). |

{% enddocs %}
