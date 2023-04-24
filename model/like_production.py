from sqlalchemy import Column, String,Integer, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from model.user import User
from model.production import Production
from sqlalchemy.orm import relationship, backref

Base = declarative_base()

class LikeProduction(Base):
    __tablename__= "like_staff"
    id_user = Column(Integer,ForeignKey(User.uid), primary_key=True, nullable=False)
    id_production = Column(Integer, ForeignKey(Production.uid), primary_key=True, nullable=False)
    production= relationship(Production, backref=backref("LikeProduction", cascade="all,delete"))
    user = relationship(User, backref=backref("LikeProduction", cascade="all,delete"))
