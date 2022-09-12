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
--https://generatedata.com/generator

INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (100,'Trevor Wiley','West-Vlaanderen','Ribeirão Preto');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (101,'Mary Bass','East Region','Juazeiro');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (102,'Mara Whitley','Australian Capital Territory','Balsas');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (103,'Jamal Floyd','North-East Region','Bragança');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (104,'Simone Morgan','Maluku','São José dos Pinhais');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (105,'Peter Calhoun','Quảng Trị','Valparaíso de Goiás');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (106,'Rajah Orr','Caraga','São João de Meriti');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (107,'Claire Conrad','Jönköpings län','Maracanaú');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (108,'Clarke Hensley','Dadra and Nagar Haveli','Jaboatão dos Guararapes');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (109,'Raya Hampton','Xīnán','Itapipoca');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (110,'Angelica Carr','South Chungcheong','Rio Verde');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (111,'Nelle Robbins','Northern Territory','Anápolis');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (112,'Eleanor Lowery','Zeeland','Novo Hamburgo');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (113,'Lani Gentry','Azad Kashmir','Petrópolis');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (114,'Carly Campos','Poitou-Charentes','Sousa');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (115,'Portia Rich','Kerala','Valparaíso de Goiás');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (116,'Mia Allen','Risaralda','Valparaíso de Goiás');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (117,'Ruby Jensen','Baja California','Divinópolis');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (118,'Phillip Juarez','Meta','Canoas');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (119,'Kieran Valdez','Madhya Pradesh','São João de Meriti');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (120,'Tobias Shaffer','Puntarenas','João Pessoa');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (121,'Kai Hancock','Santa Catarina','Criciúma');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (122,'Suki Monroe','Zeeland','Santarém');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (123,'Herman Holmes','Tasmania','Petrópolis');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (124,'Kaye Kinney','East Lothian','Timon');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (125,'Urielle Wilkins','La Rioja','Campos dos Goytacazes');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (126,'Troy Strong','Luxemburg','Águas Lindas de Goiás');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (127,'Roth Monroe','Cundinamarca','Juiz de Fora');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (128,'Asher Raymond','Pernambuco','Cascavel');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (129,'Sybil Mooney','Canarias','Sousa');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (130,'Karleigh Battle','Agder','Valparaíso de Goiás');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (131,'Dora Harvey','Worcestershire','Osasco');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (132,'Macon Bailey','Overijssel','Recife');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (133,'Donovan Chase','Styria','Juazeiro do Norte');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (134,'Callum Lang','Xīnán','Curitiba');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (135,'Fay Massey','Chelyabinsk Oblast','Maranguape');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (136,'Sara Rojas','Friesland','Luziânia');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (137,'Cathleen Conway','Vestland','Joinville');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (138,'Austin Melton','Eastern Visayas','Santa Rita');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (139,'Karleigh Frank','Zachodniopomorskie','Itapipoca');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (140,'Vielka Hahn','Veracruz','Lauro de Freitas');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (141,'Cynthia Koch','Puno','Duque de Caxias');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (142,'Jordan Hooper','Salzburg','Valparaíso de Goiás');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (143,'Linus Hill','Hessen','Cascavel');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (144,'Randall Morse','Gelderland','São João de Meriti');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (145,'Teagan Gilbert','Ulster','São José dos Pinhais');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (146,'Barbara Mckenzie','Zhōngnán','Criciúma');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (147,'Quyn Griffin','North-East Region','Ilhéus');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (148,'Ori Burnett','Zhōngnán','Cabo de Santo Agostinho');
INSERT INTO aluno (ra,nome,endereco,cidade)
VALUES (149,'Hashim Singleton','Zeeland','Feira de Santana');


