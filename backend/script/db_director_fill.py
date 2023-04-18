import csv
import pymysql

# Connexion à la base de données
conn = pymysql.connect(host='localhost', user='root', password='', db='wow')

# Ouverture du fichier CSV contenant les données
with open('./data.csv', 'r',encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)

    # Boucle à travers chaque ligne du fichier CSV
    for i, row in enumerate(reader):
        # Récupération de l'ID du film
        if i >= 200:
            break
        tmdb_id = row['id']

        # Vérification si le film est présent dans la base de données
        cursor = conn.cursor()
        sql = "SELECT uid FROM movie WHERE uid = %s"
        cursor.execute(sql, tmdb_id)
        result = cursor.fetchone()

        if result:
            movie_uid = result[0]

            # Récupération du réalisateur du film
            director = row['director']
            if director:
                # Insertion du réalisateur dans la table staff
                cursor = conn.cursor()
                sql = "INSERT INTO staff (name, job) VALUES (%s, %s)"
                cursor.execute(sql, (director, "Director"))
                staff_uid = cursor.lastrowid

                # Insertion du lien entre le réalisateur et le film dans la table work
                cursor = conn.cursor()
                sql = "INSERT INTO work (id_staff, id_movie) VALUES (%s, %s)"
                cursor.execute(sql, (staff_uid, movie_uid))
                conn.commit()

# Fermeture de la connexion à la base de données
conn.close()
