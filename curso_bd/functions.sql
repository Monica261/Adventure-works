-- Funções são rotinas que retornam valores ou tabelas
use universidade_u;
-- modelo
delimiter $$
create function func_modelo()
returns int -- tipo_de_dados_que_sera_retornado;
begin
	
    /*bloco de codigo da funcao*/
    return -- retorno da função
end;
$$ 
delimiter ;

-- função para formatar data
delimiter $$
create function fnc_data(p_data datetime)
returns char(10)
deterministic -- indica que a função não vai afetar o banco
begin
	return date_format(p_data, '%d/%m/%y');
end
$$
delimiter ;

/*chama a função com select*/
select fnc_data(data_nascimento) from aluno; 

select fnc_data(sysdate());

-- para remover function
drop function fnc_data;

-- exibir a instrução de criação
show create function universidade_u.fnc_data;

-- para alterar uma função, basta remover e criar ela de novofnc_data

-- função idade
delimiter $$
create function fnc_idade(p_data date)
returns int
deterministic
comment 'função determina idade'
begin
	return timestampdiff(year, p_data, curdate());
end;
$$
delimiter ;

select concat('A idade é: ', fnc_idade(data_nascimento), ' anos') as idade_aluno from aluno;

/*Função não deterministica*/
delimiter $$
create function fnc_addvalor(valor longtext)
returns longtext
comment 'função não deterministica'
begin
	return concat('$ ', format(valor, 2));
end;
$$
delimiter ;

select fnc_addvalor('526340') as valor_formatado;

drop function fnc_addvalor;

-- desabilitar a opção deterministica
SET GLOBAL log_bin_trust_function_creators = 0;

