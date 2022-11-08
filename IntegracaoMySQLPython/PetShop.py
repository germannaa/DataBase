import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="alunoaluno",
    database = "PetShop"
)
cursor = db.cursor()
'''
responsaveis = [
    ("Maria", 0000000, 859999),
    ("João", 11111111, 8588888),
    ("José", 2222222, 851236549)
]

sql = "INSERT INTO ResponsavelPet VALUES (%s, %s, %s)"
cursor.executemany (sql, responsaveis)
'''
#Populando
'''
pets = [
    ("Totó", "cachorro", "ViraLata", 0000000),
    ("Lulu", "gato", "ViraLata", 0000000),
    ("Tobias", "cachorro", "ViraLata", 0000000),
    ("Galego", "passaro", "ViraLata", 11111111),
    ("Fifi", "hamster", "ViraLata", 2222222),
    ("Johnny", "Passarinho", "ViraLata", 2222222),
]

sql = "INSERT INTO Pet VALUES (%s, %s, %s, %s)"
cursor.executemany (sql, pets)
db.commit()
print(cursor.rowcount)
'''

print("Questao01: Buscar todos os Pets da Maria.")
cursor.execute("Select * from Pet WHERE responsavel = (SELECT cpf from ResponsavelPet where nome = 'Maria')")

for pet in cursor.fetchall():
    print(pet)

print("Questao02: Quais tipos de Pets existem no nosso BD.")
cursor.execute("Select DISTINCT tipo from Pet")

for pet in cursor.fetchall():
    print(pet)

print("Questao03: Quais raças existem. ")
cursor.execute("Select DISTINCT raca from pet")

for pet in cursor.fetchall():
    print(pet)

print("Questao04: Quem são os Responsáveis que possuem gatos.")
cursor.execute ("Select nome from ResponsavelPet where cpf in (Select responsavel from Pet where raca = 'gato')")
for ResponsavelPet in cursor.fetchall():
    print(ResponsavelPet)

print("Questao05: Quem tem gato e não tem cachorro")
cursor.execute("Select * from ResponsavelPet where cpf not in (Select responsavel from Pet where raca = 'gato') AND cpf in (Select responsavel from Pet where raca = 'cachorro')")

for ResponsavelPet in cursor.fetchall():
    print(ResponsavelPet)
    
cursor.close
db.close
