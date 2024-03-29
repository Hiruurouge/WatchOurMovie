import model
from schema import Preferences, UserBase, Genre
from sqlalchemy.orm import Session
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException, status
from typing import List

def get_all_genres(db:Session):
    result = db.query(model.Genre).all()
    return result

def create_genre_preference(preferences: List[Preferences], db: Session):
    db_preferences=[model.Preferences(id_user= preference.id_user, id_genre=preference.id_genre) for preference in preferences]
    try:
        db.add_all(db_preferences)
        db.commit()
    except IntegrityError:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="One genre preference already exist at least.")
    return preferences

def get_genre_preferences_by_user(uid:int, db:Session):
    result = db.query(model.Genre).join(model.Preferences).filter(model.Preferences.id_user==uid).all()
    return [Genre(uid=genre.uid, name=genre.name) for genre in result]

def delete_genre_preference(preferences:Preferences,db:Session):
    db.query(model.Preferences).filter(model.Preferences.id_user==preferences.id_user).filter(model.Preferences.id_genre==preferences.id_genre).delete()
    db.commit()

def update_genre_preference(old_preferences: Preferences,new_preferences:Preferences, db:Session):
    genre_list = get_all_genres(db)
    genres_id=[genre.uid for genre in genre_list]

    if new_preferences.id_genre in genres_id:
        db_preferences = db.query(model.Preferences).filter(model.Preferences.id_user==old_preferences.id_user).filter(model.Preferences.id_genre==old_preferences.id_genre).first()
    preferences_data = new_preferences.dict(exclude_unset=True)
    for key,value in preferences_data.items():
        setattr(db_preferences, key,value)

    db.add(db_preferences)
    db.commit()
    db.refresh(db_preferences)
    return db_preferences

def get_genre_preference_by_group(users: List[UserBase], db: Session):
    users_id=[int(user.uid) for user in users]
    result= db.query(model.Genre).join(model.Preferences).filter(model.Preferences.id_user.in_(users_id)).all()
    return [Genre(uid=genre.uid, name=genre.name) for genre in result]