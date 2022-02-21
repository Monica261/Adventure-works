use universidade_u;

/*criação da tabela contrato e boleto*/
create table contrato(
	idcontrato int not null auto_increment,
    fk_idaluno int not null,
    fk_idcurso int not null,
    fk_data_inscricao_curso datetime not null,
    valor_total_curso float(8,2) not null,
    desconto float(4,1) not null default 0,
    numero_parcelas int not null,
    processado enum('n', 's') default 'n',
    constraint pk_idcontrato primary key(idcontrato)
);

alter table contrato add constraint fk_contrato_aluno_curso

foreign key(fk_idaluno, fk_idcurso, fk_data_inscricao_curso)

references aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso);

alter table aluno_curso drop column valor_pago_curso;

create table boleto(
	idboleto int primary key auto_increment,
    fk_idcontrato int,
    data_vencimento date not null,
    valor float(8,2) not null,
    numero_parcela int not null
);

/* */
select * from aluno;
select * from curso;
select * from aluno_curso;
select * from contrato;
select * from boleto;
/* */

insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(1, 2, '2019-01-07 12:00:00');
insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(2, 3, '2019-01-12 17:30:00');
insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(3, 1, '2019-01-09 09:45:00');
insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(4, 4, '2019-02-01 13:20:00');

select * from aluno_curso;

insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(1, 2, '2019-01-07 12:00:00', 1500.00, 12);
insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(2, 3, '2019-01-12 17:30:00', 1300.00, 12);
insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(3, 1, '2019-01-09 09:45:00', 900.00, 10);
insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(4, 4, '2019-02-01 13:20:00', 2000.00, 10);

/*procedure para processamento de contrato*/
delimiter $$
create procedure proc_boleto()
comment 'procedure para processamento de contrato e boleto'
begin
	declare v_fim_loop int default 0;
    declare v_log text;
	declare v_idcontrato, v_fk_idaluno, v_fk_idcurso int;
    declare v_fk_data_inscricao_curso datetime;
    declare v_valor_total_curso float(8,2);
	declare v_desconto float(4,1);
    declare v_numero_parcelas int;
    declare v_processado char(1);
	
    declare v_boleto_loop_parcelas int;
    declare v_boleto_valor_parcela float(8,2);
	declare v_boleto_data_vencimento datetime;
    
    
    declare c_contratos cursor for(-- var do tipo cursor
		select idcontrato, fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, desconto, numero_parcelas, processado
        from contrato
    );
    
    /*manipulando handler de continuidade do laço */
    declare continue handler for not found set v_fim_loop = 1; -- quando não houver mais elementos, essa instrução será executada
    
    -- abrir o cursor
    open c_contratos;
     
     repeat
		 -- utilizar uma estrutura de repetição para evitar a repetição do fetch
		 fetch c_contratos into v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_fk_data_inscricao_curso, v_valor_total_curso, v_desconto, v_numero_parcelas,
		 v_processado;
		 
         if v_fim_loop = 0 then -- evita que o ultimo elemento do cursor se repita
			 set v_log = concat(
				v_fim_loop, ' *** ', v_idcontrato, ' - ', v_fk_idaluno, ' - ', v_fk_idcurso, ' - ', v_fk_data_inscricao_curso, ' - ',
				v_valor_total_curso, ' - ', v_desconto, ' - ', v_numero_parcelas
			 );
			 
			insert into log(log) value(v_log);
            
            /*estrutura de repetição para inserir as parcelas de acordo com o valor da mensalidade*/
            while v_boleto_loop_parcelas <= v_numero_parcelas do
				insert into boleto(fk_idcontrato, data_vencimento, valor, numero_parcela)
				values(v_idcontrato, v_boleto_data_vencimento, v_boleto_valor_parcela, v_boleto_loop_parcelas);
            
				set v_boleto_loop_parcelas = v_boleto_loop_parcelas + 1;
            end while;
            
         end if;
         
		 select v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_fk_data_inscricao_curso,
		 concat('$', format(v_valor_total_curso, 2)) as "v_valor_total_curso",
		 v_desconto, v_numero_parcelas,
		 case 
			when v_processado = 'n' then 'NAO'
		 end as "v_processado";
         
     until v_fim_loop > 0 end repeat; /*quando a condição for verdadeira, o laço será interrompido*/
     
    -- fechar o cursor
    close c_contratos;
end;
$$
delimiter ;

call proc_boleto();

drop procedure proc_boleto;

select * from contrato; 

select * from log;
select * from boleto;

truncate table log;