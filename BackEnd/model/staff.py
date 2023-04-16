from sqlalchemy.orm import relationship
from sqlalchemy import String, Integer, Column

from sqlalchemy.ext.declarative import declarative_base
Base =declarative_base()

class Staff(Base):
    __tablename__="staff"
    uid =Column(Integer,primary_key=True, nullable=False)
    name=  Column(String,nullable=False)
    job = Column(String, nullable=False)
    work = relationship('Work', cascade="all,delete",backref="Staff")