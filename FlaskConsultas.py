import flask
from flask import request
from flask.globals import g

import mysql.connector as MySQLConnector

# Iniciarlização do banco de dados
#  adicionamos o handle do conector no contexto do
#  app do flask.
def init_db():
    g.db = MySQLConnector.connect(
        host = "localhost",
        user = "root",
        password = "alunoaluno",
        database = "PetShop"
    )
    return g.db

# Recupera o handle do banco de dados
def get_db():
    if "db" not in g:
        g.db = init_db()
    
    return g.db

# Inicialização da aplicação flask
def init_app():
    app = flask.Flask(__name__)

    with app.app_context():
        init_db()

    return app

app = init_app()

# Fechamos a conexão com o banco de dados
#  quando a aplicação se encerra.
@app.teardown_appcontext
def teardown_db(exception):
    db = g.pop('db', None)

    if db is not None:
        db.close()

# Rota raiz que diz se você conseguiu se conectar no banco de dados
@app.route("/")
def index():
    db = get_db()

    return "Is connected? %s" % ("Yes" if db.is_connected else "No")

# Implementar rota de listar todos os pets
# utilizando a conexão através do init_db()
@app.route("/pet", methods=["GET"])
def list_all_pets():

    db = get_db()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM Pet")
    return cursor.fetchall()
    

# Implementar rota de listar um pet em específico
# Mostrar nome do dono/responsável ao invés do id
##Download Postman
##Dentro dele: API - novo - POST - FormData

@app.route("/pet/<int:responsavel>")
def list_pet_by_id(responsavel):

    db = get_db()
    cursor = db.cursor()
    comandoSQL = f'select p.nome, r.nome from Pet as p, ResponsavelPet as r where r.cpf = p.responsavel and p.responsavel = {res};'

    cursor.execute(comandoSQL)

    return [cursor.fetchall()]
    


# Implementar rota pra inserção de um pet
# o método padrão é POST
@app.route("/pet", methods=["POST"])
def insert_pet():
    # dados recebidos através do método post
    pet_data = request.form # dicionário contendo todos os dados recebidos de um pet
    
    pet_nome = (pet_data["nome"])
    pet_tipo = (pet_data["tipo"])
    pet_raca = (pet_data["raca"])
    pet_responsavel = (pet_data["responsavel"])
    pet_id = (pet_data["id"])

    db = get_db()
    cursor = db.cursor()
    comandoSQL = f'INSERT INTO Pet (nome, tipo, raca, responsavel, id) VALUES ("{pet_nome}", "{pet_tipo}", "{pet_raca}", {pet_responsavel}, {pet_id});'

    cursor.execute(comandoSQL)
    db.commit()




    # Inserir utilizando os dados recebidos e utilizando o SQL
    pass

# Gerar rotas para os donos/responsáveis
# 1. Listar todos os donos
# 2. Listar um dono em específico e o nome de todos os pets que ele possuí
# 3. Inserir um dono novo






if __name__ == "__main__":
    app.run(debug = True)

