--CRIACAO DAS TABELAS
create table alunos(
idaluno int not null,
nome varchar2(20) not null,
primary key(idaluno)
);

create sequence p_alunos
start with 1
increment by 1
nocache;


create table disciplina(
iddisc int not null,
nome_disc varchar2(50) not null,
primary key (iddisc)
);

create sequence p_disciplina
start with 1
increment by 1
nocache;

create table matricula(
idaluno int not null,
iddisc int not null,
periodo varchar2(10),
primary key (idaluno, iddisc),
foreign key (idaluno) references alunos(idaluno),
foreign key(iddisc) references disciplina(iddisc)
);

create sequence p_matricula
start with 1
increment by 1
nocache;

--inserir registros em aluno
insert into alunos(idaluno, nome) values(p_alunos.nextval, 'Mônica');
insert into alunos values(p_alunos.nextval, 'Ester');
insert into alunos values(p_alunos.nextval, 'Maria');
insert into alunos values(p_alunos.nextval, 'Ana');
insert into alunos values(p_alunos.nextval, 'Elaine');

--inserindo registros em disciplina
insert into disciplina values(p_disciplina.nextval, 'Fisica');
insert into disciplina values(p_disciplina.nextval, 'Quimica');
insert into disciplina values(p_disciplina.nextval, 'Matematica');
insert into disciplina values(p_disciplina.nextval, 'Banco de dados');
insert into disciplina values(p_disciplina.nextval, 'Programação');

select * from disciplina;

--inserindo matriculas de alunos
insert into matricula values(1, 1, 'noturno');
insert into matricula values(1, 2, 'vespertino');
insert into matricula values(1, 3, 'matutino');

insert into matricula values(2, 3, 'noturno');
insert into matricula values(2, 4, 'noturno');

insert into matricula values(3, 1, 'noturno');
insert into matricula values(3, 3, 'noturno');
insert into matricula values(3, 4, 'noturno');

insert into matricula values(5, 1, 'noturno');
insert into matricula values(5, 2, 'vespertino');
insert into matricula values(5, 4, 'matutino');