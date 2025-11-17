{% docs stg_movies_description %}

# stg_movies

This table contains standardized movie information used across the warehouse.

### What this model does
- Ensures unique `movie_id`s  
- Standardizes movie titles  
- Cleans durations and ensures non-negative values  
- Prepares data for fact tables like watch history

### Columns

| Column | Description |
|--------|-------------|
| **movie_id** | Unique identifier for the movie. |
| **title** | Clean movie title text. |
| **duration_minutes** | Total runtime of the movie in minutes (must be >= 0). |

{% enddocs %}
