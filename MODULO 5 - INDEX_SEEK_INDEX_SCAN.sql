use TSQLV4;
GO

-- N�o recomendado
SELECT OrderId, Orderdate FROM Sales.Orders
WHERE YEAR(orderdate) = '2014'

--Procurar Solu��o alternativa
SELECT OrderId, Orderdate FROM Sales.Orders
WHERE orderdate >= '20140101' AND orderdate <= '20141231'