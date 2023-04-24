from pydantic import BaseModel

class LikeProduction(BaseModel):
    id_user:int
    id_production:int