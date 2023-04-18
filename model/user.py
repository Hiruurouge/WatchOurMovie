from sqlalchemy import Column, String,Integer, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, backref
from model.auth import Auth

Base = declarative_base() 

class  User(Base):
    __tablename__="wow_user"
    uid= Column(Integer,ForeignKey(Auth.uid),primary_key=True, nullable=False)
    first_name = Column(String(100),nullable=False)
    last_name = Column(String(100), nullable=False)
    age = Column(Integer,nullable=False)
    genre = Column(String(1),nullable=False)
    auth= relationship(Auth, backref=backref("User", cascade="all,delete"))
