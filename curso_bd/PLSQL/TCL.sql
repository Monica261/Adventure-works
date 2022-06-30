--TCL CONTROLE DE TRANSACOES

create table cadastro(
nome varchar2(50) not null,
docto varchar2(20) not null
);

--insere registros
insert into cadastro values('M�nica', '51263');
insert into cadastro values('Ester', '63911');
insert into cadastro values('Pedro', '71264');

--verificando se foram inseridos
select * from cadastro;

--voltando para o estado atual antes da altera��o
rollback;

--efetivar/salvar as altera��es
commit;

--utilizando savepoint -> definir ponto para cada insert
insert into cadastro values('M�nica', '51263');
savepoint p1;
insert into cadastro values('Ester', '63911');
savepoint p2;
insert into cadastro values('Pedro', '71264');
savepoint p3;

--utilizando o rollback com o savepoint de referencia
rollback to savepoint p2;

select * from cadastro;