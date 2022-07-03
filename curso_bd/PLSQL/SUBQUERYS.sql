--SUBSELECTS

--utilizando o operador in
select * from hr.employees emp
where emp.employee_id in (select jh.employee_id from hr.job_history jh); --trazer os colaboradores que tem historico na job_history

select * from hr.employees emp
where emp.employee_id in (select jh.employee_id from hr.job_history jh)
and emp.manager_id = '100'; --trazer os colaboradores que tem historico na job_history e o manager igual a 100

select * from hr.employees emp
where emp.employee_id in (select jh.employee_id from hr.job_history jh where jh.department_id = ' 50')
and emp.manager_id = '100';

--utilizando o operador not in
select * from hr.employees emp
where emp.employee_id not in (select jh.employee_id from hr.job_history jh);

--retornando em coluna
select emp.employee_id, emp.first_name, emp.job_id,
(select j.job_title from HR.jobs j where emp.job_id = j.job_id) as cargo
from hr.employees emp;

select emp.employee_id, emp.first_name, emp.job_id,
(select d.department_name from HR.departments d where d.department_id = emp.department_id) as departamento
from hr.employees emp;

--descobrir o gerente de cada departamento
select d.department_id, d.department_name, d.manager_id,
(select emp.first_name from HR.employees emp where d.manager_id = emp.employee_id)
from HR.departments d;

--soma de todos os salarios por departamento
select d.department_id,
d.department_name,
(select sum(emp.salary) from HR.employees emp where d.department_id = emp.department_id) as salario
from HR.departments d;

--soma de todos os salarios por departamento e qunt funcionarios
select d.department_id,
d.department_name,
(select sum(emp.salary) from HR.employees emp where d.department_id = emp.department_id) as salario,
(select count(*) from HR.employees emp where d.department_id = emp.department_id) as qnt_funcionarios
from HR.departments d;

--media de salario que cada funcionario recebe
select d.department_id,
d.department_name,
(select sum(emp.salary) from HR.employees emp where d.department_id = emp.department_id)as salario,
(select count(*) from HR.employees emp where d.department_id = emp.department_id)as qnt_funcionarios,
(select sum(emp.salary) from HR.employees emp where d.department_id = emp.department_id) /
(select count(*) from HR.employees emp where d.department_id = emp.department_id) as media
from HR.departments d;