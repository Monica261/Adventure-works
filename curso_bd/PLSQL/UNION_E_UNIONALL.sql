--UNION E UNION ALL PARA JUNÇÕES E COMPARAÇÕES

--union possui a propriedade distinct ja embutida
select ses.ano, ses.estado, ses.nome_mun, ses.populacao from senso ses where ses.ano = 2013 and ses.cod_uf = 11
union 
select ses.ano, ses.estado, ses.nome_mun, ses.populacao from senso ses where ses.ano = 2013 and ses.cod_uf = 11
order by nome_mun desc;

--union all nãao possui o distinct
select ses.ano, ses.estado, ses.nome_mun, ses.populacao from senso ses where ses.ano = 2013 and ses.cod_uf = 11
union all
select ses.ano, ses.estado, ses.nome_mun, ses.populacao from senso ses where ses.ano = 2013 and ses.cod_uf = 11
order by nome_mun desc;

--OS SELECTS PRECISAM ESTAR IGUAIS
select * from HR.countries ct where ct.region_id = 4
union
select * from HR.countries ct where ct.region_id = 1