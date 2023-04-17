from pydantic import BaseModel

class AuthBase(BaseModel): 
    email: str

class Auth(Base):
    password:str
