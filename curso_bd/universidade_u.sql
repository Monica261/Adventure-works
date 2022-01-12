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

select * from telefone;

/*Cardinalidade 1:n modelagem fisica - relacionamento FK*/
alter table telefone add column fk_idaluno int;

alter table telefone add constraint fk_aluno_telefone /*definir a constraint depois de criar a tabela*/
foreign key (fk_idaluno)
references aluno(idaluno); /*refenrencia de onde esta vindo*/

desc telefone;

/*Cardinalidade 1:n - inserindo registros relacionados*/
select * from aluno;

insert into telefone(numero, tipo, fk_idaluno) values('11 98256-4287', 'res', 1);

/*atualizando id dos alunos*/
update telefone
set fk_idaluno = 2
where idtelefone = 1;

update telefone
set fk_idaluno = 4
where idtelefone = 2;

select * from telefone;

/*Cardinalidade 1:1 - modelagem fisica*/
create table endereco (
    numero varchar(10),
    logradouro varchar(100),
    bairro varchar(100),
    complemento varchar(20),
    cidade varchar(50),
    estado char(2),
    idendereco int auto_increment PRIMARY KEY,
    fk_idaluno int
);

alter table endereco add constraint fk_aluno_endereco
foreign key (fk_idaluno)
references aluno (idaluno);

select * from endereco;
desc endereco;

/*inserindo na tabela endereco dados da tabela aluno*/
insert into endereco(
numero, logradouro, bairro, complemento, cidade, estado, fk_idaluno
)
select numero, logradouro, bairro, complemento, cidade, estado, idaluno
from aluno;

alter table aluno drop column logradouro;
alter table aluno drop column numero;
alter table aluno drop column bairro;
alter table aluno drop column complemento;
alter table aluno drop column cidade;
alter table aluno drop column endereco;

select * from aluno;

select * from endereco as e
where e.fk_idaluno = 1;

/*criando a tabela curso*/
create table curso(
idcurso int auto_increment primary key,
descricao varchar(200)
);

insert into curso(descricao) values('curso de js');
insert into curso(descricao) values('curso mongo e nodeJS');
insert into curso(descricao) values('curso de Angular');
insert into curso(descricao) values('curso de React');

select * from curso;

/*Cardinalidade de relacionamento n:n*/
create table aluno_curso(
    fk_idaluno int,
    idalunocurso int auto_increment PRIMARY KEY,
    fk_idcurso int
);

alter table aluno_curso add constraint fk_curso_aluno
foreign key(fk_idcurso) references curso(idcurso);

alter table aluno_curso add constraint fk_aluno_curso
foreign key(fk_idaluno) references aluno(idaluno);

use universidade_u;

select * from curso;
select * from aluno;

insert into aluno_curso(fk_idaluno, fk_idcurso) values(3, 2);
select * from aluno_curso;

/*Enum - determina no banco os tipos possiveis para aquela tabela*/
select * from telefone;

alter table telefone drop column tipo;
alter table telefone add tipo enum('res', 'com', 'cel');

update telefone
set tipo = 'com'
where idtelefone = 2;

/*Null e not null*/
select * from telefone;

alter table telefone modify column numero varchar(20) not null;
alter table telefone modify column tipo enum('res', 'com', 'cel') not null;
alter table telefone modify column fk_idaluno int not null;

desc telefone;

delete from telefone
where idtelefone = 3; 

/*Unique*/
alter table aluno add constraint uc_aluno_cpf unique(cpf);

insert into aluno(sexo, idade, data_inscricao_curso, telefone, valor_pago_curso, ativo_sn, nome, cpf) values('F', 35, '2021-01-05', '12989564879', 700.00, 1, 'Carla Starv', '172.590.900-96');
desc aluno;

/*determinando campos importantes como não nulos*/
alter table aluno modify column nome varchar(25) not null;
alter table aluno modify column cpf varchar(25) not null;

select * from aluno;

/*funções de agregação*/
use universidade_u;

/*total de registros na tabela*/
select count(*) from aluno;

/*total de registros distintos na tabela*/
select count(distinct(nome)) from aluno;

/*projeta o maior valor de todos os registros de uma tabela*/
select max(valor_pago_curso) from aluno;

select max(valor_pago_curso) 
from aluno
where sexo = 'F';

/*projeta o menor valor de todos os registros de uma tabela*/
select min(valor_pago_curso) from aluno;

select min(valor_pago_curso) 
from aluno
where ativo_sn != 0;

/*projeta a média dos valores de todos os registros de uma tabela*/
select avg(valor_pago_curso) from aluno;

/*projeta a soma dos valores de todos os registros de uma tabela*/
select sum(valor_pago_curso) from aluno;

select 
	min(valor_pago_curso) as 'vl minimo pago em um curso',
    max(valor_pago_curso) as 'vl maximo pago em um curso',
    sum(valor_pago_curso) as 'vl total de todos os cursos'
from aluno;

/*Funções ceil, floor, truncate e round*/
use universidade_u;

/*ceil - arredonda a função para cima*/
select ceil(17.4) as valor;

/*floor - arredonda a função para baixo*/
select floor(18.9) as valor;

select avg(floor(valor_pago_curso)) 
from aluno
where ativo_sn = 0;

/*truncate - trunca a função*/
select truncate(22.684, 1) as valor; /*passa a qntd de nº que quero na fração*/

/*round - arredondamento de fração*/
select round(22.62, 1) as valor;

select sum(round(valor_pago_curso)) as 'valor total arrendondado F'
from aluno
where sexo = 'F' and ativo_sn = 1;

select round(avg(valor_pago_curso), 2) as 'valor total arrendondado F'
from aluno
where idaluno in(2, 6, 1);

/*Group by*/
use universidade_u;

select nome, ceil(sum(valor_pago_curso)) as 'valor total arrendondado F'
from aluno
where idaluno in(2, 6, 1)
group by nome;

select nome, count(distinct((ativo_sn)))
from aluno
where ativo_sn = 1
group by nome;

select sexo, round(avg(idade)) as 'media de idade por sexo'
from aluno
group by sexo;

select idade, sum((ativo_sn)) as 'soma de ativos por idade'
from aluno
group by idade;

select count(nome), ativo_sn
from aluno
group by ativo_sn;

select sexo, min(idade) as 'menor idade do agrupamento', max(idade) as 'maior idade do agrupamento'
from aluno
group by sexo;

select estado, count(*) /*quantos registros eu tenho por estado*/
from endereco
group by estado;

select tipo, count(*) /*qntd de telefone por tipo*/
from telefone
group by tipo;

/*requisitos do cliente*/
/*estados com mais alunos*/
select estado, count(*) total
from endereco
group by estado
order by total desc
limit 3; /*os 3 primeiros*/

/*cursos mais vendidos*/
select fk_idcurso, count(*) total
from aluno_curso
group by fk_idcurso
order by total desc;

/*atualizando estados*/
select * from endereco;

update endereco
set estado = 'RJ'
where fk_idaluno = 5;

/*criando tabela controle gastos mensais*/
use universidade_u;

create table gasto(
idgasto int primary key auto_increment,
tipo enum('previsto', 'realizado') not null,
ano int not null,
jan float(10,2),
fev float(10,2),
mar float(10,2),
abril float(10,2),
maio float(10,2),
jun float(10,2),
jul float(10,2),
ago float(10,2),
`set` float(10,2),
`out` float(10,2),
nov float(10,2),
dez float(10,2)
);

drop table gasto;

select * from gasto;

/*operações aritmeticas*/
select (10 + 5) as soma;

select round((80/5)) as divisao;

select (26-9) as subtracao;

select (36*7) as multiplicacao;

insert into gasto(ano, tipo, jan, fev, mar, abr, maio, jun, jul, ago, `set`, `out`, nov, dez)values('2019', 'previsto', 18000, 17000, 19000, 20000, 17000, 18000, 18500, 18500, 1800, 17500, 18000, 17000);
insert into gasto(ano, tipo, jan)values('2019', 'realizado', 18353.20);
update gasto set fev = 17555.55 where idgasto = 2;
update gasto set mar = 19435.73 where idgasto = 2;
update gasto set abril = 22753.12 where idgasto = 2;
update gasto set maio = 16198.12 where idgasto = 2;
update gasto set jun = 17451.88 where idgasto = 2;
update gasto set jul = 18975.40 where idgasto = 2;
update gasto set ago = 19163.84 where idgasto = 2;
update gasto set `set` = 18132.56 where idgasto = 2;
update gasto set `out` = 17667.91 where idgasto = 2;
update gasto set nov = 17936.33 where idgasto = 2;
update gasto set dez = 17125.88 where idgasto = 2;

/*renomear coluna da tabela*/
alter table gasto rename column abril to abr;
alter table gasto rename column outu to `set`;

/*média de valores por meses*/
select round(avg(jan + fev + mar + abri + maio + jun + jul + ago)) as 'média de gastos ano'
from gasto;

select truncate((jan + fev + mar + abri + maio + jun + jul + ago + `set` + `out` + nov + dez / 12), 2) 
as 'média' 
from gasto;

use universidade_u;

delete from aluno
where idaluno = 13;

/*subquerys*/
use universidade_u;

/*valor realizado_previsto por mês*/
select
  (select jan
  from gasto
  where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) 
  -
  (select jan
  from gasto
  where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) as realizado_previsto,
  
  (select fev
  from gasto
  where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado'))
  -
  (select fev
  from gasto
  where idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) as realizado_previsto_fev;

select * from gasto;

select nome, idade, valor_pago_curso as 'valor acima do limitado por idade'
from aluno
where valor_pago_curso = (
select valor_pago_curso 
from aluno 
where valor_pago_curso > 250.50 and idade > 35
order by nome desc limit 1
);

/*Armazenando data de nascimento dos alunos*/
use universidade_u;

alter table aluno add data_nascimento date;


update aluno set data_nascimento = '1999-11-26' where idaluno = 1;
update aluno set data_nascimento = '1987-05-20' where idaluno = 2;
update aluno set data_nascimento = '1978-03-10' where idaluno = 3;
update aluno set data_nascimento = '1960-12-15' where idaluno = 4;
update aluno set data_nascimento = '1998-08-18' where idaluno = 5;
update aluno set data_nascimento = '1995-06-27' where idaluno = 6;
update aluno set data_nascimento = '1986-04-03' where idaluno = 7;
update aluno set data_nascimento = '1995-05-30' where idaluno = 8;

/*Funções de datas*/

/*recuperar a data atual*/
select curdate();
select current_date();

/*retorna data e hora atual*/
select now();
select date_format(now(), '%d/%m/%y %H:%i') as agora;

/*formatando as datas*/
select date_format(curdate(), '%d/%m/%Y') as data_formatada;
select date_format(curdate(), '%d/%M/%Y') as data_formatada;

/*extrair parte de data*/
select extract(month from now());/*day, month ou year*/

/*add intervalos de tempos*/
select date_add('1999-11-26', interval 4 day) as intervalo_de_dias;
select date_format(date_add('1999-11-26 10:15:20', interval 24 hour), '%d/%m/%Y %H:%i') as intervalo_de_horas;
/*second, minute, day, hour, month, year*/

/*calculo de dias entre datas*/
select '2019-03-20' as data_nascimento,
curdate() as data_atual,
datediff('2019-03-20', curdate()) as diferenca_de_dias,
floor(datediff(curdate(), '1999-11-26') / 365) as idade_aproximada;

/*calculo de meses entre datas*/
select period_diff('202112', '199911') as diferenca_meses;

/*dia do ano*/
select dayofyear('1999-11-26') as dia_do_ano;

/*calculando idade exata*/
select timestampdiff(YEAR, '1999-11-26', curdate()) as idade;

select data_nascimento,
curdate() as data_atual,
timestampdiff(YEAR, data_nascimento, curdate()) as idade_exata
from aluno;

alter table aluno drop idade;

/*saber os aniversariantes do dia*/
use universidade_u;

select 
	data_nascimento,
	nome,
	extract(month from data_nascimento) as data_nascimento_mes,
	extract(day from data_nascimento) as data_nascimento_dia,

	curdate() as data_atual,
	extract(month from curdate()) as mes_atual,
	extract(day from curdate()) as dia_atual,
	timestampdiff(YEAR, data_nascimento, curdate()) as data_atual
from aluno
where extract(month from data_nascimento) = extract(month from curdate()) and
extract(day from data_nascimento) = extract(day from curdate());

select * from aluno;

update aluno
set data_nascimento = '1987-12-28'
where idaluno = 2;

/*Refatorando data_inscricao_curso e valor_pago*/
use universidade_u;

select data_inscricao_curso, valor_pago_curso from aluno;

alter table aluno_curso add column data_inscricao_curso date;
alter table aluno_curso add column valor_pago_curso float(10,2);

select * from aluno_curso;


/*query de update com uma subquery para recuperar os dados - para não precisar
cadastrar manualmente na tabela aluno_curso*/

select 
idaluno, data_inscricao_curso, valor_pago_curso 
from aluno
where idaluno = 4;

update 
	aluno_curso
set 
	data_inscricao_curso = (select data_inscricao_curso from aluno where idaluno = 13),
	valor_pago_curso = (select valor_pago_curso from aluno where idaluno = 4) 
where 
	fk_idaluno = 3;
    
select * from aluno_curso;

/*saber quais IDS precisam da atualização ainda*/
select count(fk_idaluno) from aluno_curso;

/*valores default*/
use universidade_u;

alter table aluno modify column ativo_sn int default 1 not null;
alter table aluno modify column data_inscricao_curso datetime default current_timestamp not null;

commit;

desc aluno;

/*não precisa mais declarar o ativo_sn e nem a data_inscricao no insert*/
insert into aluno (sexo, telefone, valor_pago_curso, nome, cpf, data_nascimento)
values('M', 12982805784, 490.00, 'Carlos', '858.648.328-58', '1997-05-12');

delete from aluno
where idaluno = 9;

select  * from aluno;

/*chaves primarias compostas
NATURAL - Tem relação com o registro.
ARTIFICIAL - Não tem relação com o registro.
*/
select * from aluno_curso;

alter table aluno_curso drop column idalunocurso;

/*é uma primary key composta por 3 colunas*/
alter table aluno_curso 
add constraint pk_aluno_curso primary key(fk_idcurso, fk_idaluno, data_inscricao_curso);


