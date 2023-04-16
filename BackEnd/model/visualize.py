from sqlalchemy import Integer, ForeignKey, Column
from model.user import User
from model.movie import Movie
from sqlalchemy.ext.declarative import declarative_base

Base =declarative_base()
class Visualize(Base):
    __tablename__="visualize"
    id_user = Column(Integer, ForeignKey(User.uid), primary_key=True,nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True, nullable=False)