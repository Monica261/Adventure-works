/*IF E ELSE*/
--bloco if then comparando valores
set serveroutput on;

accept v_digitado prompt 'digite o numero da sorte: '
declare
       v_numero int;
      -- v_sorte:=5;
begin
  v_numero:=12;
  if v_numero = 2 then
    dbms_output.put_line('Parabens, vc acertou!');
  elsif v_numero > 10 and v_numero < 15 then
    dbms_output.put_line('vc é fera no oracle');
  else
    dbms_output.put_line('ishe, vc errou!');
  end if;
end;

--bloco if com variaveis
set serveroutput on;

accept v_digitado prompt 'digite o numero da sorte'
declare
       v_numero int;
       v_sorte int default 5;
begin
  v_numero:=&v_digitado;
  if v_numero = v_sorte then
    dbms_output.put_line('Parabens, vc acertou!');
  elsif v_numero > 10 and v_numero < 15 then
    dbms_output.put_line('vc é fera no oracle');
  else
    dbms_output.put_line('ishe, vc errou!');
  end if;
end;