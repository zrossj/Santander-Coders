BEGIN;

CREATE TABLE IF NOT EXISTS machine 
(
	  id INT primary key,
	  age int NOT NULL,
	  model char(6) NOT NULL
);

      
CREATE TABLE IF NOT EXISTS comp
(
	  id smallint NOT NULL primary key,
	  comp varchar(20),
	  CONSTRAINT uk_comp_comp UNIQUE(comp)
);


CREATE TABLE IF NOT EXISTS telemetry 
(
	  id serial primary key,
	  date timestamp NOT NULL,
	  volt float NOT NULL,
	  rotate float NOT NULL,
	  pressure float NOT NULL,
	  vibration float NOT NULL,
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
	  comp_id smallint NOT NULL,
	  machine_id int NOT NULL,
	  CONSTRAINT fk_failure_comp FOREIGN KEY (comp_id) REFERENCES comp(id),
	  CONSTRAINT fk_failure_machine FOREIGN KEY (machine_id) REFERENCES machine(id)
);

CREATE TABLE IF NOT EXISTS error_table 
(
	  id serial primary key,
	  date timestamp NOT NULL, 
	  error_type char(6) NOT NULL,
	  machine_id int NOT NULL,
	  CONSTRAINT fk_error_machine FOREIGN KEY(machine_id) REFERENCES machine(id)
);

END;

