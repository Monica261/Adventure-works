create table uf(
cod_uf char(2) not null primary key,
sigla_uf char(2) not null,
estado varchar(50) not null
);

create table senso(
ano int not null,
cod_uf char(2) not null,
estado varchar2(50) not null,
cod_mun char(7) not null,
nome_mun varchar2(50) not null,
regiao varchar2(150),
cod_meso_reg char(4),
nome_meso_reg varchar2(100) not null,
cod_mic_reg char(5) not null,
nome_min_reg varchar2(50) not null,
pib decimal(12,3) not null,
populacao integer not null,
pib_per_cap decimal(12,3) not null
);

select user from dual;

select * from senso;