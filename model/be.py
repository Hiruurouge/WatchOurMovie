from sqlalchemy import Column,Integer, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import backref, relationship
from model.movie import Movie
from model.genre import Genre

Base =declarative_base()

class Be(Base):
    __tablename__="be"
    id_genre = Column(Integer, ForeignKey(Genre.uid),primary_key=True, nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True,nullable=False)
    movie = relationship(Movie, backref=backref("Be", cascade="all,delete"))
    genre = relationship(Genre, backref=backref("Be", cascade="all,delete"))