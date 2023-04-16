#!/bin/bash

# Ouvre le fichier de sortie en écriture, en écrasant son contenu s'il existe déjà
> sortie.txt

# Boucle sur tous les fichiers dans le répertoire courant
for fichier in *
do
    # Si le fichier est un fichier .py, retire l'extension .py et met en sortie
    if  [[ $fichier == *.py ]] && [[ $fichier != __init__.py ]] && [[ $fichier != base.py ]] && [[ $fichier != engine.py ]]; then
        nom_fichier=$(basename "$fichier" .py)
        nom_class=$(echo $nom_fichier | sed 's/^\(.\)/\U\1/')
        echo "from .$nom_fichier import $nom_class" >> sortie.txt
    # Sinon, rien hehe
    fi    
done