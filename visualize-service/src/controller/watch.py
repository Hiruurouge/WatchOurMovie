import model
from schema import Visualize
from sqlalchemy.orm import Session
from typing import List

def create_visualize_relation(relations: List[Visualize], db: Session):
    db_visualize=[model.Visualize(id_user= relation.id_user, id_movie=relation.id_user) for relation in relations]
    db.add_all(db_visualize)
    db.commit()
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

