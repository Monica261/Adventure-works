import cx_Oracle


# conexão com o banco
cx_Oracle.init_oracle_client(lib_dir=r"C:\instantclient_19_11\instantclient_19_11")
pwd = "dbapssta368"
con = cx_Oracle.connect("dbaps", pwd, "10.200.0.211/PRDME1")


# função pra atualizar
def update_cadastro():
    cur = con.cursor()
    try:
        coluna = input('insira o nome da coluna ')
        alteracao = input('insira a alteracao ')
        contrato = input('insira o contrato ')

        query = f"update dbaps.contrato  set {coluna} = '{alteracao}' where cd_contrato = {contrato}"

        res = cur.execute(query)
        print('Alteração realizada')
    except Exception as e:
        print('Erro apresentado:', e)
    con.commit()
    cur.close()


update_cadastro()
