use universidade_u;

/*MODELO DE ESTRUTURA
case <valor>
	when <comparacao> then
		<instrucao que deve ser executada se a comparação for verdadeira>
	when <comparacao> then
		<instrucao que deve ser executada se a comparação for verdadeira>
	else
		<caso nenhuma das comparações anteriores forem verdadeiras>
end case; 
*/

delimiter $$
create procedure prc_case_exemplo(in opcao float)
comment 'procedure para exemplo de case'
begin
	/*declare opcao int default 1;*/
    
    case opcao
		when 1 then select 'instrução 1';
        when 2 then select 'instrução 2';
        when 3 then select 'instrução 3';
        when 4 then select 'instrução 4';
        else
			select 'escolha de 1 a 4';
	end case;
end;
$$
delimiter ;

drop procedure prc_case_exemplo;

call prc_case_exemplo(3);

/*VERIFICAR IDADE COM CASE*/
delimiter $$
create procedure prc_case_idade(in idade float)
comment 'verificar idade do usuario a partir de case'
begin
	case /*quando for para verificar condicional(expressão logica), não precisa passar a var no case*/
		when idade < 18 then select 'criança';
		when idade >= 18 and idade < 23 then select 'jovem';
        when idade > 23 and idade < 50 then select 'adulto';
        when idade > 50 then select 'idoso';
	else
		select 'insira uma idade';
	end case;
end;
$$
delimiter ;

drop procedure prc_case_idade;

call prc_case_idade(15)

/*VERIFICAR DATA ATUAL NO BANCO COM CASE*/
delimiter $$
create procedure prc_data_atual()
comment 'verificando data atual no banco'
begin
	declare data_teste date;
	set data_teste = curdate() + 1; /*+1 - futuro	-1 - passado*/
    
    case
		when data_teste = curdate() then select 'presente' as data_teste;
        when data_teste < curdate() then select 'passado' as data_teste;
        when data_teste > curdate() then select 'futuro' as data_teste;
	else
		select 'nenhuma das anterioes';
	end case;
end
$$
delimiter ;

drop procedure prc_data_atual;

call prc_data_atual();