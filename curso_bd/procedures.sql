/*Stored procedure
refere-se a regras de negocio armazenada no banco de dados
*/

/*Modelo*/
create procedure nome_procedure(parametros)
begin
	/*bloco de código da procedure*/
end
call nome_procedure(parametros)


/*criando primeira procedure*/
delimiter $$
create procedure proc_msg()
begin
	select 'executando primeira procedure criada no banco';
end
$$
delimiter ;

call proc_msg();/*chama a procedure*/

/*LISTAR, MOSTRAR E APAGAR PROCEDURES*/
/*lista as procedures do DB*/
show procedure status where Db = 'universidade_u';

/*mostrar conteudo da procedure*/
show create procedure universidade_u.proc_msg;

/*alterar procedure -> remover a procedure e criar novamente*/
drop procedure universidade_u.proc_msg;/*remove*/

delimiter $$
CREATE PROCEDURE `proc_msg`()
 begin
 	select 'executando primeira procedure criada no banco' as msg;
 end
 $$
 delimiter ;
 
 call proc_msg;
 
 /*PROCEDURES COM PARAMETROS*/
 /*Procedure media ponderada*/
 delimiter $$
 create procedure prc_media_ponderada(
	in nome varchar(100),
    in p1 float(3,1),
    in p2 float(3,1),
    in p3 float(3,1),
    in p4 float(3,1)
 )
comment 'procedure criada para calcular média de notas'
begin
	select nome, (((p1*2)+ (p2*2) + (p3*2) + (p4*3))/10) as 'média ponderada';
end
$$
delimiter ;

call prc_media_ponderada('Mônica', 10, 6, 2, 8)/*executa a procedure*/

/*Procedure para verificar se é maior de idade*/
delimiter $$
create procedure prc_idade(
	in idade float(3)
)
comment 'saber se o usuario é maior de idade'
begin
	if (idade >= 18) then
		select 'maior de idade';
	else
		select 'menor de idade';
	end if;
end;
$$
delimiter ;

call prc_idade(22);

drop procedure universidade_u.prc_idade;

show create procedure universidade_u.prc_idade;

/*Procedure com parametro de saida*/
delimiter $$;
create procedure prc_total(
out total_professores int,
out total_alunos int/*exportar parametros com output*/
)
comment 'resumo do total de alunos e professores'
begin
	select count(*) into total_professores from professor;
    select count(*) into total_alunos from aluno;
end;
$$
delimiter;

show procedure status where Db = 'universidade_u';/*verificar se o procedimento foi criado e armazenado*/

call prc_total(@a, @b);

select @a as total_professores, @b as total_alunos;