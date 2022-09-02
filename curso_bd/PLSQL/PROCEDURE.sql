/*CRIANDO PROCEDURE*/ 
--AULA https://youtu.be/QLpIPnwADeY

CREATE OR REPLACE PROCEDURE SP_CONFERE_NM_FUNCIONARIO (
    P_ID_FUNCIONARIO NUMBER,
    P_NM_FUNCIONARIO VARCHAR2
) IS
 
    V_NM_FUNCIONARIO HR.EMPLOYEES.FIRST_NAME%TYPE; 
    V_PH_NUMBER HR.EMPLOYEES.PHONE_NUMBER%TYPE; 
BEGIN 
    --CRIAÇÃO DE UM CURSOR EXPLICITO 
    SELECT PHONE_NUMBER, FIRST_NAME 
    INTO V_PH_NUMBER, V_NM_FUNCIONARIO -- JOGANDO DENTRO DE UMA VARIAVEL O FIRST_NAME 
    FROM HR.EMPLOYEES 
    WHERE EMPLOYEE_ID = P_ID_FUNCIONARIO; 
     
     
    IF V_NM_FUNCIONARIO <> P_NM_FUNCIONARIO THEN 
        DBMS_OUTPUT.PUT_LINE('NOME: ' || V_NM_FUNCIONARIO || V_PH_NUMBER); -- PACKAGE INTERNA DO ORACLE ONDE POSSUI VARIAS PROCEDURES, PARA CHAMADA DA MESMA PRECISA SER DESSA FORMA 
    ELSE 
        DBMS_OUTPUT.PUT_LINE('NOT OK'); 
    END IF; 
 
END SP_CONFERE_NM_FUNCIONARIO;

-- CHAMAR A PROCEDURE QUE FOI CRIADA PASSANDO OS PARAMETROS
BEGIN
    SP_CONFERE_NM_FUNCIONARIO(P_ID_FUNCIONARIO => 102,P_NM_FUNCIONARIO => 'LEX');
END;

------------------------------------------------------------------------------------

create or replace procedure detalhes_dos_funcionarios is
    cursor emp_cur is
        select first_name, last_name, salary from hr.employees;
    emp_rec emp_cur%rowtype; ---recebe todas as infos do cursor sem precisar declarar variavel
begin
    for emp_rec in emp_cur
    loop
        dbms_output.put_line('Nome do funcionario: ' || emp_rec.first_name);
        dbms_output.put_line('Sobrenome do funcionario: ' || emp_rec.last_name);
        dbms_output.put_line('Salario do funcionario: ' || emp_rec.salary);
        dbms_output.put_line('-------------------------------------------------------');
    end loop;
end;

--executando a procedure
begin
    detalhes_dos_funcionarios;
end;

--outra forma de execução
execute detalhes_dos_funcionarios;
