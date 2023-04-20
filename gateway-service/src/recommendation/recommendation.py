from fastapi import APIRouter,Depends
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData
import os
from dotenv import load_dotenv

router = APIRouter(
    prefix="/ia",
    tags=['recommendation']
)

@router.get('/')
def get_recommendation(token: Annotated[TokenData,Depends(get_current_user)]):
    return {"Movies": []}