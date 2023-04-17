from pydantic import BaseModel

class Genre(BaseModel):
    uid:int
    name:str