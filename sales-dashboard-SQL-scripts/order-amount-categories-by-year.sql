
-- 6. Total Order Amount of Categories by Year

-- 6.a. For the Year 2011

-- Sales.SalesOrderDetail and t2 tables are joined to get the order quantity information of products
SELECT t2.ProductCategoryID, 
	   t2.Name, 
	   SUM(OrderQty) AS TotalOrderQuantity
FROM
	 -- Production.ProductCategory and t1 tables are joined to get the ProductCategoryID information of the subcategories
	(SELECT c.ProductCategoryID, 
			c.Name, t1.ProductSubcategoryID, 
			t1.Name AS SubName, 
			t1.ProductID
	 FROM Production.ProductCategory AS c
	 JOIN 
		   -- ProductSubcategoryID and Production.Product tables are joined to get the subcategory information of the categories
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
 -- 2011 filtered
 WHERE DATEPART(yy, s.ModifiedDate) = 2011  
 GROUP BY t2.ProductCategoryID, t2.Name
 ORDER BY t2.ProductCategoryID;


 -- 6.b. For the Year 2012

SELECT t1.ProductCategoryID, 
	   t1.Name, 
	   SUM(OrderQty) AS TotalOrderQuantity
FROM
	(SELECT c.ProductCategoryID, 
			c.Name, t.ProductSubcategoryID, 
			t.Name AS SubName, 
			t.ProductID
	 FROM Production.ProductCategory AS c
	 JOIN (SELECT s.ProductCategoryID, 
				  s.ProductSubcategoryID, 
				  p.ProductID, 
				  p.Name
		   FROM Production.ProductSubcategory AS s
		   JOIN Production.Product AS p
		   ON s.ProductSubcategoryID = p.ProductSubcategoryID) AS t
	  ON c.ProductCategoryID = t.ProductCategoryID) AS t1
 JOIN Sales.SalesOrderDetail AS s
 ON t1.ProductID = s.ProductID
 WHERE DATEPART(yy, s.ModifiedDate) = 2012  
 GROUP BY t1.ProductCategoryID, t1.Name
 ORDER BY t1.ProductCategoryID;


-- 6.c. For the Year 2013

SELECT t1.ProductCategoryID, 
	   t1.Name, 
	   SUM(OrderQty) AS TotalOrderQuantity
FROM
	(SELECT c.ProductCategoryID, 
			c.Name, 
			t.ProductSubcategoryID, 
			t.Name AS SubName, 
			t.ProductID
	 FROM Production.ProductCategory AS c
	 JOIN (SELECT s.ProductCategoryID, 
				  s.ProductSubcategoryID, 
				  p.ProductID, 
				  p.Name
		   FROM Production.ProductSubcategory AS s
		   JOIN Production.Product AS p
		   ON s.ProductSubcategoryID = p.ProductSubcategoryID) AS t
	  ON c.ProductCategoryID = t.ProductCategoryID) AS t1
 JOIN Sales.SalesOrderDetail AS s
 ON t1.ProductID = s.ProductID
 WHERE DATEPART(yy, s.ModifiedDate) = 2013 
 GROUP BY t1.ProductCategoryID, t1.Name
 ORDER BY t1.ProductCategoryID;


 -- 6.d. For the Year 2014

SELECT t1.ProductCategoryID, 
	   t1.Name, 
	   SUM(OrderQty) AS TotalOrderQuantity
FROM
	(SELECT c.ProductCategoryID, 
			c.Name, 
			t.ProductSubcategoryID, 
			t.Name AS SubName, 
			t.ProductID
	 FROM Production.ProductCategory AS c
	 JOIN (SELECT s.ProductCategoryID, s.ProductSubcategoryID, p.ProductID, p.Name
		   FROM Production.ProductSubcategory AS s
		   JOIN Production.Product AS p
		   ON s.ProductSubcategoryID = p.ProductSubcategoryID) AS t
	  ON c.ProductCategoryID = t.ProductCategoryID) AS t1
 JOIN Sales.SalesOrderDetail AS s
 ON t1.ProductID = s.ProductID
 WHERE DATEPART(yy, s.ModifiedDate) = 2014
 GROUP BY t1.ProductCategoryID, t1.Name
 ORDER BY t1.ProductCategoryID;