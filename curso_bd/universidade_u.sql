drop database universidade_u;

create database universidade_u;

use universidade_u;

/*criando tabela aluno*/
create table aluno(
sexo char(1),
idade int,
data_inscricao_curso date, /*'yyyy-mm-dd'*/
telefone varchar(20),
valor_pago_curso float(10,2),
ativo_sn int,
endereco text,
nome varchar(25)
);

drop table aluno;

/*inserindo dados na tabela alunos*/
insert into aluno values('F', 22, '2018-01-20', '1235195705', 250.50, 1, 'Abilia Machado, 53, bloco 17 apto 14 - sjc', 'Mônica Torres');
insert into aluno values('M', 30, '2016-08-10', '33604875', 400.10, 1, 'Av. Joaquim Moreira Ávila, 296 - Jardim Minas Gerais', 'Paulo Oliveira');
insert into aluno values('F', 20, '2021-01-15', '11982506541', 350.00, 0, 'Rua Peixoto Gomide, 707 - Bela Vista, São Paulo', 'Olivia Castro');
insert into aluno values('M', 43, '2020-01-27', '11980264891', 650.20, 1, 'Av. Ver. José Diniz, 3725 - Cj. 23 - Brooklin, São Paulo', 'Pedro Vergara');
insert into aluno values('M', 45, '2019-01-27', '1236548927', 320.20, 0, 'Rua Dr. Ricardo Edwards, 95 - Vila Industrial, sjc', 'Caio Valencio');
insert into aluno values('F', 18, '2021-01-22', '1298542634', 450.00, 1, 'Av. Comendador Vicente de Paulo Penido, 532 - Jardim Aquarius, sjc', 'Ana Barros');

/*listando dados*/
select * from aluno;

/*listando dados especificos*/
select nome, idade, endereco from aluno;

/*filtrando registros where*/
select nome, sexo 
from aluno
where sexo = 'F';

select * from aluno 
where valor_pago_curso <= 400.10;

/*filtrando registros where - operadores de comparação com logicos*/
select nome, idade, endereco, valor_pago_curso
from aluno
where idade > 20 and valor_pago_curso >= 300.00;

select * from aluno
where sexo = 'M' and idade >= 30 and ativo_sn = 1 and valor_pago_curso > 400.50; 

select * from aluno
where sexo = 'F' or idade < 32;

/*Between - utilizar somente com valores númericos e datas*/
select * from aluno
where idade between 20 and 40;

select * from aluno
where data_inscricao_curso between '2020-01-20' and '2021-12-01';

/*In - filtro com base em uma lista de possibilidades*/
select * from aluno where nome in ('Paulo Oliveira', 'Olivia Castro', 'Antonio Vilela');

select * from aluno where nome not in ('Paulo Oliveira', 'Olivia Castro', 'Antonio Vilela');

/*like*/
select * from aluno where nome like '%o';

select * from aluno where nome like '%i%';

select * from aluno where nome like 'm%';

select * from aluno where nome like 'm%n%';

select * from aluno where nome like '_au%';

/*Order by*/
select nome, idade from aluno
where idade > 22
order by nome asc;

select * from aluno
order by valor_pago_curso desc;

/*Update - atualizar informações*/
update aluno
set ativo_sn = 1
where nome = 'Olivia Castro';

update aluno
set ativo_sn = 1, valor_pago_curso = 360.80
where nome = 'Caio Valencio';

update aluno
set ativo_sn = 0
where nome = 'Paulo Oliveira';

update aluno
set telefone = '1188884444'
where telefone = '11980264891';

/*Delete*/
delete from aluno
where ativo_sn = 0 and nome = 'Paulo Oliveira';

delete from aluno where idade in (18,43);

delete from aluno where idade in (18,43) or sexo = 'M';

delete from aluno where sexo = 'F';

/*verificar a estrutura da tabela para alterar*/
desc aluno;

/*add inclusão*/
alter table aluno
add cpf varchar(11);

alter table aluno
add email varchar(150);

/*modify*/
alter table aluno modify column email varchar(150) after idade;

alter table aluno modify column cpf varchar(25);

/*drop*/
alter table aluno
drop column cpf;

/*Primary key 1FN - identifica de forma unica um registro em uma tabela*/
use universidade_u;

update aluno
set cpf = '962.003.340-05'
where nome = 'Olivia Castro';

update aluno
set cpf = '648.489.030-76'
where nome = 'Mônica Torres';

update aluno
set cpf = '309.939.810-11'
where nome = 'Paulo Oliveira';

update aluno
set cpf = '618.033.790-06'
where nome = 'Pedro Vergara';

update aluno
set cpf = '172.544.910-29'
where nome = 'Caio Valencio';

update aluno
set cpf = '011.131.600-63'
where nome = 'Ana Barros';

select * from aluno;

alter table aluno modify column cpf varchar(25) primary key;

/*para remover uma chave primaria é apagando a coluna*/
alter table aluno drop cpf;
alter table aluno add column cpf varchar(25);

/*criando a chave artificial*/
alter table aluno add idaluno int primary key auto_increment;

/*1FN atributos compostos*/
alter table aluno add logradouro varchar(100);
alter table aluno add numero varchar(10);
alter table aluno add complemento varchar(20);
alter table aluno add bairro varchar(100);
alter table aluno add cidade varchar(50);
alter table aluno add estado char(2);

select * from aluno;

update aluno
set logradouro = 'Abilia Machado', numero = '53', complemento = 'bloco 17 apto 14', bairro = 'Vila tatetuba', cidade = 'sjc', estado = 'SP'
where idaluno = 1;

update aluno
set logradouro = 'Av. Joaquim Moreira Ávila', numero = '296', complemento = 'bairro', bairro = 'Jardim Minas Gerais', cidade = 'sjc', estado = 'SP'
where idaluno = 2;

update aluno
set logradouro = 'Rua Peixoto Gomide', numero = '707', complemento = '', bairro = 'Bela Vista', cidade = 'são paulo', estado = 'SP'
where idaluno = 3;

update aluno
set logradouro = 'Av. Ver. José Diniz', numero = '3725', complemento = 'Cj. 23', bairro = 'Brooklin', cidade = 'são paulo', estado = 'SP'
where idaluno = 4;

update aluno
set logradouro = 'Rua Dr. Ricardo Edwards', numero = '95', complemento = '', bairro = 'Vila Industrial', cidade = 'sjc', estado = 'SP'
where idaluno = 5;

update aluno
set logradouro = 'Av. Comendador Vicente de Paulo Penido', numero = '532', complemento = '', bairro = 'Jardim Aquarius', cidade = 'sjc', estado = 'SP'
where idaluno = 6;


/*executar depois de preencher todos*/
alter table aluno drop column endreco;

/*1FN - atributos multivalorados*/
create table telefone(
idtelefone int auto_increment primary key,
numero varchar(20),
tipo char(3)
);

insert into telefone(numero, tipo) values('12 98280-5148', 'res');
insert into telefone(numero, tipo) values('12 98056-9587', 'pes');

select * from telefone

