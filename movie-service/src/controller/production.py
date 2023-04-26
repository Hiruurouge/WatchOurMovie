import model
from schema import ProductionBase, Production
from sqlalchemy.orm import Session
from typing import List
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException, status

def create_production(production:Production, db:Session):
    db_production= model.Production(uid=production.uid, name=production.name)
    try: 
        db.add(db_production)
    except:
        db.rollback()
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Production already exists.")
    else:
        db.commit()
        db.refresh(db_production)
        return db_production.uid

def create_productions(productions:List[Production],db:Session):
    try:
        db_genres = [model.Production(uid=production.uid, name=production.name) for production in productions]
        db.add_all(db_genres)
    except: 
        db.rollback()
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="One production at least already exists.")
    else:
        db.commit()

    
def get_all_productions(db:Session):
    result = db.query(model.Production).all()
    return result

def get_production(production: ProductionBase, db:Session):
    result = db.query(model.Production).filter(model.Production.uid==production.uid).first()
    return result

def delete_production(production: ProductionBase, db:Session):
    db.query(model.Production).filter(model.Production.uid==production.uid).delete()
    db.commit()

def update_production(production: Production, db:Session):
    db_production = get_production(ProductionBase(uid=production.uid),db)
    if db_production: 
        genre_data = production.dict(exclude_unset=True)
        for key,value in genre_data.items():
            setattr(db_production, key,value)
    db.add(db_production)
    db.commit()
    db.refresh(db_production)
    return db_production
