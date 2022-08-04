--type e rowtype
--garantir que a variavel tenha a mesma precisao do campo declarado
 
 /*type faz referencia ao campo e rowtype a tabela*/
 
 
set serveroutput on;

declare
    v_id hr.employees.employee_id%TYPE;
    v_name hr.employees.first_name%TYPE;
    v_sal hr.employees.salary%TYPE;
begin
    select employee_id, first_name, salary
    into v_id, v_name, v_sal
    from hr.employees
    where employee_id=&emp_id;
    
    dbms_output.put_line('ID: ' || to_char(v_id));
    dbms_output.put_line('nome: ' || to_char(v_name));
    dbms_output.put_line('salario: ' || to_char(v_sal));
end;