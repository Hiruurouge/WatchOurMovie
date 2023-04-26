from fastapi import APIRouter,Depends
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData
from dotenv import load_dotenv
from typing import List
import os
import requests

load_dotenv()

MOVIE_URL = os.getenv("MOVIE_URL")

router = APIRouter(
    prefix="/production",
    tags=['production']
)

@router.get('/all')
def get_prod(token: Annotated[TokenData,Depends(get_current_user)]):
    db_prod= requests.get(f"{MOVIE_URL}/production/all", params={"uid":token.uid})
    return db_prod.json()
