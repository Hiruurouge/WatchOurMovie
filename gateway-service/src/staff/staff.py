from fastapi import APIRouter,Depends
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData
from dotenv import load_dotenv
from typing import List
import os
import requests

load_dotenv()

STAFF_URL = os.getenv("STAFF_URL")

router = APIRouter(
    prefix="/staff",
    tags=['staff']
)

@router.get('/all')
def get_prod(token: Annotated[TokenData,Depends(get_current_user)]):
    db_prod= requests.get(f"{STAFF_URL}/all")
    return db_prod.json()
