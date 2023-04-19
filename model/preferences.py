from sqlalchemy import Column, String,Integer, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from model.user import User
from model.genre import Genre
from sqlalchemy.orm import relationship, backref

Base = declarative_base()

class Preferences(Base):
    __tablename__= "preferences"
    id_user = Column(Integer,ForeignKey(User.uid), primary_key=True, nullable=False)
    id_genre = Column(Integer, ForeignKey(Genre.uid), primary_key=True, nullable=False)
    genre= relationship(Genre, backref=backref("Preferences", cascade="all,delete"))
    user = relationship(User, backref=backref("Preferences", cascade="all,delete"))