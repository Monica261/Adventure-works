/*FUNCAO PARA MEDIA PONDERADA*/
create or replace function FN_mediapond(
nota1 in number,
peso1 in number,
nota2 in number,
peso2 in number
)

return number is
media_pond number;
begin
    media_pond:=(nota1*peso1*nota2*peso2)/(peso1*peso2);
    return media_pond;
end;

select FN_mediapond(5,9,10,7) from dual;

-------------------------------------------------------------------
--retorna o departamento do funcionario conforme passa o nome e sobrenome na chamada da funcao

create or replace function fnc_departamento(
   -- v_depart in varchar2,
    v_nome hr.employees.first_name%TYPE,
    v_sobrenome hr.employees.last_name%TYPE
)


return varchar2 is
regra varchar2(500);

begin
    select job_id
    into regra
    from hr.employees
    where first_name = v_nome
    and last_name = v_sobrenome;
    
    return regra;
end;

select fnc_departamento('David', 'Austin') from dual;

-------------------------------------------------------------------
--retornar o salario de acordo com o departamento e o nome
create or replace function fnc_retorna_salario(
    v_nome varchar2,
    v_depap varchar2
)

return number is
proposta number(20);

begin
    select salary
    into proposta
    from hr.employees
    where first_name = v_nome
    and job_id = v_depap;
    
    return proposta;
end;


select first_name, (salary * 0.35) SALARIO_COM_AUMENTO, 
fnc_retorna_salario('David', 'IT_PROG') SALARIO_ATUAL
from hr.employees
where first_name = 'David' 
and job_id = 'IT_PROG';

select fnc_retorna_salario('David', 'IT_PROG') from dual;

-------------------------------------------------------------------
--funcao sem parametros
create or replace function fnc_funcionario
return varchar is
v_nome varchar2(30);


begin
    select first_name
    into v_nome
    from hr.employees
    where employee_id = 100;
    
    return v_nome;
end;

select fnc_funcionario from dual;
-------------------------------------------------------------------


select * from hr.employees