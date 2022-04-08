/*LOGS DE ERROS*/

show global variables where variable_name = 'log_error';

show global variables where variable_name = 'datadir';

-- procedure aciona variaveis de escolha do usuario
delimiter $$
create procedure prc_var(in aciona varchar(50))
comment 'proc aciona diretorio log de erros'
begin
	show global variables where variable_name = aciona;
end;
$$
delimiter ;

call prc_var('hostname');

use universidade_u;
show create procedure universidade_u.prc_var;