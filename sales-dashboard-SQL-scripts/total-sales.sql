-- SQL SCRIPTS of ADVENTUREWORKS SALES DASHBOARD CHARTS
USE AdventureWorks2019

-- 1. Total Sales Amount

-- Line Total formatted using FORMAT function to desired
SELECT FORMAT(SUM(LineTotal),'#,0.00') AS TotalSales FROM Sales.SalesOrderDetail;