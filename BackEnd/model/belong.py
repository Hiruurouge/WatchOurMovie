from sqlalchemy import Column,Integer, ForeignKey
from model.user import User
from model.group import Group
from sqlalchemy.orm import Declarative_base

class BelongBase(Declarative_base):
    pass
    
class Belong(BelongBase):
    __tablename__="belong"
    id_user=  Column(Integer, ForeignKey(User.uid),primary_key=True, nullable=False)
    id_group= Column(Integer, ForeignKey(Group.uid),primary_key=True, nullable=False)