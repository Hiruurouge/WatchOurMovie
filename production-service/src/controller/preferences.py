import model
from schema import LikeProduction
from sqlalchemy.orm import Session
from typing import List


def create_production_preference(preferences: List[LikeProduction], db: Session):
    db_preferences=[model.LikeProduction(id_user= preference.id_user, id_genre=preference.id_production) for preference in preferences]
    db.add_all(db_preferences)
    db.commit()
    return preferences

def get_preferences_by_user(uid:int, db:Session):
    result = db.query(model.Production).join(model.LikeProduction).filter(model.LikeProduction.id_user==uid).all()
    return result

def delete_production_preferences(preferences:LikeProduction,db:Session):
    db.query(model.LikeProduction).filter(model.LikeProduction.id_user==preferences.id_user).filter(model.LikeProduction.id_production==preferences.id_production).delete()
    db.commit()

def update_production_preferences(old_preferences: LikeProduction,new_preferences:LikeProduction, db:Session):
    db_preferences = db.query(model.LikeProduction).filter(model.Preferences.id_user==old_preferences.id_user).filter(model.Preferences.id_genre==old_preferences.id_production).first()
    preferences_data = new_preferences.dict(exclude_unset=True)
    for key,value in preferences_data.items():
        setattr(db_preferences, key,value)
    db.add(db_preferences)
    db.commit()
    db.refresh(db_preferences)
    return db_preferences