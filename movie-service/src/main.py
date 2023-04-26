from fastapi import FastAPI,Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm  import Session, sessionmaker
from schema import  ProductionBase, Production, Staff, StaffBase, Genre, GenreBase, MovieId, Movie, Visualize
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

@app.get("/production", tags="production")
def get_production(production:int, db:Session=Depends(get_db)):
    result = ctrl.get_production(ProductionBase(uid=production),db)
    db.close()
    return result

@app.get("/production/all", tags="production")
def get_productions(db:Session=Depends(get_db)):
    result = ctrl.get_all_productions(db)
    db.close()
    return result

@app.post("/production", tags="production")
def create_production(production: Production,db: Session = Depends(get_db)):
    result = ctrl.create_production(production, db)
    db.close()
    return result

@app.post("/production/multiple", tags="production")
def create_productions(productions: List[Production], db:Session=Depends(get_db)):
    result = ctrl.create_productions(productions, db)
    db.close()
    return result

@app.delete("/production", tags="production")
def delete_production(production:ProductionBase, db: Session= Depends(get_db)):
    ctrl.delete_production(production, db)
    db.close()
    

@app.patch("/production", tags="production")
def update_production(production: Production, db:Session=Depends(get_db)):
    ctrl.update_production(production, db)
    db.close()

@app.get("/staff", tags="staff")
def get_staff(uid:int, db:Session=Depends(get_db)):
    result = ctrl.get_staff(StaffBase(uid=uid),db)
    db.close()
    return result

@app.get("/staff/all", tags="staff")
def get_staff(db:Session=Depends(get_db)):
    result = ctrl.get_all_staffs(db)
    db.close()
    return result

@app.post("/staff", tags="staff")
def create_staff(staff: Staff,db: Session = Depends(get_db)):
    result = ctrl.create_staff(staff, db)
    db.close()
    return result

@app.post("/staff/multiple", tags="staff")
def create_staffs(staffs: List[Staff], db:Session=Depends(get_db)):
    result = ctrl.create_staffs(staffs, db)
    db.close()
    return result

@app.delete("/staff", tags="staff")
def delete_staff(staffs:StaffBase, db: Session= Depends(get_db)):
    ctrl.delete_staff(staffs, db)
    db.close()
    

@app.patch("/staff", tags="staff")
def update_staff(staff: Staff, db:Session=Depends(get_db)):
    ctrl.update_staff(staff, db)
    db.close()
@app.get("/genre", tags="genre")
def get_genre(genre:int, db:Session=Depends(get_db)):
    result = ctrl.get_genre(GenreBase(uid=genre),db)
    db.close()
    return result

@app.get("/genre/all", tags="genre")
def get_genres(db:Session=Depends(get_db)):
    result = ctrl.get_all_genres(db)
    db.close()
    return result

@app.post("/genre", tags="genre")
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

@app.get("/movie", tags="movie")
def get_staff(uid:int, db:Session=Depends(get_db)):
    result = ctrl.get_staff(StaffBase(uid=uid),db)
    db.close()
    return result

@app.get("/movie/all", tags="movie")
def get_staff(db:Session=Depends(get_db)):
    result = ctrl.get_all_staffs(db)
    db.close()
    return result

@app.post("/movie", tags="movie")
def create_staff(movie: Movie,db: Session = Depends(get_db)):
    result = ctrl.create_staff(movie, db)
    db.close()
    return result

@app.delete("/movie", tags="movie")
def delete_staff(movie:MovieId, db: Session= Depends(get_db)):
    ctrl.delete_staff(movie, db)
    db.close()

@app.patch("/movie", tags="movie")
def update_staff(movie:Movie, db:Session=Depends(get_db)):
    ctrl.update_staff(movie, db)
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

@app.delete("/watch")
def delete_visualize_relationship(relation:Visualize,db:Session=Depends(get_db)):
    ctrl.delete_visualize_relation(relation,db)
    db.close()

@app.patch("/watch")
def update_visualize_relationship(new_relation:Visualize,old_relation:Visualize,db:Session=Depends(get_db)):
    ctrl.update_visualize_relation(new_relation=new_relation, old_relation=old_relation,db=db)
    db.close()
 
