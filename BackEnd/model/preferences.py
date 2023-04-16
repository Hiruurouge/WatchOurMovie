from sqlalchemy import Column, String,Integer, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from model.user import User
from model.genre import Genre

Base = declarative_base()

class Preferences(Base):
    __tablename__= "preferences"
    id_user = Column(Integer,ForeignKey(User.uid), primary_key=True, nullable=False)
    id_genre = Column(Integer, ForeignKey(Genre.uid), primary_key=True, nullable=False)