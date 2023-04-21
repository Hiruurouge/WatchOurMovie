from fastapi import APIRouter,Depends
from ..auth.controller import  get_current_user
from schema import User, TokenData, UserBase, AuthId
from typing import Annotated
import requests
import os
from dotenv import load_dotenv
load_dotenv()

USER_IP=os.getenv("USER_IP")
USER_PORT = os.getenv("USER_PORT")
USER_URL = f'http://{USER_IP}:{USER_PORT}/user'
AUTH_URL = os.getenv("AUTH_URL")
router = APIRouter(
    prefix="/user",
    tags=["user"] 
)



@router.get('/')
def get_user(token: Annotated[TokenData,Depends(get_current_user)]):
    result = requests.get(USER_URL, params={'uid': token.uid})
    return result.json()

@router.patch ('/')
def update_user(user: User,token: Annotated[TokenData, Depends(get_current_user)]):
    user.uid= token.uid
    result = requests.patch(USER_URL, data=user.json())
    return result.status_code

@router.delete('/')
def delete_user(token:Annotated[TokenData, Depends(get_current_user)]):
    user= AuthId(uid=token.uid)
    result = requests.delete(user, data=user.json())
    return result.status_code


   
