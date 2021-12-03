--SELECT u.cd_vendedor, u.cd_unidade_venda, u.cd_emp_vendedora
UPDATE dbaps.USUARIO u 
SET u.cd_vendedor = NULL, u.cd_unidade_venda = NULL, u.cd_emp_vendedora = NULL 
WHERE u.cd_matricula in (
97177900007040,
97177900009030,
97177900067010,
97177900067030
)

COMMIT

SELECT u.cd_vendedor, u.cd_unidade_venda, u.cd_emp_vendedora, u.rowid
FROM dbaps.USUARIO u 
WHERE u.cd_matricula in (
97177900007040,
97177900009030,
97177900067010,
97177900067030
)


commit
