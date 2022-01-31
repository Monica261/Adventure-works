use universidade_u;

/*MODELO DE ESTRUTURA
begin
	if <condicao> then
		<logica a ser passada>
	else
		<logica a ser passada>
	end if
end;
*/

/*CONDICIONAL MAIOR DE IDADE*/
delimiter $$
create procedure condicional(in idade float)
	comment 'exemplo de como usar IF e ELSE'
	begin
		if idade >= 18 then
			select 'maior de idade' as resultado;
		else
			select 'menor de idade' as resultado;
		end if;
	end;
$$
delimiter ;

call condicional(25);

drop procedure condicional;


/*CONDICIONAL SEXO BASEADO NA TABELA ALUNO*/
delimiter $$
create procedure prc_genero()
begin
	if(select sexo from aluno as a where a.idaluno = 8) = 'M' then
		select 'o aluno é do sexo masculino' as genero;
	elseif(select sexo from aluno as a where a.idaluno = 8) = 'F' then
		select 'o aluno é do sexo feminino' as genero;
	else
		select 'definir genero do aluno' as genero;
	end if;
end;
$$
delimiter ;

drop procedure prc_genero;

call prc_genero()

/*genero definido em variavel*/
delimiter $$
create procedure prc_var_genero()
begin
	declare sexo char(1);
	set sexo = 'M';
    
	if sexo = 'M' then
		select 'genero masculino';
	elseif sexo = 'F' then
		select 'genero feminino';
	else
		select 'definir genero';
	end if;
end;
$$
delimiter ;

drop procedure prc_var_genero;

call prc_var_genero();

/*CONDICIONAL PARA SABER ONDE A IDADE DO ALUNO ENCAIXA*/
delimiter $$
create procedure prc_idade_ifelse()
comment 'uso de condicional para saber idade do aluno'
begin
	declare idade int;
	set idade = (select timestampdiff(year, data_nascimento, curdate()) as idade_aluno from aluno where idaluno = 5);

	if idade >= 0 and idade <= 15 then
		select 'criança';
	elseif idade > 15 and idade <= 29 then
		select 'jovem';
	elseif idade > 29 and idade <= 59 then
		select 'adulto';
	else 
		select 'idoso';
	end if;
end;
$$
delimiter ;

call prc_idade_ifelse();