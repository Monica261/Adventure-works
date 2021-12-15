# Importamos a biblioteca:
import pymysql

# Abrimos uma conexão com o banco de dados:
conexao = pymysql.connect(db='universidade_u', user='root', passwd='root')

# Cria um cursor:
cursor = conexao.cursor()

# Executa o comando:
cursor.execute("UPDATE aluno SET nome = 'Maria Antonia',cpf = '356.896.146-36' WHERE idaluno = 11")

# Efetua um commit no banco de dados.
# Por padrão, não é efetuado commit automaticamente. Você deve commitar para salvar
# suas alterações.
conexao.commit()

# Finaliza a conexão
conexao.close()