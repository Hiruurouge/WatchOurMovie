from pydantic import BaseModel
from typing import Optional 

class ProductionBase(BaseModel):
    uid: Optional[int]

class Production(ProductionBase):
    name:str
