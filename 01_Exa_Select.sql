
--1.	Consulta desde el Analizador de Consultas, de la base de datos Northwind, con las tablas Products y Categories, de los siguientes campos:
---	ProductID
---	ProductName
---	CategoryID
---	CategoryName
---	UnitPrice


--a.	Filtre únicamente las categorías 1 y 7

USE Northwind
GO
SELECT ProductID, ProductName, P.CategoryID, CategoryName, UnitPrice FROM Products P
	INNER JOIN (
		    SELECT * FROM Categories
		    )C ON C.CategoryID = P.CategoryID
            	    WHERE P.CategoryID IN (1,7)

					
--b.	Eliminar el filtro anterior y filtre de la categoría 3 a la 6 utilizando BETWEEN.

USE Northwind
GO
SELECT ProductID, ProductName, P.CategoryID, CategoryName, UnitPrice FROM Products P
	INNER JOIN (
		    SELECT * FROM Categories
		    )C ON C.CategoryID = P.CategoryID
			WHERE P.CategoryID BETWEEN 3 AND 6

--c.	Respete el filtro del punto anterior y ordénelo por CategoryID en forma ascendente.

USE Northwind
GO
SELECT ProductID, ProductName, P.CategoryID, CategoryName, UnitPrice FROM Products P
	INNER JOIN (
		    SELECT * FROM Categories
		    )C ON C.CategoryID = P.CategoryID
			WHERE P.CategoryID BETWEEN 3 AND 6 ORDER BY P.CategoryID ASC
