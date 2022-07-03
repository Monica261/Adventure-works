--AVG retorna a média dos valores em um grupo. Valores nulos são ignorados.

select AVG(populacao) as media 
from senso
where ano = '2014';

--média por estado
select estado, AVG(populacao) as media 
from senso
where ano = '2014'
group by estado
order by 1;

--media por estado com sigla estado
select a.cod_uf, b.sigla_uf, AVG(a.populacao) media
from senso a
inner join uf b on a.cod_uf = b.cod_uf
where a.ano = '2014'
group by a.cod_uf, b.sigla_uf
order by 2;

--avg por regiao
-- avg media por regiao
select a.regiao, AVG(a.populacao)
from senso a
where a.ano = '2014'
group by a.regiao;

--MIN retorna o valor minimo na expressão. Pode ser seguida pela cláusula OVER

select MIN(a.populacao) 
from senso a
where a.ano = '2014';

--min por estado
select a.estado, MIN(a.populacao)
from senso a
where a.ano = '2014'
group by a.estado;

--MAX retorna o valor maximo na expressao
select MAX(a.populacao) 
from senso a
where a.ano = '2014';

select a.estado, MAX(a.populacao) 
from senso a
where a.ano = '2014'
group by a.estado
order by 2 desc;

select a.cod_uf, b.sigla_uf, MAX(a.populacao) media
from senso a
inner join uf b on a.cod_uf = b.cod_uf
where a.ano = '2014'
group by a.cod_uf, b.sigla_uf
order by 2 desc;

--SUM retorna a somatoria

--SUM por estado
select a.cod_uf, SUM(a.populacao)
from senso a
group by a.cod_uf
order by 2 desc;

--SUM por região
select a.estado, SUM(a.populacao) as maximo
from senso a
where a.ano = '2014'
group by a.estado
order by 2 desc;

--COUNT retorna o número de itens de um grupo
select count(*) as quantidade
from senso a
where a.ano = '2014';

--COUNT retorna o numero de cidades por ano
select a.ano, count(*) as qtd_cidades
from senso a
group by a.ano
order by 1 desc;

--descobrindo a quantidade de estados
select count(distinct a.cod_uf) from senso a;

--COUNT por estado
select a.estado, count(a.estado) as cont_estado
from senso a
group by a.estado;

--COUNT por regiao
select a.regiao, count(a.regiao) as cont_regiao
from senso a
group by a.regiao;

--usando varias funções de agregação
select avg(a.populacao) media_pop,
min(a.populacao) minimo_pop,
max(a.populacao) maximo_pop,
sum(a.populacao) total_pop,
count(*) qtd_cidades
from senso a
where a.ano = '2014';

--usando varias funções de agregação -> por estado
select a.estado, 
avg(a.populacao) media_pop,
min(a.populacao) minimo_pop,
max(a.populacao) maximo_pop,
sum(a.populacao) total_pop,
count(*) qtd_cidades
from senso a
where a.ano = '2014'
group by a.estado
order by 1 desc;

--STDDEV retorna o desvio padrão estatistico de todos os valores da expressão especificada
select STDDEV(a.populacao)
from senso a
where a.ano = '2014';

--STDDEV_POP retorna o desvio padrão estatistico para a população de todos os valores na expressao especificada
select STDDEV_POP(a.populacao)
from senso a
where a.ano = '2014';

--COMPARANDO CRESCIMENTO POP DAS CIDADES REF ANOS 2010 A 2014
--utilizando a mesma tabela para trazer infos de periodos diferentes
select 
    a.nome_mun,
    a.populacao as senso_2010,
    b.populacao as senso_2014,
    (100/a.populacao)*(b.populacao) - 100 as percentual
from senso a
inner join senso b
on a.cod_mun = b.cod_mun
where a.ano = '2010'
and b.ano = '2014';

--COMPARANDO CRESCIMENTO POP POR ESTADO REF ANOS 2010 A 2014
select 
    a.estado,
    SUM(a.populacao) as senso_2010,
    SUM(b.populacao) as senso_2014,
    (100/SUM(a.populacao))*(SUM(b.populacao)) - 100 as percentual
from senso a
inner join senso b
on a.cod_mun = b.cod_mun
where a.ano = '2010'
and b.ano = '2014'
group by a.estado;

--VAR_POP retorna a variancia estatistica para o preenchimento de todos os valores da expressao especificada
--VAR_POP variancia por valor
select VAR_POP(a.populacao) 
from senso a;

--VAR_POP com group by por estado
select a.estado, VAR_POP(a.populacao) 
from senso a
group by a.estado;