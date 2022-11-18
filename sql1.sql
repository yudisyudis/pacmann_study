USE pacmann;

SELECT * 
FROM employee
WHERE sex = 'M' AND salary > 75000;

SELECT first_name, salary, salary*2 as bonus
FROM employee
order by bonus DESC;

SELECT *
FROM employee
WHERE first_name LIKE 'J%' AND super_id in(100,101) AND salary BETWEEN 50000 AND 100000;