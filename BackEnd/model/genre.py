from sqlalchemy import Column, String,Integer
from sqlalchemy.orm import Declarative_base, relationship

class GenreBase(Declarative_base):
    pass
    
class Genre(GenreBase):
    __tablename__="genre"
    uid = Column(Integer, primary_key=True ,nullable=False)
    name= Column(String, nullable=False)
    be =relationship("Be", cascade="all,delete", backref="Genre")
    preferences = relationship("Preferences", cascade="all,delete", backref="Genre")