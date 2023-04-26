from fastapi import APIRouter,Depends
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData, MovieId, Visualize
from dotenv import load_dotenv
from typing import List
import os
import requests
import json
load_dotenv()

MOVIE_URL = os.getenv("MOVIE_URL")

router = APIRouter(
    prefix="/watch",
    tags=['visualize']
)

@router.get('/all')
def get_movies_seen_by_user(token: Annotated[TokenData,Depends(get_current_user)]):
    db_preferences = requests.get(f"{MOVIE_URL}/watch/all", params={"uid":token.uid})
    db_preferences.raise_for_status()
    return db_preferences.json()

@router.post("/")
def create_visualize_relationships(movies: List[MovieId], token: Annotated[TokenData,Depends(get_current_user)]):
    visualize = [Visualize(id_user=int(token.uid), id_movie=movie.uid).dict() for movie in movies]
    result = requests.post(f"{MOVIE_URL}/watch/like", data=json.dumps(visualize))
    result.raise_for_status()
    return result.json()

@router.delete("/")
def delete_visualize_relationship(movie:MovieId,token: Annotated[TokenData,Depends(get_current_user)]):
    visualize= Visualize(id_user=int(token.uid),id_movie=movie.uid)
    result = requests.delete(f"{MOVIE_URL}/watch/like",data=visualize.json())
    result.raise_for_status()
    return result.json()