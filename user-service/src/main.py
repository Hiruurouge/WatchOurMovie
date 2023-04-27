from fastapi import FastAPI, Depends, status, HTTPException
from sqlalchemy.orm import Session
from schema import User, UserBase
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import os
from dotenv import load_dotenv
from . import controller as ctrl
from fastapi.middleware.cors import CORSMiddleware

load_dotenv()

MYSQL_DATABASE_URL= os.getenv('MYSQL_DATABASE_URL')

engine = create_engine(MYSQL_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

app = FastAPI()
origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/user", status_code=201)
def create_user(user: User, db:Session=Depends(get_db)):
    ctrl.create_user(db,user)
    db.close()

@app.delete('/user',status_code=200)
def delete_user(user:UserBase, db:Session=Depends(get_db)):
    ctrl.delete_user(db,user)
    db.close()

@app.patch('/user',status_code=200) #To fix
def update_user(user: User, db:Session=Depends(get_db)): 
    ctrl.update_user(db,user)
    db.close()
    
@app.get('/user', status_code=200)
def get_user(uid: int, db:Session=Depends(get_db)):
    try:  
        user = ctrl.get_user(db,UserBase(uid=uid))
    except:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Ressource not found."
        )
    db.close()
    return user
@app.get('/user/mail', status_code=200)
def get_user(mail: str, db:Session=Depends(get_db)):
    try:  
        user = ctrl.get_user_by_mail(db,mail)
    except:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Ressource not found."
        )
    db.close()
    return user