 
/*CURSOR*/

set serveroutput on

declare
    viDFunc hr.employees.employee_id%type;
    vNome hr.employees.first_name%type;
    vSalario hr.employees.salary%type;
    
--declaracao de cursor
cursor  cs_salarios_top_10 is
    select a.employee_id, a.first_name, a.salary
    from hr.employees a
    order by a.salary desc;
begin
    --abre o cursor
open cs_salarios_top_10;

--executa loop com 10 ciclos
for i in 1..10 loop

--extrai dados o registro corrente do cursor e avança para o proximo
fetch cs_salarios_top_10 into viDFunc, vNome, vSalario;

--imprime os dados extraidos na tela
dbms_output.put_line(viDFunc || ' - ' || vNome || ' - ' || vSalario)
end loop;

--fecha o cursor
close cs_salarios_top_10;
-------------------------------------------

--caso real para saber os dez maiores pagamentos do financeiro
declare 
      vValorAlto dbamv.con_pag.vl_bruto_conta%type;
      vConta dbamv.con_pag.cd_con_pag%type;

cursor cs_alto_pagamentos is
select cp.vl_bruto_conta, cp.cd_con_pag
from dbamv.con_pag cp
order by 1 desc; 
begin  
  open cs_alto_pagamentos;

  for i in 1..10 loop
    
  fetch cs_alto_pagamentos into vValorAlto, vConta;

  dbms_output.put_line('Contas com os valores mais altos: '|| vConta || ' - ' || to_char(vValorAlto, 'FM999G999G999G999D99'));
  end loop;

  close cs_alto_pagamentos;
end;
/


-----------------------------------------

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

-------------------------------------------------------
--declaracao tipo de registro
type TFuncionario is record(
    viDFunc hr.employees.employee_id%type,
    vNome hr.employees.first_name%type,
    vSalario hr.employees.salary%type
);

vFunc TFuncionario;

cursor cs_func%isopen is
select a.employee_id, a.first_name, a.salary
from hr.employees a
order by 3 desc;

begin
 --abertura do cursor se ainda nao estiver aberto
 if not cs_func%isopen then
   open cs_func;
 end if;
 
 --executa loop
 loop
   --extrai daddos do cursor e avanca para o proximo
   fetch cs_func into vFunc;
   
   --sai do loop quando nao existir mais intens para processaar
   exit when cs_func%NOTFOUND;
   
   --imprime dados extraidos na tela
   dbms_output.put_line(VFunc.viDFunc ||' - '|| VFunc.vNome ||' - '|| VFunc.vSalario);
 end loop;
 
--fechar o cursor
close cs_func;
end;
/
-------------------------------------------------------
--cursor implicito oracle

begin
    --inicia o loop no conjunto ativo do cursor
    for vFunc in (select a.employee_id, a.first_name, a.salary from hr.employees a order by 3 desc)
    loop
    
        --imprimir dados na tela
        dbms_output.put_line(vFunc.employee_id || ' - ' || vFunc.first_name || ' - ' || vFunc.salary);
    end loop;
end;