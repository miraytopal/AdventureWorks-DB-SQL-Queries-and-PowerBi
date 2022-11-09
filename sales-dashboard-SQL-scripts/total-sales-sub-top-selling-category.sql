
-- 8. Total Sales Amount of Sub-Categories of Bike Category
-- Bike Category has best sales performance in the categories

-- Sales.SalesOrderDetail and t2 tables are joined to get the total sales information of subcategories of the bike category
SELECT t2.Name, FORMAT((SUM(s.LineTotal)),'#,0.00') AS SubCategoryTotalSales
FROM
	-- t1 and Production.Product tables are joined to get the ProductCategoryID information of the subcategories of the bikes category
	(SELECT t1.ProductSubcategoryID, t1.ProductCategoryID, t1.Name, ProductID
	 FROM 
		 -- Subcategories of bikes category filtered
		 (SELECT ProductSubcategoryID, ProductCategoryID, Name
		  FROM Production.ProductSubcategory
		  -- Bikes category filtered
		  WHERE ProductCategoryID = (SELECT ProductCategoryID
									 FROM Production.ProductCategory 
									 WHERE Name = 'Bikes')) AS t1
	 LEFT JOIN Production.Product AS p
	 ON t1.ProductSubcategoryID = p.ProductSubcategoryID) AS t2
LEFT JOIN Sales.SalesOrderDetail AS s
ON t2.ProductID = s.ProductID
GROUP BY t2.Name;
