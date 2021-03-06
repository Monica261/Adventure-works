select user from dual; --retorna o user logado nessa se??o

--dar permiss?es ao user aluno para as tabelas
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

select * from HR.employees emp
where emp.salary > 9000
order by emp.salary asc;

--operador menor
select emp.first_name, emp.salary, sysdate from HR.employees emp
where emp.salary < 5000;

--operador maior igual
select * from hr.employees emp
where emp.salary >= 9000;

--operador menor igual
select * from hr.employees emp
where emp.hire_date <= to_date('16/08/2002', 'DD/MM/YYYY')
order by first_name asc;

--operador diferente
select * from hr.employees emp
where emp.job_id <> 'IT_PROG';

--combina??es dos operadores
select * from hr.employees emp
where emp.job_id <> 'IT_PROG'
and emp.hire_date >= to_date('26/11/2005', 'DD/MM/YYYY')
and emp.salary < 6000;

