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

select * from tbl_autores

create table tbl_editoras(
ID_editora int primary key identity,
Nome_editora varchar(50) not null
)
