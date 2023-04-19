from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Auth(Base):
    __tablename__="auth"
    uid=Column(Integer, primary_key=True, nullable=False)
    email= Column(String(100), unique=True, nullable=False)
    password=Column(String,nullable=False)