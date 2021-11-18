/*create database*/
CREATE DATABASE db_Biblioteca
ON Primary (
NAME = db_Biblioteca,
FILENAME='C:\SQL\db_Biblioteca.MDF',
SIZE=6MB,
MAXSIZE=15MB,
FILEGROWTH=10% --determina em qual porcentagem o arquivo irá crescer
)

-- instrui que os comandos logo abaixo deveram ser executado nesse banco escolhido
use db_Biblioteca

-- informa o local, taxa de crescimento e tamanho do bd, comando interno sql server
sp_helpdb db_biblioteca

/*Criando tabelas e inserindo dados*/

create table tbl_livro(
ID_livro int identity(1,1) primary key,
Nome_livro varchar(50) not null,
ISBN varchar(30) not null,
ID_autor int not null,
Data_pub datetime not null,
Preco_livro money not null
)

select * from tbl_livro

create table tbl_autores(
ID_autor int primary key,
Nome_autor varchar(50),
Sobrenome_autor varchar(60)
)

insert into tbl_autores(ID_autor, Nome_autor, Sobrenome_autor) values (1, 'Sthepan', 'King')
insert into tbl_autores(ID_autor, Nome_autor, Sobrenome_autor) values (2, 'Fernando', 'Pessoa')
insert into tbl_autores(ID_autor, Nome_autor, Sobrenome_autor) values (3, 'Machado', 'De Assis')

select * from tbl_autores

create table tbl_editoras(
ID_editora int primary key identity,
Nome_editora varchar(50) not null
)

/*inserir dados na tabela*/
insert into tbl_livro(Nome_livro, ISBN, ID_autor, Data_pub, Preco_livro, ano_importacao) values('Fernando Pessoa', 5686, 2, '20/05/1990', 50.10, '1990')
insert into tbl_livro(Nome_livro, ISBN, ID_autor, Data_pub, Preco_livro, ano_importacao) values('Machado de assis', 5687, 3, '01/02/1980', 20.10, '1995')

select * from tbl_livro

/*exluir colunas de uma tabela - drop
alterar tabela - alter
*/

alter table tbl_livro
drop column ID_livro 

/*excluir constraint*/
alter table tabela
drop constraint nome_constraint

alter table tbl_livro
add ano_importacao varchar(50) not null
constraint fk_ID_autor Foreign key (ID_autor)
references tbl_autores

drop table tbl_livro

/*ADD PK*/
alter table clientes
add primary key (ID_cliente)

/*IN E NOT IN*/

--retorna todos que estão no ID 1 e 2
select * from tbl_autores ta
where ta.ID_autor in (1 ,2)

--retorna todos que não estão no ID 1 e 2
select * from tbl_autores ta
where ta.ID_autor not in (1 ,2)

/*CAMPOS CALCULADOS*/
use db_Biblioteca

create table Produtos(
codProduto smallint,
nomeProduto varchar(20),
Preco money,
Quant smallint,
Total as (Preco * Quant)
)

insert into Produtos values(6, 'TV', 19.00, 2)
insert into Produtos values(2, 'DVD', 100.00, 3)
insert into Produtos values(3, 'Cabo HDMI', 30.00, 15)
insert into Produtos values(4, 'Cabo USB', 20.00, 10)
insert into Produtos values(5, 'Laterna', 10.00, 6)
insert into Produtos values(7, 'Mouse', 30.00, 10)
insert into Produtos values(9, 'MousePad', 12.00, 20)

select * from Produtos

--trazer o valor total em produtos
select sum(Total) from Produtos

--EXEC sp_rename 'Produtos', 'tbl_produtos', 'COLUMN';

/*INDICES
permite que as aplicações em bd encontrem os dados mais rapido.
crie indices em tabelas que recebem muitas consultas, pq ela demora pra atualizar
*/

use db_Biblioteca

create index indice_nome_produto
on dbo.Produtos(nomeProduto)

/*CREATE RULE
as regras são configurações que permitem determinar parametros do bd deve se comportar
como limitar faixas de valores em colunas ou especificar valores invalidos para registros.
*/

--criar a regra
create rule rl_preco as @VALOR > 10.00 

--vincular essa regra a minha tabela e coluna
execute sp_bindrule rl_preco, 'Produtos.Preco'

update Produtos
set Preco = 15.00
where codProduto = 5

select * from Produtos

/*Fazer backup do banco*/
backup database db_Biblioteca
to disk = 'C:\SQL\teste.bak';
go

/*CONCATENAÇÃO DE STRINGS
*/

select a.Nome_autor + ' ' + a.Sobrenome_autor as 'Nome Completo' from tbl_autores a

select 'Produto desejado: ' + p.nomeProduto as 'Lista de desejos' from Produtos p
where p.codProduto = 7

/*Colletion - assistir
*/

--para ver as opções de agrupamento
select * from fn_helpcollations()


/*VIEW
é uma tabela virtual baseada no conjunto de resultados de uma consulta sql
*/

use db_Biblioteca

create view vw_livrosAutores
as select tbl_livro.Nome_Livro as livro,
tbl_autores.Nome_autor as Autor
from tbl_livro 
inner join tbl_autores 
on tbl_livro.ID_autor = tbl_autores.ID_autor

select * from vw_livrosAutores

--alterar a view
alter view vw_livrosAutores
as select tbl_livro.Nome_Livro as livro, tbl_livro.Preco_livro as Preco,
tbl_autores.Nome_autor as Autor
from tbl_livro 
inner join tbl_autores 
on tbl_livro.ID_autor = tbl_autores.ID_autor

-- para excluir uma view
drop view vw_livrosAutores

<<<<<<< HEAD
/*Subconsultas(subquery)
é uma declaração embutida em uma consulta externa
*/

--primeiro criar a tabela clientes
create table clientes(
ID_cliente int IDENTITY(1,1) PRIMARY KEY,
Nome_cliente varchar(100) not null,
Sobrenome_cliente varchar(150) not null
)

insert into clientes values('Mônica', 'Torres')
insert into clientes values('Maria', 'Torres')
insert into clientes values('Ana Beatriz', 'Torres')

select * from clientes

use db_Biblioteca

--ex de subconsulta
select (select 'Mônica') as subconsulta

--total de livro por autores, dá pra fazer com join
use db_Biblioteca

select a.Nome_autor
from tbl_livro as l
inner join tbl_autores as a on l.Nome_livro = a.Nome_autor

select * from tbl_livro
select * from tbl_autores
=======
--criar a tabela clientes
create table tbl_clientes(
	ID_clientes int identity(1,1) primary key,
	Nome_cliente varchar(100) not null,
	Sobrenome_cliente varchar(100) not null,
)

use db_Biblioteca
alter table Produtos
add ID_Produto int identity(1,1) primary key

insert into tbl_clientes values('Mônica', 'Torres')
insert into tbl_clientes values('Maria', 'Torres')
insert into tbl_clientes values('Beatriz', 'Torres')

select * from tbl_clientes

/*DECLARAÇÃO DE VAR
uso dentro de um procedimento armazenado
*/

declare @valor int,
		@texto varchar(40),
		@data_nas date,
		@preco money

--atribuir valores
set @valor = 50
set @texto = 'Olá mundo'
set @data_nas = getdate()

select @valor as valor, @texto as texto, @data_nas as 'data de nascimento', @preco as preco

--atribuir valor com select
declare @autor varchar(50)
select @autor = Nome_autor
from tbl_autores
where ID_autor = 2

select @autor as 'Nome do autor'

--conta var
declare @preco money, @quantidade int, @nome varchar(30)
set @quantidade = 5

select @preco = Preco_livro, @nome = Nome_livro
from tbl_livro
where ID_livro = 101

select @nome as 'Nome do Livro',
@preco * @quantidade as 'Preço dos Livros'

/*CONVERSÃO DE DADOS
CAST E CONVERT
*/
use db_Biblioteca

--coverter a coluna do tipo 'Money' para varchar
select 'preço do livro' + Nome_livro + ' é de R$ ' +
cast(Preco_livro as varchar(6)) as item
from tbl_livro
where ID_autor = 2

--convert é usado para converter datas ou usar float/real
select 'preço do livro' + Nome_livro + ' é de R$ ' +
convert(varchar(6), Preco_livro)
from tbl_livro

--trabalhar com datas, convertendo para o padrão 103
select 'a data é: ' + 
convert(varchar(15), Data_pub, 103) as 'Data publicação'
from tbl_livro
where ID_livro = 2

/*CONDICIONAL IF E ELSE*/
--para executar o bloco de código use BEGIN e END

declare @idade float

set @idade = 21

if @idade >= 18
begin
select 'Maior de idade' as Idade
end;

else
begin
select 'Menor de idade' as Idade
end;

--traz todos os produtos com o preço maior que 10,00
use db_Biblioteca

declare @nome varchar(30),
		@precoalto float

select
@nome = (Produtos.nomeProduto),
@precoalto = (Produtos.Preco)
from Produtos
where ID_Produto = 2

if @precoalto >= 10
begin
select 'Produto precisa entrar na black: ' + @nome
end;

else
begin
select 'Produtos preço bom pra black: ' + @nome
end;

/*WHILE*/

declare @valor int
set @valor = 0

while @valor <= 10
begin
print 'numero: ' + cast(@valor as
varchar(2))

set @valor = @valor + 1
end;

-- retorna os ids a partir do 3 dos produtos
use db_Biblioteca

declare @codigo int
set @codigo = 3

while @codigo < 10
	begin
		select ID_Produto as id,nomeProduto as produto,
		Preco as preço
		from Produtos
		where ID_Produto = @codigo 
		set @codigo = @codigo +1
	end;

/*STORED PROCEDURES
lotes de declarações SQL executados como uma subrotina
*/

-- criar procedimento armazenado
use db_Biblioteca
create procedure teste
as 
select 'Mônica Torres' as Nome

--executar procedimento
exec teste

-- procedimento com nome e preço produtos

--criar
create procedure ProdutoValores
as
select p.nomeProduto, p.Preco * p.Quant as 'valor total'
from Produtos p

--executar
exec ProdutoValores

--atualizar
alter procedure ProdutoValores
as
select p.nomeProduto, p.Preco * p.Quant as 'valor total', p.Quant
from Produtos p

--apagar
drop procedure ProdutoValores

--verificar conteudo armazenado na procedure
exec sp_helptext ProdutoValores

--procedimento criptografado
alter procedure ProdutoValores
with encryption
as
select p.nomeProduto, p.Preco * p.Quant as 'valor total', p.Quant
from Produtos p

exec ProdutoValores
exec sp_helptext ProdutoValores