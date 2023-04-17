from pydantic import BaseModel 

class ProductionBase(BaseModel):
    uid:int

class Production(Production):
    name:str
