SELECT lastName, firstName, jobTitle
FROM employees
WHERE jobTitle = 'sales rep';

SELECT lastName, firstName, jobTitle, officeCode
FROM employees
WHERE jobTitle = 'sales rep' OR officeCode = 1
ORDER BY officeCode, jobTitle;

SELECT officeCode, city, phone, country
FROM offices
WHERE country in ('USA', 'France');


SELECT od.orderNumber, o.orderDate, od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
FROM orders as o, orderdetails as od, products as p
WHERE o.orderNumber = od.orderNumber AND p.productCode = od.productCode
ORDER BY od.orderNumber, od.orderLineNumber;

SELECT  status, count(*)
FROM orders
GROUP BY status;
