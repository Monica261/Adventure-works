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

/*LOGS GERAIS*/
use universidade_u;

call prc_var('general_log_file'); -- mostra o arquivo que armazena log: DESKTOP-ALHV5A6.log

call prc_var('datadir'); -- caminho onde fica o arquivo que armazena o log

set @@global.general_log = 'ON';-- para esse arquivo existir, é preciso habilitar o mesmo

select * from aluno a -- executando query para ver se a mesma aparece no arquivo de log que habilitamos
where a.sexo = 'F';

set @@global.general_log = 'OFF'; -- desabilita para que o mesmo não fique muito grande devida a grande quant de logs


/*LOGS DE CONSULTAS LENTAS*/

call prc_var('slow_query_log_file'); -- consulta qual arquivo registra os logs slow

show global variables where variable_name = 'slow_query_log_file'; /* .\WINDOWNS-PC.log */
/* global read only */

show global variables where variable_name = 'datadir'; /* C:\mysql_dados\Data\ */
/* global read only */

show global variables where variable_name = 'slow_query_log'; /* ON -> ativo | OFF -> inativo */
/* global dinâmica */

show global variables where variable_name = 'long_query_time'; /* segundos */
/* global dinâmica */

set global long_query_time = 4;

select sleep(5), 'Query muito lenta!!!';

/*LOGS BINARIOS -> são registrados a cada alteração no banco*/
use universidade_u;

call prc_var('log_bin_basename'); -- exibe a base da criação para os logs binarios, arquivos que possuem nr sequencial

call prc_var('log_bin'); -- verifica se o armazenamento esta ON ou OFF

-- criterios para que esses arquivos sejam criados:
-- banco de dados é iniciado
call prc_var('max_binlog_size');-- bytes 
select ((1073741824/1024) / 1024) / 1024; -- descobrir o gb do arquivo de log

-- saber por quantos dias os arquivos de logs serão preservados

call prc_var('binlog_expire_logs_seconds');
select ((2592000 / 60) / 60) / 24 as dias_expirar; 
