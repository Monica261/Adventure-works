--DDL CRIANDO TABELA
create table funcionario (
matricula int not null primary key,
nome varchar2(50) not null,
sobrenome varchar2(50) not null,
endereco  varchar2(50),
cidade varchar2(50),
pais varchar2(25),
data_nasc date
);

--DDL SEQUENCE FUNCIONARIO
create sequence id_func2
start with 1
increment by 1
nocache;

--DDL CRIANDO TABELA COM CHAVE ESTRANGEIRA
create table salario(
matricula int not null,
salario decimal(10,2) not null,
foreign key(matricula) references funcionario(matricula)
);

--CRIACAO DE TABELA COM CHAVE PRIMARIA
create table audit_salario(
transacao int not null,
matricula int not null,
data_trans timestamp not null,
sal_antigo decimal(10,2),
sal_novo decimal(10,2),
usuario varchar2(20) not null,
primary key(transacao),
foreign key(matricula) references funcionario(matricula)
);

--SEQUENCE TRANSACAO
create sequence id_tran
start with 1
increment by 1
nocache;

--DDL CRIACAO DE INDEX
create index ix_func1 on funcionario(data_nasc) ;

create index ix_func2 on funcionario(nome, sobrenome);

--DDL ADD NOVO CAMPO NA TABELA
alter table funcionario add genero char(1);

--RENOMEAR CAMPOS/COLUNAS DE TABELAS
alter table funcionario rename column genero to sexo;

--MODIFICAR O TIPO DO CAMPO
alter table funcionario modify sexo check(sexo in('F', 'M'));

select * from funcionario;

--ALTERANDO O NOME DE TABELA
alter table funcionario
rename to pessoa;

--ADD CAMPO EM TABELA
alter table senso add id int;

--DDL PARA REMOVER CAMPO
alter table senso
drop column id;

--EXCLUINDO CAMPO
alter table funcionario
drop column sexo;

--CRIACAO DE DATABASE
create database TESTE;

--EXCLUINDO DATABASE
drop database TESTE;

--EXCLUINDO TABELA
drop table salario;

--CRIACAO DE VIEW
create or replace view V_FUNCIONARIO as --replace serve para alterar uma view ja existente
select matricula, nome, sobrenome, data_nasc from funcionario;

select * from v_funcionario;

--EXCLUIR VIEW
drop view v_funcionario;

--CRIACAO DE PROCEDURE
create or replace procedure proc_calc (v_num1 number)
is
v_num2 number;

begin
    v_num2:= v_num1 * v_num1;
    dbms_output.put_line('Retorno: ' || v_num2);
end;

set SERVEROUTPUT ON --setando para que traga um retorno
execute proc_calc(2);

--EXECUTAR UMA PROCEDURE
begin
    proc_calc(2);
end;

--APAGAR PROCEDURE
drop procedure proc_calc;

--CRIAR TABELAS TEMPORARIAS BKP EM TABELA TEMPORARIA
create global temporary table TMP_FUNCIONARIOS(
id int not null,
nome varchar2(50) not null,
salario decimal(10,2),
setor varchar2(30),
primary key(id)
)

--FAZENDO BKP EM TABELA TEMPORARIA
insert into tmp_funcionarios
select * from funcionarios;

--VERIFICANDO BKP
select * from tmp_funcionarios;