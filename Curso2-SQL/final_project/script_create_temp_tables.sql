DROP TABLE IF EXISTS error_temp, failure_temp, machine_temp, maint_temp, telemetry_temp ;

BEGIN;

CREATE TABLE error_temp
(
	datetime timestamp,
	machineID int,
	errorID char(8)
);

CREATE TABLE failure_temp
(
	datetime timestamp,
	machineID int,
	failure char(7)
);

CREATE TABLE machine_temp
(
	machineID int,
	model char(8),
	age smallint
);

CREATE TABLE maint_temp
(
	datetime timestamp,
	machineID int,
	comp char(7)
);

CREATE TABLE telemetry_temp
(
	datetime timestamp,
	machineID int,
	volt numeric(16,13),
	rotate numeric(16,13),
	pressure numeric(16,13),
	vibration numeric(16,13)
);

END;


