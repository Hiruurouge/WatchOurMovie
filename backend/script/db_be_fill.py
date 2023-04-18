import pymysql

# Connexion à la base de données
connection = pymysql.connect(host='localhost', user='root', password='', db='wow')


# Récupération des correspondances entre noms de genres et IDs de genres
genre_map = {}
with connection.cursor() as cursor:
    cursor.execute('SELECT name, uid FROM genre')
    for name, uid in cursor.fetchall():
        genre_map[name] = uid

# Récupération des IDs de films et des noms de genres correspondants dans la table movie
with connection.cursor() as cursor:
    cursor.execute('SELECT uid, genres FROM movie')
    for uid, genres_str in cursor.fetchall():
        genres = genres_str.split(',')
        for genre_name in genres:
            # Récupération de l'ID correspondant dans la table genre
            genre_id = genre_map.get(genre_name)
            if genre_id:
                # Insertion dans la table be
                cursor.execute('INSERT INTO be (id_genre, id_movie) VALUES (%s, %s)', (genre_id, uid))

# Validation de la transaction
connection.commit()

# Fermeture de la connexion
connection.close()
