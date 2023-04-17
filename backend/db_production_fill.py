import csv
import pymysql

# Connexion à la base de données
conn = pymysql.connect(host='localhost', user='root', password='', db='wow')

# Récupération des 200 premières entrées du fichier CSV
with open('../BackEnd/data.csv', 'r', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    data = list(reader)[:200]

# Boucle à travers chaque ligne du fichier CSV
for row in data:
    # Vérification si le tmdb_id du film est présent dans la table movie
    cursor = conn.cursor()
    sql = "SELECT uid FROM movie WHERE tmdb_id = %s"
    cursor.execute(sql, row['id'])
    result = cursor.fetchone()

    # Si le film est présent dans la table movie
    if result:
        movie_uid = result[0]

        # Récupération des maisons de production du film
        production_companies = row['production_companies'].split('|')

        # Boucle à travers chaque maison de production
        for company in production_companies:
            # Vérification si la maison de production est présente dans la table production
            cursor = conn.cursor()
            sql = "SELECT uid FROM production WHERE name = %s"
            cursor.execute(sql, company)
            result = cursor.fetchone()

            # Si la maison de production n'est pas présente dans la table production, on l'ajoute
            if not result:
                cursor = conn.cursor()
                sql = "INSERT INTO production (name) VALUES (%s)"
                cursor.execute(sql, company)
                conn.commit()

                # Récupération de l'id de la maison de production ajoutée
                cursor = conn.cursor()
                sql = "SELECT uid FROM production WHERE name = %s"
                cursor.execute(sql, company)
                result = cursor.fetchone()

            production_uid = result[0]

            # Vérification si l'association movie_uid/production_uid est déjà présente dans la table product
            cursor = conn.cursor()
            sql = "SELECT id_movie FROM product WHERE id_movie = %s AND id_production = %s"
            cursor.execute(sql, (movie_uid, production_uid))
            result = cursor.fetchone()

            # Si l'association n'est pas présente dans la table product, on l'ajoute
            if not result:
                cursor = conn.cursor()
                sql = "INSERT INTO product (id_movie, id_production) VALUES (%s, %s)"
                cursor.execute(sql, (movie_uid, production_uid))
                conn.commit()

# Fermeture de la connexion à la base de données
conn.close()
