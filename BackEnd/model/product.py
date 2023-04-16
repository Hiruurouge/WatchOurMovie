from sqlalchemy.orm import Declarative_base,relationship
from sqlalchemy import Integer, ForeignKey,Column
from model.production import Production
from model.movie import Movie

class ProductBase(Declarative_base):
    pass

class Product(ProductBase):
    __tablename__="product"
    id_production= Column(Integer,ForeignKey(Production.uid), primary_key=True, nullable=False)
    id_movie= Column(Integer, ForeignKey(Movie.uid), primary_key=True, nullable=False)

    