{% docs stg_profiles_description %}

# stg_profiles

This table contains user profile information.  
Users can have multiple profiles (e.g., in streaming apps like Netflix).

### What this model does
- Validates `user_id` relationships  
- Flags kid-friendly profiles  
- Cleans up invalid or incomplete profiles  

### Columns

| Column | Description |
|--------|-------------|
| **profile_id** | Unique ID for the profile. |
| **user_id** | Links the profile to its user (parent account). |
| **is_kid_profile** | Boolean flag indicating whether the profile is for kids. |

{% enddocs %}
