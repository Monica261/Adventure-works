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
create or replace function fnc_departamento(
    v_depart in varchar2
)

return varchar is
v_nome varchar;

begin
    select first_name
    from hr.employees
    where first_name := v_nome;
    
    return v_nome;
end;
/

select fnc_departamento('IT_PROG', 'BERNST') from dual;
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