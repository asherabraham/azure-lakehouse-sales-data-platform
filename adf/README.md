# Azure Data Factory (ADF)

This directory contains **Azure Data Factory (ADF)** artifacts responsible for orchestrating the end-to-end data ingestion workflows in the Azure Lakehouse platform.

The pipelines implemented here follow **production-grade ingestion patterns** and integrate with the Medallion Architecture (Bronze–Silver–Gold).

---

## Responsibilities

- Orchestrate **initial (full)** and **incremental** data loads
- Ingest data from source systems into the **Bronze layer** of the data lake
- Manage control flow between ingestion and downstream transformation layers
- Track pipeline execution status for observability and recovery

---

## Key Concepts Demonstrated

- Parameterized pipelines and datasets  
- Incremental data loading using the **watermark pattern**
- Stored procedure execution for watermark and state management
- Idempotent ingestion design
- Environment-agnostic pipeline configuration

---

## ADF Pipelines

### Bronze Ingestion Pipeline

This pipeline is responsible for ingesting source data into the **Bronze layer**.

**Features:**
- Incremental ingestion from **Azure SQL Database**
- Watermark-driven data extraction
- Run-based, idempotent writes to the Bronze layer
- Pipeline execution status tracking:
  - `STARTED`
  - `SUCCESS`
  - `FAILED`




