select user from dual; --retorna o user logado nessa seção

--dar permissões ao user aluno para as tabelas
grant select on hr.countries to aluno with grant option;
grant select on HR.departments to aluno with grant option;
grant select on HR.employees to aluno with grant option;
grant select on HR.job_history to aluno with grant option;
grant select on HR.jobs to aluno with grant option;
grant select on HR.locations to aluno with grant option;
grant select on HR.regions to aluno with grant option;


--operador igual
select * from HR.jobs a
where a.job_id = 'AC_MGR';

select * from HR.employees e
where e.job_id = 'IT_PROG';

--operador maior
select * from HR.employees emp
where emp.hire_date > to_date('03/01/06', 'DD/MM/YYYY')
and emp.job_id = 'FI_ACCOUNT';


