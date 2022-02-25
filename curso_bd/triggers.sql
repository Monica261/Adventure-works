/*Trigger - Before Insert*/

-- modelo de sintaxe
create trigger trg_nome
before insert on nome_da_tabela
for each row -- para cada linha
begin
	
end;

/*preparo do ambiente*/
use universidade_u;

create table funcionario_log (
    idfuncionario_log int auto_increment PRIMARY KEY,
    fk_idmatricula int,
    data_log datetime, 
    tipo_log char(2) not null,
    funcao_antiga varchar(50),
    funcao_nova varchar(50),
    telefone_antigo varchar(20),
    telefone_novo varchar(20)
);