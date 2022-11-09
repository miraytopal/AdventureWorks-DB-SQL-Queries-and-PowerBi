
-- 3.Average Money Spent on a Order

SELECT (SUM(LineTotal)/(SUM(OrderQty))) AS AVGSpentMoney FROM Sales.SalesOrderDetail;