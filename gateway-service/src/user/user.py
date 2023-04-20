from fastapi import APIRouter,Depends
from ..auth.controller import  get_current_user
from schema import User, TokenData, UserBase
from typing import Annotated
import requests
import os
from dotenv import load_dotenv
load_dotenv()

USER_IP=os.getenv("USER_IP")
USER_PORT = os.getenv("USER_PORT")
USER_URL = f'http://{USER_IP}:{USER_PORT}/user'

router = APIRouter(
    prefix="/user",
    tags=["user"] 
)

@router.post('/')
def create_user(user: User, token :Annotated[TokenData,Depends(get_current_user)]):
    user.uid = token.uid
    result = requests.post(USER_URL, data=user.json())
    return result.status_code
    

@router.get('/')
def get_user(token: Annotated[TokenData,Depends(get_current_user)]):
    result = requests.get(USER_URL, params={'uid': token.uid})
    return result.status_code 

@router.patch ('/')
def update_user(user: User,token: Annotated[TokenData, Depends(get_current_user)]):
    user.uid= token.uid
    result = requests.patch(USER_URL, data=user.json())
    return result.status_code

@router.delete('/')
def update_user(token:Annotated[TokenData, Depends(get_current_user)]):
    user= UserBase(uid=token.uid)
    result = requests.delete(USER_URL, data=user.json())
    return result.status_code


   
