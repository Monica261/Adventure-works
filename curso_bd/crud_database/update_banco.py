# Importamos a biblioteca:
import pymysql

# Abrimos uma conexão com o banco de dados:
conexao = pymysql.connect(db='universidade_u', user='root', passwd='root')

# Cria um cursor:
cursor = conexao.cursor()

# Executa o comando:
coluna = input('insira a coluna ')
aluno = input('insira o nome ')
id = input('insira o id ')

query = f"UPDATE aluno SET {coluna} = '{aluno}' WHERE idaluno = '{id}'"
cursor.execute(query)

# Efetua um commit no banco de dados.
# Por padrão, não é efetuado commit automaticamente. Você deve commitar para salvar
# suas alterações.
conexao.commit()

# Finaliza a conexão
conexao.close()