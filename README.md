# WatchOurMovie
  
Une application web avec un front et un back qui permet de recommander des films en fonction des préférences d'un utilisateur ou d'un groupe auquel il appartient.  

## Lancer le projet
Le projet utilise docker compose pour gérer les conteneurs des différents services.  
Pour lancer le projet : `docker compose up -d`  
Pour accéder au site : http://localhost:4200  
Pour accéder à la gateway : http://localhost:3212/api/docs  

## Variables d'environnement
Le projet a besoin de vrariable d'environnment pour fonctionner.   
Pour cela il faut un fichier .env rempli à la racine.