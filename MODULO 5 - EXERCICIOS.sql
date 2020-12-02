/*
O Departamento de Marketing est� trabalhando em novas campanhas de divulga��o, e precisar de informa��es para melhora-las. Com isso foi solicitado a voc� a constru��o de um relat�rio 
com as seguintes informa��es: As vendas realizadas no �ltimo trimestre de 2014 (Out � Dez) com os campos: Pa�s, Cidade, Data do Pedido, Total da Compra (UnitPrice * Qty) sem considerar o desconto. 

Ap�s voc� entregar o relat�rio para o Departamento de Marketing, foi detectado a necessidade de visualizar os dados de forma ordenada: Do maior valor total para o menor valor total (Descendente)

O Departamento de Vendas, tamb�m, solicitou a voc� um relat�rio com os �ltimos pedidos realizados com o top 10% dos produtos mais caros sendo vendidos

Lembra do relat�rio para a equipe de Marketing? Ent�o... Como a listagem � muito longa foi solicitando a inclus�o de uma pagina��o na consulta, na qual dever� permitir a exibi��o de 20 linhas por p�gina. 
*/
--1, 2
SELECT O.shipcountry AS [Pa�s], O.shipcity AS [Cidade], O.orderdate as [Data Pedido], (OD.unitprice * od.qty) AS [Total da Compra] 
FROM Sales.Orders AS O INNER JOIN Sales.OrderDetails AS OD ON O.orderid = OD.orderid
WHERE O.orderdate >= '20141001' AND O.orderdate < '20150101'
ORDER BY [Total da Compra] DESC;

--3
SELECT TOP(10) PERCENT WITH TIES * FROM Sales.Orders AS O INNER JOIN
              Sales.OrderDetails AS OD ON O.orderid = OD.orderid INNER JOIN 
              Production.Products AS P ON P.productid = OD.productid
ORDER BY P.unitprice DESC, O.orderdate DESC


--4
DECLARE @pagenum  AS BIGINT = 1
       ,@pagesize AS BIGINT = 20

SELECT O.shipcountry AS [Pa�s], O.shipcity AS [Cidade], O.orderdate as [Data Pedido], (OD.unitprice * od.qty) AS [Total da Compra] FROM Sales.Orders AS O INNER JOIN Sales.OrderDetails AS OD ON O.orderid = OD.orderid
WHERE O.orderdate >= '20141001' AND O.orderdate < '20150101'
ORDER BY [Total da Compra] DESC
OFFSET (@pagenum - 1) * @pagesize ROW FETCH FIRST @pagesize ROW ONLY;

