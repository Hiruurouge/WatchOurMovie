from sqlalchemy.orm import Declarative_base, relationship
from sqlalchemy import Integer, String,Column

class ProductionBase(Declarative_base):
    pass

class Production(ProductionBase):
    __tablename__="production"
    uid= Column(Integer,primary_key=True, nullable=False)
    name= Column(String,nullable=False)
    product =relationship("Product", cascade="all,delete",backref="Production")
    