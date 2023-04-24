from pydantic import BaseModel
from typing import Optional

class MovieBase(BaseModel):
    title: str

class Movie(MovieBase):
    uid: Optional[int]
    release_date:str
    overview : str
    poster: str
    popularity: float

class MovieId(BaseModel):
    uid: Optional[int]