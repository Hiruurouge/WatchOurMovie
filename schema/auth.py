from pydantic import BaseModel

class AuthCredentials(BaseModel): 
    email: str
    password:str
    
class AuthId(BaseModel):
    uid:int

class Auth(AuthCredentials):
    uid:int
