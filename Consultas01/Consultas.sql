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

SELECT p.productName, od.quantityOrdered, od.priceEach, pay.paymentDate 
FROM products as p, orderdetails as od, orders as o, customers as c, payments as pay
WHERE p.productCode = od.productCode AND od.orderNumber = o.orderNumber AND o.customerNumber = c.customerNumber AND c.customerNumber = pay.customerNumber
GROUP BY p.productName

SELECT c.customerName, SUM(od.PriceEach * od.quantityOrdered) as ValorTotalCompras, SUM(od.quantityOrdered) as QuantidadeItensComprados
FROM orderdetails as od, orders as o, customers as c 
WHERE od.orderNumber = o.orderNumber AND o.customerNumber = c.customerNumber
GROUP BY  c.customerName


SELECT filial.city, SUM(od.quantityOrdered * od.priceEach) as ValorTotal
FROM offices as filial, employees as emp, customers as c, orders as o, orderdetails as od
WHERE filial.officecode = emp.officeCode AND emp.employeeNumber = c.salesRepEmployeeNumber AND c.customerNumber = o.customerNumber AND o.orderNumber = od.orderNumber
GROUP BY filial.city
order by ValorTotalVendas desc

SELECT filial.city as filial, count(distinct c.customerNumber) as qtdClientes
FROM offices as filial, employees as emp, customers as c, orders as o, orderdetails as od, products as p
WHERE  emp.employeeNumber = c.salesRepEmployeeNumber AND c.customerNumber = o.customerNumber AND o.orderNumber = od.orderNumber
GROUP BY filial.city
ORDER BY qtdClientes

SELECT emp.firstName as NomeVendedor,  count( distinct o.orderNumber) as qtdeVendas
FROM employees as emp, customers as c, orders as o
WHERE emp.employeeNumber = c.salesRepEmployeeNumber AND c.customerNumber = o.customerNumber
GROUP BY NomeVendedor
ORDER BY qtdeVendas desc


SELECT emp.firstName as NomeVendedor,  count( distinct o.orderNumber) as qtdeVendas, sum(od.quantityOrdered * od.priceEach) as ValorTotalVendas
FROM employees as emp, customers as c, orders as o, orderdetails as od
WHERE emp.employeeNumber = c.salesRepEmployeeNumber AND c.customerNumber = o.customerNumber
GROUP BY NomeVendedor
ORDER BY ValorTotalVendas desc





