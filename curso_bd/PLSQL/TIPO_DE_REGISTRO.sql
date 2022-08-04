/*TIPO DE REGISTRO*/

set serveroutput on;

declare
--definicao de tipos
type Tfuncionario is record(
    nome varchar2(40),
    depto varchar2(20),
    salario number(10,2)
);

--declaracao de variaveis
vFunc Tfuncionario;

begin
--atribuir valor para o registro vProduto
select a.first_name, a.department_id, a.salary
into vFunc.nome, vFunc.depto, vFunc.salario
from hr.employees a
where a.employee_id = 102;

--imprimir na tela os dados recuperados
dbms_output.put_line('Nome do produto: ' || vFunc.nome || char(10) ||
'Depto: '|| vFunc.depto || char(10) ||
'Salario: '|| vFunc.depto || to_ char(vFunc.salario)
);

end;
