import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="alunoaluno",
    database = "PetShop"
)



#Cadastrar Pet
def cadastroPet():
    cursor = db.cursor()

    pet = input("Digite o nome do Pet \n")
    tipo = input("Que tipo de bichinho ele é? \n")
    raca = input("Qual a raça dele? \n")
    responsavel = int(input("Qual o cpf do responsavel? \n"))

    comandoSQL = f'INSERT INTO Pet (nome, tipo, raca, responsavel) VALUES ("{pet}", "{tipo}", "{raca}", {responsavel})'

    cursor.execute(comandoSQL)
    db.commit()
    #cursor.close


def cadastroResponsavel():
    cursor = db.cursor()

    nome = input("Digite seu nome: \n")
    cpf= int(input("Digite seu cpf: \n"))
    contato = int(input("Digite seu numero para contato: \n"))

    comandoSQL = f'INSERT INTO ResponsavelPet (nome, cpf, contato) VALUES ("{nome}", {cpf}, {contato})'

    cursor.execute(comandoSQL)
    db.commit()
    #cursor.close



while True:
    opcao = input("Digite 1 para cadastro de Pet, 2 para cadastro de usuario, 0 para sair: \n")
 
    if opcao == "1":
        cadastroPet()

    if opcao == "2": 
        cadastroResponsavel()

    if opcao == "0":
        break
        
    opcao = input("Digite 1 para cadastro de Pet, 2 para cadastro de usuario, 0 para sair")



db.close
