--ASCII descodifica as letras
select ascii('ab') from sys.dual;

--CONCAT para concatenar somente campos com o mesmo formato
select concat(first_name, last_name) from hr.employees;

--PIPE concatena tambem
select first_name || ' ' || last_name || ' - ' || salary as infos
from hr.employees;

--LOWER
select lower(first_name) as com_lower, first_name as sem_lower 
from hr.employees;

--UPPER
select upper(first_name) as com_upper, first_name as sem_upper 
from hr.employees;

--LAPD completa com 0 a direita
select LPAD(salary, 10, 0),
salary,
first_name 
from hr.employees;

--RPAD completa com 0 a esquerda
select RPAD(salary, 10, 0),
salary,
first_name 
from hr.employees;

--exemplo
select 
first_name,
last_name,
LPAD(first_name, 1, 1),
LPAD(last_name, 1, 1),
CONCAT(LPAD(first_name, 1, 1), LPAD(last_name, 1, 1))
from hr.employees;

--SUBSTR retorna parte da expressao
select SUBSTR('oracle', 2, 4) from dual;

--INSTR retorna em qual posição se encontra certo item
select job_title, INSTR(job_title, 'a') as posicao from hr.jobs;

--consigo definir a partir de qual posição peço para verificar
select job_title, INSTR(job_title, 'a', 12) as posicao from hr.jobs;

--LTRIM remoção de letras ao aparecer
select job_title, LTRIM(job_title, 'AVDTP') from hr.jobs;

--pode ser usado para remover espaçamento
select LTRIM('   oracle') as com_ltrim, '   oracle' as sem_ltrim from dual;

--RTRIM
select job_title, RTRIM(job_title, 'Pre') as posicao from hr.jobs;

select RTRIM(123000, 123) from dual;

--LENGHT
select job_title, LENGTH(job_title) from hr.jobs;

--TRANSLATE
select job_title, TRANSLATE(job_title) from hr.jobs

select job_title, TRANSLATE(job_title, 'S', 'A') from hr.jobs

--DECODE
select DECODE(job_title, 'President', 'Presidente') from hr.jobs


--REVERSE
select REVERSE(job_title) from hr.jobs;