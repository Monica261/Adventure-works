--temp table
/*
temporary - indica que a tabela criada será temporaria, oq significa que ela expira assim que sua sessão ou 
transação no oracle terminar
*/

create global temporary table minha_temp(
    id number,
    nome varchar(20)
)
on commit delete rows;

--inserindo, mas nao realizando commit
insert into minha_temp values(1, 'Teste1');
insert into minha_temp values(1, 'Teste2');
insert into minha_temp values(1, 'Teste3');

--analisando conteudo da temp
select count(*) from minha_temp;

select * from minha_temp;

--commit and check contents
commit;

--criando uma tabela com dados de uma normal
create global temporary table empregados_temp(
    employee_id number(6, 0) not null
    first_name varchar2(20),
    last_name varchar2(25),
    comission_pct number(2)
) 
on commit delete rows;

--inserindo registros na temp
insert into empregados_temp
select emp.employee_id, emp.first_name, emp.commision_pct
from hr.employee emp;

--retornando
select count(*) from empregados_temp;

drop table empregados_temp;
drop table minha_temp;