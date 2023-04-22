from pydantic import BaseModel

class GenreBase(BaseModel):
    uid:int
class Genre(GenreBase):
    name:str