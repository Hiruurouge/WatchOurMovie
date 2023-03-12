from sqlalchemy import Column, String,Integer
from sqlalchemy.orm import Declarative_base

class GenreBase(Declarative_base):
    pass
    
class Genre(GenreBase):
    __tablename__="genre"
    uid: Column(Integer, primary_key=True ,nullable=False)
    name: Column(String, nullable=False)