/* ============================================================
   TABLE: pipeline_run_control
   ------------------------------------------------------------
   Purpose:
   - Stores execution-level metadata for ADF pipeline runs
   - Acts as the source of truth for downstream consumers
     (e.g., Silver layer) to identify successful runs
   - Separates operational state from business data state
   ============================================================ */

CREATE TABLE pipeline_run_control (
    run_id          VARCHAR(100) PRIMARY KEY,
    pipeline_name   VARCHAR(100),
    run_status      VARCHAR(20),
    run_start_ts    DATETIME,
    run_end_ts      DATETIME,
    bronze_path     VARCHAR(500)
);

/* ============================================================
   PROCEDURE: sp_insert_pipeline_run
   ------------------------------------------------------------
   Purpose:
   - Logs the STARTED state of an ADF pipeline run
   - Executed at the very beginning of the pipeline
   - Ensures visibility even if the pipeline fails early
   ============================================================ */

CREATE PROCEDURE sp_insert_pipeline_run
    @run_id VARCHAR(100),
    @pipeline_name VARCHAR(100),
    @bronze_path VARCHAR(500)
AS
BEGIN
    INSERT INTO pipeline_run_control (
        run_id,
        pipeline_name,
        run_status,
        run_start_ts,
        bronze_path
    )
    VALUES (
        @run_id,
        @pipeline_name,
        'STARTED',
        GETUTCDATE(),
        @bronze_path
    );

/* ============================================================
   PROCEDURE: sp_update_pipeline_run_failed
   ------------------------------------------------------------
   Purpose:
   - Marks a pipeline run as FAILED
   - Executed only on the failure path in ADF
   - Prevents downstream layers from consuming bad/partial data
   ============================================================ */

CREATE PROCEDURE sp_update_pipeline_run_failed
    @run_id VARCHAR(100)
AS
BEGIN
    UPDATE pipeline_run_control
    SET
        run_status = 'FAILED',
        run_end_ts = GETUTCDATE()
    WHERE run_id = @run_id;
END;

/* ============================================================
   PROCEDURE: sp_update_pipeline_run_success
   ------------------------------------------------------------
   Purpose:
   - Marks a pipeline run as SUCCESS
   - Executed only after Bronze copy completes successfully
   - Enables Silver layer to consume this run deterministically
   ============================================================ */
CREATE PROCEDURE sp_update_pipeline_run_success
    @run_id VARCHAR(100)
AS
BEGIN
    UPDATE pipeline_run_control
    SET
        run_status = 'SUCCESS',
        run_end_ts = GETUTCDATE()
    WHERE run_id = @run_id;
END;
