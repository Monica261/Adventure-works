/*CONTROLE DE PERMISSAO*/

select * from mysql.user; -- usuario e provilegios
select * from mysql.db;-- permissao nivel de banco
select * from mysql.tables_priv;-- permissao nivel de tabela
select * from mysql.columns_priv;-- permissao nivel de coluna

/*CRIANDO USUARIOS*/

create user joao@'localhost' identified by '11234'; -- limitando que a conexão do mesmo venha de localhost

create user pedro@'222.222.222.222' identified by '11234'; -- limitando que a conexão do mesmo venha do ip de origem

commit;

/*GRANT - CONCEDENDO PERMISSOES*/

