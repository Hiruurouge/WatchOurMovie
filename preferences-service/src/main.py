from fastapi import FastAPI,Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm  import Session, sessionmaker
from schema import LikeProduction, LikeStaff, Preferences, UserBase, Prediction
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

@app.post("/production/like")
def create_production_relationship(relations: List[LikeProduction],db: Session= Depends(get_db)):
    result = ctrl.create_production_preference(relations,db)
    db.close()
    return result

@app.get("/production/like/all")
def get_preferences_by_user(uid:int, db:Session= Depends(get_db)):
    result = ctrl.get_production_preferences_by_user(uid,db)
    db.close()
    return result

@app.delete("/production/like")
def delete_production_preferences(preferences:LikeProduction,db:Session=Depends(get_db)):
    ctrl.delete_production_preference(preferences,db)
    db.close()

@app.patch("/production/like")
def update_production_preferences(new_preferences:LikeProduction,old_preferences:LikeProduction,db:Session=Depends(get_db)):
    ctrl.update_production_preference(new_preferences=new_preferences, old_preferences=old_preferences,db=db)
    db.close()
 
@app.post("/staff/like")
def create_staff_relationship(relations: List[LikeStaff],db: Session= Depends(get_db)):
    result = ctrl.create_staff_preference(relations,db)
    db.close()
    return result

@app.get("/staff/like/all")
def get_staff_preferences_by_user(uid:int, db:Session= Depends(get_db)):
    result = ctrl.get_staff_preferences_by_user(uid,db)
    db.close()
    return result

@app.delete("/staff/like")
def delete_staff_preferences(preferences:LikeStaff,db:Session=Depends(get_db)):
    ctrl.delete_staff_preference(preferences,db)
    db.close()

@app.patch("/staff/like")
def update_staff_preferences(new_preferences:LikeStaff,old_preferences:LikeStaff,db:Session=Depends(get_db)):
    ctrl.update_staff_preference(new_preferences=new_preferences, old_preferences=old_preferences,db=db)
    db.close()

@app.post("/genre/like")
def create_preferences(genres: List[Preferences],db: Session= Depends(get_db)):
    result = ctrl.create_genre_preference(genres,db)
    db.close()
    return result

@app.get("/genre/like/all")
def get_preferences_by_user(uid:int, db:Session= Depends(get_db)):
    result = ctrl.get_genre_preferences_by_user(uid,db)
    db.close()
    return result

@app.delete("/genre/like")
def delete_preferences(preferences:Preferences,db:Session=Depends(get_db)):
    ctrl.delete_genre_preference(preferences,db)
    db.close()

@app.patch("/genre/like")
def update_preferences(new_preferences:Preferences,old_preferences:Preferences,db:Session=Depends(get_db)):
    ctrl.update_genre_preference(new_preferences=new_preferences, old_preferences=old_preferences,db=db)
    db.close()

@app.post("/group/like")
def get_group_preference(users:List[UserBase],db:Session=Depends(get_db)):
    genres = ctrl.get_genre_preference_by_group(users,db)
    productions = ctrl.get_production_preference_by_group(users,db)
    staffs = ctrl.get_staff_preference_by_group(users,db)
    db.close()
    return Prediction(genres=genres,staffs=staffs, productions=productions)

@app.get("/user/like")
def get_user_preference(uid:int,db:Session=Depends(get_db)):
    genres= ctrl.get_genre_preferences_by_user(uid,db)
    productions = ctrl.get_production_preferences_by_user(uid,db)
    staffs = ctrl.get_staff_preferences_by_user(uid, db)
    db.close()
    return Prediction(genres=genres,staffs=staffs, productions=productions)


