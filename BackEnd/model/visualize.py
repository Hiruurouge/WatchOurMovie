from sqlalchemy.orm import Declarative_base
from sqlalchemy import Integer, ForeignKey
class VisualizeBase(Declarative_base):
    pass
    
class Visualize(VisualizeBase):
    __tablename__="visualize"
    id_user: Column(Integer, ForeignKey(User.uid),nullable=False)
    id_movie: Column(Integer, ForeignKey(Movie.uid), nullable=False)