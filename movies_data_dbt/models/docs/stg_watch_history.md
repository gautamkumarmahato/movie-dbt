{% docs stg_watch_history_description %}

# stg_watch_history

This fact table captures movie-watching behavior per profile.

### What this model does
- Cleans raw watch logs  
- Ensures valid links to movies and profiles  
- Removes corrupted or incomplete watch entries  
- Prepares data for engagement, completion rate, and time-watched metrics  

### Columns

| Column | Description |
|--------|-------------|
| **history_id** | Unique identifier for each watch event. |
| **profile_id** | Profile that watched the movie. |
| **movie_id** | Movie that was watched. |

{% enddocs %}
