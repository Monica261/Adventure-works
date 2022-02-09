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
create procedure prc_calendario(in p_data_inicio date, in p_data_fim date)
comment 'procedimento armazenada - calendario academico'
begin
	declare v_dia, v_mes int(2); /*defini as variaveis que terão o valor extraido*/
    declare v_ano int(4);
    
	while p_data_inicio <= p_data_fim do
		set v_dia = extract(day from p_data_inicio);
        set v_mes = extract(month from p_data_inicio);
        set v_ano = extract(year from p_data_inicio); /*setar as variaveis para conseguir extrair o valor das mesmas*/
       
		insert into calendario(`data`, dia, mes, ano) values(p_data_inicio, v_dia, v_mes, v_ano); /*insere as var extraidas*/
		set p_data_inicio = date_add(p_data_incio, interval 1 day);
        
    end while;
end
$$
delimiter ;

drop procedure prc_calendario;

call prc_calendario('2021-02-19', '2022-11-26');