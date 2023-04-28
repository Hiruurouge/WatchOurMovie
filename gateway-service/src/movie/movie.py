from fastapi import APIRouter,Depends,HTTPException,status
from ..auth.controller import get_current_user
from schema import Group, GroupBase,Belong,TokenData, UserBase
from dotenv import load_dotenv
from typing import Annotated, List
import os
import requests
import json

MOVIE_URL = os.getenv('MOVIE_URL')
TMDB_URL = os.getenv('TMDB_URL')
router = APIRouter(
    prefix="/movie",
    tags=["movie"]
)

@router.get("/all")
def get_all_movies(token :Annotated[TokenData,Depends(get_current_user)]):
    response = requests.get(f"{MOVIE_URL}/movie/all")
    return response.json()

@router.get("/title")
def get_movie_by_title(title:str, token :Annotated[TokenData,Depends(get_current_user)]):
    response = requests.get(f"{MOVIE_URL}/movie/title", params={"title":title}).json()
    if (response == None):
        requests.post(TMDB_URL, params={'title': title})
        response = requests.get(f"{MOVIE_URL}/movie/title", params={"title":title}).json()
    return response

@router.get("/random")
def get_random_movies(token :Annotated[TokenData,Depends(get_current_user)]):
    response = requests.get(f"{MOVIE_URL}/movie/random")
    return response.json()
