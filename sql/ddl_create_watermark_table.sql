
/*
Watermark table used to track incremental loads.

The last_load column stores the latest processed Date_ID
from the source_car_data table.
*/
 CREATE TABLE dbo.water_table (
        last_load VARCHAR(20) NULL
);

 -- Initial watermark seed value
 INSERT INTO dbo.watermark (last_load)
 VALUES ('DT00000');

-- Notes:
-- 1. last_load is stored as VARCHAR to align with source Date_ID datatype.
-- 2. This table maintains state for incremental ADF pipelines.
-- 3. Only a single row is expected in this table.

