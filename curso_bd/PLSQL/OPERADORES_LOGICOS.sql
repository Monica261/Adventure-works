create table uf(
cod_uf char(2) not null primary key,
sigla_uf char(2) not null,
estado varchar(50) not null
);

create table senso(
ano int not null,
cod_uf char(2) not null,
estado varchar2(50) not null,
cod_mun char(7) not null,
nome_mun varchar2(50) not null,
regiao varchar2(150),
cod_meso_reg char(4),
nome_meso_reg varchar2(100) not null,
cod_mic_reg char(5) not null,
nome_min_reg varchar2(50) not null,
pib decimal(12,3) not null,
populacao integer not null,
pib_per_cap decimal(12,3) not null
);

select user from dual;

select * from senso;

select * from HR.countries;

--OPERADORES LOGICOS
 
 --where
 select * from HR.countries co
 where co.country_name = 'Brazil'
 
 --and
 select * from HR.employees emp
 where emp.salary >= 17000
 and emp.manager_id = 100
 
 --in
 select count(*), emp.first_name 
 from hr.employees emp
 where emp.job_id in ('IT_PROG', 'AD_VP')
 group by emp.first_name 
 
 --not in
 select * from HR.employees emp
 where emp.manager_id not in (100)
 
 --between
 select count(emp.DEPARTMENT_ID) || ' - ' || emp.first_name quant_for_depatment from HR.employees emp
 where emp.hire_date between to_date('25-JUN-05', 'DD/MM/YY') and to_date('30-NOV-08', 'DD/MM/YY')
 group by emp.first_name --quant de nomes por departamento                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
 
 --not like
  select * from HR.employees emp
  where emp.first_name not like '%a%'
  and emp.job_id = 'IT_PROG'
  
  --or
  select * from HR.employees emp
  where emp.first_name not like '%a%'
  and (emp.job_id = 'IT_PROG' or emp.job_id = 'FI_ACCOUNT')
  
  
 