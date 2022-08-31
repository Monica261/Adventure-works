--CRIANDO TABELA PARA USO DE PIVOT
--DROP TABLE VOLUME_VENDAS
CREATE TABLE VOLUME_VENDAS
(
 PRODUTO VARCHAR2(50) NOT NULL,
 DEPTO    VARCHAR2(15) NOT NULL,
 QTDE     INT          NOT NULL,
 MES      INT          NOT NULL
 );
 
--CARGA DE DADOS
insert into volume_vendas values ('Pão','Padaria','72','1');
insert into volume_vendas values ('Roscas','Padaria','34','1');
insert into volume_vendas values ('Biscoitos','Padaria','45','1');
insert into volume_vendas values ('Bolos','Confeitaria','11','1');
insert into volume_vendas values ('Tortas','Confeitaria','96','1');
insert into volume_vendas values ('Pão','Padaria','52','2');
insert into volume_vendas values ('Roscas','Padaria','47','2');
insert into volume_vendas values ('Biscoitos','Padaria','31','2');
insert into volume_vendas values ('Bolos','Confeitaria','60','2');
insert into volume_vendas values ('Tortas','Confeitaria','38','2');
insert into volume_vendas values ('Pão','Padaria','29','3');
insert into volume_vendas values ('Roscas','Padaria','63','3');
insert into volume_vendas values ('Biscoitos','Padaria','95','3');
insert into volume_vendas values ('Bolos','Confeitaria','73','3');
insert into volume_vendas values ('Tortas','Confeitaria','72','3');
insert into volume_vendas values ('Pão','Padaria','82','4');
insert into volume_vendas values ('Roscas','Padaria','72','4');
insert into volume_vendas values ('Biscoitos','Padaria','61','4');
insert into volume_vendas values ('Bolos','Confeitaria','70','4');
insert into volume_vendas values ('Tortas','Confeitaria','30','4');
insert into volume_vendas values ('Pão','Padaria','85','5');
insert into volume_vendas values ('Roscas','Padaria','48','5');
insert into volume_vendas values ('Biscoitos','Padaria','50','5');
insert into volume_vendas values ('Bolos','Confeitaria','17','5');
insert into volume_vendas values ('Tortas','Confeitaria','15','5');
insert into volume_vendas values ('Pão','Padaria','23','6');
insert into volume_vendas values ('Roscas','Padaria','67','6');
insert into volume_vendas values ('Biscoitos','Padaria','94','6');
insert into volume_vendas values ('Bolos','Confeitaria','80','6');
insert into volume_vendas values ('Tortas','Confeitaria','58','6');


--usando o pivot
select * from(
select produto, qtde, mes from volume_vendas
)
pivot(
sum(qtde)
for mes in (1,2,3,4,5,6)
)
order by produto