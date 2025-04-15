# Airbnb Analytics Project with dbt + Snowflake

This project demonstrates an end-to-end **data analytics engineering pipeline** using **dbt** and **Snowflake** to transform Airbnb data into trusted, analytics-ready datasets. It follows modern data engineering practices including modular SQL, reusable macros, automated testing, and clean model structuring — making it ideal for integration into BI tools like Tableau.

---

## Tools & Technologies

| Tool       | Purpose                                 |
|------------|------------------------------------------|
| **dbt**    | Data transformation, testing, lineage    |
| **Snowflake** | Cloud data warehouse for raw and modeled data |
| **Jinja (macros)** | Reusable SQL logic & testing helpers  |
| **Tableau** | For visualization of mart-level models |
| **Git/GitHub** | Version control and collaboration      |

---

## Data Source

This project uses publicly available **Airbnb datasets for Austin, TX**, originally provided by [Inside Airbnb](http://insideairbnb.com/get-the-data.html). The raw data includes:

- `listings.csv`: Property and host details, pricing, availability
- `calendar.csv`: Daily price and availability for listings
- `reviews.csv`: Guest reviews and reviewer metadata

> The data was **preloaded into Snowflake (schema: RAW_DATA)** for modeling with dbt.

---

## Project Goals

- **Clean and standardize raw Airbnb data** from multiple sources
- **Test data quality** using built-in and custom dbt tests
- **Create mart models** to support KPI reporting and dashboards
- **Build reusable macros** for maintainable, scalable code
- **Enable analytics** for pricing, availability, and guest reviews



---

## Key Features

###  Staging Models
- `stg_listings`: Cleans pricing, room types, and text data
- `stg_calendar`: Handles date, availability, and price cleaning
- `stg_reviews`: Extracts structured feedback and dates

###  Mart Models
- `mart_listing_summary`: Listing-level KPIs for dashboards
- `mart_calendar_metrics`: Monthly pricing and availability trends
- `mart_review_insights`: Review volume and recency metrics

###  Macros & Testing
- `safe_sum`: Null-safe aggregate logic
- `positive_value`: Ensures numeric fields (like price) are valid
- `no_null_text`: Checks for missing review/comment data
- Schema-level tests: `not_null`, `unique`, `custom macros`

---

## How to Run Locally

>  First, activate your virtual environment and install dbt-snowflake:
```bash
python3 -m venv venv
source venv/bin/activate
pip install dbt-snowflake
```
Then run dbt commands:
```bash
dbt debug                # Ensure Snowflake connection is working
dbt run                  # Build models in Snowflake
dbt test                 # Run data tests
dbt docs generate && dbt docs serve  # View interactive docs
```
Make sure your ~/.dbt/profiles.yml is configured to point to your Snowflake account (DB: Database_name, SCHEMA: schema_name).
