import model
from schema import Visualize,UserBase
from sqlalchemy.orm import Session
from typing import List
from sqlalchemy.exc  import IntegrityError
from fastapi import HTTPException, status

def create_visualize_relation(relations: List[Visualize], db: Session):
    db_visualize=[model.Visualize(id_user= relation.id_user, id_movie=relation.id_movie) for relation in relations]
    try: 
        db.add_all(db_visualize)
        db.commit()
    except IntegrityError:
        db.rollback()
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Relationship already exist.")
    else:
        return relations

def get_movies_seen_by_user(uid:int, db:Session):
    result = db.query(model.Movie).join(model.Visualize).filter(model.Visualize.id_user==uid).all()
    return result

def delete_visualize_relation(relation:Visualize,db:Session):
    db.query(model.Visualize).filter(model.Visualize.id_user==relation.id_user).filter(model.Visualize.id_movie==relation.id_movie).delete()
    db.commit()

def update_visualize_relation(old_relation:Visualize,new_relation:Visualize, db:Session):
    
    db_relation = db.query(model.Visualize).filter(model.Visualize.id_user==old_relation.id_user).filter(model.Visualize.id_movie==old_relation.id_movie).first()
    relation_data = new_relation.dict(exclude_unset=True)
    for key,value in relation_data.items():
        setattr(db_relation, key,value)
    db.add(db_relation)
    db.commit()
    db.refresh(db_relation)
    return db_relation

def get_movies_seen_by_group(users :List[UserBase], db:Session):
    users_id=[int(user.uid) for user in users]
    result= db.query(model.Movie).join(model.Visualize).filter(model.Visualize.id_user.in_(users_id)).all()
    return result