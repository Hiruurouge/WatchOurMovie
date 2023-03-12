from sqlalchemy import Column, String,Integer
from slqalchemy.orm import Declarative_base

class UserBase(Declarative_base):
    pass 
class  User(UserBase):
    __tablename__="wow_user"
    uid: Column(Integer,primary_key=True, nullable=False)
    first_name: Column(String(100),nullable=False)
    last_name: Column(String(100), nullable=False)
    email: Column(String(100), nullable=False)
    age: Column(Integer,nullable=False)
    genre : Column(String(1),nullable=False)
    password: Column(String, nullable=False)

