/*CASE EM COLUNAS DE CONSULTAS PL/SQL*/
select lc.cd_usuario, lc.dt_realizacao,
case 
  when lc.cd_usuario = 'TRODRIGUES' then 'foi a thais rodrigues'
  when lc.cd_usuario != 'TRODRIGUES' then 'não foi a thais rodrigues'
end as condicional_nome
from dbaps.log_contrato lc
where lc.cd_usuario = 'TRODRIGUES'
and lc.dt_realizacao < to_char(SYSDATE, 'DD/MM/YYYY')
order by lc.dt_realizacao asc