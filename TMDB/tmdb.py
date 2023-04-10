from dotenv import dotenv_values
import requests

conf = dotenv_values(".env")


def get_movie_id(title: str):
    url:str = f"{conf['TMDB_URL']}search/movie?api_key={conf['API_KEY']}&language=en-US&query={title}&page=1"
    r:requests.Response = requests.get(url)
    return r.json()["results"][0]["id"]

def get_movie_details(id: str):
    url:str = f"{conf['TMDB_URL']}movie/{id}?api_key={conf['API_KEY']}&language=en-US"  
    r:requests.Response = requests.get(url)
    return r.json()