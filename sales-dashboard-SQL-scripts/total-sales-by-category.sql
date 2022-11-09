 
--7. Total Sales for Each Product Category

-- Sales.SalesOrderDetail and t2 tables are joined to get the total sales information of categories
SELECT t2.ProductCategoryID, 
	   t2.Name, 
	   FORMAT((SUM(LineTotal)),'#,0.00') AS TotalAmount
FROM
    -- Production.ProductCategory and t1 tables are joined to get the ProductCategoryID information of the subcategories
	(SELECT c.ProductCategoryID, 
			c.Name, 
			t1.ProductSubcategoryID, 
			t1.Name AS SubName, 
			t1.ProductID
	 FROM Production.ProductCategory AS c
	 JOIN 
		  -- Production.ProductSubcategory and Production.Product tables are joined to get information of categories
	      (SELECT s.ProductCategoryID, 
				  s.ProductSubcategoryID, 
				  p.ProductID, 
				  p.Name
		   FROM Production.ProductSubcategory AS s
		   JOIN Production.Product AS p
		   ON s.ProductSubcategoryID = p.ProductSubcategoryID) AS t1
	  ON c.ProductCategoryID = t1.ProductCategoryID) AS t2
 JOIN Sales.SalesOrderDetail AS s
 ON t2.ProductID = s.ProductID
 GROUP BY t2.ProductCategoryID, t2.Name
 ORDER BY t2.ProductCategoryID;
