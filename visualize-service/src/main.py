from fastapi import FastAPI,Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm  import Session, sessionmaker
from schema import Visualize
from sqlalchemy import create_engine
from dotenv import load_dotenv
from typing import List
from . import controller as ctrl 
import os 

load_dotenv()

MYSQL_DATABASE_URL = os.getenv('MYSQL_DATABASE_URL')

engine = create_engine(MYSQL_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

app=FastAPI()
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

@app.post("/watch")
def create_visualize_relationship(relations: List[Visualize],db: Session= Depends(get_db)):
    result = ctrl.create_visualize_relation(relations,db)
    db.close()
    return result

@app.get("/watch/all")
def get_movies_seen_by_user(uid:int, db:Session= Depends(get_db)):
    result = ctrl.get_movies_seen_by_user(uid,db)
    db.close()
    return result

@app.delete("/whatch")
def delete_visualize_relationship(relation:Visualize,db:Session=Depends(get_db)):
    ctrl.delete_visualize_relation(relation,db)
    db.close()

@app.patch("/watch")
def update_visualize_relationship(new_relation:Visualize,old_relation:Visualize,db:Session=Depends(get_db)):
    ctrl.update_visualize_relation(new_relation=new_relation, old_relation=old_relation,db=db)
    db.close()
 

