--FUNCOES CONTROLE DE FLUXO

--case
select first_name, salary,
case 
     when salary < 5000 then 'Baixo'
     when salary >= 5000 and salary < 10000 then 'Medio'
     when salary < 15000 then 'Medio Alto'
else 'Alto' end as faixa
from hr.employees
order by salary desc;

--identificar gerencia
select first_name, manager_id,
case 
     when manager_id is null then 'Gerente'
     else 'subordinado' end as Hierarquia 
from hr.employees;

--para n retornar repetidos posso utilizar UNIQUE
select UNIQUE city, country_id,
case
    when country_id = 'IT' then 'Italia'
    when country_id = 'CA' then 'Canada'
    when country_id = 'BR' then 'Brazil'
    else 'Outro pais' end as Pais
from hr.locations
order by 1 desc;


--NULLIF
--se os valores das expressoes forem iguais retorna NULL
select NULLIF(100,100) from dual;

select NULLIF(100,20) from dual;

select first_name, commission_pct,
NULLIF(commission_pct,0)
from hr.employees
order by 1 desc;