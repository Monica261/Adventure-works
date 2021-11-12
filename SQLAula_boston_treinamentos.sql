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
ID_livro int primary key identity,
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

select * from tbl_autores

create table tbl_editoras(
ID_editora int primary key identity,
Nome_editora varchar(50) not null
)

/*inserir dados na tabela*/
insert into tbl_livro(Nome_livro, ISBN, ID_autor, Data_pub, Preco_livro, ano_importacao) values('Fernando Pessoa', 5686, 2, '20/05/1990', 50.10, '1990')

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

/*add pk*/
alter table clientes
add primary key (ID_cliente)

/*in e not in*/

--retorna todos que estão no ID 1 e 2
select * from tbl_autores ta
where ta.ID_autor in (1 ,2)

--retorna todos que não estão no ID 1 e 2
select * from tbl_autores ta
where ta.ID_autor not in (1 ,2)

/*campos calculados*/
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

select * from Produtos

--trazer o valor total em produtos
select sum(Total) from Produtos

EXEC sp_rename 'Produtos', 'tbl_produtos', 'COLUMN';

/*Indices
permite que as aplicações em bd encontrem os dados mais rapido.
crie indices em tabelas que recebem muitas consultas, pq ela demora pra atualizar
*/

use db_Biblioteca

create index indice_nome_produto
on dbo.Produtos(nomeProduto)

/*Create rule
as regras são configurações que permitem determinar parametros do bd deve se comportar
como limitar faixas de valores em colunas ou especificar valores invalidos para registros.
*/


create rule rl_preco as @VALOR > 10.00 

execute sp_bindrule rl_preco, 'Produtos.Preco'

