
-- 2. Total Order Quantity

SELECT FORMAT((SUM(OrderQty)),'#,0.00') AS TotalOrderQuantity FROM Sales.SalesOrderDetail;