--operador de adi��o
select 10+5 as soma from dual;

select emp.first_name,
emp.salary, 
emp.salary + 500 as novo_salario 
from HR.employees emp;

--operador de subtra��o
select 10 - 2 as subtracao from dual;

select (7*4)-1 from dual;--retorno negativo

select emp.first_name,
emp.salary, 
emp.salary - 200 as reajuste_salarial 
from HR.employees emp
where emp.job_id <> 'IT_PROG';

--operador de multiplica��o
select 2 * 6 as multiplicacao from dual;

select emp.first_name,
emp.job_id,
emp.commission_pct * 2 as multiplica_comissao
from HR.employees emp
where emp.commission_pct is not null;

--operador de divis�o
select 7/2 as divisao from dual;

--operador modulo
select MOD(10, 5) from dual;