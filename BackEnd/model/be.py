from sqlalchemy.orm import Declarative_base
from sqlalchemy import Column, String,Integer, ForeignKey
from model.movie import Movie
from model.genre import Genre

class BeBase(Declarative_base):
    pass

class Be(BeBase):
    __tablename__="be"
    id_genre: Column(Integer, ForeignKey(Genre.uid), nullable=False)
    id_movie: Column(Integer, ForeignKey(Movie.uid), nullable=False)