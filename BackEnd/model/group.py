from sqlalchemy import Column, String,Integer, ForeignKey
from model.user import User
from sqlalchemy.orm import Declarative_base,relationship

class GroupBase(Declarative_base):
    pass
    
class Group(GroupBase):
    __tablename__="wow_group"
    uid = Column(Integer,primary_key=True, nullable=False)
    group_name = Column(String(100),nullable=False)
    owner = Column(Integer, ForeignKey(User.uid),nullable=False)
    belong= relationship("Belong", cascade="all,delete", backref="Group")