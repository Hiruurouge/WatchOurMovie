from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from pydantic.tools import parse_obj_as
from typing import Annotated
from datetime import timedelta
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import os
from dotenv import load_dotenv
from . import controller as ctrl
from schema import AuthCredentials, Auth, Token, User
import requests

load_dotenv()

MYSQL_DATABASE_URL= os.getenv('MYSQL_DATABASE_URL')
ACCESS_TOKEN_EXPIRE_MINUTES = int(os.getenv('ACCESS_TOKEN_EXPIRE_MINUTES'))
AUTH_URL = os.getenv('AUTH_URL')
USER_URL = os.getenv('USER_URL')
engine = create_engine(MYSQL_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

router = APIRouter(
    prefix="/auth",
    tags=["authentication"]
)


@router.post("/signup")
def create_user(auth: AuthCredentials, user:User):
    result = requests.post(url=AUTH_URL,data=auth.json())
    if result.status_code==201:
        user.uid = int(result.text)
        response = requests.post(url=USER_URL, data= user.json())
        if response.status_code!=201:
            raise HTTPException(status_code=response.status_code, detail="Unable to store profil details.")
    else:
        raise HTTPException(status_code=result.status_code, detail="Unable to create user.")

@router.post("/login")
def authenticate_user(form_data: Annotated[OAuth2PasswordRequestForm, Depends()]):
    try:
        auth = AuthCredentials(email= form_data.username, password= form_data.password)
        response = requests.post(f"{AUTH_URL}/authenticate", data=auth.json())
    except: 
        raise HTTPException(status_code= status.HTTP_401_UNAUTHORIZED, detail= "Invalid credentials",headers={"WWW-Authenticate": "Bearer"})
    user_dict= response.json()
    user = parse_obj_as(Auth, user_dict)
    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = ctrl.create_access_token(data={"uid": user.uid}, expires_delta=access_token_expires)
    return Token(access_token=access_token,token_type="Bearer")

@router.get("/hash")
def get_hashed_password(password:str):
    hashed = ctrl.get_password_hash(password)
    return hashed

