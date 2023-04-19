from sqlalchemy import Column,Integer, ForeignKey
from model.user import User
from model.group import Group
from sqlalchemy.orm import relationship,backref
from sqlalchemy.ext.declarative import declarative_base

Base =declarative_base()
    
class Belong(Base):
    __tablename__="belong"
    id_user=  Column(Integer, ForeignKey(User.uid),primary_key=True, nullable=False)
    id_group= Column(Integer, ForeignKey(Group.uid),primary_key=True, nullable=False)
    group = relationship(Group, backref=backref("Belong", cascade="all,delete"))
    user = relationship(User, backref=backref("Belong", cascade="all,delete"))