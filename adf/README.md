# Azure Data Factory

This directory contains Azure Data Factory (ADF) artifacts used to orchestrate
the end-to-end data ingestion process.

## Responsibilities
- Orchestrating initial and incremental data loads
- Copying data from source systems into the data lake
- Managing control flow between ingestion and transformation layers

## Key Concepts Demonstrated
- Parameterized pipelines and datasets
- Incremental loading using watermark pattern
- Stored procedure execution for state management

## Notes
Pipeline definitions may be exported as JSON files for version control
and reproducibility.

