import model
from schema import LikeStaff, UserBase
from sqlalchemy.orm import Session
from typing import List


def create_staff_preference(preferences: List[LikeStaff], db: Session):
    db_preferences=[model.LikeStaff(id_user= preference.id_user, id_staff=preference.id_staff) for preference in preferences]
    db.add_all(db_preferences)
    db.commit()
    return preferences

def get_staff_preferences_by_user(uid:int, db:Session):
    result = db.query(model.Staff).join(model.LikeStaff).filter(model.LikeStaff.id_user==uid).all()
    return result

def delete_staff_preference(preferences:LikeStaff,db:Session):
    db.query(model.LikeStaff).filter(model.LikeStaff.id_user==preferences.id_user).filter(model.LikeStaff.id_staff==preferences.id_staff).delete()
    db.commit()

def update_staff_preference(old_preferences: LikeStaff,new_preferences:LikeStaff, db:Session):
    db_preferences = db.query(model.LikeStaff).filter(model.LikeStaff.id_user==old_preferences.id_user).filter(model.LikeStaff.id_staff==old_preferences.id_staff).first()
    preferences_data = new_preferences.dict(exclude_unset=True)
    for key,value in preferences_data.items():
        setattr(db_preferences, key,value)
    db.add(db_preferences)
    db.commit()
    db.refresh(db_preferences)
    return db_preferences

def get_staff_preference_by_group(users:List[UserBase], db: Session):
    result= db.query(model.Staff).join(model.LikeStaff).filter(model.LikeStaff.id_user.in_(members)).all()
    return result