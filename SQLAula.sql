SELECT * FROM person.person;

SELECT Title FROM person.person;

SELECT * FROM person.EmailAddress;

/*1º Nome e sobrenome de todos os clientes cadastrados no sistema*/
SELECT FirstName, LastName FROM person.person;

/*DISTINCT*/
/*Distinct permite que remova os dados duplicados*/
SELECT DISTINCT FirstName FROM person.person;

/*2º Quantos nomes e sobrenomes unicos tem na tabela*/
SELECT DISTINCT FirstName, LastName FROM person.person;

/*WHERE*/
SELECT * 
FROM person.person
WHERE LastName = 'miller' and FirstName = 'anna'

SELECT * FROM production.Product WHERE color = 'blue' OR color = 'black';

SELECT * FROM production.Product WHERE ListPrice > 1500

SELECT * FROM production.Product WHERE ListPrice > 1500 AND ListPrice < 5000	

/*traz os produtos que não são red*/
SELECT *
FROM production.product 
WHERE color <> 'red'

/*3º a equipe de produção precisa do nome de todas as peças que pesam mais de 500kg mas não
mais que 700kg para inspeção*/
SELECT Name FROM production.Product WHERE Weight > 500 AND Weight < 700

/*4º Relação de todos os empregados que são casados e são assalariados*/
SELECT * FROM HumanResources.Employee WHERE MaritalStatus = 'm' AND SalariedFlag = 'true'

/*5º Usuario Peter está devendo um pagamento, preciso do e-mail dele para enviar uma cobrança*/
SELECT * FROM Person.Person WHERE FirstName = 'Peter' AND LastName = 'Krebs'

SELECT EmailAddress FROM Person.EmailAddress WHERE BusinessEntityID = 26

/*COUNT*/
/*Traz o nº de todas as colunas da tabela*/
SELECT count(*) FROM Person.Person

/*Caso eu queira a contagem especifica de algum campo*/
SELECT COUNT(Title) FROM Person.Person

/*Contagem especifica de uma coluna que não inclua os valores nulos*/
SELECT COUNT(DISTINCT FirstName) FROM Person.Person

/*6º Quantos produtos temos cadastrados em nossa tabela de produtos*/
SELECT COUNT (*) FROM Production.Product

/*7º Quantos tamanhos de produtos tem cadastrado na tabela*/
SELECT COUNT (Size) FROM Production.Product

/*TOP*/
/*Traz a quantidade que eu defino*/
SELECT TOP 10 * FROM Person.Person

/*ORDER BY*/
/*Permite ordenar os resultados de alguma coluna em ordem ASC ou DESC*/
SELECT * FROM  Person.Person ORDER BY FirstName ASC 

/*É possivel filtrar por duas colunas*/
SELECT * FROM Person.Person ORDER BY FirstName DESC, LastName ASC

/*Filtrar somente pelas colunas*/
SELECT FirstName, LastName FROM Person.Person ORDER BY FirstName ASC, LastName ASC

/*8º Ordenar o ProductID dos 10 produtos mais caros cadastrados no sistema, listando
do mais caro para o mais barato*/
SELECT TOP 10 ProductID, ListPrice FROM Production.Product ORDER BY ListPrice DESC 

/*9º Obter o nome e nº dos produtos que tem o ProductID entre 1 e 4*/
SELECT TOP 4 Name, ProductNumber FROM Production.Product ORDER BY ProductID

/*BETWEEN*/
/*É usado para encontrar valor entre valor minimo e valor máximo*/
SELECT ListPrice FROM Production.Product WHERE ListPrice BETWEEN 1000 AND 1500

/*Quando eu não quero de um determinado valor a outro, colocar o Not*/
SELECT ListPrice FROM Production.Product WHERE ListPrice NOT BETWEEN 1000 AND 1500

/*É possivel fazer isso com datas*/
SELECT HireDate FROM HumanResources.Employee WHERE HireDate BETWEEN '2005/01/01' AND '2010/01/01'

/*IN*/
/*	O IN é utilizado junto com o WHERE para verificar se um valor correponde com qualquer valor
passado na lista de valores. IN é mais rápido
*/
SELECT * FROM Person.Person WHERE BusinessEntityID IN (2, 7, 13)

/*Posso utilizar o NOT que retornará o oposto*/
SELECT * FROM Person.Person WHERE BusinessEntityID NOT IN (2, 7, 13)

/*LIKE*/
/*Serve para encontrar algo que não lembre o nome*/
SELECT FirstName FROM Person.Person WHERE FirstName like 'An%'

/*Quando você não tiver ctza do inicio, pode usar assim*/
SELECT FirstName FROM Person.Person WHERE FirstName like '%te'

/*Quando você não tiver ctza do inicio e nem do final, pode usar assim*/
SELECT FirstName FROM Person.Person WHERE FirstName like '%ni%'

/*10º Quantos produtos tem cadastrado no sistema que custa mais de 1500 dolares*/
SELECT COUNT (*) ListPrice FROM Production.Product WHERE ListPrice > 1500

/*11º Quantas pessoas temos com o sobrenome que inicia com a letra P*/
SELECT COUNT (LastName) FROM Person.Person WHERE LastName like 'P%'

/*12º Em quantas cidades únicas estão cadastrados nossos clientes*/
SELECT COUNT(DISTINCT(City)) FROM Person.Address 

/*13º Quais cidades únicas temos cadastradas em nosso sistema*/
SELECT DISTINCT(City) FROM Person.Address 

/*14º Quantos produtos red tem o preço entre 500 a 1000 dolares*/
SELECT COUNT(*) FROM Production.Product WHERE ListPrice BETWEEN 500 AND 1000 AND Color = 'red'

/*15º Quantos produtos cadastrados tem a palavra 'road' no nome deles*/
SELECT COUNT(Name) FROM Production.Product WHERE Name LIKE '%road%'

/*MIN, MAX, SUM E AVG*/
/*funções de agragação , agregam ou combinam dados de uma tabela em 1 resultado só*/

/*SUM*/
/*retorna o valor geral total de todas as vendas*/
SELECT TOP 10 SUM(lineTotal) AS 'Soma' FROM Sales.SalesOrderDetail

/*valor max cadastrado*/
SELECT TOP 10 MAX(lineTotal) AS 'Soma' FROM Sales.SalesOrderDetail

/*para obter a média*/
SELECT TOP 10 AVG(lineTotal) AS 'Soma' FROM Sales.SalesOrderDetail

/*GROUP BY*/
/*Divide o resultado da pesquisa em grupos*/
SELECT ProductID, COUNT(ProductID) AS 'contagem'
FROM Sales.SalesOrderDetail
GROUP BY ProductID

/*Caso eu queira saber quantos nomes de cada nome temos cadastrados em nosso BD*/
SELECT FirstName, COUNT(FirstName) 
FROM Person.Person 
WHERE FirstName  = 'monica' /*se colocar WHERE traz só o Monica*/
GROUP BY FirstName 
ORDER BY FirstName ASC /*se colocar ORDER BY posso definir ASC OU DESC*/

/*Média de preço por cor para os produtos prata*/
SELECT Color, AVG(ListPrice) AS "PREÇO"
FROM Production.Product
WHERE Color = 'silver'
GROUP BY Color

/*16º Quantas pessoas tem o middleaname agrupadas por middleaname*/
SELECT MiddleName, COUNT(FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY MiddleName

/*17º Saber em média qual é a quantidade que cada produto é vendido na loja*/
SELECT ProductID, AVG(OrderQty)AS "QUANTIDADE"
FROM Sales.SalesOrderDetail
GROUP BY ProductID

/*18º Quais foram as 10 vendas que no total tiveram os maiores valores 
de venda por produto de maior valor para o menor*/
SELECT TOP 10 ProductID, SUM(LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC

/*19º Saber quantos produtos e qual a quantidade média de produtos temos
cadastrados nas nossas ordens de serviço, agrupadas por ProductID*/
SELECT ProductID, COUNT(ProductID),
AVG(OrderQty)
FROM Production.WorkOrder
GROUP BY ProductID

/*HAVING*/
/*é usado em junção com o GROUP BY para filtrar resultados de um argumento*/

/*vamos supor que queremos saber quais nomes no sistema tem uma ocorrencia
maior que 10 vezes*/
SELECT FirstName, COUNT(FirstName)
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

/*Queremos saber quais os produtos que no total de vendas estão entre 
162K a 500K*/
SELECT TOP 10 * FROM Sales.SalesOrderDetail

SELECT ProductID, SUM(lineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 162000 AND 500000

/*Provincias com o maior nº de cadastrados no sistena, então é preciso encontrar
quais provincias estão registradas no bd mais que 1000 vezes*/
SELECT StateProvinceID, COUNT(StateProvinceID)
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000

/**/
SELECT ProductID, AVG(LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING  AVG(LineTotal) < 1000000

/*AS*/
/*Serve para dar apelido as colunas*/
SELECT TOP 10 AVG(ListPrice) AS "MÉDIA DE PREÇOS"
FROM Production.Product

/*1º encontrar o firstname e o lastname*/
SELECT FirstName AS "NOME", LastName AS "SOBRENOME"
FROM Person.Person

/*2º productnumber da tabela production.prosuct "CÓDIGO DO PRODUTO"*/
SELECT TOP 10 ProductNumber AS "CÓDIGO DO PRODUTO"
FROM Production.Product

/*3º unitprice para "PREÇO UNITARIO"*/
SELECT UnitPrice AS "PREÇO UNITARIO"
FROM Sales.SalesOrderDetail

/*INNER JOIN*/
/*juntar os dados de duas tabelas*/
SELECT TOP 10 * FROM Person.Person

SELECT TOP 10 * FROM Person.EmailAddress

SELECT p.BusinessEntityID, p.FirstName, p.LastName, pe.EmailAddress
FROM Person.Person AS p
INNER JOIN Person.EmailAddress pe ON p.BusinessEntityID = pe.BusinessEntityID

/*Trazer os nomes dos produtos e as informações de suas subcategorias*/
-- ListPrice, Nome do produto, nome da subcategoria

SELECT TOP 10 * FROM Production.Product

SELECT TOP 10 * FROM Production.ProductSubcategory

SELECT a.Name, a.ListPrice, b.Name
FROM Production.Product a
INNER JOIN Production.ProductSubcategory b ON a.ProductSubcategoryID = b.ProductSubcategoryID

/*é possivel juntar todas as colunas que tem o ID igual*/
SELECT TOP 10 * FROM Person.BusinessEntityAddress ba
INNER JOIN Person.Address pa ON pa.AddressID = ba.AddressID

/**/

SELECT TOP 10 * FROM Person.PhoneNumberType

SELECT TOP 10 * FROM Person.PersonPhone

SELECT M.Name, N.PhoneNumber, N.PhoneNumberTypeID, N.BusinessEntityID
FROM Person.PhoneNumberType M
INNER JOIN Person.PersonPhone N ON M.PhoneNumberTypeID = N.PhoneNumberTypeID

/*INNER JOIN
retorna apenas os resultados que existe tanto na tabela A como na B(a interceção)
*/

SELECT M.Name, N.PhoneNumber, N.PhoneNumberTypeID, N.BusinessEntityID
FROM Person.PhoneNumberType M
INNER JOIN Person.PersonPhone N ON M.PhoneNumberTypeID = N.PhoneNumberTypeID

/*FULL OUTER JOIN
retorna um conjunto de todos os registros correspondentes na tableaA
e tabelaB quando são iguais, se não forem iguais retorna NULL
*/
SELECT * FROM Person.AddressType A
FULL OUTER JOIN Person.AddresS B
ON A.rowguid = B.rowguid

/*LEFT OUTER JOIN
retorna um conjunto de todos os registros da tabelaA  e os registros correspondentes
na tabelaB 
*/
SELECT * FROM Person.AddressType A
LEFT JOIN Person.AddresS B
ON A.rowguid = B.rowguid

/*quais pessoas tem um cartão de crédito registrado*/
SELECT * FROM  Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID

-- INNER JOIN: 19.118
-- LEFT JOIN: 19.972
SELECT 19.972 - 19.118 

/*para extrair info das pessoas que não tem cc registrado*/
SELECT * FROM  Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL

/*UNION
combina dois selects em um resultado, é utilizado em tabelas que possuem
alguma incosistencia
*/

SELECT FirstName, Title
FROM Person.Person
WHERE Title = 'Mr.'

UNION

SELECT FirstName, Title
FROM Person.Person
WHERE MiddleName = 'A'

/*UNION ALL
junta as infos inclusive dados duplicados
*/

/*DATEPART 
é uma função que permite extrair dados de coluna do tipo data
*/

/*meses que foram feito os pedido*/
SELECT SalesOrderID, DATEPART(month, OrderDate) AS MES
FROM Sales.SalesOrderHeader

SELECT AVG(TotalDue), DATEPART(YEAR, OrderDate) AS ANO
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(YEAR, OrderDate)
ORDER BY ANO ASC

/*encontrar outra tabela no bd e extrair mês e ano usando o DATEPART*/
SELECT AVG(TotalDue), DATEPART(YEAR, OrderDate) AS ANO, DATEPART(MONTH, OrderDate) AS MES
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(YEAR, OrderDate), DATEPART(MONTH, OrderDate) 
ORDER BY ANO ASC

/*OPERAÇÕES EM STRING*/

SELECT CONCAT(FirstName, ' ', LastName)
FROM Person.Person

/*deixar tudo em maiusculo*/
SELECT UPPER(FirstName)
FROM Person.Person

/*deixar tudo em minusculo*/
SELECT LOWER(FirstName)
FROM Person.Person

/*contar quantos caracteres uma palavra tem*/
SELECT DISTINCT(FirstName), LEN(FirstName) AS QTO 
FROM Person.Person
WHERE FirstName = 'monica'

/*posso extrair a quant de letras que eu quiser*/
SELECT FirstName, SUBSTRING(FirstName, 1, 3)
FROM Person.Person

/*serve para substituir por outra coisa*/
SELECT productNumber, REPLACE(ProductNumber, '-', 'xxxx')
FROM Production.Product

/*FUNÇÕES MATEMATICAS
é possivel fazer as operações matematicas como: + - * /
*/

SELECT UnitPrice + LineTotal
FROM Sales.SalesOrderDetail

SELECT UnitPrice - LineTotal
FROM Sales.SalesOrderDetail

SELECT UnitPrice * LineTotal
FROM Sales.SalesOrderDetail

SELECT UnitPrice / LineTotal
FROM Sales.SalesOrderDetail

/*pegar a média*/
SELECT AVG(LineTotal)
FROM Sales.SalesOrderDetail

/*pegar a soma*/
SELECT SUM(LineTotal)
FROM Sales.SalesOrderDetail

/*pegar o valor minimo*/
SELECT MIN(LineTotal)
FROM Sales.SalesOrderDetail

/*pegar o valor maximo*/
SELECT MAX(LineTotal)
FROM Sales.SalesOrderDetail

/*arrendondar passando parametro*/
SELECT LineTotal, ROUND(LineTotal, 2)
FROM Sales.SalesOrderDetail

/*pegar a raiz quadrada*/
SELECT LineTotal, SQRT(LineTotal)
FROM Sales.SalesOrderDetail

/*arredonda*/
SELECT LineTotal, FLOOR(LineTotal)
FROM Sales.SalesOrderDetail

-- FUNÇÕES MATEMATICAS: https://docs.microsoft.com/pt-br/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver15

/*SUBQUERY
é basicamente um SELECT dentro de outro SELECT
*/

/*montar um relatorio de todos os produtos cadastrados que tem preço de venda acima de média*/
SELECT *
FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)

/*trazer o nome dos usuarios que tem um cargo de design engineer*/
SELECT *
FROM Person.Person

SELECT JobTitle
FROM HumanResources.Employee

SELECT FirstName
FROM Person.Person
WHERE BusinessEntityID IN(
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer')

/*posso fazer essa mesma questão com o INNER JOIN*/
SELECT P.FirstName
FROM Person.Person P
INNER JOIN HumanResources.Employee E ON P.BusinessEntityID = E.BusinessEntityID
AND E.JobTitle = 'Design Engineer'

/*encontrar todos os endereços que estão no estado de 'Alberta', todas as infos*/
SELECT * FROM Person.Address

SELECT * FROM Person.StateProvince

SELECT TOP 10 *
FROM Person.Address 
WHERE StateProvinceID IN (
SELECT StateProvinceID FROM Person.StateProvince
WHERE Name = 'Alberta'
)

/*VIEW
trazer infos simplificadas
*/
CREATE VIEW [Pessoas simplificando] AS
SELECT FirstName, MiddleName, LastName
FROM Person.Person
WHERE Title = 'Ms.'

SELECT * FROM [Pessoas simplificando]

