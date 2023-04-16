from sqlalchemy.orm import Declarative_base
from sqlalchemy import Column,Integer, ForeignKey
from model.movie import Movie
from model.genre import Genre

class BeBase(Declarative_base):
    pass

class Be(BeBase):
    __tablename__="be"
    id_genre = Column(Integer, ForeignKey(Genre.uid),primary_key=True, nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True,nullable=False)