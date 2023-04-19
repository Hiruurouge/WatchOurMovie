import model
from schema import User, UserBase
from sqlalchemy.orm import Session
from fastapi import HTTPException, status



def create_user(db:Session, user: User)->bool:
    db_user = model.User(uid = user.uid, first_name = user.first_name, last_name=user.last_name,age=user.age, genre=user.genre)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)


def delete_user(db:Session, user: UserBase):
    db.query(model.User).filter(model.User.uid==user.uid).delete();
    db.commit()

def update_user(db:Session, user: User):
    db_user = db.query(model.User).filter(model.User.uid==user.uid).first()
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

def get_user(db:Session, user: UserBase):
    db_user=db.query(model.User).filter(model.User.uid==user.uid).first()
    return db_user;

def get_user_by_group(db:Session, uid:int):
    return db.query(model.User).join(model.Belong).filter(model.Belong.id_group==uid).all()