/*WHILE*/
use universidade_u;

create table log(
	idlog int primary key auto_increment,
    log varchar(260)
);

select * from log;

delimiter $$
create procedure prc_while()
comment 'exemplo de uso do while'
begin
	declare contador int default 1;
    
    while contador < 10 do
		insert into log(log) values(contador);
        
        set contador = contador + 1;
	end while;
end
$$
delimiter ;

call prc_while(); /*executa e faz os inserts*/

drop procedure prc_while;

select * from log;

/*LOOP*/
delimiter $$
create procedure prc_loop()
comment 'exemplo de como utilizar o loop'
begin
	loop_tabu: loop
    
    leave loop_tabu; /*interrompe o loop*/
    end loop loop_tabu;
end;
$$
delimiter ;

/*REPEAT PROCEDURE CRIACAO E INSERÇÃO EM TABELA*/
delimiter $$
create procedure prc_repeat()
comment 'uso do repeat'
begin
	declare z int default 1;
    declare resultado varchar(20);
    
    repeat
    /*set resultado = concat('2 x', z, ' = ', (2*z));*/
    set resultado = 2*z;
    
    insert into log(log) value(resultado);
    
    set z = z + 1;
    
    until z > 10 end repeat;
end
$$
delimiter ;

call prc_repeat();

select * from log;

drop procedure prc_repeat;