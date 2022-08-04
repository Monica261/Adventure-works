--conjunto de caracteres

/*
; - termina os statementos de declarações
% - indicador de atributo
@ - indicador de localização
<<e>> - delimitadores de labels
:= - é indicador de atribuição de valor a variaveis
=> - é operador de associação para notação posicional
.. - operador de range
*/

--variaveis

/*
para inicializar uma var pode utilizar o operado := ou a palavra chave DEFAULT, ex:
vFrase varchar2(30) := 'Olá mundo';
OU
vFrase varchar2(30) DEFAULT 'Olá mundo';
*/

DECLARE
VdataNasc DATE;
VcodFunc NUMBER(2) not null := 10;
Vcidade varchar2(30) := 'SJC';
VPI constant number := 3.1415;
Vbloqueado boolean := false;
BEGIN;

SET SERVEROUTPUT ON
DECLARE
    v_total_sal number(10,2);
    v_depto number;
    v_qtd int;
    
BEGIN
    v_depto := 100;
    select sum(salary), count(*) qtd
    into v_total_sal, v_qtd
    from hr.employees 
    where department_id=v_depto;
    
    dbms_output.put_line('total salario depto: ' ||v_depto|| ' é '||v_total_sal);
END;
