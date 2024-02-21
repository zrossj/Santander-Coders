INSERT INTO public.machine_model (model)
		SELECT distinct model 
		FROM machine_temp ORDER BY model LIMIT 10;


INSERT INTO public.comp (comp) 
	SELECT distinct failure from failure_temp ORDER BY failure LIMIT 10;


INSERT INTO machine 
	SELECT machineid, age, id 
	FROM machine_temp mt
	JOIN machine_model mm ON mm.model = mt.model ORDER BY machineid LIMIT 10;


INSERT INTO error_type (error_name) 
	SELECT DISTINCT errorid FROM error_temp ORDER BY errorid LIMIT 10;
	
	
INSERT INTO error_log (date, error_id, machine_id)
	SELECT datetime, id, machineid
	FROM
	error_temp et JOIN
	error_type bb ON bb.error_name = et.errorid LIMIT 10;
		

INSERT INTO telemetry (date, machine_id, volt, rotate, pressure,vibration)
	SELECT * FROM telemetry_temp LIMIT 10;
	
	
INSERT INTO maint (date, machine_id, comp_id)
	SELECT datetime, machineid, id
	from maint_temp mt
	JOIN comp c ON mt.comp = c.comp LIMIT 10;


INSERT INTO failure (date, machine_id, comp_id)	
	SELECT datetime, machineid, id
	FROM failure_temp ft
	JOIN comp c ON c.comp = ft.failure ORDER BY machineid, datetime LIMIT 10;
