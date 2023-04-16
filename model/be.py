from sqlalchemy import Column,Integer, ForeignKey
from Model.movie import Movie
from Model.genre import Genre
from sqlalchemy.ext.declarative import declarative_base

Base =declarative_base()

class Be(Base):
    __tablename__="be"
    id_genre = Column(Integer, ForeignKey(Genre.uid),primary_key=True, nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True,nullable=False)