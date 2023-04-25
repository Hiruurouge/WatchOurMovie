# Connexion à la base de données
import pymysql
connection = pymysql.connect(
    host='localhost',
    port=3306,
    user='app',
    password='rZ3uNu3VeBJKowr3b42Q',
    database='wow',
    cursorclass=pymysql.cursors.DictCursor)


try:
    with connection.cursor() as cursor:
        # Récupération des données de chaque film
        cursor.execute("SELECT uid, title FROM movie")
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

# Affichage des films et de leurs données
print(movies[::5])