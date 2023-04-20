from fastapi import FastAPI, Depends, status, HTTPException
from sqlalchemy.orm import Session
from schema import Auth,AuthCredentials, AuthId
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import os
from dotenv import load_dotenv
from . import controller as ctrl

load_dotenv()

MYSQL_DATABASE_URL= os.getenv('MYSQL_DATABASE_URL')

engine = create_engine(MYSQL_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/", status_code=201)
def create_user(auth: AuthCredentials, db:Session=Depends(get_db)):
    result = ctrl.create_user(auth,db)
    db.close()
    return result

@app.get("/")
def get_user(uid:int, db:Session= Depends(get_db)):
    auth = AuthId(uid=uid)
    result = ctrl.get_user(auth,db)
    db.close()
    return result

@app.patch("/")
def update_user(auth:Auth, db:Session=Depends(get_db)):
    ctrl.update_user(auth, db)
    db.close()

@app.delete("/")
def delete_user(auth:AuthId, db:Session=Depends(get_db)):
    ctrl.delete_user(auth,db)
    db.close()

@app.post("/authenticate")
def authenticate_user(auth: AuthCredentials, db:Session=Depends(get_db)):
    result = ctrl.authenticate_user(auth,db)
    db.close()
    return result
