-- models/example/select_users.sql
{{ config(materialized='table') }}

with base_users as (
    select *
    from {{ source('raw', 'users') }}
)

select *
from base_users
