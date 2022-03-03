/*Trigger - Before Insert*/
use universidade_u;

-- modelo de sintaxe
delimiter $$
create trigger trg_nome
before insert on nome_da_tabela
for each row -- para cada linha
begin
	
end;
$$
delimiter ;

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

alter table funcionario_log modify column tipo_log varchar(20);

-- criando trigger before insert
delimiter $$
create trigger trg_funcionario_before_insert
before insert on funcionario
for each row
begin
	insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
    values(null, 'BI', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

drop trigger trg_funcionario_before_insert;

INSERT INTO universidade_u.funcionario(telefone, funcao, nome) VALUES ('98524-8605', 'Dev Junior', 'Pedro');

select * from funcionario;
select * from funcionario_log;

-- mostrar triggers existentes no banco
show triggers;

-- verificar a instrução da trigger
show create trigger universidade_u.trg_funcionario_before_insert;

-- remover trigger
drop trigger universidade_u.trg_funcionario_before_insert;

-- listar trigger de uma determinada tabela
show triggers where `table` = 'funcionario';

/*Trigger - after insert*/
delimiter $$
create trigger trg_funcionario_after_insert
after insert on funcionario
for each row
begin
	insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
    values(NEW.idmatricula, 'BI', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

INSERT INTO universidade_u.funcionario(telefone, funcao, nome) VALUES ('99457-7432', 'analista contabil', 'Caio');

select * from funcionario;
select * from funcionario_log;

/*Trigger - before delete*/

delimiter $$
create trigger trg_funcionario_before_delete
before delete on funcionario
for each row
begin
	insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
    values(null, 'Before Delete', OLD.funcao, null, OLD.telefone, null );
end 
$$
delimiter ;

delete from universidade_u.funcionario
where idmatricula = 4;

drop trigger trg_funcionario_before_delete;

set foreign_key_checks = 0; -- desabilita as foreigns key

select * from funcionario;
select * from funcionario_log;
