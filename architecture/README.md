# Azure Data Engineering Project – Architecture

## Overview
This project implements an **end-to-end Azure Data Engineering Lakehouse** using the **Medallion Architecture (Bronze–Silver–Gold)**.  
It demonstrates how raw transactional data is ingested, transformed incrementally, governed, and finally modeled into analytics-ready datasets using modern Azure services.

The architecture is designed to be:
- Production-aligned
- Incremental (CDC-based)
- Scalable
- Governed using Unity Catalog
- Suitable for interview and portfolio showcase

---

## High-Level Architecture Diagram

![Azure Lakehouse Architecture](./architecture/azure_lakehouse_architecture.png)

---

## Architecture Components

### 1. Data Sources
- **GitHub (CSV files)**  
  Used to simulate external/raw data sources.
- **Azure SQL Database**  
  Acts as a transactional source system storing structured sales data.

---

### 2. Ingestion & Orchestration
- **Azure Data Factory (ADF)**
  - Orchestrates data movement
  - Handles **initial load** and **incremental loads**
  - Uses parameterized pipelines
  - Implements watermark-based CDC logic
  - Loads data into the Bronze layer

---

### 3. Storage Layer (ADLS Gen2)
Data is stored in Azure Data Lake Storage Gen2, organized using the Medallion pattern:

#### 🥉 Bronze Layer
- Raw, append-only data
- Incrementally ingested from Azure SQL
- Stored in **Parquet** format
- No business transformations

#### 🥈 Silver Layer
- Cleaned and standardized data
- Data type corrections
- Deduplication
- Business rules applied
- Managed using **Delta Lake**

#### 🥇 Gold Layer
- Analytics-ready datasets
- Star schema implementation:
  - Fact tables
  - Dimension tables
- Handles **Slowly Changing Dimensions (SCD Type 1)**
- Optimized for BI consumption

---

### 4. Processing Layer
- **Azure Databricks**
  - Spark-based transformations
  - Delta Lake operations
  - Incremental MERGE logic
  - Surrogate key generation
  - Fact–dimension modeling

---

### 5. Governance & Security
- **Unity Catalog**
  - Centralized data governance
  - Catalogs, schemas, and tables
  - Access control & permissions
  - Data lineage and auditing

---

### 6. Consumption Layer
- **Power BI (optional)**
  - Connects to Gold layer
  - Used by analysts for reporting and dashboards

---

## Data Flow Summary

1. CSV data hosted on GitHub
2. Loaded into Azure SQL Database (source preparation)
3. Azure Data Factory:
   - Detects new data using watermarks
   - Loads incremental data into Bronze layer
4. Azure Databricks:
   - Transforms Bronze → Silver
   - Models Silver → Gold (Star Schema)
5. Unity Catalog enforces governance
6. Gold layer consumed by BI tools

---

## Key Design Highlights

- Parameterized ADF pipelines (production-ready)
- Incremental loading using watermark tables
- Delta Lake for ACID compliance and time travel
- Star schema modeling using Spark
- Unity Catalog for enterprise-grade governance
- Clear separation of raw, refined, and curated data

---

## Why This Architecture Matters
This project reflects **real-world Azure Data Engineering practices** and demonstrates skills expected from a mid-level to senior Data Engineer, including:
- Lakehouse design
- Incremental ingestion
- Data modeling
- Cloud-native governance
- Performance-aware transformations

---

## Folder Reference
