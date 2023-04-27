import model
from schema import LikeStaff, UserBase, Staff
from sqlalchemy.orm import Session
from typing import List
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException,status

def create_staff_preference(preferences: List[LikeStaff], db: Session):
    db_preferences=[model.LikeStaff(id_user= preference.id_user, id_staff=preference.id_staff) for preference in preferences]
    try:     
        db.add_all(db_preferences)
    except IntegrityError: 
        db.rollback()
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST,detail="Relationship already exists.")
    else:
        db.commit()
        return preferences

def get_staff_preferences_by_user(uid:int, db:Session):
    result = db.query(model.Staff).join(model.LikeStaff).filter(model.LikeStaff.id_user==uid).all()
    return [Staff(uid=staff.uid, name=staff.name, job=staff.job) for staff in result]

def delete_staff_preference(preferences:LikeStaff,db:Session):
    db.query(model.LikeStaff).filter(model.LikeStaff.id_user==preferences.id_user).filter(model.LikeStaff.id_staff==preferences.id_staff).delete()
    db.commit()

def update_staff_preference(old_preferences: LikeStaff,new_preferences:LikeStaff, db:Session):
    db_preferences = db.query(model.LikeStaff).filter(model.LikeStaff.id_user==old_preferences.id_user).filter(model.LikeStaff.id_staff==old_preferences.id_staff).first()
    if db_preferences is not None:
        preferences_data = new_preferences.dict(exclude_unset=True)
        for key,value in preferences_data.items():
            setattr(db_preferences, key,value)
        db.add(db_preferences)
        db.commit()
        db.refresh(db_preferences)
        return db_preferences
    else:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Staff not found.")
    
def get_staff_preference_by_group(users:List[UserBase], db: Session):
    users_id=[int(user.uid) for user in users]
    result= db.query(model.Staff).join(model.LikeStaff).filter(model.LikeStaff.id_user.in_(users_id)).all()
    return [Staff(uid=staff.uid, name=staff.name, job=staff.job) for staff in result]