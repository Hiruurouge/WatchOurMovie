from pydantic import BaseModel

class Belong(BaseModel):
    id_group: int
    id_user:int
