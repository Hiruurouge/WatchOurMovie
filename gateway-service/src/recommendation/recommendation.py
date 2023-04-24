import json
from fastapi import APIRouter,Depends
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData,Prediction
from dotenv import load_dotenv
import os
import requests
load_dotenv()

RECO_URL = os.getenv("RECO_URL")

router = APIRouter(
    prefix="/predict",
    tags=['recommendation']
)

@router.post('/')
def get_recommendation(preferences: Prediction,token: Annotated[TokenData,Depends(get_current_user)]):
    headers = {'Content-Type': 'application/json', 'accept': 'application/json'}
    response = requests.post(f"{RECO_URL}", headers=headers, data=preferences.json())
    return response.json()