create table funcionarios(
id int not null,
nome varchar2(50) not null,
salario decimal(10,2),
setor varchar2(30),
primary key(id)
);

create sequence id_func
start with 1
increment by 1
nocache;

--dml select
select * from funcionarios;

select nome, salario from funcionarios;

--dml insert
insert into funcionarios(id, nome, salario, setor) values(id_func.nextval, 'Pedro', 3200, 'Desenvolvedor junior');
insert into funcionarios(id, nome, salario, setor) values(id_func.nextval, 'Ester', 2200, 'Auxiliar Administrativo');
insert into funcionarios(id, nome, salario, setor) values(id_func.nextval, 'Mônica', 3200, 'Desenvolvedora junior');

--dml update
update funcionarios
set salario = 1200
where id = 2;

update funcionarios
set salario = salario*9.15
where id = 3;

--dml delete
delete funcionarios
where id = 1;