--Q1. 

SELECT model, COUNT(model)
FROM failure f
JOIN machine m ON f.machine_id = m.id
JOIN machine_model mm ON mm.id = m.model_id
GROUP BY model
ORDER BY count DESC
LIMIT 1;


--Q2.

SELECT age, count(*) FROM
failure f JOIN
machine m ON m.id= f.machine_id
GROUP BY age;

--Q3. 

SELECT DISTINCT ON (machine_id)
	machine_id,
	comp, 
	count(*)
FROM failure f
JOIN comp c ON c.id = f.comp_id
GROUP BY machine_id, comp ORDER BY machine_id, count DESC;

--Q4.

SELECT model, AVG(age)
FROM machine m JOIN
machine_model mm ON mm.id = m.model_id 
GROUP BY model ORDER BY model;

--Q5.	

SELECT model, error_name, count(*)
FROM error_log el 
JOIN machine m ON el.machine_id = m.id
JOIN machine_model mm ON mm.id = m.model_id
JOIN error_type et on et.id = el.error_id
GROUP BY model, error_name
ORDER BY model, error_name;


