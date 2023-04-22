from fastapi import APIRouter,Depends
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData, GenreBase, Preferences
from dotenv import load_dotenv
from typing import List
import os
import requests
import json
load_dotenv()

GENRE_URL = os.getenv("GENRE_URL")

router = APIRouter(
    prefix="/like",
    tags=['preferences']
)

@router.get('/genre')
def get_genre_preference(token: Annotated[TokenData,Depends(get_current_user)]):
    db_preferences = requests.get(f"{GENRE_URL}/like/all", params={"uid":token.uid})
    db_preferences.raise_for_status()
    return db_preferences.json()

@router.post("/genre")
def create_genre_preference(genres: List[GenreBase], token: Annotated[TokenData,Depends(get_current_user)]):
    preferences = [Preferences(id_user=int(token.uid), id_genre=genre.uid).dict() for genre in genres]
    result = requests.post(f"{GENRE_URL}/like", data=json.dumps(preferences))
    result.raise_for_status()
    return result.json()

@router.delete("/genre")
def delete_genre_preference(genre: GenreBase,token: Annotated[TokenData,Depends(get_current_user)]):
    preference= Preferences(id_user=int(token.uid),id_genre=genre.uid)
    result = requests.delete(f"{GENRE_URL}/like",data=preference.json())
    result.raise_for_status()
    return result.json()