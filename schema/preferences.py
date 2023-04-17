from pydantic import BaseModel


class Preferences(BaseModel):
    id_user:int
    id_movie:int