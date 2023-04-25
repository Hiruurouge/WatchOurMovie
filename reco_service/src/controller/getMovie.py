import json
import numpy as np
import pymysql
import os
from dotenv import load_dotenv

load_dotenv()
MYSQL_PASSWORD = os.getenv('MYSQL_PASSWORD')
MYSQL_USER = os.getenv('MYSQL_USER')
# Définir les films
connection = pymysql.connect(
    host='10.5.0.2',
    port=3306,
    user=MYSQL_USER,
    password=MYSQL_PASSWORD,
    database='wow',
    cursorclass=pymysql.cursors.DictCursor)


try:
    with connection.cursor() as cursor:
        # Récupération des données de chaque film
        cursor.execute("SELECT uid, title,poster,overview FROM movie")
        movies = cursor.fetchall()
        # Récupération des genres, maisons de production et réalisateurs pour chaque film
        for movie in movies:
            # Récupération des genres pour chaque film
            cursor.execute("SELECT genre.* FROM genre JOIN be ON genre.uid=be.id_genre WHERE be.id_movie=%s", (movie['uid'],))
            genres = [genre['name'] for genre in cursor.fetchall()]
            movie['genres'] = genres

            # Récupération des maisons de production pour chaque film
            cursor.execute("SELECT production.* FROM production JOIN product ON production.uid=product.id_production WHERE product.id_movie=%s", (movie['uid'],))
            productions = [prod['name'] for prod in cursor.fetchall()]
            movie['maisons_de_production'] = productions

            # Récupération des réalisateurs pour chaque film
            cursor.execute("SELECT staff.* FROM staff JOIN work ON staff.uid=work.id_staff WHERE work.id_movie=%s AND staff.job='Director'", (movie['uid'],))
            directors = [dir['name'] for dir in cursor.fetchall()]
            movie['realisateurs'] = directors

finally:
    # Fermeture de la connexion à la base de données
    connection.close()
# Définir les utilisateurs
utilisateurs = [
    {
        'nom': 'Alice',
        'preferences': {
            'genres': ['romance', 'comédie musicale'],
            'realisateurs': ['Damien Chazelle'],
            'maisons_de_production': ['Summit Entertainment','Universal Pictures']
        }
    },
    {
        'nom': 'Bob',
        'preferences': {
            'genres': ['action', 'aventure'],
            'realisateurs': ['Steven Spielberg', 'Christopher Nolan'],
            'maisons_de_production': ['Universal Pictures']
        }
    },
    {
        'nom': 'Charlie',
        'preferences': {
            'genres': ['drame'],
            'realisateurs': ['James Cameron'],
            'maisons_de_production': ['Paramount Pictures']
        }
    }
]

# Créer des dictionnaires pour stocker les films par genre, réalisateur et maison de production
genres_dict = {}
realisateurs_dict = {}
maisons_de_production_dict = {}

films = []
for movie in movies:
    nouveau_film = {}
    nouveau_film['titre'] = movie['title']
    nouveau_film['genres'] = movie['genres']
    nouveau_film['realisateurs'] = movie['realisateurs']
    nouveau_film['maisons_de_production'] = movie['maisons_de_production']
    films.append(nouveau_film)

for film in films:
    titre = film['titre']
    genres = film['genres']
    realisateurs = film['realisateurs']
    maisons_de_production = film['maisons_de_production']
    
    # Ajouter le film au dictionnaire de genre
    for genre in genres:
        if genre not in genres_dict:
            genres_dict[genre] = []
        genres_dict[genre].append(titre)
    
    # Ajouter le film au dictionnaire de réalisateur
    for realisateur in realisateurs:
        if realisateur not in realisateurs_dict:
            realisateurs_dict[realisateur] = []
        realisateurs_dict[realisateur].append(titre)
    
    # Ajouter le film au dictionnaire de maison de production
    for maison_de_production in maisons_de_production:
        if maison_de_production not in maisons_de_production_dict:
            maisons_de_production_dict[maison_de_production] = []
        maisons_de_production_dict[maison_de_production].append(titre)

def transform_object(preferences):
    # Charger l'objet JSON en un dictionnaire Python
    
    # Extraire les noms des genres, réalisateurs et maisons de production
    genres = [genre['name'] for genre in preferences['genres']]
    realisateurs = [staff['name'] for staff in preferences['staffs']]
    maisons_de_production = [production['name'] for production in preferences['productions']]
    
    # Créer un nouveau dictionnaire avec les noms extraits
    nouveau_dict = {
        'genres': genres,
        'realisateurs': realisateurs,
        'maisons_de_production': maisons_de_production
    }
    
    return nouveau_dict
# Créer une fonction pour calculer la similarité cosinus entre deux vecteurs
def cosine_similarity(a, b):
    """
    Calcule la similarité cosinus entre deux vecteurs
    """
    dot_product = np.dot(a, b)
    norm_a = np.linalg.norm(a)
    norm_b = np.linalg.norm(b)
    return dot_product / (norm_a * norm_b)

def recommander_films(preferences):
    #preferences = json.loads(preferences)
    data = json.loads(preferences)
    preferences = transform_object(data)
    films_recommandes = []
    # Collecter tous les films avec les de l'utilisateur
    for genre in preferences['genres']:
        if genre not in genres_dict:
            genres_dict.setdefault(genre, [])
        films_recommandes.extend(genres_dict[genre])
    for realisateur in preferences['realisateurs']:
        if realisateur not in realisateurs_dict:
            realisateurs_dict.setdefault(realisateur,[])
        films_recommandes.extend(realisateurs_dict[realisateur])
    for maison_de_production in preferences['maisons_de_production']:
        if maison_de_production not in maisons_de_production_dict:
            maisons_de_production_dict.setdefault(maison_de_production,[])
        films_recommandes.extend(maisons_de_production_dict[maison_de_production])

    # Enlever les doublons
    films_recommandes = list(set(films_recommandes))
    similarites_cosinus = {}

    # Calculer la similarité cosinus entre chaque film et les préférences de l'utilisateur
    for film in films_recommandes:
        film_preferences = np.zeros((3,))
        user_preferences = np.zeros((3,))
        film_genres = films[0]['genres']
        film_realisateurs = films[0]['realisateurs']
        film_maisons_de_production = films[0]['maisons_de_production']

        # Créer un vecteur pour les films
        for genre in film_genres:
            if genre in preferences['genres']:
                film_preferences[0] = 1
        for realisateur in film_realisateurs:
            if realisateur in preferences['realisateurs']:
                film_preferences[1] = 1
        for maison_de_production in film_maisons_de_production:
            if maison_de_production in preferences['maisons_de_production']:
                film_preferences[2] = 1
        
        # Créer un vecteur pour les préférences de l'utilisateur
        user_preferences[0] = len(preferences['genres'])
        user_preferences[1] = len(preferences['realisateurs'])
        user_preferences[2] = len(preferences['maisons_de_production'])
        
        # Calculer la similarité cosinus entre le film et les préférences de l'utilisateur
        similarite = cosine_similarity(film_preferences, user_preferences)
        similarites_cosinus[film] = similarite

    # Trier les films par ordre de similarité cosinus décroissante et retourner les meilleurs films recommandés
    films_recommandes = sorted(similarites_cosinus.keys(), key=lambda x: similarites_cosinus[x], reverse=True)
    print(similarites_cosinus)
    
    films_recommandes_objets = []

    for titre in films_recommandes[:10]:
        for film in movies:
            if film['title'] == titre:
                films_recommandes_objets.append(film)
                break
    return films_recommandes_objets
