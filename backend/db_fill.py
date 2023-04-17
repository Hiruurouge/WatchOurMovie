import pymysql
import csv

# Connexion à la base de données
conn = pymysql.connect(host='localhost', user='root', password='', db='wow')

# Ouverture du fichier CSV contenant les données
with open('../BackEnd/data.csv', 'r', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)

    # Boucle à travers chaque ligne du fichier CSV
    for i, row in enumerate(reader):
        if i >= 200:
            break
        # Extraction des données de la ligne
        tmdb_id = row['id']
        title = row['original_title']
        release_year = row['release_year']
        overview = row['overview']
        poster = 'UNDEFINED'
        popularity = row['popularity']
        genres = ','.join(row['genres'].split('|'))

        # Insertion des données dans la base de données
        cursor = conn.cursor()
        sql = "INSERT INTO movie (tmdb_id, title, release_year, overview, poster, popularity, genres) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(sql, (tmdb_id, title, release_year, overview, poster, popularity, genres))
        conn.commit()

# Fermeture de la connexion à la base de données
conn.close()
