// https://www.w3resource.com/mysql-exercises/subquery-exercises/#PracticeOnline

SELECT firstname, lastname, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = "Bull");


05.
SELECT 	first_name, last_name, salary	
FROM employees
WHERE salary > (SELECT avg(salary) FROM employees)

06.
SELECT 	first_name, last_name, salary	
FROM employees
WHERE salary = (SELECT min_salary 
				FROM jobs 
				WHERE jobs.JOB_ID = employees.JOB_ID)
        
        
07.
SELECT 	first_name, last_name, salary	
FROM employees
WHERE salary > (SELECT AVG(salary)FROM employees) 
		AND DEPARTMENT_ID = (SELECT DEPARTMENT_ID
							FROM departments
                            WHERE DEPARTMENT_NAME = "IT");


08.
SELECT 	first_name, last_name, salary	
FROM employees
WHERE salary > (SELECT salary
				FROM employees
                WHERE LAST_NAME = "Bell") 
		


09.
SELECT 	first_name, last_name, salary	
FROM employees
WHERE salary in (SELECT MIN_SALARY
				FROM jobs) 
		

OR
SELECT 	first_name, last_name, salary	
FROM employees
WHERE salary = (SELECT min(salary)
				FROM employees) 
		

10.
SELECT 	first_name, last_name, salary	
FROM employees
WHERE salary > (SELECT avg(salary)
				FROM employees) 
		

11.
SELECT 	first_name, last_name, salary
FROM employees
WHERE salary > (SELECT max(salary)
				FROM employees
                WHERE JOB_ID = "SH_CLERK")
ORDER BY salary


12.
SELECT 	first_name, last_name
FROM employees
WHERE EMPLOYEE_ID not in (SELECT MANAGER_ID
						 FROM employees)
		


13.
SELECT 	e.first_name, e.last_name, e.EMPLOYEE_ID, d.DEPARTMENT_NAME
FROM employees as e, departments as d
WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID


14.
SELECT 	first_name, last_name, EMPLOYEE_ID, salary
FROM employees 
WHERE salary > (SELECT avg(SALARY)
				from employees
                WHERE employees.DEPARTMENT_ID = DEPARTMENT_ID)
order by SALARY


15.

