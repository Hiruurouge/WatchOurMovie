import model
from schema import Preferences, UserBase
from sqlalchemy.orm import Session
from fastapi import HTTPException, status
from typing import List
from .genre import get_all_genres
from sqlalchemy.exc import IntegrityError

def create_genre_preference(preferences: List[Preferences], db: Session):
    db_preferences=[model.Preferences(id_user= preference.id_user, id_genre=preference.id_genre) for preference in preferences]
    try:
        db.add_all(db_preferences)
    except IntegrityError:
        db.rollback()
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail= "Relationship already exists.")
    else:
        db.commit()
        return preferences

def get_genre_preferences_by_user(uid:int, db:Session):
    result = db.query(model.Genre).join(model.Preferences).filter(model.Preferences.id_user==uid).all()
    return result

def delete_genre_preference(preferences:Preferences,db:Session):
    db.query(model.Preferences).filter(model.Preferences.id_user==preferences.id_user).filter(model.Preferences.id_genre==preferences.id_genre).delete()
    db.commit()

def update_genre_preference(old_preferences: Preferences,new_preferences:Preferences, db:Session):
    try: 
        db_preferences = db.query(model.Preferences).filter(model.Preferences.id_user==old_preferences.id_user).filter(model.Preferences.id_genre==old_preferences.id_genre).first()
        preferences_data = new_preferences.dict(exclude_unset=True)
        for key,value in preferences_data.items():
            setattr(db_preferences, key,value)
        db.add(db_preferences)
    except IntegrityError as e:
        db.rollback()
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e)
    else:
        db.commit()
        db.refresh(db_preferences)
        return db_preferences

def get_genre_preference_by_group(users:List(UserBase), db:Session):
    result= db.query(model.Genre).join(model.Preferences).filter(model.Preferences.id_user.in_(users)).all()
    return result