--CASE
set serveroutput on;
accept v_nota_dig prompt 'Digite sua nota: ';

declare
    v_nota integer;
    v_msg varchar2(100);
begin
    v_nota := &v_nota_dig;
    
    case v_nota
        when 10 then dbms_output.put_line('Nota excelente');
        when 9 then dbms_output.put_line('Nota muito boa');
        when 8 then dbms_output.put_line('Boa nota');
        when 7 then dbms_output.put_line('Nota na midia');
        when 6 then dbms_output.put_line('Nota abaixo da media');
        else 
         -- select ('Sem classificação') into v_msg from dual;
         dbms_output.put_line('Sem classificação');
    end case;
end;

--utilizando exception e sem else no case
declare
    v_nota integer;
    v_msg varchar2(100);
begin
    v_nota := &v_nota_dig;
    
    case v_nota
        when 10 then dbms_output.put_line('Nota excelente');
        when 9 then dbms_output.put_line('Nota muito boa');
        when 8 then dbms_output.put_line('Boa nota');
        when 7 then dbms_output.put_line('Nota na midia');
        when 6 then dbms_output.put_line('Nota abaixo da media');
    end case;
        EXCEPTION
          when case_not_found then
          --select ('error') into v_msg from dual;
          dbms_output.put_line('error');
end;


/*CASE EM COLUNAS DE CONSULTAS PL/SQL - CASO DE USO REAL*/

select lc.cd_usuario, lc.dt_realizacao,
case 
  when lc.cd_usuario = 'TRODRIGUES' then 'foi a thais rodrigues'
  when lc.cd_usuario != 'TRODRIGUES' then 'não foi a thais rodrigues'
end as condicional_nome
from dbaps.log_contrato lc
where lc.cd_usuario = 'TRODRIGUES'
and lc.dt_realizacao < to_char(SYSDATE, 'DD/MM/YYYY')
order by lc.dt_realizacao asc