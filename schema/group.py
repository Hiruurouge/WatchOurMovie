from pydantic import BaseModel

class GroupBase(BaseModel):
    uid:int

class Group(GroupBase):
    group_name:str
    owner:int