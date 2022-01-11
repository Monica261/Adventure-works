/*Criando e populando a tabela projeto_funcionario*/
use universidade_u;

create table projeto_funcionario(
	codigo_projeto int,
    matricula_funcionario int,
    nome_projeto varchar(100) not null,
    nome_funcionario varchar(50) not null,
    funcao_funcionario varchar(50) not null,
    telefone_funcionario varchar(20),
    data_criacao_projeto datetime default current_timestamp,
    horas_estimadas int not null,
    horas_realizadas int
);

alter table projeto_funcionario
add constraint pk_projeto_funcionario primary key(codigo_projeto, matricula_funcionario);

desc projeto_funcionario;

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(1, 110, 'Matrícula Online', 'Carla', 'Analista de projetos', 200);

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(1, 127, 'Matrícula Online', 'Pedro', 'Desenvolvedor Sênior', 500);

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(1, 115, 'Matrícula Online', 'Fátima', 'Gerente de atendimento', 100);

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(2, 143, 'Economia de papel', 'Paula', 'Gerente de qualidade', 300);

insert into projeto_funcionario
(codigo_projeto, matricula_funcionario, nome_projeto, nome_funcionario, funcao_funcionario, horas_estimadas)
values(3, 210, 'Notas Online', 'Pablo', 'Analista adminitrativo', 180);

select * from projeto_funcionario;
    
update 
	projeto_funcionario
set
	matricula_funcionario = 123,
    nome_funcionario = (select nome from aluno where idaluno = 2)
    
where 
	matricula_funcionario = 110;