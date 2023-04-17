from pydantic import BaseModel

class StaffBase(BaseModel):
    uid:int

class Staff(StaffBase):
    name:str
    job: str