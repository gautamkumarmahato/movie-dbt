{% snapshot users_snapshot %}

{{
    config(
        target_schema='snapshots',   
        unique_key='user_id',        
        strategy='check',            

        check_cols=['full_name', 'email', 'phone']
    )
}}

select * from {{ source('public_raw', 'users') }}

{% endsnapshot %}
