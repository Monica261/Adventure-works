create table disciplina(
iddisciplina int auto_increment,
constraint pk_iddisciplina primary key(iddisciplina), /*definindo como pk o meu id*/
descricao varchar(200) not null,
carga_horaria int,
nome_professor varchar(50),
email_professor varchar(70),
codigo_professor int,
fk_idcurso int/*adiciono a fk e referencio com o alter table*/
);

alter table disciplina add constraint fk_curso_disciplina
foreign key (fk_idcurso) references curso(idcurso);

desc disciplina;

insert into disciplina(descricao, carga_horaria, nome_professor, email_professor, codigo_professor, fk_idcurso)
values('curso de Mongo e Node', 30, 'Jorge Santana', 'jorgesantana@gmail.com', 100, 2);

insert into disciplina(descricao, carga_horaria, nome_professor, email_professor, codigo_professor, fk_idcurso)
values('curso js 2018', 50, 'Jamilton Damasceno', 'jamilton@gmail.com', 110, 1);

insert into disciplina(descricao, carga_horaria, nome_professor, email_professor, codigo_professor, fk_idcurso)
values('curso de angular avançado', 40, 'Claudio Alves', 'claudioalves@gmail.com', 140, 3);


select * from curso;

/*refatorando a tabela disciplina*/
use universidade_u;

create table professor(
idprofessor int auto_increment,
constraint pk_idcurso primary key(idprofessor),
nome varchar(100) not null,
email varchar(100)
);

insert into professor(
	idprofessor,
	nome,
	email
)
select distinct
	codigo_professor,
	nome_professor,
    email_professor
from
	disciplina;

alter table disciplina drop column nome_professor, drop column email_professor;
select * from professor;
select * from disciplina;

desc disciplina;

alter table disciplina rename column codigo_professor to fk_idprofessor;

/*aplicando a constraint*/
alter table disciplina add constraint fk_disciplina_professor
foreign key (fk_idprofessor) references professor(idprofessor);
