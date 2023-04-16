from sqlalchemy import Integer, ForeignKey, Column
from model.movie import Movie
from model.user import User
from sqlalchemy.ext.declarative import declarative_base

Base =declarative_base()
class Work(Base):
    __tablename__="work"
    id_user = Column(Integer, ForeignKey(User.uid), primary_key=True, nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True, nullable=False)
    