
-- 4- Total Sales in the Second Quarter of Each Year
-- Second Quarter includes the 4th, 5th and 6th months of the year

-- 4.a For the Year 2011
SELECT FORMAT(SUM(t.LineTotal),'#,0.00') AS SecondQuarterTotalSales
-- "CONVERT" function used to convert ModifiedDate column to the format we want (date format only)
-- After that the char converted to the desired format(dd-mm-yy) using 105 code
FROM (SELECT ProductID, 
			 LineTotal, 
			 CONVERT(VARCHAR(10), ModifiedDate, 105) AS Date 
	  FROM Sales.SalesOrderDetail) AS t 
-- for filtering 4th, 5th and 6th months of the year (Second Quarter)
WHERE t.Date LIKE ('%[4-6]-2011');

-- 4.b For the Year 2012
SELECT FORMAT(SUM(t.LineTotal),'#,0.00') AS SecondQuarterTotalSales
FROM (SELECT ProductID, 
			 LineTotal, 
			 CONVERT(VARCHAR(10), ModifiedDate, 105) AS Date 
	 FROM Sales.SalesOrderDetail) AS t 
WHERE t.Date LIKE ('%[4-6]-2012');

-- 4.c For the Year 2013
SELECT FORMAT(SUM(t.LineTotal),'#,0.00') AS SecondQuarterTotalSales
FROM (SELECT ProductID, 
			 LineTotal, 
			 CONVERT(VARCHAR(10), ModifiedDate, 105) AS Date 
	  FROM Sales.SalesOrderDetail) AS t 
WHERE t.Date LIKE ('%[4-6]-2013');

-- 4.d For the Year 2014
SELECT FORMAT(SUM(t.LineTotal),'#,0.00') AS SecondQuarterTotalSales
FROM (SELECT ProductID, 
			 LineTotal, 
			 CONVERT(VARCHAR(10), ModifiedDate, 105) AS Date 
	  FROM Sales.SalesOrderDetail) AS t 
WHERE t.Date LIKE ('%[4-6]-2014');
