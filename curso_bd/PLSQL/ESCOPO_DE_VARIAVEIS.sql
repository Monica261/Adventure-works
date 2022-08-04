/*ESCOPO DE VARIAVEIS*/

<<blocoprincipal>>--declaracao de label de escopo
declare
    v_num1 number := 100;
begin
    declare
    v_num1 number := 50;
begin
    dbms_output.put_line('impressao 1 ' || blocoprincipal.vnum1 );
    dbms_output.put_line('impressao 2 ' || vnum1 );
end;
    dbms_output.put_line('impressao 3 ' || vnum1 );
end;

--outro exemplo
declare v_temp number := 100;
begin
    dbms_output.put_line('primeira impressao: '||v_temp);
    declare v_temp number := 200;
    begin
        dbms_output.put_line('segunda impressao: '||v_temp);
    end;
        dbms_output.put_line('terceira impressao: '||v_temp);
end;

