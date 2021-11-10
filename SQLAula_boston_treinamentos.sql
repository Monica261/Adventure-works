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

/*SQL Constrains(Restrições)*/

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

insert into tbl_autores(ID_autor, Nome_autor, Sobrenome_autor) values (2, 'Machado', 'Assis')

select * from tbl_autores

create table tbl_editoras(
ID_editora int primary key identity,
Nome_editora varchar(50) not null
)

/*inserir dados na tabela*/
insert into tbl_livro(Nome_livro, ISBN, ID_autor, Data_pub, Preco_livro, ano_importacao) values('Machado de assis', 5685, 1, '20/05/1990', 50.10, 1989)

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


