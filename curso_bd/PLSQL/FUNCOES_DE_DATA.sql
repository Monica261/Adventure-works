--FUNCOES DE DATA E HORA

--ADD_MONTHS - add n meses de calendario a data, o nº tem que ser inteiro e pode ser negativo

--MONTHS_BETWEEN -- nº de meses entre data1 e data2, o resultado pode ser positivo ou negativo

--LAST_DAY --devolve o ultimo dia do mes de data1

--NEXT_DAY --devolve a data do prox dia da semana especificado por c e a seguir a data1

--SYSDATE -retorna data e hora do sistema
select sysdate from dual;

--utilizando mascara
select 
    sysdate "Data do servidor",
    to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') "Data formatada",
    to_char(sysdate, 'SCC') "Século"
from dual;

--formatando datas
--MM - retorna o nº representando o mes
select to_char(sysdate, 'MM') as mes from dual;
--MON - retorna a abreviação do mes
select to_char(sysdate, 'MON') as mes from dual;
--DD - retorna o dia da data informada, como parametro
select to_char(sysdate, 'DD') as mes from dual;
--DY - retorna a abreviacao do dia da semana
select to_char(sysdate, 'DY') as mes from dual;
--YYYY - retorna o ano com 4 digitos
select to_char(sysdate, 'YYYY') as mes from dual;
--YY - retorna os ultimos dois numeros do ano
select to_char(sysdate, 'YY') as mes from dual;
--AM(ou PM) - retorna se a hora é de manha ou a tarde
select to_char(sysdate, 'AM') as mes from dual;
--HH - retorna a hora(0 - 12)
select to_char(sysdate, 'HH') as mes from dual;
--HH24 - retorna a hora(0 - 24)
select to_char(sysdate, 'HH24') as mes from dual;
--MI - retorna o minuto
select to_char(sysdate, 'MI') as mes from dual;
--SS - retorna o segundo
select to_char(sysdate, 'SS') as mes from dual;

--formato utilizado no brazil
select to_char(sysdate, 'DD/MM/YYYY hh24:mi:ss') as padrao_brazil from dual;

alter session set nls_language = 'PORTUGUESE';

select first_name, hire_date,
       to_char(hire_date, 'MON'),
       to_char(hire_date, 'MM'),
       to_char(hire_date, 'MONTH'),
       to_char(hire_date, 'DY'),
       to_char(hire_date, 'DAY')
from hr.employees;

 
--UTILIZACAO DE OPERADORES ARITMETICOS
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';

--DATE + NUMBER - add um nº de dias a data, retornando uma data

--DATE - NUMBER -subtrai um nº de dias da data, retornando uma data
select sysdate-5 from dual;

---diferenca entre os dias 
select round(to_date(sysdate)-to_date('2022-07-10')) from dual;

--DATE - DATE -subtrai um nº de dias da data, retornando uma data
select sysdate data_atual, add_months(sysdate, -2) add_meses from dual;

--DATE + NUMBER/24 -add um nº de horas a data, retornando uma data
select sysdate, sysdate+5/24 data_hora_add from dual;

--qntd de meses entre datas
select first_name, hire_date, sysdate, trunc(months_between(sysdate, hire_date)) meses
from HR.employees;

--descobrir a idade
select trunc((months_between(sysdate, to_date('26/11/1999', 'DD/MM/YYYY')))/12) as idade from dual;

--meses de vida
select trunc((months_between(sysdate, to_date('26/11/1999', 'DD/MM/YYYY')))) as idade_meses from dual;

--dias de vida
select trunc(sysdate-to_date('26/11/1999', 'DD/MM/YYYY')) as dias_de_vida from dual;

--next_day - cenario para descobrir uma dara que acontece toda segunda de casa mes
-- 1 - domingo, 2 - segunda, 3 - terça, 4 - quarta, 5 - quinta, 6 - sexta, 7 - sabado.
select next_day(trunc(sysdate), 7) from dual;