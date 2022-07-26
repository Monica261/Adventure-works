--VIEWS

create or replace view v_func_depto as
select a.first_name, a.salary, a.department_id, b.department_name 
from hr.employees a
inner join hr.departments b
on a.department_id = b.department_id

select * from v_func_depto;

--paises e regioes
create or replace view v_pais_regiao as
select c.country_id, c.country_name, c.region_id, r.region_name 
from hr.countries c
inner join hr.regions r
on c.region_id = r.region_id

select * from v_pais_regiao where region_name <> 'Europe';

select region_name, count(*) as qntd
from v_pais_regiao
group by region_name;

--criando views com union all
create or replace view v_depto_union as
select em.employee_id, em.first_name, em.salary, em.department_id, dp.department_name
from hr.employees em
inner join hr.departments dp
on em.department_id = dp.department_id
where em.department_id = '10'

union all

select em.employee_id, em.first_name, em.salary, em.department_id, dp.department_name
from hr.employees em
inner join hr.departments dp
on em.department_id = dp.department_id
where em.department_id = '20'

union all

select em.employee_id, em.first_name, em.salary, em.department_id, dp.department_name
from hr.employees em
inner join hr.departments dp
on em.department_id = dp.department_id
where em.department_id not in ('10', '20');

select * from v_depto_union;

--verificando funcionarios que nao tem historico, sempre foram do mesmo setor

select * from hr.employees
where employee_id not in (select employee_id from hr.job_history);

--verificando funcionarios que tem historico, sempre foram do mesmo setor

select * from hr.employees
where employee_id in (select employee_id from hr.job_history);