--CAST
select cast(350.569 as integer) conversao from dual;

select cast(employee_id as integer) from hr.employees;

--TO_CHAR -> CONVERTE DATA EM STRING
select hire_date, to_char(hire_date, 'day') from hr.employees;

--TO_DATE -> CONVERTE STRING EM DATA
select hire_date, to_date(hire_date, 'yyyy-mm-dd hh24:mi:ss') from hr.employees;

--NVL -> TRATAR VALOR NULO
select first_name, NVL(commission_pct, 10) 
from hr.employees 
order by commission_pct asc;

--TO_NUMBER
select to_number('5')+10 soma_apos_conversao from dual;


--alterar formato da data
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';

--alterar territorio
alter session set nls_territory = 'PORTUGUESE';

select 
to_char(to_date('2003-06-17 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'hh:mi:ss') as "Horas, minutos e segundos",
to_char(to_date('2003-06-17 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'scc') as "Século",
to_char(to_date('2003-06-17 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'q') as "Trimestre",
to_char(to_date('2003-06-17 20:10:00', 'yyyy-mm-dd hh24:mi:ss'), 'HH24') as "Hora em formato 24",
to_char(to_date('2003-06-17 10:30:43', 'yyyy-mm-dd hh24:mi:ss'), 'HH') as "Hora formato 12"
from dual;

--formatar salario
select 
first_name, 
hire_date,
to_char(salary, '$999999')salario1, 
to_char(salary, '$999')salario2,
'$' || salary as valor
from hr.employees;


