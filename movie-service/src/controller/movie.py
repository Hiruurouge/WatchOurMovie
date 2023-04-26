import model
from schema import MovieId, Movie
from sqlalchemy.orm import Session
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException, status

def create_movie(movie:Movie, db:Session):
    db_movie= model.Movie(uid=movie.uid, title=movie.title,release_date=movie.release_date, overview=movie.overview, poster=movie.poster, popularity=movie.popularity )
    try: 
        db.add(db_movie)
    except IntegrityError:
        db.rollback()
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Movie already exists.")
    else:
        db.commit()
        db.refresh(db_movie)
        return db_movie.uid
    
    
def get_all_movies(db:Session):
    result = db.query(model.Movie).all()
    return result

def get_movie(movie: MovieId, db:Session):
    result = db.query(model.Movie).filter(model.Movie.uid==movie.uid).first()
    return result

def delete_movie(movie: MovieId, db:Session):
    db.query(model.Movie).filter(model.Movie.uid==movie.uid).delete()
    db.commit()

def update_movie(movie: Movie, db:Session):
    db_movie = get_movie(MovieId(uid=movie.uid),db)
    if db_movie: 
        genre_data = movie.dict(exclude_unset=True)
        for key,value in genre_data.items():
            setattr(db_movie, key,value)
    db.add(db_movie)
    db.commit()
    db.refresh(db_movie)
    return db_movie
