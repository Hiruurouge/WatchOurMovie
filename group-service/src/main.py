from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session, sessionmaker
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine
from schema import Group, GroupBase, Belong
from . import controller as ctrl
from dotenv import load_dotenv
from typing import List
import os

load_dotenv()

MYSQL_DATABASE_URL = os.getenv('MYSQL_DATABASE_URL')

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

@app.get("/")
def get_group(uid: int, db:Session=Depends(get_db)):
    group = GroupBase(uid=uid)
    result= ctrl.get_group(group, db)
    db.close()
    return result

@app.delete("/")
def delete_group(group:GroupBase,db: Session= Depends(get_db)):
    ctrl.delete_group(group,db)
    db.close()

@app.patch("/")
def update_group(group: Group, db: Session= Depends(get_db)):
    ctrl.update_group(group,db)
    db.close()

@app.post("/", status_code=201)
def create_group(group:Group, db:Session=Depends(get_db)):
    result = ctrl.create_group(group,db)
    db.close()
    return result
    

@app.post("/add", status_code=201)
def add_group(belong:List[Belong], db: Session= Depends(get_db)):
    ctrl.add_to_group(belong, db)
    db.close()
    

@app.post("/quit")
def quit_group(belong: Belong, db: Session=Depends(get_db)):
    ctrl.quit_group(belong, db)
    db.close()
    
@app.get("/users")
def get_users_by_group(uid:int,db:Session=Depends(get_db)):
    result = ctrl.get_users_by_group(db,uid)
    db.close()
    return result

@app.get("/all")
def get_groups_by_user(uid:int,db:Session= Depends(get_db)):
    result= ctrl.get_groups_by_user(db,uid)
    db.close()
    return result
