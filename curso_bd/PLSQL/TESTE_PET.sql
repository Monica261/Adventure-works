--exercicio 2
/*
tabela_alunos → colunas = (ra, nome, endereco, cidade);
tabela_disciplinas → colunas = (cod_disc, nome_disc, carga_hor)
tabela_professores → colunas = (cod_prof, nome, endereco, cidade)
tabela_turma → colunas = (cod_disc, cod_turma, cod_prof, ano, semestre)
tabela_historico, colunas = (ra, cod_disc, cod_turma, cod_prof, ano, semestre,
frequencia, nota)

*/
create table alunos(
    ra number,
    nome varchar2(100),
    endereco varchar2(80),
    cidade varchar2(50),
    constraint ra_pk primary key (ra)
);

create table disciplinas(
    cod_disc number,
    nome_disc varchar2(50),
    carga_hor number,
    constraint cod_disc_pk primary key (cod_disc)
);

create table professores(
    cod_prof number,
    nome varchar2(100),
    endereco varchar2(80),
    cidade varchar2(50),
    constraint cod_prof_pk primary key (cod_prof)
);


create table turma(
    cod_disc number,
    cod_turma number,
    cod_prof number,
    ano number, 
    semestre varchar2(20),
    constraint cod_turma_pk primary key (cod_turma),
    
    constraint fk_cod_prof 
    foreign key (cod_prof) 
    references professores(cod_prof)--fk
);

create table historico(
    ano number, 
    semestre varchar2(20),
    frequencia number,
    nota number,
    ra number,
    cod_disc number,
    cod_turma number,
    cod_prof number,
    
    constraint fk_ra
    foreign key (ra)
    references alunos(ra), --fk
    
    constraint fk_cod_disc
    foreign key (cod_disc)
    references disciplinas(cod_disc), --fk
    
    constraint fk_cod_turma
    foreign key (cod_turma)
    references turma(cod_turma), --fk
    
    constraint fk_cod_prof_historico
    foreign key (cod_prof)
    references professores(cod_prof) --fk

);

--insert em alunos
INSERT INTO alunos (ra,nome,endereco,cidade)
VALUES (100,'Hadassah Berger',"952-1654 Ipsum Street","Crato");
INSERT INTO alunos (ra,nome,endereco,cidade)
VALUES (101,"Ignatius Barrett","Ap #899-4151 Est. Avenue","Cabo de Santo Agostinho");
INSERT INTO alunos (ra,nome,endereco,cidade)
VALUES (102,"Rina Hubbard","527 A, Av.","Londrina");
INSERT INTO alunos (ra,nome,endereco,cidade)
VALUES (103,"Abel Hyde","P.O. Box 869, 1299 Ad Rd.","Florianópolis");
INSERT INTO alunos (ra,nome,endereco,cidade)
VALUES (104,"Felix Dejesus","Ap #719-8377 In Ave","Ipatinga");
--https://generatedata.com/generator
