-- Script to feed the 'temp' tables;

\COPY error_temp FROM 'PdM_errors.csv' WITH DELIMITER ',' HEADER;

\COPY failure_temp FROM 'PdM_failures.csv' WITH DELIMITER ',' HEADER;

\COPY machine_temp FROM 'PdM_machines.csv' WITH DELIMITER ',' HEADER;

\COPY maint_temp FROM 'PdM_maint.csv' WITH DELIMITER ',' HEADER;

\COPY telemetry_temp FROM 'PdM_telemetry.csv' WITH DELIMITER ',' HEADER;
