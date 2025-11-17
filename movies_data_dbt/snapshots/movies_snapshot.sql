{% snapshot movies_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='movie_id',
      strategy='check',
      check_cols=['title', 'description', 'rating', 'duration_minutes'],
      invalidate_hard_deletes=True,
    )
}}

SELECT
    movie_id,
    title,
    description,
    release_year,
    duration_minutes,
    rating
FROM
    {{ source('raw_streaming_db', 'movies') }}

{% endsnapshot %}