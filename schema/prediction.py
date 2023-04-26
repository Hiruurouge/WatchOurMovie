from pydantic import BaseModel
from typing import List
from schema import Genre,Production,Staff

class Prediction(BaseModel):
    genres: List[Genre]
    staffs: List[Staff]
    productions: List[Production]