from typing import Type
from sqlalchemy.orm import Session
from fastapi import HTTPException, status
from pydantic import BaseModel

import model

def model_factory(obj: Type[BaseModel]):
    cls = getattr(model, type(obj).__name__)
    return cls(**obj.dict(exclude_unset=True))

def create_one(db: Session, obj: Type[BaseModel]):
    try:
        orm_obj = model_factory(obj)
        db.add(orm_obj)
        db.commit()
        db.refresh(orm_obj)
    except Exception as e:
        print("Exception : ", e)
    

def delete_one(db:Session, obj: Type[BaseModel]):
    cls = getattr(model, type(obj).__name__)
    db.query(cls).filter(cls.uid==obj.uid).delete()
    db.commit()

def update_one(db:Session, obj: Type[BaseModel]):
    cls = getattr(model, type(obj).__name__)
    orm_obj = db.query(cls).filter(cls.uid==obj.uid).first()
    if orm_obj is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            details="Resources not found."
        )
    user_data = obj.dict(exclude_unset=True)
    for key,value in user_data.items():
        setattr(orm_obj, key,value)
    db.add(orm_obj)
    db.commit()
    db.refresh(orm_obj)
    return orm_obj

def get_user(db:Session, obj: Type[BaseModel]):
    cls = getattr(model, type(obj).__name__)
    orm_obj=db.query(cls).filter(cls.uid==obj.uid).first()
    return orm_obj