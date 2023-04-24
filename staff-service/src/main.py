from fastapi import FastAPI,Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm  import Session, sessionmaker
from schema import LikeStaff, Staff, StaffBase
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

@app.post("/staff/like")
def create_staff_relationship(relations: List[LikeStaff],db: Session= Depends(get_db)):
    result = ctrl.create_staff_preference(relations,db)
    db.close()
    return result

@app.get("/staff/like/all")
def get_staff_preferences_by_user(uid:int, db:Session= Depends(get_db)):
    result = ctrl.get_preferences_by_user(uid,db)
    db.close()
    return result

@app.delete("/staff/like")
def delete_staff_preferences(preferences:LikeStaff,db:Session=Depends(get_db)):
    ctrl.delete_staff_preferences(preferences,db)
    db.close()

@app.patch("/staff/like")
def update_staff_preferences(new_preferences:LikeStaff,old_preferences:LikeStaff,db:Session=Depends(get_db)):
    ctrl.update_staff_preferences(new_preferences=new_preferences, old_preferences=old_preferences,db=db)
    db.close()
 
@app.get("/staff")
def get_staff(uid:int, db:Session=Depends(get_db)):
    result = ctrl.get_staff(StaffBase(uid=uid),db)
    db.close()
    return result

@app.get("/staff/all")
def get_staff(db:Session=Depends(get_db)):
    result = ctrl.get_all_staffs(db)
    db.close()
    return result

@app.post("/staff")
def create_staff(staff: Staff,db: Session = Depends(get_db)):
    result = ctrl.create_staff(staff, db)
    db.close()
    return result

@app.post("/staff/multiple")
def create_staffs(staffs: List[Staff], db:Session=Depends(get_db)):
    result = ctrl.create_staffs(staffs, db)
    db.close()
    return result

@app.delete("/staff")
def delete_staff(staffs:StaffBase, db: Session= Depends(get_db)):
    ctrl.delete_staff(staffs, db)
    db.close()
    

@app.patch("/staff")
def update_staff(staff: Staff, db:Session=Depends(get_db)):
    ctrl.update_staff(staff, db)
    db.close()
    
