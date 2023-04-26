import model
from schema import StaffBase, Staff
from sqlalchemy.orm import Session
from typing import List

def create_staff(staff: Staff, db:Session):
    db_staff= model.Staff(uid=staff.uid, name=staff.name, job=staff.job)
    db.add(db_staff)
    db.commit()
    db.refresh(db_staff)
    return db_staff.uid

def create_staffs(staffs:List[Staff],db:Session):
    db_staffs = [model.Staff(uid=staff.uid, name=staff.name, job=staff.job) for staff in staffs]
    db.add_all(db_staffs)
    db.commit()

    
def get_all_staffs(db:Session):
    result = db.query(model.Staff).all()
    return result

def get_staff(staff: StaffBase, db:Session):
    result = db.query(model.Staff).filter(model.Staff.uid==staff.uid).first()
    return result

def delete_staff(staff: StaffBase, db:Session):
    db.query(model.Staff).filter(model.Staff.uid==staff.uid).delete()
    db.commit()

def update_staff(staff: Staff, db:Session):
    db_staff= get_staff(StaffBase(uid=staff.uid),db)
    if db_staff: 
        genre_data = staff.dict(exclude_unset=True)
        for key,value in genre_data.items():
            setattr(db_staff, key,value)
    db.add(db_staff)
    db.commit()
    db.refresh(db_staff)
    return db_staff