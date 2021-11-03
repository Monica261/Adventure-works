/*SELF JOIN*/
/*todos os clientes que moram na mesma região*/
SELECT A.ContactName, A.Region, B.ContactName, B.Region
FROM Customers A, Customers B
WHERE A.Region = B.Region

/*nome e data de contratação de todos os funcionarios que foram contratados no  mesmo ano*/
SELECT A.FirstName, A.HireDate, B.FirstName, B.HireDate
FROM Employees A, Employees B
WHERE DATEPART(year, A.HireDate) = DATEPART(year, B.HireDate)

--DESAFIO
/*quais produtos tem o mesmo percentual de desconto*/
SELECT * FROM [Order Details]

SELECT A.ProductID, A.Discount, B.ProductID, A.Discount 
FROM [Order Details] A, [Order Details] B
WHERE A.Discount = B.Discount

/*TIPOS DE DADOS*/
/*
Booleanos, Caractere, Números e Temporais
*/
/*
Booleanos: 1 ou 0;

Caracteres: tamanho fixo - char = permite inserir ate uma qaunt e ocupa todo o espaço reservado
varchar ou nvarchar = permite inserir até uma quant porem só usa o espaço que for preenchido;

Números: TINYINT, SMALLINT, INT, BIGINT, NUMERIC OU DECIMAL;

Temporais: DATE = armazena data no formato aaaa/mm/dd
DATETIME = armarzena data e horas no formato aaaa/mm/dd:hh:mm:ss
DATETIME2 = data e horas com adição de milisegundos no formato aaaa/mm/dd:hh:mm:ssss
SAMLLDATETIME = data e horas respeitando o limite entre '1900-01-01:00:00:00 até 2079-06-06:23:59:59'
TIME = horas, minutos, segundos e milesegundos limite entre '00:00:00.000000 até 23:59:59.999999'
*/

/*CHAVE PRIMARIA E CHAVE ESTRANGEIRA
chave estrangeira é definida em uma tabela quando ela é apenas uma referencia(FK)
*/

