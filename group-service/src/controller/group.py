import model
from schema import Group, GroupBase, Belong
from sqlalchemy.orm import Session
from fastapi import HTTPException, status
from typing import List
def create_group(group:Group, db:Session):
    db_group=model.Group(group_name=group.group_name, owner=group.owner)
    db.add(db_group)
    db.commit()
    db.refresh(db_group)
    belong= Belong(id_group=db_group.uid, id_user=db_group.owner)
    add_to_group(belong,db)
    return db_group.uid

def delete_group(group: GroupBase, db:Session):
    db.query(model.Group).filter(model.Group.uid==group.uid).delete()
    db.commit()


def get_group(group:GroupBase, db:Session):
    result= db.query(model.Group).filter(model.Group.uid == group.uid).first()
    return result

def update_group(group:Group, db:Session):
    db_group= get_group(group,db)
    if db_group is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            details="Resources not found."
        )
    user_data = group.dict(exclude_unset=True)
    for key,value in user_data.items():
        setattr(db_group, key,value)
    db.add(db_group)
    db.commit()
    db.refresh(db_group)
    return db_group

def add_to_group(belong_list:List[Belong], db:Session):
    db_belong= [model.Belong(id_user=belong.id_user,id_group=belong.id_group) for belong in belong_list]
    db.add_all(db_belong)
    db.commit()
    

def quit_group(belong:Belong, db:Session):
    db_group = GroupBase(uid=belong.id_group)
    group=get_group(db_group,db)
    if group: 
        if group.owner==belong.id_user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Unable to quit a group as owner. Please delete group or transmit owner's rights."
            )
        else:
            db.query(model.Belong).filter(model.Belong.id_group==belong.id_group).filter(model.Belong.id_user==belong.id_user).delete()
            db.commit()
    else:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Group not found."
        )
    
def get_users_by_group(db:Session, uid:int):
    result=  db.query(model.User).join(model.Belong).filter(model.Belong.id_group==uid).all()
    return result

def get_groups_by_user(db:Session,uid:int):
    result = db.query(model.Group).join(model.Belong).filter(model.Belong.id_user==uid).all()
    return result