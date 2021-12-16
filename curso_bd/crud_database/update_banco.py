# Importamos a biblioteca:
import pymysql

# Abrimos uma conexão com o banco de dados:
conexao = pymysql.connect(db='universidade_u', user='root', passwd='root')

# Cria um cursor:
cursor = conexao.cursor()

# Executa o comando:
campo = input('escolha o campo: ')
dado = input('dado a ser atualizado: ')
id = input('escolha o id do aluno: ')

query = f"UPDATE aluno SET {campo} = '{dado}' WHERE idaluno = {id}"
cursor.execute(query)

# Efetua um commit no banco de dados.
conexao.commit()

# Finaliza a conexão
conexao.close()