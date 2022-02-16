/*Criando e populando a tabela projeto_funcionario*/
use universidade_u;

create table projeto_funcionario(
	codigo_projeto int,
    matricula_funcionario int,
    nome_projeto varchar(100) not null,
    nome_funcionario varchar(50) not null,
    funcao_funcionario varchar(50) not null,
    telefone_funcionario varchar(20),
    data_criacao_projeto datetime default current_timestamp,
    horas_estimadas int not null,
    horas_realizadas int
);

alter table projeto_funcionario
add constraint pk_projeto_funcionario primary key(codigo_projeto, matricula_funcionario);

desc projeto_funcionario;

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(1, 110, 'Matrícula Online', 'Carla', 'Analista de projetos', 200);

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(1, 127, 'Matrícula Online', 'Pedro', 'Desenvolvedor Sênior', 500);

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(1, 115, 'Matrícula Online', 'Fátima', 'Gerente de atendimento', 100);

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(2, 143, 'Economia de papel', 'Paula', 'Gerente de qualidade', 300);

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(3, 210, 'Notas Online', 'Pablo', 'Analista adminitrativo', 180);

select * from projeto_funcionario;

update projeto_funcionario
set telefone_funcionario = 11956324589
where matricula_funcionario = 110;

/*atualizando dados de um funcionario com conteudo da tabela aluno*/    
update 
	projeto_funcionario
set
	matricula_funcionario = 123,
    nome_funcionario = (select nome from aluno where idaluno = 2)
    
where 
	matricula_funcionario = 110;
    
/*REFATORANDO A TABELA PROJETO_FUNCIONARIO*/

/*criando a tabela funcionario*/
use universidade_u;

create table funcionario(
idmatricula int auto_increment,
telefone varchar(20) not null,
funcao varchar(50) not null,
nome varchar(50) not null,
constraint pk_funcionario primary key(idmatricula)
);

desc funcionario;

/*criando a tabela projeto*/
create table projeto(
idcodigo int auto_increment,
nome varchar(50) not null,
data_criacao datetime default current_timestamp,
constraint pk_projeto primary key(idcodigo)
);

desc projeto;

/*criando a tabela projeto funcionario*/
create table projeto_funcionario2(
fk_idcodigo int,
fk_idmatricula int,
horas_estimadas int not null,
horas_realizadas int,
constraint pk_projeto_funcionario primary key(fk_idcodigo, fk_idmatricula)
);

desc projeto_funcionario2;

/*referenciando as fk*/
alter table projeto_funcionario2 add constraint 
foreign key(fk_idcodigo) references projeto(idcodigo);

alter table projeto_funcionario2 add constraint
foreign key(fk_idmatricula) references funcionario(idmatricula);

/*populando as tabelas*/
select 
	nome_funcionario,
    funcao_funcionario,
    matricula_funcionario,
    telefone_funcionario
from
	projeto_funcionario;
    
/*query para migração dos dados de funcionarios*/
insert into funcionario(
	idmatricula,
	nome,
    funcao,
    telefone
)
select distinct
	matricula_funcionario,
    nome_funcionario,
    funcao_funcionario,
    telefone_funcionario
from
	projeto_funcionario;
    
select * from funcionario;

/*query para migração dos dados de projetos*/
update projeto_funcionario
set data_criacao_projeto = '2022-01-10 20:13:47'
where codigo_projeto = 1;

insert into projeto(
	idcodigo, 
    nome,
    data_criacao
)
select distinct
	codigo_projeto,
    nome_projeto,
    data_criacao_projeto
from
	projeto_funcionario;

select * from projeto;


/*query para migração dos dados de projeto_funcionario*/
insert into projeto_funcionario2(
	fk_idcodigo,
    fk_idmatricula,
    horas_estimadas,
    horas_realizadas
)
select
	codigo_projeto,
    matricula_funcionario,
    horas_estimadas,
    horas_realizadas
from
	projeto_funcionario;
    
select * from projeto_funcionario2;

/*drop na tabela depois da migração dos registros*/
drop table projeto_funcionario;

/*relacionamento unario, binario e ternario - estudar*/
use universidade_u;

select * from funcionario;

alter table funcionario add column fk_idmatricula_supervisor int;

alter table funcionario add constraint fk_funcionario_supervisor
foreign key(fk_idmatricula_supervisor) references funcionario(idmatricula);

desc funcionario;

/*definindo os supervisores de cada área*/
update funcionario 
set fk_idmatricula_supervisor = 115
where idmatricula = 110;

insert into funcionario(nome, funcao)
values('Miguel', 'Gerente de TI');

insert into funcionario(nome, funcao)
values('Mônica', 'Desenvolvedora junior');

update funcionario
set fk_idmatricula_supervisor = 211
where idmatricula = 212;

/*remover a obrigatoriedade do campo telefone*/
alter table funcionario modify column telefone varchar(20);

select * from funcionario;

/*apagar registros de uma tabela com truncate
truncate reseta o auto_increment de uma tabela
*/
select * from gasto;

truncate table gasto;

/*truncate na tabela referencia*/
/*a tabela aluno é referencia para outras tabelas, sendo assim não podendendo ser truncada*/
truncate table aluno;

/*para que uma tabela consiga ser truncada, precisa setar uma flag*/
set foreign_key_checks = 0; /*desconsiderar a integridade referencial*/
truncate table aluno;

select * from aluno;

/*para impedir que novos truncates sejam realizados em outras tabelas referencias
basta ativar a flag novamente.
*/
set foreign_key_checks = 1;

/*exibe qual vai ser o proximo id auto_increment*/
select max(idtelefone) + 1 from telefone;
select * from telefone;

alter table telefone auto_increment = 300; /*posso definir que o auto_increment vai começar a partir de tal numero*/
insert into telefone (numero, fk_idaluno, tipo)
values ('11 3519-5705', 1, 'res');

/*modificando a ordem de uma coluna*/
use universidade_u;
select * from aluno;

show create table aluno;

alter table aluno modify `idaluno` int(11) NOT NULL AUTO_INCREMENT first;/*altera a ordem*/

/*pode utilizar AFTER pra colocar em uma posição especifica*/
select * from aluno;

alter table aluno modify `sexo` char(1) DEFAULT NULL after nome;