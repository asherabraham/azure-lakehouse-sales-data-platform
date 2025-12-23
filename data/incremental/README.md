# Incremental Load Data

This folder contains sample files representing incremental data changes
arriving after the initial load.

## Usage
- Used to demonstrate watermark-based incremental ingestion
- Contains records with higher date or ID values than the previous load

## Key Concept
Only new or changed records beyond the stored watermark are processed
during incremental pipeline runs.
