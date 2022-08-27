create table empregados(
    codigo int not null primary key,
    nome varchar2(20),
    salario decimal(10,2)
);

create table log_salario(
    codigo int,
    salario_anterior decimal(10,2),
    salario_atual decimal(10,2),
    data_alteracao date,
    usuario varchar2(20),
    operacao varchar2(20)
);

drop table log_salario;

--trigger each row insert
create or replace trigger trg_salario_aud
after insert or update on empregados
for each row
begin
    insert into log_salario(
        codigo,
        salario_anterior,
        salario_atual,
        data_alteracao,
        usuario,
        operacao
    )
    values(
        :new.codigo,
        :old.salario,
        :new.salario,
        sysdate,
        user,
        ''
    );
end;

--teste insert
insert into empregados values(1, 'Monica', 2999);
insert into empregados values(2, 'Pedro', 1900);

select * from empregados;
select * from log_salario;

--teste update
update empregados
set salario = 4305
where codigo = 1;

select * from log_salario;

--exemplo de trigger de restricao de horario
create or replace trigger trg_restricao_empregados
before insert or delete or update
on empregados
referencing new as new old as old
begin
    if to_number(to_char(sysdate, 'hh24')) not between 09 and 18
    then
    raise_application_error(-20001, 'essa ação não pode ser executada fora do horario de expediente');
    end if;
end;

insert into empregados values(3, 'Carla', 2500);

update empregados
set salario = 4320
where codigo = 1;
