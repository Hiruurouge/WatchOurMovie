import pymysql
import requests

# Connexion à la base de données
conn = pymysql.connect(host='localhost', user='root', password='', db='wow')

# Récupération des films de la table "movie"
cur = conn.cursor()
cur.execute("SELECT uid, title FROM movie")
movies = cur.fetchall()

# Parcours des films
for movie in movies:
    # Appel à l'API pour récupérer les informations de production
    api_url = f"https://api.themoviedb.org/3/movie/{movie[0]}?api_key=3f49224776894938c6b988e3d4d0e944&language=en-US"
    response = requests.get(api_url)
    if response.status_code != 200:
        print(f"Erreur lors de la récupération des informations pour le film {movie[1]}")
        continue
    production_data = response.json().get("production_companies", [])
    
    # Recherche des identifiants de production correspondant aux noms dans les données de l'API
    production_ids = []
    for production in production_data:
        cur.execute("SELECT uid FROM production WHERE name = %s", production["name"])
        result = cur.fetchone()
        if result:
            production_ids.append(result[0])
    
    # Ajout des relations dans la table "product"
    for production_id in production_ids:
        cur.execute("INSERT INTO product (id_production, id_movie) VALUES (%s, %s)", (production_id, movie[0]))
        conn.commit()

# Fermeture de la connexion
cur.close()
conn.close()
