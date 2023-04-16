from sqlalchemy.orm import Declarative_base
from sqlalchemy import Integer, ForeignKey, Column
from model.movie import Movie
from model.user import User

class WorkBase(Declarative_base):
    pass
    
class Work(WorkBase):
    __tablename__="work"
    id_user = Column(Integer, ForeignKey(User.uid), primary_key=True, nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True, nullable=False)
    