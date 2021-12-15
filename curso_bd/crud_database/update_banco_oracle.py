import cx_Oracle

# conexão com o banco
cx_Oracle.init_oracle_client(lib_dir=r"C:\instantclient_19_11\instantclient_19_11")
pwd = "dbapssta368"
con = cx_Oracle.connect("dbaps", pwd, "10.200.0.211/PRDME1")


# função pra atualizar
def update_cadastro():
    cur = con.cursor()
    try:
        res = cur.execute('update dbaps.contrato c set c.nr_telefone = 1239165800 where c.cd_contrato = 12200')
        print('Deu certo')
    except Exception as e:
        print('Erro apresentado:', e)
    con.commit()
    cur.close()


update_cadastro()
