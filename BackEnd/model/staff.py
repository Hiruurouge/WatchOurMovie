from sqlalchemy.orm import Declarative_base
from sqlalchemy import String, Integer

class StaffBase(Declarative_base):
    pass
    

class Staff(StaffBase):
    __tablename__="staff"
    uid:Column(Integer,primary_key=True, nullable=False)
    name: Column(String,nullable=False),
    job: Column(String, nullable=False)