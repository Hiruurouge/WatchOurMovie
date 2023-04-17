from pydantic import BaseModel

class MovieBase(BaseModel):
    title: str

class Movie(Movie):
    uid:int
    release_date:str
    overview : str
    poster: str
    popularity: float
