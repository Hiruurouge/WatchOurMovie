from pydantic import BaseModel

class Visualize(BaseModel):
    id_user:int
    id_movie:int