from sqlalchemy import Integer, ForeignKey, Column
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import backref, relationship
from model.user import User
from model.movie import Movie

Base =declarative_base()
class Visualize(Base):
    __tablename__="visualize"
    id_user = Column(Integer, ForeignKey(User.uid), primary_key=True,nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid),primary_key=True, nullable=False)
    movie = relationship(Movie, backref=backref("visualize", cascade="all,delete"))
    user= relationship(User, backref=backref("Visualize", cascade="all,delete"))