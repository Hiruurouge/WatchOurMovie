import requests
import json
import pymysql

# Connexion à la base de données
conn = pymysql.connect(host='localhost', user='root', password='', db='wow')
cursor = conn.cursor()

# Récupération des films à partir de la table "movie"
cursor.execute("SELECT * FROM movie")
movies = cursor.fetchall()

# URL de l'API TMDb
url = "https://api.themoviedb.org/3/movie/{tmdb_id}?api_key=3f49224776894938c6b988e3d4d0e944&language=en-US"

# Parcourir chaque film et récupérer sa date de sortie
for movie in movies:
    # Récupération de l'ID TMDb du film
    tmdb_id = movie[1]

    # Requête de l'API TMDb
    response = requests.get(url.format(tmdb_id=tmdb_id))

    # Vérification du code d'état de la réponse
    if response.status_code == 200:
        # Extraction de la date de sortie de la réponse
        data = json.loads(response.text)
        release_date = data["release_date"]

        # Mise à jour de la base de données
        cursor.execute("UPDATE movie SET release_date = %s WHERE tmdb_id = %s", (release_date, tmdb_id))
        conn.commit()

# Fermeture de la connexion
conn.close()
