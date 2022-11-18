from flask import Flask, render_template
import mysql.connector




app = Flask(__name__)

@app.route("/")

def todosPets():
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="alunoaluno",
        database = "PetShop"
    )


    cursor = db.cursor()
    comandoSQL = f'SELECT * FROM Pet'

    cursor.execute(comandoSQL)

    return [cursor.fetchall()]
    

    #db.commit()

@app.route("/<int:responsavel>")

def selectPets(responsavel):
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="alunoaluno",
        database = "PetShop"
    )


    cursor = db.cursor()
    comandoSQL = f'SELECT * FROM Pet where responsavel = {responsavel}'

    cursor.execute(comandoSQL)

    return [cursor.fetchall()]
    

@app.route("/html")
def Teste():

    return render_template(Pagina01.html)
    

    



if __name__ == "__main__":
    app.run(debug = True)
