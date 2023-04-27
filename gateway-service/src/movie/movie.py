from fastapi import APIRouter,Depends,HTTPException,status
from ..auth.controller import get_current_user
from schema import Group, GroupBase,Belong,TokenData, UserBase
from dotenv import load_dotenv
from typing import Annotated, List
import os
import requests
import json
MOVIE_URL = os.getenv('MOVIE_URL')
router = APIRouter(
    prefix="/movie",
    tags=["movie"]
)

@router.get("/all")
def get_group(token :Annotated[TokenData,Depends(get_current_user)]):
    response = requests.get(f"{MOVIE_URL}/movie/all")
    return response.json()
