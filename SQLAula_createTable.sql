/*CREATE TABLE*/

CREATE TABLE canal(
	CanalId int Primary key,
	Nome varchar(150) not null,
	ContagemInscritos int default 0,
	DataCriacao DATETIME not null,
);

SELECT * FROM CANAL

CREATE TABLE Video(
	VideoId int Primary key,
	Nome varchar(150) not null,
	Visualizacoes int default 0,
	Dislikes int default 0,
	Duracao int not null,
	CanalId int foreign key references Canal(CanalId)
);

SELECT * FROM Video

CREATE TABLE Aula(
	id int primary key,
	nome varchar(150)
);

SELECT * FROM Aula

CREATE TABLE Alunos(
	id int not null,
	nome varchar(150),
	idade varchar(25),
	cpf varchar(50),
	primary key(id)
);

INSERT INTO Alunos(id, nome, idade, cpf)
VALUES
(1,'MONICA', '21', '888.888.888-88'),
(2,'MARIA', '18', '999.888.999-88'),
(3,'JOANA', '11', '444.444.444-44');

/*INSERT INTO
inserir dados de outra tabela em uma já existente
*/
SELECT * INTO tabelaNova
FROM Aula

SELECT * FROM tabelaNova

/*UPDATE*/
UPDATE Alunos
SET nome = 'Mônica'
WHERE id = 3

UPDATE Alunos
SET cpf = '365.256.645-66'
WHERE id = 2

SELECT * FROM Alunos


/*DELETE*/
DELETE FROM AULA
WHERE nome = 'sql'/*filtra onde eu quero apagar*/

SELECT * FROM Aula

/*ALTER TABLE
- add, remover ou alterar uma coluna
- setar valores padrões para uma coluna
- add ou remover retrições de coluna
- renomear uma tabela
*/
ALTER TABLE Alunos
add ativos bit

ALTER TABLE Alunos
ALTER COLUMN nome varchar(300) not null

select * from Alunos

/*procedure para alterar o nome de coluna*/
EXEC sp_RENAME 'Aula.nome', 'nomeCanal', 'COLUMN'

SELECT * FROM Aula

/*DROP
funciona somente com tabelas que não são referenciadas
*/

/*TRUNCATE
serve para apagar algum dado da tabela
*/
truncate table Aula.nomeCanal

/*CHECK CONSTRAINT
Syntaxe:

create table carteiraMotorista(
	id int not null,
	nome varchar(255) not null,
	idade int CHECK (idade >= 18)
)
*/

create table carteiraMotorista(
	id int not null,
	nome varchar(255) not null,
	idade int CHECK (idade >= 18)
)

drop table carteiraMotorista

select * from carteiraMotorista

insert into carteiraMotorista (id, nome, idade) values (1, 'João', 20)

/*NOT NULL CONSTRAINT
não permite colocar valores nulos
*/

/*UNIQUE CONSTRAINT
não permite inserir valores repetidos
*/

create table carteiraMotorista(
	id int not null,
	nome varchar(255) not null,
	idade int CHECK (idade >= 18),
	CodigoCNH int not null UNIQUE
);

select * from carteiraMotorista

insert into carteiraMotorista(id, nome, idade, CodigoCNH) values (2, 'caio', 21, 85246)

