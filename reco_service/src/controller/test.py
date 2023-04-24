import pymysql.cursors

# Connexion à la base de données
connection = pymysql.connect(host='10.5.0.2', user='root', password='7iJoxvKgMGw4x3nBXMAt', db='wow')
print(connection)
