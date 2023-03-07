import numpy as np

# Définir les films
films = [
    {
        'titre': 'La La Land',
        'genres': ['comédie musicale', 'romance', 'drame'],
        'realisateurs': ['Damien Chazelle'],
        'maisons_de_production': ['Summit Entertainment', 'Black Label Media']
    },
    {
        'titre': 'The Dark Knight',
        'genres': ['action', 'thriller', 'drame'],
        'realisateurs': ['Christopher Nolan'],
        'maisons_de_production': ['Warner Bros. Pictures', 'Legendary Entertainment']
    },
    {
        'titre': 'Inception',
        'genres': ['action', 'aventure', 'sci-fi'],
        'realisateurs': ['Christopher Nolan'],
        'maisons_de_production': ['Warner Bros. Pictures', 'Syncopy']
    },
    {
        'titre': 'Jurassic Park',
        'genres': ['action', 'aventure', 'sci-fi'],
        'realisateurs': ['Steven Spielberg'],
        'maisons_de_production': ['Universal Pictures', 'Amblin Entertainment']
    },
    {
        'titre': 'Titanic',
        'genres': ['romance', 'drame'],
        'realisateurs': ['James Cameron'],
        'maisons_de_production': ['Paramount Pictures', '20th Century Fox']
    }
]

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

# Créer une fonction pour calculer la similarité cosinus entre deux vecteurs
def cosine_similarity(a, b):
    """
    Calcule la similarité cosinus entre deux vecteurs
    """
    dot_product = np.dot(a, b)
    norm_a = np.linalg.norm(a)
    norm_b = np.linalg.norm(b)
    return dot_product / (norm_a * norm_b)
def recommander_films(utilisateur):
    preferences = utilisateur['preferences']
    films_recommandes = []
    # Collecter tous les films préférés de l'utilisateur
    for genre in preferences['genres']:
        films_recommandes.extend(genres_dict[genre])
    for realisateur in preferences['realisateurs']:
        films_recommandes.extend(realisateurs_dict[realisateur])
    for maison_de_production in preferences['maisons_de_production']:
        films_recommandes.extend(maisons_de_production_dict[maison_de_production])

    # Enlever les films en double et créer un dictionnaire pour stocker les similarités cosinus
    films_recommandes = list(set(films_recommandes))
    similarites_cosinus = {}

    # Calculer la similarité cosinus entre chaque film et les préférences de l'utilisateur
    for film in films_recommandes:
        film_preferences = np.zeros((3,))
        user_preferences = np.zeros((3,))
        film_genres = films[0]['genres']
        film_realisateurs = films[0]['realisateurs']
        film_maisons_de_production = films[0]['maisons_de_production']

        # Créer un vecteur pour les préférences de film
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
    return films_recommandes[:5]
alice = utilisateurs[0]
films_recommandes = recommander_films(alice)
print(films_recommandes)