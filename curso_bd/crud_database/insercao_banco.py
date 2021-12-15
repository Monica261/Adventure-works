# Importamos a biblioteca:
import pymysql

# Abrimos uma conexão com o banco de dados:
conexao = pymysql.connect(db='universidade_u', user='root', passwd='root')

# Cria um cursor:
cursor = conexao.cursor()

# Executa o comando:
cursor.execute("INSERT INTO aluno (sexo, idade, data_inscricao_curso, telefone, valor_pago_curso, ativo_sn, nome, cpf) VALUES ('F', 35, '2021-01-05', '12989564547', 350.20, 1, 'Vanessa Figueira', '156.356.906-86')")

# Efetua um commit no banco de dados.
# Por padrão, não é efetuado commit automaticamente. Você deve commitar para salvar
# suas alterações.
conexao.commit()

# Finaliza a conexão
conexao.close()