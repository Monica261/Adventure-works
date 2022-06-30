--REMOVENDO PERMISSOES COM REVOKE

--verificando o usuario
select user from dual;

--analisando
select * from dba_sys_privs
where grantee like upper('aluno');

--revogando
revoke create view, create procedure, create session, create table from aluno;

--concedendo
grant create view, create procedure, create session, create table to aluno;

--analisando
select * from dba_role_privs;

--revogando
revoke resource from aluno;