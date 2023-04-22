from fastapi import APIRouter,Depends
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData
from dotenv import load_dotenv
import os
import requests

load_dotenv()

PREFERENCE_URL = os.getenv("PREFERENCE_URL")

router = APIRouter(
    prefix="/ia",
    tags=['recommendation']
)

@router.get('/')
def get_recommendation(token: Annotated[TokenData,Depends(get_current_user)]):
    db_preferences = requests.get(f"{PREFERENCE_URL}/all", params={"uid":token.uid})
    db_preferences.raise_for_status()
    return {"Movies": []}