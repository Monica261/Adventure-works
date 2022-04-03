/*existem var dinamicas que podem ser modificadas no tempo de execução*/
show variables where Variable_name = 'max_connections'; -- buscar variavel do sistema

set global max_connections = 300; -- setar a variavel

/*VAR SOMENTE DE LEITURA*/
set global port = 3307;

-- MODIFICAR VAR DE SISTEMA EM UM ESCOPO GLOBAL

show global variables; -- exibe as variaveis globais

show global variables where Variable_name like 'auto%';

/*para utilizar na linha de comando:*/
set @@session.auto_increment_increment = 10;
set @@session.auto_increment_offset = 5;

use universidade_u;
create table t2(
	idT1 int primary key auto_increment,
    nome varchar(250)
);

insert into t2(nome) values('Monica');

select * from t2;

/*--------------------------------------------------------*/

/*VAR DE STATUS*/
-- uptime - quanto tempo desde que o mysql foi iniciado
-- bytes_received - numero de bytes recebidos
-- bytes_sent - numero de bytes enviados do servidor para os clientes

show global status where Variable_name in ('uptime', 'bytes_received', 'bytes_sent');

-- verificar o status da var local, pode utilizar 'local' ou 'session'
show local status where Variable_name in ('uptime', 'bytes_received', 'bytes_sent');
