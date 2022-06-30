--concedendo acesso de atualizacao para aluno
grant update on funcionarios to aluno;

--CONCEDENDO ACESSO DE ATUALIZACAO PARA ALUNO COM WITH ADMIN OPTION
--usuario ALUNO pode estender seus privilegios de sistema para outros usuarios
grant create session, create table, create view to aluno with admin option;

--concedendo acesso de update, select para aluno na tabela senso
grant select update on senso to aluno;

--concedendo acesso de insert e delete para aluno em todos objetos
grant insert, delete on senso to aluno;

grant create procedure, create view to aluno;

--DICA PARA GERAR GRANT PARA MUITOS OBJETOS
select 'GRANT ALL ON ' || object_name || 'TO ALUNO;' as retorno
from user_objects;

select 'GRANT UPDATE ' || object_name || 'TO ALUNO;' as retorno
from user_objects
where object_type = 'TABLE';

--concedenco grant de delete para aluno
grant delete on funcionarios to aluno;

--concedendo grant de insert para aluno
grant insert on senso to aluno;

--acesso a tudo na tabela funcionario
grant all on funcionarios to aluno;

--VERIFICANDO PRIVILEGIOS
--VERIFICAR PELO SYSTEM

select * from dba_sys_privs
where grantee like upper('aluno');

select * from dba_role_privs
where grantee like upper('aluno');

--grantee foi quem recebeu a permissao e grantor foi quem concedeu:
select * from user_tab_privs;