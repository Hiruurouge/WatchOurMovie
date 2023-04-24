from sqlalchemy import Column, String,Integer, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from model.user import User
from model.staff import Staff
from sqlalchemy.orm import relationship, backref

Base = declarative_base()

class LikeStaff(Base):
    __tablename__= "like_staff"
    id_user = Column(Integer,ForeignKey(User.uid), primary_key=True, nullable=False)
    id_staff = Column(Integer, ForeignKey(Staff.uid), primary_key=True, nullable=False)
    staff= relationship(Staff, backref=backref("LikeStaff", cascade="all,delete"))
    user = relationship(User, backref=backref("LikeStaff", cascade="all,delete"))
