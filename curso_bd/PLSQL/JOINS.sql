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

select * from matricula;

--aluno 4 n tem disciplina e disciplina 5 n tem alunos -> aviso

--inner join
select a.nome, c.nome_disc, b.periodo
from alunos a
inner join matricula b on a.idaluno = b.idaluno
inner join disciplina c on b.iddisc = c.iddisc ;

--left join
select a.nome, c.nome_disc, b.periodo
from alunos a
left join matricula b on a.idaluno = b.idaluno
left join disciplina c on b.iddisc = c.iddisc ;

--right join
select a.nome, c.nome_disc, b.periodo
from alunos a
right join matricula b on a.idaluno = b.idaluno
right join disciplina c on b.iddisc = c.iddisc ;

--full join
select a.nome, c.nome_disc, b.periodo
from alunos a
full join matricula b on a.idaluno = b.idaluno
full join disciplina c on b.iddisc = c.iddisc ;

/*utilizando a base de employees*/
select a.employee_id, a.first_name, b.department_id, c.job_title
from HR.employees a
inner join HR.departments b on a.department_id = b.department_id
inner join HR.jobs c on a.job_id = c.job_id
order by 1;

select a.employee_id, a.first_name, b.department_id, c.job_title
from HR.employees a
left join HR.departments b on a.department_id = b.department_id --verificar funcio sem depart
left join HR.jobs c on a.job_id = c.job_id
order by 1;

select a.employee_id, a.first_name, b.department_id, c.job_title
from HR.employees a
right join HR.departments b on a.department_id = b.department_id --depar ou job sem funcio
right join HR.jobs c on a.job_id = c.job_id
order by 1;