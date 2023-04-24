from fastapi import FastAPI,Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm  import Session, sessionmaker
from schema import LikeProduction, ProductionBase, Production
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
    result = ctrl.get_preferences_by_user(uid,db)
    db.close()
    return result

@app.delete("/production/like")
def delete_production_preferences(preferences:LikeProduction,db:Session=Depends(get_db)):
    ctrl.delete_production_preferences(preferences,db)
    db.close()

@app.patch("/production/like")
def update_production_preferences(new_preferences:LikeProduction,old_preferences:LikeProduction,db:Session=Depends(get_db)):
    ctrl.update_production_preferences(new_preferences=new_preferences, old_preferences=old_preferences,db=db)
    db.close()
 
@app.get("/production")
def get_production(production:int, db:Session=Depends(get_db)):
    result = ctrl.get_production(ProductionBase(uid=production),db)
    db.close()
    return result

@app.get("/production/all")
def get_productions(db:Session=Depends(get_db)):
    result = ctrl.get_all_productions(db)
    db.close()
    return result

@app.post("/production")
def create_production(production: Production,db: Session = Depends(get_db)):
    result = ctrl.create_production(production, db)
    db.close()
    return result

@app.post("/production/multiple")
def create_productions(productions: List[Production], db:Session=Depends(get_db)):
    result = ctrl.create_productions(productions, db)
    db.close()
    return result

@app.delete("/production")
def delete_production(production:ProductionBase, db: Session= Depends(get_db)):
    ctrl.delete_production(production, db)
    db.close()
    

@app.patch("/production")
def update_production(production: Production, db:Session=Depends(get_db)):
    ctrl.update_production(production, db)
    db.close()
    
