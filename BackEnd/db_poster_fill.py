import pymysql
import requests

# Connexion à la base de données
conn = pymysql.connect(host='localhost', user='root', password='', db='wow')

# Requête SQL pour récupérer les films avec un tmdb_id supérieur ou égal à 252
sql = "SELECT * FROM movie WHERE tmdb_id >= 252"
cursor = conn.cursor()
cursor.execute(sql)
rows = cursor.fetchall()

# Boucle à travers chaque ligne de la réponse SQL
for row in rows:
    # Extraction des données de la ligne
    tmdb_id = row[1]
    poster_path = row[6]

    # Requête API pour récupérer les informations sur le film
    url = f"https://api.themoviedb.org/3/movie/{tmdb_id}?api_key=3f49224776894938c6b988e3d4d0e944&language=en-US"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        # Récupération de l'URL du poster
        if data['poster_path'] is not None:
            poster_url = f"https://image.tmdb.org/t/p/w500/{data['poster_path']}"
        else:
            poster_url = 'UNDEFINED'

        # Mise à jour de la base de données avec l'URL du poster
        cursor = conn.cursor()
        sql = "UPDATE movie SET poster=%s WHERE tmdb_id=%s"
        cursor.execute(sql, (poster_url, tmdb_id))
        conn.commit()

# Fermeture de la connexion à la base de données
conn.close()
