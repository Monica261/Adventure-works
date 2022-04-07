show databases;

use mysql;

show tables;

-- permissões de usuarios
select * from user;

-- status das tabelas do bd
select * from innodb_table_stats;

-- logs do banco
select * from slow_log;
select * from general_log;

-- topicos para ajudar usuario
select * from help_topic where name like 'JOIN%';

/*BD PADRÃO - PERFORMANCE SCHEMA
Tabelas que armazenam infos de execução do servidor mysql em baixo nivel:
-logs de eventos do servidor em tempo de execução
-desempenho - performance
-conexões ativas de hosts e usuarios
*/
show databases;

use performance_schema;

-- inspecionar as variaveis de sistema e de status
select * from global_status;
select * from global_variables;

-- analisar os clientes conectados ao servidor
select * from hosts;

show tables;

/*BD PADRÃO - INFORMATION SCHEMA
Tabelas que armazenam infos sobre os dados(metadados):
- nomes de bancos e tabelas
- tipos de dados das colunas das tabelas
- triggers e views
*/

use information_schema;

show tables;

-- mostra as conexões abertas
select * from processlist;

-- detalhes sobre as tabelas
select 
	table_name as nome,
    table_rows as n_de_linhas,
    table_comment as comentario,
    (data_length + index_length) as total_bytes,
    (((data_length + index_length)/1024)/1024) as total_mega_bytes
from tables
where table_schema = 'universidade_u'
and table_type = 'BASE TABLE'
order by n_de_linhas desc;

-- verificar triggers e views
select * from triggers;

select * from views;

/*BD SYS
armazena views que permite analisar resumidamente
*/

use sys;

show tables;

select * from host_summary_by_statement_latency;