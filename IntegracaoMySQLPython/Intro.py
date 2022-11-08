import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="alunoaluno",
    database = "turfe"
)

#print(db)

cursor = db.cursor()
#-Criando Banco de dados
#cursor.execute("CREATE DATABASE turfe")

#-Criando a tabela
#cursor.execute("CREATE TABLE turfe (pareo int, cavalo varchar(64),tempo decimal(15,2))")

#Adicionando dados
turfes = [
(1, 'Stupenda', 52.2),
(1, 'Mandrake', 53.1),
(1, 'Capricho', 54.2),
(2, 'Stupenda', 52.3),
(2, 'Muddy River', 52.4),
(2, 'Capricho', 56.1),
(2, 'Urumak', 52.5),
(3, 'Urumak', 53.0),
(3, 'Muddy River', 52.1),
(3, 'Stupenda', 52.3),
(3, 'Escorial', 55.1)
]

sql = "INSERT INTO turfe VALUES (%s, %s, %s)"
cursor.executemany (sql, turfes)
db.commit()
print(cursor.rowcount)


cursor.close
db.close
