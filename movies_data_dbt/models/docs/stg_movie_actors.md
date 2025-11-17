{% docs stg_movie_actors_description %}

# stg_movie_actors

This link table creates the relationship between movies and actors  
(i.e., which actors appear in which movie).

### What this model does
- Ensures valid `movie_id` and `actor_id` references  
- Deduplicates movie–actor combinations  
- Forms the base for a many-to-many relationship  

### Columns

| Column | Description |
|--------|-------------|
| **movie_id** | Movie the actor appears in. |
| **actor_id** | Actor who appears in the movie. |

{% enddocs %}
