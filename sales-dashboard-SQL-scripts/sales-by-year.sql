
-- 5. Sales Performance by Year

SELECT SUM(LineTotal) AS TotalSales FROM Sales.SalesOrderDetail;
SELECT SUM(OrderQty) AS TotalQuantity FROM Sales.SalesOrderDetail;