from sqlalchemy import Column, String,Integer
from sqlalchemy.orm import relationship

from sqlalchemy.ext.declarative import declarative_base

Base =declarative_base()
    
class Genre(Base):
    __tablename__="genre"
    uid = Column(Integer, primary_key=True ,nullable=False)
    name= Column(String, nullable=False)