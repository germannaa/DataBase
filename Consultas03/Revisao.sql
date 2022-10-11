// https://www.w3resource.com/mysql-exercises/subquery-exercises/#PracticeOnline

SELECT firstname, lastname, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = "Bull");


