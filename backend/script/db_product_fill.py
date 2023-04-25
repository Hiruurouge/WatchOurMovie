import csv
import pymysql.cursors

# Connect to the database
connection = pymysql.connect(host='localhost',
                             user='app',
                             password='rZ3uNu3VeBJKowr3b42Q',
                             db='wow',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

try:
    with open('data.csv', 'r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            # Check if the movie id exists in the movie table
            cursor = connection.cursor()
            cursor.execute("SELECT uid FROM movie WHERE uid=%s", (row['id'],))
            result = cursor.fetchone()
            if result is None:
                print(f"Movie with id {row['id']} not found in database.")
            else:
                # Split the production companies string into a list of company names
                production_companies = row['production_companies'].split('|')
                for production_company in production_companies:
                    # Check if the production company exists in the production table
                    cursor = connection.cursor()
                    cursor.execute("SELECT uid FROM production WHERE name=%s", (production_company,))
                    result = cursor.fetchone()
                    if result is None:
                        # If the production company doesn't exist, insert it into the production table and get the new uid
                        cursor = connection.cursor()
                        cursor.execute("INSERT INTO production (name) VALUES (%s)", (production_company,))
                        production_uid = cursor.lastrowid
                    else:
                        # If the production company already exists, use its uid
                        production_uid = result['uid']
                    # Check if the relationship already exists in the product table
                    cursor = connection.cursor()
                    cursor.execute("SELECT id_production, id_movie FROM product WHERE id_production=%s AND id_movie=%s",
                                   (production_uid, row['id']))
                    result = cursor.fetchone()
                    if result is not None:
                        print(f"Relationship between movie {row['id']} and production {production_uid} already exists.")
                    else:
                        # If the relationship doesn't exist, insert it into the product table
                        cursor = connection.cursor()
                        cursor.execute("INSERT INTO product (id_production, id_movie) VALUES (%s, %s)",
                                       (production_uid, row['id']))
            connection.commit()

finally:
    connection.close()
