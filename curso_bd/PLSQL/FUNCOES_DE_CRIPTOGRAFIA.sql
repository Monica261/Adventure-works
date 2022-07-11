set serveroutput on

--cripty/descrypt base 64
declare
    v_str varchar2(100);
    v_frase varchar2(100);
    
begin

--atribuindo valor
v_frase:='utilidades oracle';

v_str:=utl_encode.text_encode(v_frase, 'WE8ISO8859P1', utl_encode.base64);

dbms_output.put_line(v_frase);

v_str:=utl_encode.text_encode(v_str, 'WE8ISO8859P1', utl_encode.base64);

dbms_output.put_line(v_str);

end;