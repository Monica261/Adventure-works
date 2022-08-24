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
--funcao que retorna o salario do funcionario a partir do nome de departamento passados como parametro
create or replace function fnc_retorna_salario( 
    v_depap varchar2,
    v_nome varchar2
     
) 
 
return number is 
   resultado number;
 
begin 
    select salary 
    into resultado
    from hr.employees 
    where job_id = v_depap
    and first_name = v_nome;
     
    return resultado; 
end;

select fnc_retorna_salario('IT_PROG', 'David') from dual;

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