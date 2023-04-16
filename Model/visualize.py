from sqlalchemy import Integer, ForeignKey, Column
from Model.user import User
from Model.movie import Movie
from sqlalchemy.ext.declarative import declarative_base

Base =declarative_base()
class Visualize(Base):
    __tablename__="visualize"
    id_user = Column(Integer, ForeignKey(User.uid), primary_key=True,nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True, nullable=False)