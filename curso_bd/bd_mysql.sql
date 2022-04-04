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