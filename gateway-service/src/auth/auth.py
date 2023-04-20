from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from typing import Annotated
from datetime import timedelta
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker,Session
import os
from dotenv import load_dotenv
from . import controller as ctrl
from schema import AuthCredentials, Auth,AuthId, TokenData, Token, User

load_dotenv()

MYSQL_DATABASE_URL= os.getenv('MYSQL_DATABASE_URL')
ACCESS_TOKEN_EXPIRE_MINUTES = int(os.getenv('ACCESS_TOKEN_EXPIRE_MINUTES'))

engine = create_engine(MYSQL_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

router = APIRouter(
    prefix="/auth",
    tags=["authentication"]
)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/signup")
async def create_user(auth: AuthCredentials,db:Session=Depends(get_db)):
    ctrl.create_user(auth,db)   
    db.close()

@router.delete("/")
def delete_user(token: Annotated[TokenData, Depends(ctrl.get_current_user)], db:Session=Depends(get_db)):
    auth = AuthId(uid = token.uid)
    ctrl.delete_user(auth,db)
    db.close()

@router.patch("/")
def update_user(credentials: AuthCredentials ,token: Annotated[TokenData, Depends(ctrl.get_current_user)], db:Session=Depends(get_db)):
    auth= Auth(email=credentials.email, password=credentials.password, uid= token.uid)
    ctrl.update_user(auth,db)
    db.close()

@router.get("/")
def get_user(token: Annotated[TokenData, Depends(ctrl.get_current_user)], db:Session=Depends(get_db)):
    auth = AuthId(uid=token.uid)
    return ctrl.get_user(auth,db)

@router.post("/login")
def authenticate_user(form_data: Annotated[OAuth2PasswordRequestForm, Depends()], db:Session= Depends(get_db)):
    try:
        auth = AuthCredentials(email= form_data.username, password= form_data.password)
        user = ctrl.authenticate_user(auth,db)
    except: 
        raise HTTPException(status_code= status.HTTP_401_UNAUTHORIZED, detail= "Invalid credentials",headers={"WWW-Authenticate": "Bearer"})
    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = ctrl.create_access_token(data={"uid": user.uid}, expires_delta=access_token_expires)
    return Token(access_token=access_token,token_type="Bearer")

@router.get("/hash")
def get_hashed_password(password:str):
    hashed = ctrl.get_password_hash(password)
    return hashed

@router.post("/")
def decode_token(token:TokenData = Depends(ctrl.get_current_user)):
    return token
