from pydantic import BaseModel

class LikeStaff(BaseModel):
    id_user: int
    id_staff: int