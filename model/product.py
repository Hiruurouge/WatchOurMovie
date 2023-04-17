from sqlalchemy import Integer, ForeignKey,Column
from sqlalchemy.orm import backref, relationship
from model.production import Production
from model.movie import Movie

from sqlalchemy.ext.declarative import declarative_base

Base =declarative_base()
class Product(Base):
    __tablename__="product"
    id_production = Column(Integer,ForeignKey(Production.uid), primary_key=True, nullable=False)
    id_movie = Column(Integer, ForeignKey(Movie.uid), primary_key=True, nullable=False)
    movie = relationship(Movie, backref=backref("product", cascade="all,delete"))

    