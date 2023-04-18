from sqlalchemy.orm import relationship
from sqlalchemy import Integer, String,Column
from sqlalchemy.ext.declarative import declarative_base

Base =declarative_base()
class Production(Base):
    __tablename__="production"
    uid= Column(Integer,primary_key=True, nullable=False)
    name= Column(String,nullable=False)
    
    
    