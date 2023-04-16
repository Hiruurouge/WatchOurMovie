from sqlalchemy.orm import Declarative_base, relationship
from sqlalchemy import String, Integer, Column

class StaffBase(Declarative_base):
    pass
    

class Staff(StaffBase):
    __tablename__="staff"
    uid =Column(Integer,primary_key=True, nullable=False)
    name=  Column(String,nullable=False),
    job = Column(String, nullable=False)
    work = relationship('Work', cascade="all,delete",backref="Staff")