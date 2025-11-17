## The “entry point” — data as it exists in your warehouse.

Defined in schema.yml via sources: blocks.

dbt doesn’t transform here; it just registers tables.

Example:

sources:
  - name: raw_sales_db
    schema: public
    tables:
      - name: users
      - name: orders


Used inside models via:

select * from {{ source('raw_sales_db', 'orders') }}


🎯 Goal: Make raw data accessible in a clean, documented way

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Staging Layer (stg_)

Light cleaning, type casting, renaming columns, and exposing stable names.

One staging model per raw table.

Usually materialized as view (so it’s fast and doesn’t duplicate data).

You might:

Rename snake_case columns

Cast datatypes

Filter out bad data

Add audit timestamps

Example (stg_orders.sql):

select
  order_id,
  user_id,
  order_date::date as order_date,
  payment_method,
  status
from {{ source('raw_sales_db', 'orders') }}


🎯 Goal: Create a “clean layer” that hides raw data messiness.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Intermediate Layer (int_) (optional but powerful)

Combines multiple staging models or performs heavier business logic.

Often used to:

Join different staging models (e.g., orders + users)

Calculate intermediate metrics (e.g., sales per product per month)

Filter down data before building facts

Example (int_order_enriched.sql):

🎯 Goal: Modularize transformations — keeps your fact/dim models simpler.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Mart Layer (dim_ / fct_)

The analytics-ready layer — what business users and BI tools actually query.

Usually split into:

Dimensions (dim_): “who / what / where” → entities like users, products

Facts (fct_): “events / transactions” → things like sales, orders

Often materialized as table or incremental.

🎯 Goal: Produce final, business-friendly tables ready for BI dashboards.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Reporting / Aggregates / KPI Layer (optional)

Sometimes you create one more layer for reporting logic — precomputed summaries for dashboards.

Examples:

daily_sales_summary

monthly_revenue_by_region

customer_lifetime_value

🎯 Goal: Serve directly to Looker, Power BI, Omni, etc.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

┌──────────────────────────┐
│        Raw Data          │
│ (Postgres, Snowflake...) │
└────────────┬─────────────┘
             │
             ▼
┌──────────────────────────┐
│  Source Layer (sources)  │
└────────────┬─────────────┘
             ▼
┌──────────────────────────┐
│  Staging Layer (stg_)    │ ← clean, rename, type cast
└────────────┬─────────────┘
             ▼
┌──────────────────────────┐
│ Intermediate Layer (int_)│ ← join or logic
└────────────┬─────────────┘
             ▼
┌──────────────────────────┐
│ Marts Layer (dim_ / fct_)│ ← facts & dimensions
└────────────┬─────────────┘
             ▼
┌──────────────────────────┐
│ Reporting Layer / KPIs   │
└──────────────────────────┘

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

| Stage        | Example Model                                          | Description              |
| ------------ | ------------------------------------------------------ | ------------------------ |
| Source       | `orders`, `sales`, `products` (raw tables in Postgres) | Unmodeled raw data       |
| Staging      | `stg_orders.sql`, `stg_sales.sql`                      | Clean + standardize      |
| Intermediate | `int_sales_with_users.sql`                             | Join users + sales       |
| Mart         | `dim_users.sql`, `dim_products.sql`, `fct_sales.sql`   | Analytics tables         |
| Reporting    | `daily_sales_summary.sql`                              | Summaries/KPI dashboards |
