from sqlalchemy import Integer, ForeignKey, Column
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import backref, relationship
from model.movie import Movie
from model.user import User

Base =declarative_base()
class Work(Base):
    __tablename__="work"
    id_user = Column(Integer, ForeignKey(User.uid), primary_key=True, nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True, nullable=False)
    movie = relationship(Movie, backref=backref("work", cascade="all,delete"))
    user= relationship(User, backref=backref("Work", cascade="all,delete"))