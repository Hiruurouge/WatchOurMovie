from pydantic import BaseModel
from typing import Optional

class StaffBase(BaseModel):
    uid: Optional[int]

class Staff(StaffBase):
    name:str
    job: str