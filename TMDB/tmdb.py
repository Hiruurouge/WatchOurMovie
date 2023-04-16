from dotenv import dotenv_values
import requests
from schema import Movie, Production, Staff
from typing import List, Tuple

conf = dotenv_values("tmdb/.env")

def get_movie_id(title: str) -> str:
    url:str = f"{conf['TMDB_URL']}search/movie?api_key={conf['API_KEY']}&language=en-US&query={title}&page=1"
    r:requests.Response = requests.get(url)
    return r.json()["results"][0]["id"]

def get_movie_details(id: str) -> dict:
    url:str = f"{conf['TMDB_URL']}movie/{id}?api_key={conf['API_KEY']}&language=en-US"  
    r:requests.Response = requests.get(url)
    return r.json()

def get_movie_credits(id: str) -> dict:
    url:str = f"{conf['TMDB_URL']}movie/{id}/credits?api_key={conf['API_KEY']}"  
    r:requests.Response = requests.get(url)
    return r.json()

def clean_get_movie(data_movie: dict, data_cast: dict) -> Tuple[Movie, List[Production], List[Staff]]:
    movie: Movie = Movie(
        title = data_movie["title"], 
        overview = data_movie["overview"],
        release_date = data_movie["release_date"],
        poster = conf["TMDB_IMG_URL"] + data_movie["poster_path"],
        popularity = float(data_movie["popularity"])
    )
    productions: List[Production] = [Production(name=prod["name"]) for prod in data_movie["production_companies"]]
    staffs: List[Staff] = [Staff(name=staff["name"], job=staff["known_for_department"]) for staff in data_cast["cast"]]
    return (movie, productions, staffs)

def get_movie(title: str) -> Tuple[Movie, List[Production], List[Staff]]:
    id = get_movie_id(title)
    return clean_get_movie(get_movie_details(id), get_movie_credits(id))
