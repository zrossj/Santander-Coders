

DROP TABLE IF EXISTS comp, error_type, error_log, failure, machine, maint, telemetry, machine_model CASCADE;


BEGIN;


CREATE TABLE IF NOT EXISTS machine_model 
(
	id smallserial PRIMARY KEY,
	model varchar(32) NOT NULL,
	CONSTRAINT uk_model UNIQUE(model)
);

      
CREATE TABLE IF NOT EXISTS comp
(
	  id smallserial PRIMARY KEY,
	  comp varchar(20) NOT NULL,
	  CONSTRAINT uk_comp UNIQUE(comp)
);

CREATE TABLE IF NOT EXISTS error_type
(
		id smallserial PRIMARY KEY,
		error_name varchar(32) NOT NULL,
		CONSTRAINT uk_error_name UNIQUE(error_name)
);

CREATE TABLE IF NOT EXISTS machine 
(
	  id int PRIMARY KEY,
	  age int NOT NULL,
	  model_id smallint NOT NULL,
	  CONSTRAINT fk_machine_model FOREIGN KEY(model_id) REFERENCES machine_model(id)
);

CREATE TABLE IF NOT EXISTS telemetry 
(
	  id serial primary key,
	  date timestamp NOT NULL,
	  volt numeric(16, 13) NOT NULL,
	  rotate numeric(16, 13) NOT NULL,
	  pressure numeric(16, 13) NOT NULL,
	  vibration numeric(16, 13) NOT NULL,
	  machine_id int NOT NULL,
	  CONSTRAINT fk_telemetry_machine FOREIGN KEY (machine_id) REFERENCES machine(id)
);

CREATE TABLE IF NOT EXISTS maint 
(
	  id serial primary key,
	  date timestamp,
	  machine_id int NOT NULL,
	  comp_id smallint NOT NULL,
	  CONSTRAINT fk_maint_machine FOREIGN KEY(machine_id) REFERENCES machine(id),
	  CONSTRAINT fk_maint_comp FOREIGN KEY (comp_id) REFERENCES comp(id)

);

CREATE TABLE IF NOT EXISTS failure 
(
	  id serial primary key,
	  date timestamp NOT NULL,
	  machine_id int NOT NULL,
	  comp_id smallint NOT NULL,
	  CONSTRAINT fk_failure_machine FOREIGN KEY (machine_id) REFERENCES machine(id),
	  CONSTRAINT fk_failure_comp FOREIGN KEY (comp_id) REFERENCES comp(id)
);

CREATE TABLE IF NOT EXISTS error_log 
(
	  id serial primary key,
	  date timestamp NOT NULL, 
	  error_id smallint NOT NULL,
	  machine_id int NOT NULL,
	  CONSTRAINT fk_error_log_name FOREIGN KEY(error_id) REFERENCES error_type(id),
	  CONSTRAINT fk_error_log_machine FOREIGN KEY(machine_id) REFERENCES machine(id)
	  
);

END;

