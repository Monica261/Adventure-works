/*existem var dinamicas que podem ser modificadas no tempo de execução*/
show variables where Variable_name = 'max_connections'; -- buscar variavel do sistema

set global max_connections = 300; -- setar a variavel

/*var somente leitura*/
set global port = 3307;

-- MODIFICAR VAR DE SISTEMA EM UM ESCOPO GLOBAL

show global variables; -- exibe as variaveis globais

show global variables where Variable_name like 'auto%'

