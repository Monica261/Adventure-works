/**/
use universidade_u;

create table calendario(
idcalendario int not null primary key auto_increment,
`data` date not null,
dia int(2) not null,
mes int(2) not null,
ano int(2) not null,
feriado enum('s', 'n'),
nome_feriado varchar(60)
)

/*preenche a tabela com base no tempo*/

delimiter $$
create procedure proc_calendario(in p_data_inicio date, p_data_fim date)
comment 'Procedimento para definição do calendário acadêmico com base em uma bata início e fim'
begin

	declare v_dia, v_mes int(2);
    declare v_ano int(4);
    declare v_feriado char(1);
    declare v_nome_feriado varchar(50);

	/* select p_data_inicio as data_inicio, p_data_fim as data_fim; */
	
    while p_data_inicio <= p_data_fim do /* '2019-01-01' <= '2019-12-31' */
    
		set v_dia = extract(day from p_data_inicio);
        set v_mes = extract(month from p_data_inicio);
        set v_ano = extract(year from p_data_inicio);
        
        -- add feriados em uma condicional
        if v_dia = 1 and v_mes = 1 then
			set v_feriado = 's';
            set v_nome_feriado = 'confraternização universal';
		elseif v_dia = 25 and v_mes = 12 then
			set v_feriado = 's';
            set v_nome_feriado = 'natal!';
		else
			set v_feriado = 'n';
            set v_nome_feriado = 'não é feriado';
        end if;
    
		insert into calendario(`data`, dia, mes, ano, feriado, nome_feriado)values(p_data_inicio, v_dia, v_mes, v_ano, v_feriado, v_nome_feriado);
		
        set p_data_inicio = date_add(p_data_inicio, interval 1 day); /* 2020-01-01 */
    end while;
end
$$
delimiter ;

drop procedure proc_calendario;

call proc_calendario('2021-01-01', '2022-11-26');

select * from calendario where feriado = 's';

truncate table calendario;