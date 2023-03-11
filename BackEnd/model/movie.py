from sqlalchemy import Column, String, Integer, Date
from sqlalchemy.orm import Declarative_base

class MovieBase(Declarative_base):
    pass
    
class Movie(MovieBase):
    __tablename__="movie"
    uid: Column(Integer, primary_key=True, nullable=False)
    title: Column(String, nullable=False)
    release_date: Column(Date, nullable=True)
    overview: Column(String, nullable=True)
    poster: Column(String,nullable=True)
    popularity: Column(Float,nullable=True)
