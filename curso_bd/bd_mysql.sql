show databases;

use mysql;

show tables;

/*permissões de usuarios*/
select * from user;

/*status das tabelas do bd*/
select * from innodb_table_stats;

/*logs do banco*/
select * from slow_log;
select * from general_log;

-- topicos para ajudar usuario
select * from help_topic where name like 'JOIN%'