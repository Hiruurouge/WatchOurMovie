import schema
import model
from .token import create_access_token, verify_password
from sqlalchemy.orm import Session
from fastapi import HTTPException, status



def create_user(auth: schema.AuthCredentials,db:Session):
    db_auth = model.Auth(email= auth.email, password = auth.password)
    db.add(db_auth)
    db.commit()
    db.refresh(db_auth)

def get_user(user: schema.AuthId, db:Session):
    db_user =  db.query(model.Auth).filter(model.Auth.uid==user.uid).first()
    return db_user

def delete_user(auth: schema.AuthId, db: Session):
    db.query(model.Auth).filter(model.Auth.uid==auth.uid).delete()
    db.commit()

def update_user(user: schema.Auth, db:Session):
    db_user = db.query(model.Auth).filter(model.Auth.uid==user.uid).first()
    if db_user is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            details="Resources not found."
        )
    user_data = user.dict(exclude_unset=True)
    for key,value in user_data.items():
            setattr(db_user, key,value)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

def authenticate_user(user: schema.AuthCredentials, db:Session):
    user_db = db.query(model.Auth).filter(model.Auth.email==user.email).first()
    if not user_db:
        return False
    if not verify_password(user.password, user_db.password):
        return False
    return user_db
