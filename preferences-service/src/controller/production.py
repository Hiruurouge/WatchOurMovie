import model
from schema import LikeProduction, UserBase, Production
from sqlalchemy.orm import Session
from typing import List
from fastapi import HTTPException, status
from sqlalchemy.exc import IntegrityError

def create_production_preference(preferences: List[LikeProduction], db: Session):
    db_preferences=[model.LikeProduction(id_user= preference.id_user, id_production=preference.id_production) for preference in preferences]
    try: 
        db.add_all(db_preferences)
    except IntegrityError: 
        db.rollback()
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Relationship already exists.")
    else:
        db.commit()
        return preferences

def get_production_preferences_by_user(uid:int, db:Session):
    result = db.query(model.Production).join(model.LikeProduction).filter(model.LikeProduction.id_user==uid).all()
    return [Production(uid=production.uid, name=production.name) for production in result]

def delete_production_preference(preferences:LikeProduction,db:Session):
    db.query(model.LikeProduction).filter(model.LikeProduction.id_user==preferences.id_user).filter(model.LikeProduction.id_production==preferences.id_production).delete()
    db.commit()

def update_production_preference(old_preferences: LikeProduction,new_preferences:LikeProduction, db:Session):
    db_preferences = db.query(model.LikeProduction).filter(model.Preferences.id_user==old_preferences.id_user).filter(model.Preferences.id_genre==old_preferences.id_production).first()
    if db_preferences is not None:
        preferences_data = new_preferences.dict(exclude_unset=True)
        for key,value in preferences_data.items():
            setattr(db_preferences, key,value)
        db.add(db_preferences)
        db.commit()
        db.refresh(db_preferences)
    else:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Relationship not exists.")
    return db_preferences

def get_production_preference_by_group(users: List[UserBase], db: Session):
    result = db.query(model.Production).join(model.LikeProduction).filter(model.LikeProduction.id_user.in_(users)).all()
    return result