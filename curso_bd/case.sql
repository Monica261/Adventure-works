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

call prc_case_exemplo(2);