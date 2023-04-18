import json
import pymysql

# Connexion à la base de données
conn = pymysql.connect(host='localhost', user='root', password='', db='wow')

cursor = conn.cursor()

# Données des genres
genres_data = {
    "genres": [
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 12,
            "name": "Adventure"
        },
        {
            "id": 16,
            "name": "Animation"
        },
        {
            "id": 35,
            "name": "Comedy"
        },
        {
            "id": 80,
            "name": "Crime"
        },
        {
            "id": 99,
            "name": "Documentary"
        },
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 10751,
            "name": "Family"
        },
        {
            "id": 14,
            "name": "Fantasy"
        },
        {
            "id": 36,
            "name": "History"
        },
        {
            "id": 27,
            "name": "Horror"
        },
        {
            "id": 10402,
            "name": "Music"
        },
        {
            "id": 9648,
            "name": "Mystery"
        },
        {
            "id": 10749,
            "name": "Romance"
        },
        {
            "id": 878,
            "name": "Science Fiction"
        },
        {
            "id": 10770,
            "name": "TV Movie"
        },
        {
            "id": 53,
            "name": "Thriller"
        },
        {
            "id": 10752,
            "name": "War"
        },
        {
            "id": 37,
            "name": "Western"
        }
    ]
}

# Parcourir chaque genre et l'insérer dans la table "genre"
for genre in genres_data["genres"]:
    genre_id = genre["id"]
    genre_name = genre["name"]

    # Vérifier si le genre existe déjà dans la table
    cursor.execute("SELECT COUNT(*) FROM genre WHERE uid = %s", (genre_id,))
    count = cursor.fetchone()[0]

    if count == 0:
        # Insérer le genre dans la table
        cursor.execute("INSERT INTO genre (uid, name) VALUES (%s, %s)", (genre_id, genre_name))
        conn.commit()

# Fermer la connexion
conn.close()
