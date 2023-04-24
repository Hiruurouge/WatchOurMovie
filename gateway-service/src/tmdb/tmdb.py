import os
from dotenv import load_dotenv
from fastapi import APIRouter,Depends
from ..auth.controller import get_current_user
import requests
from typing import Annotated
from schema import TokenData

load_dotenv()

TMDB_URL = os.getenv("TMDB_URL")

router = APIRouter(
    prefix="/tmdb",
    tags=['tmdb-data']
)

@router.post('/movie')
def tmdb_movie_cast_prod_in_db(title: str, token: Annotated[TokenData,Depends(get_current_user)]):
    result = requests.post(TMDB_URL, params={'title': title})
    return result.status_code 