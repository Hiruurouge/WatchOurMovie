from sqlalchemy import Column, String, Integer, Date, Float
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base =declarative_base()

class Movie(Base):
    __tablename__="movie"
    uid = Column(Integer, primary_key=True, nullable=False)
    title =  Column(String, nullable=False)
    release_date= Column(Date, nullable=True)
    overview = Column(String, nullable=True)
    poster=  Column(String,nullable=True)
    popularity = Column(Float,nullable=True)
    work = relationship("Work", cascade="all,delete", backref="Movie")
    be = relationship("Be", cascade="all,delete", backref="Movie")
    product = relationship("Product", cascade="all,delete", backref="Movie")
    visualize=relationship("Visualize", cascade="all,delete",backref="Movie")
    work=relationship("Work", cascade="all,delete", backref="Movie")