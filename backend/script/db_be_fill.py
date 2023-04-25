import csv
import pymysql

# Se connecter à la base de données
connection = pymysql.connect(host='localhost',
                             user='app',
                             password='rZ3uNu3VeBJKowr3b42Q',
                             db='wow',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

# Ouvrir le fichier CSV contenant les données des films
with open('./data.csv', newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)

    # Parcourir chaque ligne du fichier CSV
    for row in reader:
        # Récupérer les genres du film et les convertir en liste
        genres = row['genres'].split('|')

        # Insérer chaque genre du film dans la table d'association be
        with connection.cursor() as cursor:
            for genre in genres:
                cursor.execute("INSERT INTO be (id_genre, id_movie) SELECT uid, %s FROM genre WHERE name=%s", (row['id'], genre))

        # Commit après chaque film pour s'assurer que les données sont bien écrites dans la base de données
        connection.commit()

# Fermer la connexion à la base de données
connection.close()
