import os
from dotenv import dotenv_values, load_dotenv
from requests import Response, get
from sqlalchemy.orm import Session

from schema import Movie, Production, Staff, Product, Work
from typing import List, Tuple
from .use_db import create_one

load_dotenv()

TMDB_URL = os.getenv('TMDB_BASE_URL')
API_KEY = os.getenv('API_KEY')
TMDB_IMG_URL = os.getenv('TMDB_BASE_IMG_URL')

def get_movie_id(title: str) -> str:
    url:str = f"{TMDB_URL}search/movie?api_key={API_KEY}&language=en-US&query={title}&page=1"
    r:Response = get(url)
    return r.json()["results"][0]["id"]

def get_movie_details(id: str) -> dict:
    url:str = f"{TMDB_URL}movie/{id}?api_key={API_KEY}&language=en-US"  
    r:Response = get(url)
    return r.json()

def get_movie_credits(id: str) -> dict:
    url:str = f"{TMDB_URL}movie/{id}/credits?api_key={API_KEY}"  
    r:Response = get(url)
    return r.json()

def clean_get_movie(data_movie: dict, data_cast: dict) -> dict:
    movie: Movie = Movie(
        uid = data_movie["id"],
        title = data_movie["title"], 
        overview = data_movie["overview"],
        release_date = data_movie["release_date"],
        poster = TMDB_IMG_URL + data_movie["poster_path"],
        popularity = float(data_movie["popularity"])
    )
    productions: List[Production] = [Production(uid=prod["id"], name=prod["name"]) for prod in data_movie["production_companies"]]
    staffs: List[Staff] = [Staff(uid=staff["id"], name=staff["name"], job=staff["known_for_department"]) for staff in data_cast["cast"]]
    return {"movie":movie, "prods": productions, "staffs": staffs}

def get_and_put_movie_and_all(db: Session, title: str) -> None:
    id = get_movie_id(title)
    data = clean_get_movie(get_movie_details(id), get_movie_credits(id))
    create_one(db, data["movie"])
    for prod in data["prods"]:
        create_one(db, prod)
        product = Product(id_production=prod.uid, id_movie=id)
        create_one(db, product)
    for staff in data["staffs"]:
        create_one(db, staff)
        work = Work(id_staff=staff.uid, id_movie=id)
        create_one(db, work)