/*
Source table representing car sales data ingested from CSV files.

This table acts as the operational source for Azure Data Factory
initial and incremental loads into the lakehouse.
*/

CREATE TABLE dbo.source_car_data (
    Branch_ID      VARCHAR(50)  NULL,
    Dealer_ID      VARCHAR(50)  NULL,
    Model_ID       VARCHAR(50)  NULL,
    Revenue        BIGINT       NULL,
    Units_Sold     BIGINT       NULL,
    Date_ID        VARCHAR(20)  NULL,
    Day            INT          NULL,
    Month          INT          NULL,
    Year           INT          NULL,
    BranchName     VARCHAR(100) NULL,
    DealerName     VARCHAR(100) NULL,
    Product_Name   VARCHAR(100) NULL
);

-- Notes:
-- 1. This table is intentionally kept denormalized as a source layer.
-- 2. No primary key is enforced at this stage to allow raw ingestion.
-- 3. Incremental logic is handled using a separate watermark table.
