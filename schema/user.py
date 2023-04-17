from pydantic import BaseModel

class UserBase(BaseModel):
    uid:int
    
class User(UserBase):
    first_name:str 
    last_name:str
    genre: str
    age:int