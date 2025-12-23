/*
Watermark table used to track incremental loads
for Azure Data Factory pipelines.

The last_load column stores the maximum processed
Date_ID value from the source table.
*/

CREATE PROCEDURE UpdateWatermarkTable
    @last_load VARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;

        UPDATE water_table
        SET last_load = @last_load;
    END;

-- Notes:
-- 1. Only one row is expected in this table.
-- 2. last_load datatype aligns with source Date_ID (VARCHAR).
-- 3. Enables idempotent incremental ingestion.
