INSERT INTO public.machine_model (model)
SELECT distinct model 
FROM machine_temp ORDER BY model;
SELECT model, COUNT(model)
FROM failure f
JOIN machine m ON f.machine_id = m.id
JOIN machine_model mm ON mm.id = m.model_id
GROUP BY model
ORDER BY count DESC
LIMIT 1

INSERT INTO public.comp (comp) 
select distinct failure from failure_temp ORDER BY failure;


INSERT INTO machine 
SELECT machineid, age, id 
FROM machine_temp mt
JOIN machine_model mm ON mm.model = mt.model


INSERT INTO error_type (error_name) 
	SELECT DISTINCT errorid FROM error_temp ORDER BY errorid
	
	
INSERT INTO error_log (date, error_id, machine_id)
	SELECT datetime, id, machineid
	FROM
	error_temp et JOIN
	error_type bb ON bb.error_name = et.errorid
		

INSERT INTO telemetry (date, machine_id, volt, rotate, pressure,vibration)
	SELECT * FROM telemetry_temp
	
	
INSERT INTO maint (date, machine_id, comp_id)
	SELECT datetime, machineid, id
	from maint_temp mt
	JOIN comp c ON mt.comp = c.comp


INSERT INTO failure (date, machine_id, comp_id)	
	SELECT datetime, machineid, id
	FROM failure_temp ft
	JOIN comp c ON c.comp = ft.failure
