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

/*drop*/
alter table aluno
drop column cpf;