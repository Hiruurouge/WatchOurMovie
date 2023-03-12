from sqlalchemy.orm import Declarative_base
from sqlalchemy import Integer, ForeignKey

class WorkBase(Declarative_base):
    pass
    
class Work(WorkBase):
    __tablename__="visualize"
    id_user: Column(Integer, ForeignKey(User.uid),nullable=False)
    id_movie: Column(Integer, ForeignKey(Movie.uid), nullable=False)
    