# Databricks Notebooks

This folder contains Databricks notebooks responsible for transforming
and modeling data within the lakehouse.

## Typical Notebook Flow
1. Read raw data from the Bronze layer
2. Clean, standardize, and enrich data for the Silver layer
3. Build Gold layer fact and dimension tables
4. Apply Delta Lake MERGE logic for upserts (SCD Type 1)

## Notes
Notebooks are written in PySpark and are designed to be modular
and reusable across datasets.
