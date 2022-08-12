set serveroutput on

--usando isopen
declare
    --declaracao de variavel
    viDFunc hr.employees.employee_id%type;
    vNome hr.employees.first_name%type;
    vSalario hr.employees.salary%type;
    
    --declaracao de cursores
    cursor c_top_10 is
    select a.employee_id, a.first_name, a.salary
    from hr.employees a
    order by 3 desc;
begin
    --abre o cursor
    if not c_top_10%isopen then
        open c_top_10;
    end if;
    
    --executa loop
    for i in 1..10 loop
    
    --extrai dados dos registros recorrentes do cursor e avanca para o proximo
    fetch c_top_10 into viDFunc, vNome, vSalario;
    
    --imprime os dados na tela
    dbms_output.put_line(i || ' - ' || viDFunc || ' - ' || vNome || ' - ' || vSalario);
    end loop;
close c_top_10;
end;
/