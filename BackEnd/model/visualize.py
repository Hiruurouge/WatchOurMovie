from sqlalchemy.orm import Declarative_base
from sqlalchemy import Integer, ForeignKey, Column
from model.user import User
from model.movie import Movie
class VisualizeBase(Declarative_base):
    pass
    
class Visualize(VisualizeBase):
    __tablename__="visualize"
    id_user = Column(Integer, ForeignKey(User.uid), primary_key=True,nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True, nullable=False)