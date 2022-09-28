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

------------------------------
create or replace procedure proc_info_mens
is
  cursor fun_mens is
  select mc.cd_contrato, mc.cd_mens_contrato, mc.vl_mensalidade
  from dbaps.mens_contrato mc
  where mc.cd_contrato = 92908;
  
  fun_cont fun_mens%rowtype;
begin
  for fun_cont in fun_mens
    loop
      dbms_output.put_line('Código contrato: ' || fun_cont.cd_contrato ||
      'Titulo: ' || fun_cont.cd_mens_contrato || 'Valor mens: ' || fun_cont.vl_mensalidade);
    end loop;
   /* exception
      when others then
        dbms_output.put_line('Erro: ' || sqlerrem);*/
end;
  
alter procedure dbaps.proc_info_mens recompile;

begin
  proc_info_mens;
end;

execute dbaps.proc_info_mens;


------------------------------
--procedure calculadora
create or replace procedure proc_calc(
    operacao in varchar,
    pnum1 in number,
    pnum2 in number,
    retorno out number
)

is 
msg_outras exception;

begin
if operacao = 'A' then
    retorno := pnum1 + pnum2;
    elsif operacao = 'S' then
        retorno := pnum1 - pnum2;
    elsif operacao = 'M' then
        retorno := pnum1 * pnum2;
    elsif operacao = 'D' then
        retorno := pnum1 / pnum2;
else
    raise msg_outras;
end if;
    exception
        when msg_outras then
        dbms_output.put_line('Erro não catalogado');
    when others then
        dbms_output.put_line('Erro: '||SQLERRM);
end;

--execucao
declare
retorno number:=0;
begin
   proc_calc('S', 5, 2, retorno);
   DBMS_OUTPUT.put_line(retorno);
end;

------------------------------------
--procedure que faz copia de tabela ao ser executada
select * from hr.employees;

--criando tabela de copia
CREATE TABLE EMPLOYEES_COPIA 
   (	
   "EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE) CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(25 BYTE) CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE, 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE, 
	"JOB_ID" VARCHAR2(10 BYTE) CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE, 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
);

--criando proc
create or replace procedure proc_copia_func is

begin
    for func in (select * from hr.employees)
    loop
        insert into employees_copia(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
        values(func.employee_id, func.first_name, func.last_name, func.email, func.phone_number, func.hire_date, func.job_id, func.salary, func.commission_pct, func.manager_id, func.department_id);
    end loop;
commit;
exception
    when others then
        dbms_output.put_line('Erro: '||SQLERRM);
end proc_copia_func;

execute proc_copia_func;

SELECT * from employees_copia;

------------------------------------
/*PROCEDURES DE ESTOQUE*/
create table material(
cod_mat int primary key,
descricao varchar2(50) not null,
preco_unit number(10,2)
);

create sequence seq_cod_mat
increment by 1
start with 1
order
cache 10;

create table estoque(
cod_mat int primary key not null,
saldo decimal(10, 2) null
);

create table estoque_lote(
cod_mat int not null,
lote varchar2(15) not null,
saldo decimal(10,2) null,
foreign key (cod_mat) references material(cod_mat),
primary key(cod_mat, lote)
);

create table mov_estoque(
transacao int primary key not null,
mov varchar2(1) not null,
cod_mat int not null,
lote varchar(15) not null,
qtd int not null,
usuario varchar2(30) not null,
dt_hor_mov date not null
);

create sequence seq_mov_estoque
increment by 1
start with 1
order
cache 10;

alter table estoque add foreign key(cod_mat) references material(cod_mat);

alter table mov_estoque add foreign key(cod_mat) references material(cod_mat);

insert into material values(seq_cod_mat.nextval, 'SMART TV 45', 2200.50);
insert into material values(seq_cod_mat.nextval, 'CELULAR SAMSUNG', 3200.90);
insert into material values(seq_cod_mat.nextval, 'GELADEIRA BRASTEMP', 4500.00);

set serveroutput on

--pegar usuarioo, senha e IP
BEGIN
 dbms_output.put_line(ora_login_user||' ' ||ora_des_encrypted_password ||' '||ora_client_ip_address|| ' is the current user.');
 END;
 
 --usuarios logados com sess�es ativas
 SELECT USERNAME, STATUS
 FROM GV$SESSION
 WHERE USERNAME IS NOT NULL
 ORDER BY USERNAME ;