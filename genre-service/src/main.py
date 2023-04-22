from fastapi import FastAPI,Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm  import Session, sessionmaker
from schema import GenreBase, Preferences, Genre
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

@app.post("/genre/like")
def create_preferences(genres: List[Preferences],db: Session= Depends(get_db)):
    result = ctrl.create_preference(genres,db)
    db.close()
    return result

@app.get("/genre/like/all")
def get_preferences_by_user(uid:int, db:Session= Depends(get_db)):
    result = ctrl.get_preferences_by_user(uid,db)
    db.close()
    return result

@app.delete("/genre/like")
def delete_preferences(preferences:Preferences,db:Session=Depends(get_db)):
    ctrl.delete_preferences(preferences,db)
    db.close()

@app.patch("/genre/like")
def update_preferences(new_preferences:Preferences,old_preferences:Preferences,db:Session=Depends(get_db)):
    ctrl.update_preferences(new_preferences=new_preferences, old_preferences=old_preferences,db=db)
    db.close()
 
@app.get("/genre")
def get_genre(genre:int, db:Session=Depends(get_db)):
    result = ctrl.get_genre(GenreBase(uid=genre),db)
    db.close()
    return result

@app.get("/genre/all")
def get_genres(db:Session=Depends(get_db)):
    result = ctrl.get_all_genres(db)
    db.close()
    return result

@app.post("/genre")
def create_genre(genre: Genre,db: Session = Depends(get_db)):
    result = ctrl.create_genre(genre, db)
    db.close()
    return result

@app.post("/genre/multiple")
def create_genres(genres: List[Genre], db:Session=Depends(get_db)):
    result = ctrl.create_genres(genres, db)
    db.close()
    return result

@app.delete("/genre")
def delete_genre(genre:GenreBase, db: Session= Depends(get_db)):
    ctrl.delete_genre(genre, db)
    db.close()
    

@app.patch("/genre")
def update_genre(genre: Genre, db:Session=Depends(get_db)):
    ctrl.update_genre(genre, db)
    db.close()
    
